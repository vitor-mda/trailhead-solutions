public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        String animalName;
        
        if(response.getStatusCode() == 200) {
            String responseBody = response.getBody();
            Map<String, Map<String, String>> animal =
                (Map<String, Map<String, String>>) JSON.deserializeStrict(responseBody, Map<String, Map<String, String>>.class);
            
            animalName = animal.get('animal').get('name');
        }
        
        return animalName;
    }
}