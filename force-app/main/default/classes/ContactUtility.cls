public class ContactUtility {
    public static void viewContacts(){
        List<contact> lstcontacts =[SELECT FirstName, LastName From Contact]; 
        for(contact con :lstcontacts){
            string fullname='First Name:'+con.FirstName+',+ Last Name:'+ con.LastName;
            system.debug(fullName);
        }
    }

}