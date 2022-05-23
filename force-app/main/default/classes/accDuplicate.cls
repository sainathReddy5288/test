public class accDuplicate {
    public static  void duplicateAccounts(list<Account> lstAccounts)
    { 
       
        for (Account acct : lstAccounts)
        {
           /* if(acct.Industry == 'Banking')
            {
                acct.AnnualRevenue = 5000000;
            }*/
            Switch ON acct.Industry
            {
                when 'banking'
                {
                    acct.AnnualRevenue =5000000;
                }
                When 'Apparel'
                {
                    acct.AnnualRevenue =7989898;
                }
            }
          Integer AccountCount =[select Count() from Account where Name =: acct.Name];
           if(AccountCount > 0)
        {
            acct.AddError(' duplicates pls check');
        }
        }
        
    }
}