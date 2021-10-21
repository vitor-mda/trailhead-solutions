@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leadsToInsert = new List<Lead>();
        
        for(Integer i = 0; i < 200; i++) {
            leadsToInsert.add(new Lead(LastName = 'Test Lead #' + i, Company = 'Test'));
        }
        
        insert leadsToInsert;
    }
    
    @isTest
    static void test() {
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();
        System.assertEquals(200, [SELECT Count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}