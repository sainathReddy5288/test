public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList =[SELECT Name,AnnualRevenue from account];
        for(account acc:accountsList)
        {
            string acctRev ='Account Name:'+acc.Name +':Account Revenue:'+acc.AnnualRevenue;
            system.debug(acctRev);
        }
    }

}