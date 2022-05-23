Global class accountrecordsbatchannualrevenue implements Database.Batchable<sobject>,Database.stateful 
{
    global decimal totalannualrevenue= 0.0;
    global Database.QueryLocator start(Database.BatchableContext bcontext)
    {
        string accountQuery='select id,name,annualrevenue from account where annualrevenue != null';
        return Database.getQueryLocator(accountQuery);
    }
    global void execute(Database.BatchableContext bcontext,list<sobject> accountrecords)
    {
       for(sobject obj :accountrecords)
       {
           account acc=(account)obj;
           totalannualrevenue +=acc.AnnualRevenue;
       }
    }
    global void finish(Database.BatchableContext bcontext)
    {
        AsyncApexjob jobdetails=[select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from AsyncApexjob where id=:bcontext.getJobId()];
        messagingutilityhelper.sendemailnotification(jobdetails,'accountrecordsbatchannualrevenue',totalannualrevenue);
    }

}