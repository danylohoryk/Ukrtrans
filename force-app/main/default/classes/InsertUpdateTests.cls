@isTest
public with sharing class InsertUpdateTests {
    @isTest
    static void testSuccessInsert() {
        Transportation__c value = new Transportation__c(Name='Ukraine');
        System.assertEquals(value, InsertTransportation.TransportationCreate(value));
    }

    @isTest
    static void testFailInsert(){
        try{
            Transportation__c value = new Transportation__c(Name='');
            InsertTransportation.TransportationCreate(value);
        }
        catch (Exception e){
            String message = 'Something went wrong when insert record!!!';
            System.assertEquals(message, e.getMessage());
        }
        
    }

    @TestSetup
    static void makeData(){
        Transportation__c trans = new Transportation__c(Name='Ukraine');
        insert trans;
    }

    @isTest
    static void testSuccessUpdate(){
        Transportation__c record = [select id, Name from Transportation__c limit 1];
        Transportation__c recordd = UpdateTransportation.getRecord(record.id);
        recordd.Name = 'German';
        System.assertEquals(recordd, UpdateTransportation.updateRecord(recordd));
    }

    @isTest
    static void testFailUpdate(){
        try {
            Transportation__c record = [select id, Name from Transportation__c limit 1];
            Transportation__c recordd = UpdateTransportation.getRecord(record.id);
            recordd.Name = '';
            UpdateTransportation.updateRecord(recordd);
        }
        catch (Exception e){
            String message = 'Something went wrong when update record!!!';
            System.assertEquals(message, e.getMessage());
        }
    }
}
