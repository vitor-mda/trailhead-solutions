public class AccountUtility {
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        
        for(Account a : accountsList) {
            System.debug(a.Name + ': ' + a.AnnualRevenue);
        } 
    }
}