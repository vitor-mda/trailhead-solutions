@isTest
private class AccountManagerTest {
    @TestSetup
    static void setup() {
        Account account = new Account(Name = 'Dope-a-Coola');
        insert account;
        
        List<Contact> contacts = new List<Contact>();
        
        for(Integer i = 0; i < 10; i++) {
            contacts.add(new Contact(AccountId = account.Id, LastName = 'Rad Lad'));
        }
        
        insert contacts;
    }
    
    @isTest
    static void getAccountTest() {
        Id accountId = [SELECT Id FROM Account LIMIT 1].Id;
        
        RestRequest request = new RestRequest();
        request.requestURI = URL.getOrgDomainUrl().getAuthority() + '/services/apexrest/Accounts/' + accountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account accountWithContacts = AccountManager.getAccount();
        
        System.assertEquals(10, accountWithContacts.Contacts.size());
    }
}