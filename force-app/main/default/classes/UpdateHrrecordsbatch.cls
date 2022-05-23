Global class UpdateHrrecordsbatch  implements Database.Batchable<sobject>
{
  Global Database.QueryLocator start(Database.BatchableContext bcontext)
  {
     string startingchar='Ram%';
      string hrrecordsQuery='select id,name,Location__c,contact_number__c from Hiring_Manager__c where name like :startingchar';
      return database.getQueryLocator(hrrecordsQuery);
  }
    Global void Execute(Database.BatchableContext bcontext,List<sobject> hrRecords)
    {
        list<Hiring_manager__c> hrToupdate =new list<Hiring_manager__c>();
        for(sobject obj : hrrecords)
        {
            Hiring_manager__c hr =(Hiring_manager__c) obj;
            
            hr.Location__c='pune';
            hr.Contact_number__c='7777777777';
            
            hrToupdate.add(hr); 
        }
        if(! hrToupdate.isempty())
        {
            update hrToupdate;
        }
    }
    Global void Finish(Database.BatchableContext bcontext)
    {
      system.debug('batch job id is...:'+bcontext.getJobId());
        AsyncApexjob jobstatus=[select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from AsyncApexjob
                                							where id=: bcontext.getJobId()];
        
        messaging.SingleEmailMessage email = new messaging.SingleEmailMessage();
        string[] toAddress =new string[]{jobstatus.createdby.Email,'sainathreddy116@gmail.com'};
            email.setToAddresses(toAddress);
        email.setReplyTo('support@dell.com');
        email.setSenderDisplayName('weekly hr records update status..');
        email.setSubject('Alert:weekly HR  batch jobs status Notification Alert..'+bcontext.getJobId());
        string emailcontent ='Dear customer support,<br/><br/>'+
            'we are pleased to inform you that the weekly hr batch record is updated successfully.<br/><br/>'+
            'Hear are the Batch job status details..<br/><br/>'+
            'Batch job id ...:'+bcontext.getJobId()+
            '<br/>batch job name is..:UpdateHrrecordsbatch'+
            '<br/>job ststus is..:'+jobstatus.Status+
            '<br/>Total number of jobs Available...:'+jobstatus.TotalJobItems+
            '<br/>number of jobs processed...:'+jobstatus.JobItemsProcessed+
            '<br/>number of errors...:'+jobstatus.NumberOfErrors+
            '<br/><br/> please contact the below address, if any queries..<br/><br/>'+
            '****this is a system generated email.please do not reply..***'+
            '<br/><br/>Thanks & regards,<br/>Dell customer support<br/>Dell Inc.';
        email.sethtmlbody(emailcontent);
        list<messaging.EmailFileAttachment> lstAttachments =new list<messaging.EmailFileAttachment>();
        messaging.EmailFileAttachment attachment = new messaging.EmailFileAttachment();
        attachment.setcontenttype('application/pdf');
        attachment.setFileName('weeklyHRBatchJobStatus.pdf');
        attachment.body =Blob.toPdf(emailcontent);
        
        lstAttachments.Add(attachment);
        email.setFileAttachments(lstAttachments);
        
        messaging.sendEmail(new messaging.SingleEmailMessage[]{email});
        
    }
}