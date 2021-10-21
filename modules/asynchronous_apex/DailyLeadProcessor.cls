public class DailyLeadProcessor implements Schedulable {
    public static void execute(SchedulableContext scheduleContext) {
        List<Lead> leadsWithBlankLeadSource = [SELECT Id FROM Lead WHERE LeadSource = ''];
        
        for(Lead lead : leadsWithBlankLeadSource) {
            lead.LeadSource = 'Dreamforce';
        }
        
        update leadsWithBlankLeadSource;
    }
}