@restresource(URLMapping='/bulkaccountservice')
Global class bulkAccoutsrecordsHelper
{
    @httpPost()
    Global static string createallAccountrecords()
    {
       string accrecords=restcontext.request.requestbody.tostring();
        
        list<account> lstacc=(list<account>)system.JSON.deserialize(accrecords,list<account>.class);
        
        if(! lstacc.isEmpty())
        {
            insert lstacc;
           
        }
        return 'lakshman';
    }

}