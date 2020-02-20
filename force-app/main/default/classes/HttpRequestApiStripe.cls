public class HttpRequestApiStripe {
    public static void postCustomer(String name, String email) {
        String api_key = 'sk_test_baHiDHoA1YioUeZyFKt2lBR600kjjMqwdI';
        String body = 'name=' + name +'&email=' + email;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.stripe.com/v1/customers');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer ' + api_key);
        req.setBody(body);
        HttpResponse response = http.send(req);
        if (response.getStatusCode() == 200) {
            System.debug('Your customer was created on Stripe.');
        }
        else {
            System.debug('Something went wrong!');
        }
    }

    public static void getCustomers() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.stripe.com/v1/customers');
        req.setMethod('GET');
        String api_key = 'sk_test_baHiDHoA1YioUeZyFKt2lBR600kjjMqwdI';
        req.setHeader('Authorization', 'Bearer ' + api_key);
        HttpResponse response = http.send(req);
        if (response.getStatusCode() == 200) {
            System.debug('Your customer was created on Stripe.');
        }
        else {
            System.debug('Something went wrong!');
        }
    }
}
