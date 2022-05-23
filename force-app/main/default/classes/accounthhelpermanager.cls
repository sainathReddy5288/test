@restresource(URLMapping='/contacthelpermanager/*')
Global class accounthhelpermanager 
{
 @httpDelete()
 global static string Deletecontactrecords()
 {
     map<string,string> mapinputparams=restcontext.request.params;
     string ss=mapinputparams.get('account.name');
     list<contact> contacts=[select id,firstname,lastname,account.name from contact
                             where account.name=:ss];
     
     delete contacts;
     return 'deleted';
 }
}