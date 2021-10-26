public class ParkLocator {
    public static List<String> country(String country) {
        return new ParkService.ParksImplPort().byCountry(country);
    }
}