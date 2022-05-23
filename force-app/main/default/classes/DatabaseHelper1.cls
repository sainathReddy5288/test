public class DatabaseHelper1 {
    public static void GetAllCaseRecords()
    {
        List<case> lstcases = [select id,status,type,priority,reason,origin,subject from case];
            map<id,case> mapcases = new map<id,case>();
        for(case cs :lstcases)
        {
            mapcases.put(cs.id,cs);
        }
    }

}