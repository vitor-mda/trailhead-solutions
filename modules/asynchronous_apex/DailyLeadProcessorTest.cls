@isTest
private class DailyLeadProcessorTest {
    @TestSetup
    private static void setup() {
        List<Lead> leadsToInsert = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            leadsToInsert.add(new Lead(LastName = 'Test Lead #' + i, Company = 'Mamma Mia Pizzeria'));
        }
        insert leadsToInsert;
    }
    
    @isTest
    private static void executeTest() {
        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = '']);
        
        Test.startTest();
        System.schedule('Daily Lead Processor Test',
                        '0 0 0 21 10 ? 2024',
                        new DailyLeadProcessor());
        Test.stopTest();
        
        System.assertEquals(0, [SELECT COUNT() FROM Lead WHERE LeadSource = '']);
    }
}