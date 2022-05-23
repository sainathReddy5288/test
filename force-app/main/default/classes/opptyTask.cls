public class opptyTask {
    public static void opptyTaskOwner(list<opportunity> opptylist, map<id,opportunity> mapOppty)
    {   
        list<Task> tsk = new list<Task>();
        for(opportunity oppty : opptylist){
            if(oppty.Name != mapOppty.get(oppty.id).name){
            task ts =new task();
            ts.OwnerId=oppty.OwnerId;
            ts.Subject='call the customer immediately whith out any question ';
            ts.Priority='high';
            ts.Status='completed';
                tsk.add(ts);
            } 
            if(! tsk.isempty())
            {
                insert tsk;
            }
        }
        
    }}