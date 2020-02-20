@RestResource(urlMapping='/ApiCustomer')
 global class HandleCustomerApi {
    @httpPost
    global static void doPost() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.statusCode = 200;
        String jsonBody = req.requestBody.toString();
        Map<String, Object> results = (Map<String, Object>)Json.deserializeUntyped(jsonBody);
        Map<String, Object> mainResults = (Map<String, Object>)(results.get('data'));
        Map<String, Object> m = (Map<String, Object>)(mainResults.get('object'));
        System.debug(m);
        Account acc = new Account();
        acc.Name = String.valueOf(m.get('name'));
        acc.Acc_Email__c = String.valueOf(m.get('email'));
        insert acc;
    }
}
