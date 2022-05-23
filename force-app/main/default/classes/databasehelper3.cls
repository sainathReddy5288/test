public class databasehelper3 {
    public static void GetAllCaseRecords()
    {
        map<Id, case> mapcases =new map<Id, case> ([select id, status,origin,type,subject,reason,priority from case]);
        
        for(case cs : mapcases.values())
        {
            system.debug('case record is....'+cs);
        }
    }

}