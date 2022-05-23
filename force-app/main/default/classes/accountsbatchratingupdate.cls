Global class accountsbatchratingupdate implements Database.Batchable<sobject>
{
  global database.QueryLocator start(database.BatchableContext bcontext)
  {
    string accountsQurey='select id,name,industry,rating from Account';
      return database.getQueryLocator(accountsQurey);
  }
    global void execute(database.BatchableContext bcontext,list<sobject> accrecords)
    {
      list<account> accountsToUpdate =new list<account>();
        for(sobject obj:accrecords)
        {
            account acc=(account) obj;
            if(acc.Industry=='banking')
            {
                acc.rating='warm';
            }
            else if(acc.industry=='Agriculture')
            {
                acc.Rating='cold';
            }
            else if(acc.Industry=='insurance')
            {
                acc.Rating='hot';
            }
            else if(acc.industry=='energy')
            {
                acc.Rating='cold';
            }
            accountsToUpdate.Add(acc);
        }
        if(! accountsToUpdate.isempty())
        {
            update accountsToUpdate;
        }
    }
    global void finish(database.BatchableContext bcontext)
    {
       system.debug('batch job id is...:'+bcontext.getJobId()); 
        AsyncApexjob jobstatus=[select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from AsyncApexjob
                               							where id=:bcontext.getJobId()];
    }
}