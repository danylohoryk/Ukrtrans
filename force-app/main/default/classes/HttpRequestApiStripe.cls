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
            String jsonBody = response.getbody();
            JSONparserCreateCustomer json = JSONparserCreateCustomer.parse(jsonBody);
            Account acc = [SELECT Id, Name, Acc_Email__c, Stripe_Id__c FROM Account WHERE Name=:json.name AND Acc_Email__c=:json.email LIMIT 1];
            acc.Stripe_Id__c = json.id;
            update acc;
            System.debug('Your customer was created on Stripe.');
        }
        else {
            System.debug('Something went wrong!');
        }
    }

    public static void postCustomerToUpdate(String name, String email, String Id) {
        String api_key = 'sk_test_baHiDHoA1YioUeZyFKt2lBR600kjjMqwdI';
        String body = 'name=' + name +'&email=' + email;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.stripe.com/v1/customers/'+id);
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer ' + api_key);
        req.setBody(body);
        HttpResponse response = http.send(req);
        if (response.getStatusCode() == 200) {
            System.debug('Your customer was udated on Stripe.');
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
            String jsonBody = response.getbody();
            JSON2Apex json = JSON2Apex.parse(jsonBody);
            Map<Id, JSON2Apex.Data> jsonObj = new Map<Id, JSON2Apex.Data>();
            for(JSON2Apex.Data field : json.Data){
                jsonObj.put(field.id, field);
            }
            List<Account> accounts = [SELECT Id, Name, Acc_Email__c, Stripe_Id__c FROM Account WHERE Stripe_Id__c IN (:jsonObj.keySet().toString())];
            List<String> Stripe_id = new List<String>();
            for(Account acc : accounts){
                JSON2Apex.Data Jsn = jsonObj.get(acc.Stripe_Id__c);
                Stripe_id.add(acc.Stripe_Id__c);
                if(acc.Name != Jsn.name || acc.Acc_Email__c != Jsn.email){
                    acc.Name = Jsn.name;
                    acc.Acc_Email__c = Jsn.email.toString();
                    acc.Update_on_Stripe__c = False;
                    update acc;
                }
            }
            for(JSON2Apex.Data field : json.Data){
                if(!Stripe_id.contains(field.id)){
                    Account acc = new Account();
                    acc.Name = field.name;
                    acc.Acc_Email__c = field.email.toString();
                    acc.Stripe_Id__c = field.id;
                    insert acc;
                }
            }
        }
        else {
            System.debug('Something went wrong!');
        }
    }
}
