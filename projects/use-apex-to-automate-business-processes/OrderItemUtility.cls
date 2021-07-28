public class OrderItemUtility {
    public static void addBonusBouquet(List<Order> ordersFromTrigger) {
        List<OrderItem> newBouquets = new List<OrderItem>();
        List<PricebookEntry> entry = [
                SELECT Id
                FROM PricebookEntry
                WHERE Product2Id IN (
                    	SELECT Id
            		FROM Product2
            		WHERE ProductCode = 'BOT-BB-12'
                )
            ];
        
        for(Order o : ordersFromTrigger) {
            if(o.Status == 'Activated' && !entry.isEmpty()) {
                newBouquets.add(
                    new OrderItem(
                        OrderId = o.Id, numberOfFlowers__c = 3,
                        description = 'FREE Bouquet', Quantity = 1,
                        colorTheme__c = 'Spectacular Sunset', percentOfOpening__c = 0,
                        PricebookEntryId = entry[0].id, UnitPrice = 0.0
                    )
                );
             }
        }
        
        if(!newBouquets.isEmpty()) {
            insert newBouquets;
        }
    }
}