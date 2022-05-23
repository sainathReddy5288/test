public class DMLDatabase 
{
  Public static void ProcessCaseRecords()
    {
        List<Case> casesToUpsert = new List<Case>();
        
        // Update the Case Recors (Change the Priority to High)
        List<Case> lstCases = [Select id, casenumber, status, priority
                              			from Case
                              				Where status = 'New'];
        if(! lstCases.isEmpty())
        {
            for(Case cs : lstCases)
            {
             	cs.Priority = 'High';
                
                // Add the record to collection..
                casesToUpsert.Add(cs);
            }
        }
        
        // Insert a Case Record..
        Case csRecord = new Case();
        	csRecord.Status = 'Working';
        	csRecord.Priority = 'High';
        	csRecord.Type = 'Mechanical';
        	csRecord.Reason = 'Performance';
        	csRecord.Origin = 'Phone';
        	csRecord.Subject = 'My Tab Device is unable to access the Wi-fi connection';
        	csRecord.Description = 'Dear Customer Support '+
                					'My Recently purchased Tab Device is unable to connect to Wi-fi access. '+
                					'Please have a look into the issue. And address the case ASAP.'+
                					'Thanks & Regards, Ram Kumar';
        
        	// add the record to collection..
        	casesToUpsert.Add(csRecord);
        
        if(! casesToUpsert.isEmpty())
        {
            Database.UpsertResult[] results = Database.upsert(casesToUpsert, false);
            
            for(Database.UpsertResult res : results)
            {
                if(res.isSuccess())
                {
                    if(res.isCreated()) // Record has been inserted
                    {
                        system.debug('Case Record has been Created Successfully.');
                        system.debug('Case Record Id is....: '+ res.getId());
                    }
                    else  // Record has been updated..
                    {
                        system.debug('Case Record Priority has been updated successfully.' + res.getId());
                    }
                }
                else
                {
                    for(Database.Error err : res.getErrors())
                    {
                        system.debug('Error Message is...: '+ err.getMessage());
                        system.debug('Error Status Code is...: '+ err.getStatusCode());
                        system.debug('Affected Fields are...: '+ err.GetFields());
                    }
                }
            }
        }
    }


}