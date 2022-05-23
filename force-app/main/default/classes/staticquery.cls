public class staticquery 
{
    public static void getallaccounts()   
    {
     List<Account> lstAccounts = [ Select id, name, rating, industry, annualrevenue,phone ,fax,active__c from Account ];
      
        system.debug('collection size is...:'+lstAccounts.size());
        
        if(! lstAccounts.isempty())
        {
            for(Account acc:lstAccounts)
            {
               system.debug('account id is....:'+ acc.Id);
                system.debug('account name is....:'+acc.Name);
                system.debug('account rating is....:'+acc.Rating);
                system.debug('annual Revenue is.....:'+acc.AnnualRevenue);
                system.debug('contact number is.....:'+acc.Phone);
                system.debug('active status is...:'+acc.Active__c);
                
            }
        }
    }
}