@RestResource(urlMapping='/ApiCustomer/*')
 global with sharing class HandleCustomerApi {
    @HttpPost
    global static void doPost() {
        System.debug('sdgfdhgf');
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.statusCode = 200;
        String jsonBody = req.requestBody.toString();
        // Map<String, Object> results = (Map<String, Object>)Json.deserializeUntyped(jsonBody);
        // Map<String, Object> mainResults = (Map<String, Object>)(results.get('data'));
        // Map<String, Object> m = (Map<String, Object>)(mainResults.get('object'));
        System.debug('sdgfdhgf');
        System.debug(res);
        System.debug(req);
        // Account acc = new Account();
        // acc.Name = String.valueOf(m.get('name'));
        // acc.Acc_Email__c = String.valueOf(m.get('email'));
        // insert acc;
    }
}
