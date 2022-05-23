public class AcctOppty {
   public static void accountAssOppty(list<Account> acc)
   {
       list<opportunity> lstoppty =new list<opportunity>();
      for(account acct : acc)
      {
          if(acct.industry == 'energy' && acct.type =='other')
          {
              opportunity oppty = new opportunity();
              oppty.AccountId =acct.id;
              oppty.Name=acct.Name;
              oppty.CloseDate=system.today()+15;
              oppty.stagename='closed won';
              lstoppty.add(oppty);
              
          }
      }
       if(! lstoppty.isEmpty())
       {
           insert lstoppty;
       }
   }
}