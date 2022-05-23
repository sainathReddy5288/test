public class DatabaseMethodHelper 
{
    public static void processcaserecords()
    {
        list<case> caseToupdate = new list<case>();
        
        list<case> lstcases =[select id,status,priority from case where status='new'];
        if(! lstcases.isEmpty())
        {
            for(case cs :lstcases)
            {
                cs.priority='high';
                caseToupdate.Add(cs);
            }
        }
        case csrecord= new case();
        
        csrecord.Status='working';
        csrecord.Priority='high';
        csrecord.Type='mechanical';
        csrecord.Origin='phone';
        
        caseToupdate.Add(csrecord);
        if(! caseToupdate.isempty())
        {
            database.upsertresult[] results =database.upsert(caseToupdate,false);
            
            for(database.UpsertResult res: results)
            {
                if(res.isSuccess())
                {
                    if(res.isCreated())
                    {
                        system.debug('case record has been created successfully');
                        system.debug('case record id is...:'+res.getId());
                    }
                    else
                    {
                        system.debug('case priority is updated....'+res.getId());
                    }
                }
                else
                {
                    for(database.Error  err: res.getErrors())
                    {
                        system.debug('get error message...'+err.getMessage());
                        system.debug('get status code.....'+err.getStatusCode());
                        system.debug('get affected fields....'+err.getFields());
                    }
                }
            }
        }
    }
  public static void insertbulkleadrecords()
  {
      list<lead> lstleads = new list<lead>();
      for(integer counter=1; counter <=200; counter++)
      {
          lead ld = new lead();
          
          ld.FirstName='database';
          ld.LastName='Test lead-'+ counter;
          ld.Email='dbTest'+counter+'@gmail.com';
          ld.AnnualRevenue=2500000;
          if(counter != 3)
          {
          ld.Company='ibm';
          }
          ld.Status='opend -not contacted';
          ld.Rating='hot';
          ld.Industry='finance';
          ld.Phone='9900992254';
          ld.Fax='6655982356';
          
          lstleads.add(ld);
      }
      if(! lstleads.isempty())
      {
       Database.SaveResult[] results =  Database.insert(lstleads,false);
          for(Database.SaveResult res : results)
          {
              if(res.isSuccess())
              {
                  system.debug(' record has been inserted');
                  system.debug('lead record id is...:'+ res.getId());
              }
              else
              {
                  Database.Error[] errors =res.geterrors();
                  for(Database.Error err: errors)
                  {
                      system.debug('error message is'+ err.getMessage());
                      system.debug('error status code is'+err.getStatusCode());
                      system.debug('affected field id...:'+err.getFields());
                  }
              }
          }
      }
  }
}