@isTest
class AccountProcessorTest {
    @testSetup
    static void setup() {
        insert new Account(Name='T');
    }
    @isTest
    static void testForCodeCoverage() {
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{[SELECT Id FROM Account LIMIT 1].Id});
        Test.stopTest();
    }
    
}