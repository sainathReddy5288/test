Global class accountQueueable implements system.Queueable 
{
  Global void Execute(system.QueueableContext qcontext)
  {
      account acc =new account();
      
      acc.name='Queueable account';
      acc.Rating='hot';
      acc.Industry='Banking';
      acc.Phone='9955668825';
      acc.fax='8899556645';
      acc.AnnualRevenue=3500000;
      acc.Active__c='yes';
      acc.Website='www.gmail.com';
      
      insert acc;
      if(acc.id !=null)
      {
          system.debug('account record id is..'+acc.Id);
          ID jobid=system.enqueueJob(new contactQueueable(acc));
          
          AsyncApexjob jobdetails=[select id,status,totaljobitems,jobitemsprocessed,numberoferrors,createdby.email from AsyncApexjob where id=:jobid];
          
      }
  }
}