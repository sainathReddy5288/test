public class databasehelper4 {

    Public static void GetAllAccounts()
   {
     string accQuery = 'select id,name from Account ';
       List<Account> lstAccounts = database.query(accQuery);
       
       if(! lstAccounts.isempty())
       {
           for(Account Acc : lstAccounts)
           {
               system.debug('Accounts record is....:'+Acc);
           }
       }
   }
}