@RestResource(urlMapping='/apexSecurityRest')
global with sharing class ApexSecurityRest {
    @HttpGet
    global static Contact doGet() {
        Id recordId = RestContext.request.params.get('id');
        Contact result;
        if (recordId == null) {
           throw new FunctionalException('Id parameter is required');
        }
        result = (Contact)Security.stripInaccessible(AccessType.READABLE,
                                            [SELECT id, Name, Title, Top_Secret__c, Account.Name FROM Contact WHERE Id = :recordId]
                                            ).getRecords()?.get(0);
        if (Schema.sObjectType.Contact.fields.Description.isUpdateable()) {
            result.Description = result.Account?.Name;
        }
        return result;
      }
      public class FunctionalException extends Exception{}
}
