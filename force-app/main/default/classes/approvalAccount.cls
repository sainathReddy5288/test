public class approvalAccount {
    public static void accountApproval(list<account>  acc){
        list<approval.ProcessSubmitRequest> rq2 = new list<approval.ProcessSubmitRequest>();
        for(account ac : acc)
        {
            if(string.isNotBlank(ac.name)){
                approval.ProcessSubmitRequest rq1 = new approval.ProcessSubmitRequest();
                rq1.setObjectId(ac.Id);
                rq1.setComments('submit this record for approval');
                rq1.setSubmitterId(userinfo.getUserId());
 					rq2.add(rq1);
            }
        } approval.process(rq2);
        system.debug(rq2);
    }
}