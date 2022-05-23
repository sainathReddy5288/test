public class Accbackup {
    public static void abcbackup(list<account> lst){
 
        list<Account_backup__c> lstbackup = new list<Account_backup__c>();
        for (account acc : lst){
            Account_backup__c ab = new Account_backup__c ();
            ab.name = acc.name;
            lstbackup.add(ab);
        }
      insert lstbackup;
}
    
}