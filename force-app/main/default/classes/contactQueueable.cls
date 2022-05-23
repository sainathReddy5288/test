Global class contactQueueable implements system.Queueable 
{
  account accRecords;
    public contactQueueable(account acc)
    {
        accRecords=acc;
    }
    Global void Execute(system.QueueableContext qcontext)
    {
        contact con =new contact();
        
        con.FirstName='contact';
        con.lastname='Queueable';
        con.email='sample@gmail.com';
        con.Phone=accRecords.Phone;
        con.Fax=accRecords.Fax;
        
        con.AccountId=accRecords.Id;
        insert con;
        if(con.Id !=null)
        {
            system.debug('contact record is created'+con.Id);
        }
        
    }
}