@isTest
public class TestOpportunityChangeTrigger {
    
    @isTest
    static void testCreateAndUpdateOpportunity() {
        Test.enableChangeDataCapture();
        List<Opportunity> oppList = new List<Opportunity>();
        List<Task> taskList = new List<Task>();
        
        for (Integer i = 0; i < 150; i++) {
        	oppList.add(new Opportunity(Name = 'Sell 100 Widgets',
                                       StageName = 'Prospecting', CloseDate = Date.today().addMonths(3)));
        }        
        insert opplist;
        Test.getEventBus().deliver();
        
        taskList = [SELECT Id FROM Task];
        System.assertEquals(0, taskList.size());
        
        for (Opportunity o : oppList) {
            o.StageName = 'Closed Won';
        }
        update oppList;
        Test.getEventBus().deliver();
        
        taskList = [SELECT Id FROM Task];
        System.assertEquals(150, taskList.size());
    }
}
