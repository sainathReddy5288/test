public class databaseHelper
{
    public static void GetAccountsbyindustry(string accountindustry)
    {
        if(accountindustry !=null && accountindustry != '')
        {
            for(account acc : [select id,name,industry,annualrevenue from account
                             								where industry =: accountindustry])
            {
                system.debug('account record is...'+ acc);
            }
        }
    }

    public static void Getcasebystatus(string casestatus)
    {
        if (casestatus !=null && casestatus !='')
        {
            for (case cs :[select id,status,priority,origin,type,reason,subject,casenumber from case
                            													where status=:casestatus])
            {
                system.debug('case record is....'+cs);
            }
        }
    }
 public static void GetAllHRrecords()
 {
     for(Hiring_Manager__c hr : [select id,name,email_id__c,contact_number__c,location__c from Hiring_Manager__c])
     {
         system.debug('HR name is....:'+ hr.Name);
         system.debug('HR id is....'+hr.Id);
         system.debug('HR location is...'+hr.Location__c);
         system.debug('HR contact number is....'+hr.Contact_number__c);
     }
 }
}