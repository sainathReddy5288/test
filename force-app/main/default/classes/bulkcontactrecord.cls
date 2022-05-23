public class bulkcontactrecord 
{

    public static void  createbulkrecords()
    {
        for(integer counter =1;counter<=100;counter++)
        {
            contact con =new contact();
            
            con.FirstName='himanshu'+counter;
                con.LastName='reddy';
            con.Phone='9933993399';
            con.Email='king@king.com';
            
            insert con;
            
        }
            
    }
}