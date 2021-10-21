@isTest
private class AddPrimaryContactTest {
	@isTest
    	private static void executeTest() {
        List<Account> accsToInsert = new List<Account>();
        for(Integer i = 0; i < 50; i++) {
            accsToInsert.add(new Account(Name='NY Test Acc #' + i, BillingState = 'NY'));
            accsToInsert.add(new Account(Name='CA Test Acc #' + i, BillingState = 'CA'));
        }        
        insert accsToInsert;
        
        AddPrimaryContact contactAdder = new AddPrimaryContact(new Contact(LastName = 'Californian'), 'CA');
        
        Test.startTest();
        System.enqueueJob(contactAdder);
        Test.stopTest();
        
        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE Account.BillingState = 'CA']);
    }
}