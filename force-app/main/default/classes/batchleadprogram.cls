global class batchleadprogram implements database.Batchable<sobject>
{
global database.QueryLocator start(database.BatchableContext ctext)
{
    string bulkd='test%';
    string ldquery= 'select id,lastname,firstname,phone,fax,email,company,rating,industry from lead where lastname like:bulkd';
    return database.getQueryLocator(ldquery);

}
global void execute(database.BatchableContext ctext, list<sobject> leadrecord)
{
      list<lead> lstlead = new list<lead>();
     for(sobject ob : leadrecord)
     {
         lead ld=(lead)ob;
         if(ld.Industry == 'finance')
         {
             ld.Rating ='cold';
         }
         else if(ld.Industry== 'banking')
         {
             ld.Rating = 'warm';
         }
//ld.Company = 'Dgs techical service';
         lstlead.add(ld);
     }
    if(!lstlead.isempty())
    {
        update lstlead;
    }
    
}
   global void finish(database.BatchableContext ctext)  
{
    system.debug('batch id ....'+ctext.getJobId());
  asyncapexjob lstjob = [ select id,status,totaljobitems,numberoferrors,createdby.email from
                          asyncapexjob where id =: ctext.getJobId()];
    
    messaging.SingleEmailMessage mail= new messaging.SingleEmailMessage();
    string[] toaddress = new string[]{lstjob.createdby.email,'borravallagurrappa@gmail.com'};
      mail.setToAddresses(toaddress);
    mail.setReplyTo('www.chandu@gmail.com');
    mail.setSenderDisplayName('weekly lead updates');
    mail.setSubject('lead batch program');
    string context ='Dear customer <br/>'+
                    '<br/>batch status...'+ lstjob.Status+
                    '<br/> batch job...'+lstjob.TotalJobItems+
                     '<br/> batch error....'+lstjob.NumberOfErrors
                      ;
     
    mail.setHtmlBody(context);
    list<messaging.EmailFileAttachment> lsttach=new list<messaging.EmailFileAttachment>();
    messaging.EmailFileAttachment attach= new messaging.EmailFileAttachment();
                   attach.setContentType('Application/pdf');
                   attach.setFileName('weeklt_file.pdf');
                   attach.body =blob.toPdf(context);
                   lsttach.add(attach);
       mail.setFileAttachments(lsttach);
  messaging.SendEmailResult[] result= messaging.sendEmail(new messaging.SingleEmailMessage[]{mail});

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}