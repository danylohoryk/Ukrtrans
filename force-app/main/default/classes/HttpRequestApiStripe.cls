public class HttpRequestApiStripe {
    public void getAllCustomers(String name, String email) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.stripe.com/v1/customers');
        req.setMethod('POST');
        String api_key = 'sk_test_baHiDHoA1YioUeZyFKt2lBR600kjjMqwdI';
        req.setHeader('Authorization:', api_key);
        req.setBody('{"name": name, "email": email}');
    }
}
