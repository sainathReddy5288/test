public class accountContact {
    public static void accountAssContact(list<account> lstAccounts)
       
    {
       list<Contact> lstContact =new list<Contact>();
        for(Account Acc : lstAccounts)
        {
            contact con =new contact();
            con.AccountId=Acc.id;
            con.LastName=Acc.Name;
            lstContact.add(con);
        }
        if(! lstContact.IsEmpty())
        {
            insert lstContact;
            System.debug('record id+'+lstContact);
        }
    }

}