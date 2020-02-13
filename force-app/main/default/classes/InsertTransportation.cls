public with sharing class InsertTransportation {
    public InsertTransportation() {
    }
    @AuraEnabled
    public static Transportation__c TransportationCreate(Transportation__c value){
        try {
            insert value;
            return value;
        }
        catch(Exception e) {
            throw new AuraHandledException('Something went wrong when insert record!!!');
        }
    }
}
