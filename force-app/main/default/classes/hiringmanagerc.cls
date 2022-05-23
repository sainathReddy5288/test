public class hiringmanagerc {
    public static void createnewhrrecord()
    {
        Hiring_manager__c hr= New Hiring_manager__c();
        
        hr.Name='suresh kumar';
        hr.Contact_number__c='9558844661';
        hr.Email_ID__c='suresh@gmail.com';
        
        insert hr;
        if(hr.id !=null)
        {
            system.debug('create hr record with id...'+hr.id);
            List<Position__c>lstpositions = New List<position__c>();
            for(integer counter=1; counter<=10; counter++)
            {
                position__c po =New position__c();
                
                po.Name='test developer'+counter;
                po.Email__c='test'+counter+'@gmail.com';
                po.Hiring_Manager__c=hr.id;
                
                lstpositions.add(po);
            }
            if(! lstpositions.isempty())
                insert lstpositions;
            
                
                }
              
        }
    }