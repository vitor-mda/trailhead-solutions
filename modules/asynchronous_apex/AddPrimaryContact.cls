public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String billingState;
    
    public AddPrimaryContact(Contact contact, String state) {
	this.contact = contact;
	this.billingState = state;        
    }
    
    public void execute(QueueableContext qContext) {
        List<Contact> contactsToInsert = new List<Contact>();
        
        for(Account account : [SELECT Id FROM Account WHERE BillingState = :this.billingState LIMIT 200]) {
            Contact contact = this.contact.clone();
            contact.AccountId = account.Id;
            contactsToInsert.add(contact);
        }
        
        insert contactsToInsert;
    }
}