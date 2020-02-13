@isTest
public class TestTransportationBatch {
    @TestSetup
    static void makeData(){
        List<Driver__c> drivers = new List<Driver__c>();
        for(Integer i=0; i<200; i++){
            Driver__c dr = new Driver__c();
            dr.Name = 'driver' + i;
            dr.Email__c='driver'+i+'@gmail.com';
            drivers.add(dr);
        }
        insert drivers;
        List<Driver__c> driver = new List<Driver__c>([SELECT Id FROM Driver__c]);
        List<Transportation__c> transport = new List<Transportation__c>();
        for(Integer i=0; i<200; i++){
            Transportation__c trans = new Transportation__c();
            trans.Name = 'Trans'+i;
            trans.Drivers__c = driver[i].Id;
            trans.State__c = 'delivered';
            transport.add(trans);
        }
        insert transport;
    }

    @isTest
    static void BatchTransportation(){
        TransportationBatch batch = new TransportationBatch();
        Database.executeBatch(batch);
    }
}
