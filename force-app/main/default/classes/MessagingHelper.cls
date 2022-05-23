public class MessagingHelper 
{
  public static void Createleadrecord()
  {
      lead ld = new lead();
      
      ld.FirstName='sai';
      ld.LastName='sai';
      ld.Company='ibm';
      ld.Title='project managere';
      ld.Rating='hot';
      ld.Industry='banking';
      ld.AnnualRevenue=3400000;
      ld.Email='sainathreddy116@gmail.com';
      ld.Phone='9966885533';
      ld.Fax='9977885565';
      ld.City='hyderabad';
      ld.State='telangana';
      ld.country='india';
      ld.Status='working-contacted';
      
      insert ld;
      if(ld.id !=null)
      {
          system.debug('leadrecord is created successfully.......'+ld.id);
          sendEmailAlertTolead(ld);
      }
  }
    
    public static void sendEmailAlertTolead(lead ldrecord)
    {
        messaging.SingleEmailMessage email= new messaging.SingleEmailMessage();
        
        
        string[] toAddress =new string[]{ldrecord.Email, 'sainathreddy5288@gmail.com'};
            email.setToAddresses(toAddress);
        
         string[] ccAddress =new string[]{ldrecord.Email, 'sainathreddy5288@gmail.com'};
            email.setccAddresses(ccAddress);
         string[] bccAddress =new string[]{ldrecord.Email, 'sainathreddy5288@gmail.com'};
            email.setbccAddresses(bccAddress);
        email.setReplyTo('support@icicibank.com');
        email.setSenderDisplayName('cc department');
        email.setSubject('Congratulation'+ldrecord.FirstName+''+ldrecord.LastName +
                         '...!!! Your credit card is successfully applied.');
        string EmailBody= 'Dear'+ldrecord.FirstName+''+ldrecord.LastName+',<br/><br/>'+
            'Thanks for showing intrest in our origanitation  products or services.<br/><br/>'+
            'we are pleased to inform you that, Your credit card is successfully applied.<br/><br/>'+
            'Hear are your lead details....:<br/><br/>'+
            'lead record id is....'+ldrecord.Id+
            '<br/> lead record name...'+ldrecord.firstname+''+ldrecord.LastName+
            '<br/>lead record company..'+ldrecord.Company+
            '<br/> status..'+ldrecord.Status+
            '<br/>rating..'+ldrecord.Rating+
            '<br/><br/> please contact on the below address. if any queries.'+
            '<br/><br/>please click belo link to view the record:<a href='+	system.Url.getSalesforceBaseUrl().ToExternalForm()+'/'+ldrecord.id+' target="_blank"> click hear</a>'+
            '<br/><br/>******this is a system Generated mail please do not reply.'+
            '<br/><br/>Thanks & Regards,<br/>credit card department<br/>ICICI Bank.';
        email.setHtmlBody(EmailBody);
        list<messaging.EmailFileAttachment> lstatt= new list<messaging.EmailFileAttachment>();
        messaging.EmailFileAttachment attach = new messaging.EmailFileAttachment();
        attach.setContentType('application/pdf');
        attach.setFileName(ldrecord.FirstName+''+ldrecord.LastName+'.pdf');
        attach.body=Blob.toPdf(EmailBody);
        lstatt.add(attach);
        
        email.setFileAttachments(lstatt);
        
        messaging.SendEmailResult[] Results =messaging.SendEmail(new messaging.SingleEmailMessage[]{email});
        
        
    }
}