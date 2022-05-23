public class ownerAccount {
    public static void owrnerAcc(list<account> lstacc){
        list<user> us =[select id,username from user where username =:'sai@gmail.co'];
        for(account acc :lstacc){
            if(acc.Industry == 'Banking')
            {
               acc.OwnerId = us[0].Id;
            }
        }
    }
}