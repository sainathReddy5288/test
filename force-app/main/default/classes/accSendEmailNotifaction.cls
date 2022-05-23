public class accSendEmailNotifaction {
    public static void sendEmail(list<account> acclist , map<id,account> accMap)
    {
        list<messaging.SingleEmailMessage> mails =new list<messaging.SingleEmailMessage>();
        set<id> accid =new set<id>();
        for(account acc :acclist)
        {
            if(acc.Name != accMap.get(acc.id).name)
            {
                accid.add(acc.id);
            }
        }
        if(accid.size() > 0){
            list<contact> lstcon =[select id, name ,Email from contact where Email !=null AND Accountid IN :accid];
            if(lstcon.size() > 0){
                list<string> conEmails =new list<string>();
               for(contact con :lstcon)
               {
                   conEmails.add(con.Email);
               }
                messaging.SingleEmailMessage mail =new messaging.SingleEmailMessage();
                mail.setToAddresses(conEmails);
                mail.setReplyTo(userinfo.getUserEmail());
                mail.setSubject('Account name changed');
                string body ='hi';
                body +='your account name has been changed';
                mail.setHtmlBody(body);
                mails.add(mail);
            }
        }
        messaging.sendEmail(mails);
    }
}