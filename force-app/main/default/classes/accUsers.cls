public class accUsers {
    public static void assignusers(list<account> lstacc)
    {
        list<accountteammember> actteams = new list<accountteammember>();
    user u = [select id from user where alias='sai'];
    for(account acc : lstacc){
        if( acc.Industry == 'Banking' && acc.annualrevenue >500000){
            accountteammember actteam = new accountteammember();
            actteam.UserId = u.id;
            actteam.AccountId = acc.Id;
            actteam.TeamMemberRole = 'Account Manager';
            actteams.add(actteam); 
        }
    }insert actteams;
    }

}