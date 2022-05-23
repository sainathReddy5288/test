public class acctaskmail {
 	public static void taskmail(list<account> lstAcc)
    {
        set<id> ids =new set<id>();
        list<task> tk =new list<task>();
        for(account acc : lstAcc ){
            if(acc.type =='prospect'){
                ids.add(acc.OwnerId);
                task ts =new task();
                ts.Status='In Progress';
                ts.Subject='call jaipal and vantalakka ';
                ts.Priority='High';
                ts.OwnerId=acc.OwnerId;
                ts.WhatId =acc.Id;
                tk.add(ts);
            }
        } 
        if(tk.size() > 0){
            insert tk;
            system.debug(tk);
             Map<Id,User> ownerMap = new Map<Id,User>([select id, email from User where id in: ids]);
    
    //Perparing list of email to send at a time
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    for(Account tsk : lstAcc) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{ownerMap.get(tsk.OwnerId).Email});
        mail.setSubject('Task Create with Id: '+tk[0].Id);
        string s ='creat a task with ownerId';
        mail.setHtmlBody(s);
        mails.add(mail);
    }messaging.sendEmail(mails);
            system.debug('Call mails');
        }
        
    }
}