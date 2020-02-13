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
        update transportations;
    }
    global void finish(Database.BatchableContext bc){

    }
}
