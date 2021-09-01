public class OlderAccountsUtility {
    public static void updateOlderAccounts() {
        List<Account> oldAccounts = [SELECT Description
                                     FROM Account
                                     ORDER BY CreatedDate ASC
                                     LIMIT 5];
        
        for(Account a : oldAccounts ) {
            a.Description = 'Heritage Account';
        }
        
        update oldAccounts;
    }
}