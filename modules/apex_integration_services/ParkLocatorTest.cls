@isTest
private class ParkLocatorTest {
    @isTest
    static void byCountryTest() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> response = ParkLocator.country('India');
        
        System.assertEquals(3, response.size());
        for(String park : response) {
            System.assert(park.containsIgnoreCase('park'));
        }
    }
}