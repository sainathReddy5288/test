public class databasehelper2 
{
    public static void GetcontactByAccountIndustry(string industryname)
    {
        if(industryname !=null && industryname !='')
       {
          map<id,Account> mapAccounts =new map<id,Account>([select id,name,industry
                                                                 from account
                                                                   where industry =:industryname]);
           if(! mapAccounts.isempty())
           {
               list<contact> lstcontacts =[select id,firstname,lastname,email,phone,fax,accountid 
                                                    from contact
                                                     where accountid IN :mapaccounts.keyset()];
               for(contact con : lstcontacts)
               {
                   system.debug('contact record is...:'+con);
               }
           }
       }
    }
    public static void GetcandidateByEndingName(string Endingchar)
    {
        if(Endingchar != null && Endingchar !='')
        {
            Endingchar +='%';
            list<candidate__c> lstcandidate =[select id,name,location__c,notice_period__c
                                                              from candidate__c
                                             						where name like :Endingchar ];
            system.debug('collection size is...:'+lstcandidate.size());
            for(candidate__c con : lstcandidate)
            {
                system.debug('candidate record is...'+ con);
            }
        }
    }
    public static void GetAccountsByStarting(String startingChar)
    {
        if(startingchar != null && startingchar !='')
        {
            startingchar +='%';
            list<account> lstaccounts =[select id,name,industry,rating,annualrevenue 
                                                       from Account
                                                  where name like: startingchar ];
            system.debug('collection size is.........:'+lstaccounts.size());
            for(account acc : lstaccounts)
            {
                system.debug('accounts records are....'+acc);
            }
        }
    }
    public static void GetAllposition(string positionlocation)
    {
     if(positionlocation !=null && positionlocation !='')
     {
         for(position__c pos :[select id,name,email__c,location__c from position__c
                                                          where
                                                              location__c =:positionlocation])
         {
             system.debug('position record is...'+ pos);
         }
     }
    }
}