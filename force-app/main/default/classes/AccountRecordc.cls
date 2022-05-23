public class AccountRecordc {
    public static void newAccountrecord()

    {
        Account acc =new Account();
        
        acc.Name='sainikith';
        acc.Active__c='yes';
        acc.Rating='Hot';
        acc.Type='prospect';
        
        insert acc;
        if(acc.id !=null)
        {
            system.debug('create account record with id.......:'+ acc.id);
            
            List<contact> lstcontacts = new List<contact>();
            
            for(integer counter=1; counter <=10; counter++)
            {
                contact con = new contact();
                
                con.LastName ='reddy';
                con.Accountid =acc.id;
                
                lstcontacts.Add(con);
                
            }
            
            if(! lstcontacts.isempty())
                insert lstcontacts;
            
            List<opportunity>lstopportunitys = New List<opportunity>();
            for(integer counter=1; counter<= 15;counter++)
            {
               opportunity op = New opportunity();
                
                op.Name='test1'+counter;
                op.StageName='qulification';
                op.CloseDate=system.today().addDays(10);
                
                op.AccountId=acc.id;
                
                lstopportunitys.Add(op);
              
            }
            if(! lstopportunitys.isempty()){
                
           insert lstopportunitys;
            }
            List<case> lstcases = New List<case>();
            for(integer counter=1; counter<=10; counter++)
            {
                case ca = New case();
                 
                ca.Status='new';
                ca.Origin='Email';
                ca.Email__c='test'+counter+'@gmail.com';
                ca.AccountId=acc.id;
                
                lstcases.Add(ca);                   
            }
            if(!  lstcases.isempty())
                insert lstcases;
        }
        
    }
}