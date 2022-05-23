@restresource(URLMapping='/hiringmanagerservice/*')
Global class hiringmanagerhelper 
{
    @httpPost()
   global static Hiring_Manager__c createHRrecords(string hrname,string hrlocation,string hrphone,string hremail)
   {
       Hiring_Manager__c hr=new Hiring_Manager__c();
       hr.Name=hrname;
       hr.Location__c=hrlocation;
       hr.Contact_number__c=hrphone;
       hr.Email_ID__c=hremail;
       
       
       insert hr;
       return hr;
   }
}