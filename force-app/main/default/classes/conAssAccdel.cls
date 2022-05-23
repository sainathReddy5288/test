public class conAssAccdel {
    public static void accountDel(list<contact> lstcon)
    {
        set<id> cont = new set<id>();
        for(contact con : lstcon)
        {
            cont.add(con.AccountId);
        } 
        list<Account> acc =[Select id from Account where ID IN :cont];
        
        Delete acc;
    }
    
}