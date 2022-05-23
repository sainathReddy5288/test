public class DMLBulkrecords 
{ 
    public static  void mergeaccounts()
    {
        account sourceAccount =[select id,name,rating,industry,annualrevenue,phone,fax from account
                                 										where name ='sudhanshu' limit 1];
         account targetAccount =[select id,name,rating,industry,annualrevenue,phone,fax from account
                                 									where name ='Edge Communications' limit 1];
        if(sourceAccount !=null && targetAccount !=null)
        {
            merge sourceAccount targetAccount;
        }
    }
     public static void synchaccountTocontact(string accountname)
     {
        if(accountname !=null && accountname !='')
        {
            account acc =[select id,name,phone,fax from account
                         				where name =:accountname limit 1];
            if(acc.Id !=null)
            {
                list<contact> lstcontacts =[select id,phone,fax,accountid from contact
                                           			where accountid =: acc.Id];
                if(! lstcontacts.isEmpty())
                {
                    for(contact con :lstcontacts)
                    {
                        con.phone=acc.Phone;
                        con.Fax=acc.Fax;
                    }
                    update lstcontacts;
                }
            }
        }
    }
     public static void unassociatedcontactrecords()
     {
        account acc =[select  id,name from account
                                 where name ='Edge Communications' limit 1];
        list<contact> lstcons =[select id,firstname,accountid from contact
                                  where accountid = null];
        for(contact con : lstcons)
        {
            con.accountid =acc.id;
        }
        if(! lstcons.isEmpty())
        {
            update lstcons;
        }
    }
     public static void assignannualrevenue()
     {
             list<account> lstaccounts =[select id,industry,annualrevenue from account];
             for(account acc: lstaccounts)
             {
                 if(acc.Industry=='banking')
                 {
                     acc.AnnualRevenue=2500000;
                 }
                 if(acc.Industry=='finance')
                 {
                     acc.AnnualRevenue=7000000;
                 }
                  if(acc.Industry=='insurance')
                 {
                     acc.AnnualRevenue=5600000;
                 }
                  if(acc.Industry=='manufactring')
                 {
                     acc.AnnualRevenue=5800000;
                 }
                  if(acc.Industry=='consulting')
                 {
                     acc.AnnualRevenue=4000000;
                 }
                 if(acc.Industry=='education')
                 {
                     acc.AnnualRevenue=8500000;
                 }
                  if(acc.Industry=='technology')
                 {
                     acc.AnnualRevenue=6100000;
                 }
             }
             if(! lstaccounts.isempty())
             {
                 update lstaccounts;
             }
                                                                   
         }
     public static void updatecaserecors()
     {
         list<case> lstcs=[select id,priority,status,origin from case
                                               where status='new'];
         
             for(case cs : lstcs)
             {
                 cs.priority='high';
             }
         if(! lstcs.isempty())
         {
             update lstcs;
         }
             
         
     }
     public static void updatebankingAccounts()
     {
         list<account> lstaccounts =[select id,name,industry,annualrevenue,rating from account
                                                      where industry = 'banking'];
             if(! lstaccounts.isEmpty())
             {
                 for(account acc : lstaccounts)
                 {
                     acc.rating='warm';
                     acc.annualrevenue=2500000;
                 }   
                 update lstaccounts;
             }
     }
     public static void restoreHRrecords(string startingchar)
     {
        if(startingchar !=null && startingchar !='')
        {
           startingchar+='%';
            undelete[select id,name,isdeleted from Hiring_manager__c
                                where name like : startingchar and isdeleted=true ALL ROWS];
        }
    }
     public static void DeleateBulkHRRecords(string startingchars)
     {
        Delete[select id, name from Hiring_manager__c
                                where name like: startingchars+'%'];
    }
     public static void CreateBulkHRRecords(integer maxrecords)
     {
      if(maxrecords > 0)
      {
          list<Hiring_manager__c> lsthrs =new list<Hiring_manager__c>();
          for(integer counter=1; counter <=maxrecords; counter++)
          {
              Hiring_manager__c hr =new Hiring_manager__c();
              
              hr.Name='ramDML'+counter;
              hr.Location__c='pune';
              hr.Email_ID__c='ramDML'+counter+'@gmail.com';
              hr.Contact_number__c='9901011254';
               
              
              lsthrs.add(hr);
          }
              if(! lsthrs.IsEmpty())
          {
              insert lsthrs;
          }
              
          }
      
     }
}