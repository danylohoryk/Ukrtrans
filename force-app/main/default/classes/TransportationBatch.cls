global class TransportationBatch implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('a');
        return Database.getQueryLocator('SELECT Id, State__c, Closed__c FROM Transportation__c');
    }
    global void execute(Database.BatchableContext bc, List<Transportation__c> transportations){
        System.debug(transportations);
        for(Transportation__c trans : transportations){
            if(trans.State__c == 'delivered'){
                trans.Closed__c = true;
            }
        }
        try {
            update transportations;
        } catch (DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
    }
    global void finish(Database.BatchableContext bc){

    }
}
