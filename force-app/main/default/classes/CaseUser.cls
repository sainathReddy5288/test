public class CaseUser {
    public static void assignTeam(list<case> lstcase){
        user u=[select id,UserName from user where username =:'sai@gmail.co'];
        list<CaseTeamMember> casemem = new list<CaseTeamMember>();
        for(case cs :lstcase){
            if(cs.origin =='web'){
                CaseTeamMember  cst = new CaseTeamMember();
                cst.MemberId =u.id;
                cst.TeamRoleId=u.Id;
                
                casemem.add(cst);
            }
        }
        if(casemem.size() > 0){
            insert casemem;
            system.debug(casemem);
        }
    }
}