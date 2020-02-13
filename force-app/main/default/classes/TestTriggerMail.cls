@isTest
public class TestTriggerMail {
    @TestSetup
    static void makeData(){
        List<Driver__c> driver = new List<Driver__c>();
        Driver__c driver1 = new Driver__c(Name='Arkadii', Email__c='danylo.horyk@gmail.com');
        Driver__c driver2 = new Driver__c(Name='Danylo', Email__c='dalo.horyk@gmail.com');
        driver.add(driver1);
        driver.add(driver2);
        insert driver;
        List<Driver__c> dr = new List<Driver__c>([SELECT Id FROM Driver__c]); 
        Transportation__c trans = new Transportation__c(Name='Kyiv', Drivers__c=dr[0].Id);
        insert trans;
    }

    @isTest
    static void TestTriggerInsertMailSuccess() {
        List<Driver__c> dr = new List<Driver__c>([SELECT Id FROM Driver__c WHERE Name='Arkadii']);   
        Transportation__c trans = new Transportation__c(Name='Lviv', Drivers__c=dr[0].Id);
        insert trans;

    }

    @isTest
    static void TestTriggerInsertMailFail() {
        try{
            List<Driver__c> dr = new List<Driver__c>([SELECT Id FROM Driver__c WHERE Name='Danylo']);   
            Transportation__c trans = new Transportation__c(Name='German', Drivers__c=dr[0].Id);
            insert trans;
        }
        catch(Exception e){
            System.assertEquals('Email wasn\'t sent!', e.getMessage());
        }
    }

    @isTest
    static void TesstTriggerUpdateMailSuccess() {
        List<Transportation__c> transport = new List<Transportation__c>([SELECT Id, Name, Drivers__c FROM Transportation__c]);
        for(Transportation__c trans : transport){
            trans.Name = 'Lviv';
        }
        update transport;
    }

    @isTest
    static void TesstTriggerUpdateMailFail() {
        List<Transportation__c> transport = new List<Transportation__c>([SELECT Id, Name, Drivers__c FROM Transportation__c]);
        List<Driver__c> dr = new List<Driver__c>([SELECT Id FROM Driver__c WHERE Name='Danylo']);
        try{
            for(Transportation__c trans : transport){
                trans.Drivers__c = dr[0].Id;
            }
            update transport;
        }
        catch(Exception e){
            System.assertEquals('Email wasn\'t sent!', e.getMessage());
        }
    }

}
