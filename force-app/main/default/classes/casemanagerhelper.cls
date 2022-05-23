@restresource(URLMapping='/caseservicehelper/*')
Global class casemanagerhelper 
{
    @httpget()
  global static list<case> getallcaserecords()
  {
      list<case> lstcases=[select id,casenumber,status,origin,reason,type from case
                           where id !=null];
      return lstcases;
  }
}