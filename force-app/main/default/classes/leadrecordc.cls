public class leadrecordc {
    public static void createnewleadrecord()
    {
        lead le=new lead();
        le.FirstName='sainath';
        le.LastName='reddy';
        le.Company='hcl';
        le.LeadSource='working-contacted';
        
        insert le;
        if(le.id !=null)
        {
            system.debug('lead record is created with id....'+le.id);
            List<task> lsttasks =new List<task>();
            for(integer counter=1; counter<=5; counter++)
            {
                task t = new task();
                
                t.Subject='make a call';
                t.Status='in progress';
                t.Priority='high';
                
                t.WhoId=le.id;
                lsttasks.add(t);
            }
                if(! lsttasks.isempty())
                {
                    
                     insert lsttasks;
                    List<event> lstevent =new List<event>();
                    for(integer counter=1; counter <=4; counter++)
                    {
                        event ev=new event();
                        
                        ev.Subject='email';
                        ev.StartDateTime=system.today();
                        ev.EndDateTime=system.today().addDays(23);
                        
                        ev.whoid=le.id;
                        
                        if(! lstevent.isEmpty())
                            insert lstevent;
                    }
        
        
            
            
            }
        }
    }

}