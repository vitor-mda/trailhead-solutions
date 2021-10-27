@RestResource(urlMapping = '/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        String accountId =
            RestContext.request.requestUri.substringBetween('/Accounts/', '/contacts');
        
        return [SELECT Id, Name, (SELECT Id, LastName FROM Contacts)
                FROM Account
                WHERE Id = :accountId];
    }
}