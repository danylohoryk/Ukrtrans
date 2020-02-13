trigger DriverTriggerSendMail on Transportation__c (after insert, after update) {
    if (Trigger.isInsert){
        for(Transportation__c trans : [SELECT Id, Name, Drivers__r.Email__c FROM Transportation__c WHERE Id IN :Trigger.New]) {
            try{
                EmailManager.sendMail(trans.Drivers__r.Email__c, trans.Name, 'You have a New Transportation.');
            }
            catch (Exception e) {
                throw new AuraHandledException('Email wasn\'t sent!');
            }
        }
    }
    else if (Trigger.isUpdate){
        Map<Id, Driver__c> drivers = new Map<Id, Driver__c>([SELECT Id, Email__c FROM Driver__c]);
        for(Transportation__c transNew : Trigger.new){
            for (Transportation__c transOld : Trigger.old) {
                if (transNew.Drivers__c == transOld.Drivers__c){
                    try {
                        EmailManager.sendMail(drivers.get(transNew.Drivers__c).Email__c, transNew.Name, 'Your Transportation was Updated.');
                    }
                    catch(Exception e){
                        throw new AuraHandledException('Email wasn\'t sent!');
                    }
                }
                else {
                    try {
                        EmailManager.sendMail(drivers.get(transNew.Drivers__c).Email__c, transNew.Name, 'You have a New Transportation.');
                        EmailManager.sendMail(drivers.get(transOld.Drivers__c).Email__c, transOld.Name, 'Your Transportation was given anouther driver.');
                    }
                    catch(Exception e){
                        throw new AuraHandledException('Email wasn\'t sent!');
                    }
                }
            }
        }
    }
}