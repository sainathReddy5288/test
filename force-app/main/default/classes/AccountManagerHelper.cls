@restresource(URLMapping='/accounthelperservice/*')
Global class AccountManagerHelper 
{
    @httpPost()
    Global static Account getAllAccounts(string accname,string accindustry,string accrating)
    {
        account acc= new account();
        
        acc.name=accname;
        acc.industry=accindustry;
         acc.Rating=accrating;   
        insert acc;
        return acc;
    }
 
    @httpGet()
  Global static list<account> GetAllAccounts()
  {
     list<account> lstAccounts=[select id,name,industry,phone,fax,rating,active__c,annualrevenue
                               					from account  Order by Name];
      return lstAccounts;
  }
}