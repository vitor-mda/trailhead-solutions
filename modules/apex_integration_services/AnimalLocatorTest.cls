@isTest
private class AnimalLocatorTest {    
    @isTest
    static void getAnimalNameByIdTest() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String returnedName = AnimalLocator.getAnimalNameById(1);
        
        System.assertEquals('chicken', returnedName);
    }
}