public class hiringposition {
    public  static void createnewhrrecord()
    {
        hiring_manager__c hr = new hiring_manager__c();
        hr.Name='sainath reddy1';
        hr.Contact_number__c='9910010299';
        hr.Email_ID__c='king@gmail.com';
        
        insert hr;
        if(hr.Id!=null)
        {
            system.debug('hr record is created with id'+hr.Id);
        }
    }

}