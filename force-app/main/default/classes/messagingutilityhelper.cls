public class messagingutilityhelper 
{
  public  static void sendemailnotification(AsyncApexjob jobstatus,string jobname,decimal revenue)
  {
       Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        	string[] toAddress = new string[]{jobStatus.CreatedBy.Email, 'sainathreddy116@gmail.com'};
            email.setToAddresses(toAddress);
        
        	email.setReplyTo('customersupport@dell.com');
        
        	email.setSenderDisplayName('Weekly Batch Job Status Alert');
        
        	email.setSubject('Alert : Weekly Total Annual REvenue Batch Job Status Notification Alert. - '+ jobStatus.Id);
        
        	string emailContent = 'Dear Customer Support, <br/><br/>'+
                					'We are pleased to inform you, that the Total Annualre Revenue Batch Job has been Completed Successfully. <br/><br/>'+
                					'Here are the Batch Job Status Details...: <br/><br/>'+ 
                					'Batch Job Id ....: '+ jobStatus.Id+
                					'<br/> Batch Job Name is....:  '+ jobName+
                					'<br/> Batch Job Status is....: '+ jobStatus.Status+
                					'<br/> Total Number of Batches Available ....:  '+ jobStatus.TotalJobItems+
                					'<br/> Number of Batches Processed......: '+ jobStatus.JobItemsProcessed+
                					'<br/> Number of batches failed.....: '+ jobStatus.NumberOfErrors+
                					'<br/> <b> Total Annual Revenue is...: '+ revenue+
                					'</b><br/><br/> Please Contact the below address, if any queries.. <br/><br/>'+
                					'**** This is a System-Generated Email. Please Do Not Reply.'+
                					'<br/><br/> Thanks & Regards, <br/> Dell Customer Support, <br/> Dell Inc.';
        
       		email.setHtmlBody(emailContent);
        	
        	List<Messaging.EmailFileAttachment> lstAttachments = new List<Messaging.EmailFileAttachment>();
        
        	// Prepare the Attachment..
        	Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        	attachment.setContentType('Application/pdf');
        	attachment.setFileName('WeeklyHRJobStatus.pdf');
        	attachment.body = Blob.toPdf(emailContent);
        
        	// Add the Attachment to Collection..
        	lstAttachments.Add(attachment);
        
        	email.setFileAttachments(lstAttachments);
        
        	// Send the Email..
        	Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}