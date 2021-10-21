public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        for(Account account : [SELECT Id, (SELECT Id FROM Contacts)
                               FROM Account
                               WHERE Id IN :accountIds]) {
            account.Number_Of_Contacts__c = account.Contacts.size();
        }
    }
}