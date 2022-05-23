Global class accountrecordsbatchscheduling implements system.Schedulable 
{
   global void execute(system.SchedulableContext scontext)
   {
       accountrecordsbatchannualrevenue  revenue = new accountrecordsbatchannualrevenue();
       Database.executeBatch(revenue, 5);
   }

}