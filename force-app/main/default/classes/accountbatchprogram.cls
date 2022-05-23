Global class accountbatchprogram implements database.Batchable<sobject>,database.stateful
{
    global decimal totalAnnualrevenue=0.0;
Global database.QueryLocator start(database.BatchableContext bcontext)   
{
     string accountquery ='select id,name,annualrevenue from account where annualrevenue!=null';
       return  database.getQueryLocator(accountquery);
} 
Global void execute(database.BatchableContext bcontext,list<sobject> accountrecord)  
{
      for(sobject obj: accountrecord)
      {
                      account acc=(account)obj;
           totalAnnualrevenue+= acc.AnnualRevenue;
      }
}
Global void finish(database.BatchableContext bcontext)
{
     asyncapexjob joblist=[select id,status,numberoferrors,createdby.email from asyncapexjob where id=: bcontext.getJobId()];
    
    EmailMessaging_class.MAilrecords(joblist,totalAnnualrevenue);
}
    
}