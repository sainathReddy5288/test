public class opportunityteammembertask {
    public static void teamopptyt(list<opportunity> oppty){
        user u =[select id from user where alias =: 'sai'];
        list<opportunityteammember> opptyteam = new list<opportunityteammember>();
        for(opportunity op:oppty)
        {
            if(op.Amount >= 5000000){
                opportunityteammember tm = new opportunityteammember();
                tm.OpportunityId =op.id;
                tm.UserId=u.id;
                tm.TeamMemberRole='Channel Manager';
                //tm.OpportunityAccessLevel='Read/Write';
                   opptyteam.add(tm); 
            }
        } if(opptyteam.size() > 0){
            insert opptyteam;
        }
    }
}