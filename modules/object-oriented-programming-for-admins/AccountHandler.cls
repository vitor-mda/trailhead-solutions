public class AccountHandler {
    public static void insertAccount(Integer amount) {
        List<Account> addAccounts = new List<Account>();
        Integer i = 0;
        
        while(i++ < amount) {
            addAccounts.add(new Account(Name = 'Acme Inc ' + i, AccountNumber = 'A000' + i));
        }
        
        if(!addAccounts.isEmpty()) {
            insert addAccounts;
    	}
    }
}