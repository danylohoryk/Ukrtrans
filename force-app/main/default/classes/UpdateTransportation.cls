public class UpdateTransportation {
    @AuraEnabled
    public static Transportation__c getRecord(string recordId){
        Transportation__c trans = [SELECT id, Name, Companies__c, Companies__r.Name, Contact__c, Contact__r.Name, Destination_Pick_on_Map__c, Drivers__c,
        Drivers__r.Name, Price__c, Starting_Point_Pick_on_Map__c, State__c, Type_of_product__c, Urgent_1_10__c FROM Transportation__c WHERE id =: recordId LIMIT 1];
        return trans;
    }
    @AuraEnabled
    public static Transportation__c updateRecord(Transportation__c value){
        try {
            update value;
            return value;
        }
        catch (Exception e) {
            throw new AuraHandledException('Something went wrong when update record!!!');
        }
    }
}
