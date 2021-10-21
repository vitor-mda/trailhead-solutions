public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bContext) {
        return Database.getQueryLocator([SELECT LeadSource FROM Lead]);
    }
    
    public void execute(Database.BatchableContext bContext, List<Lead> scope) {
        for(Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
        }
        
        update scope;
    }
    
    public void finish(Database.BatchableContext bContext) {}
}