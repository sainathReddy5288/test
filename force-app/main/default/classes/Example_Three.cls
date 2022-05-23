public class Example_Three {
  @AuraEnabled
    public static String callAccount (String name,String industry,String rating,String phone){
     String result;
        try{
            Account acc =new Account();
            acc.Name=name;
            acc.Industry=industry;
            acc.Rating=rating;
            acc.Phone=phone;
            insert acc;
            result=''+acc.Id;
        }catch(Exception e){
            result=e.getMessage();
        }
        return result;
    }
}