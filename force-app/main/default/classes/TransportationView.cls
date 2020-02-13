public class TransportationView {
    /*apex method to fetch wrapper of list view*/ 
    @AuraEnabled
    public static list<listViewWrapper> listValues(){
 
        list<listViewWrapper> listtrans = new list<listViewWrapper>();
 
        for(Transportation__c tr : [SELECT id, Name, State__c, Companies__r.Name, Drivers__r.Name, Type_of_product__c FROM Transportation__c]){ 
            listViewWrapper trans = new listViewWrapper();
            trans.id = tr.id;
            trans.name = tr.Name;
            trans.state = tr.State__c;
            trans.company = tr.Companies__r.Name;
            trans.driver = tr.Drivers__r.Name;
            trans.product = tr.Type_of_product__c;
            listtrans.add(trans);
        }
        return listtrans; 
    }
 
    /*wrapper class to store listView details*/ 
    public class listViewWrapper{
        @AuraEnabled public string id{get;set;} 
        @AuraEnabled public string name{get;set;} 
        @AuraEnabled public string state{get;set;}
        @AuraEnabled public string company{get;set;}
        @AuraEnabled public string driver{get;set;}
        @AuraEnabled public string product{get;set;}
    }
}