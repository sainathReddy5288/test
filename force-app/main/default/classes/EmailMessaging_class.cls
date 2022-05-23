public class EmailMessaging_class {
    
public static void MAilrecords(asyncapexjob jobtext, decimal totalAnnualrevenue)  
{
   messaging.SingleEmailMessage mail= new messaging.SingleEmailMessage();
    string[] toaddress = new string[]{jobtext.createdby.email,'borravallagurrappa@gmail.com'};
        mail.setToAddresses(toaddress);
        mail.setReplyTo('www.chandu@gmail.com');
        mail.setSenderDisplayName('Toatal Account');
        mail.setSubject('ToTal annnual revenue');
        string context='Dear customer <br/>'+
                        '<br/> batch name : AccountBatchprogram'+
                         '<br/> batch status.......'+jobtext.Status+
                          '<b><br/> total Account....'+totalAnnualrevenue+
                          '</b><br/> batch number of errors'+jobtext.NumberOfErrors;
          mail.setHtmlBody(context);
    list<messaging.EmailFileAttachment> lstac= new list<messaging.EmailFileAttachment>();
         messaging.EmailFileAttachment attch= new messaging.EmailFileAttachment();
                       attch.setContentType('Application/pdf');
                       attch.setFileName('totalannualrevenue.pdf');
                       attch.body = blob.toPdf(context);
                   lstac.add(attch);
           mail.setFileAttachments(lstac);
   messaging.SendEmailResult[] results= messaging.sendEmail(new messaging.SingleEmailMessage[]{mail});
        
                           
    
    
    
    
    
    
}

}