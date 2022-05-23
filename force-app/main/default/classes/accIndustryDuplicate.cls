public class accIndustryDuplicate {
    public static void industrydup(list<account> lstacc)
    { 
        set<string> Names1 =new set<string>();
        set<string> industry1 =new set<string>();
        for(account acc :lstacc){
            if(string.isNotBlank(acc.Name)){
                Names1.add(acc.name);
            }
            if(string.isNotblank(acc.Industry)){
                industry1.add(acc.Industry);
            }
                           

        } 
         list<account> acc1 = [select id,name, industry  from Account Where name IN :Names1 and industry IN :industry1];
        for(account acc2 :lstacc){
            if(acc1.size() > 0){
                acc2.addError('duplicates Found');
            }
        }
    }
}