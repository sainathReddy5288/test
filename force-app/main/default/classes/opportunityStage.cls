public class opportunityStage {
  public static void opptystage(list<opportunity> oppty)
  {
      for(opportunity oppty1 : oppty)
      {
          oppty1.Stagename = 'prospecting';
          oppty1.closeDate = system.today()+15;
          oppty1.type ='New Customer';
      }
  }
}