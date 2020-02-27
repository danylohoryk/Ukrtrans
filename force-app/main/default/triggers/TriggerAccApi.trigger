trigger TriggerAccApi on Account (after insert, after update) {
    if(Trigger.isInsert) {
        for (Account acc : Trigger.new){
            if(acc.Import__c == false){
                ID jobID = System.enqueueJob(new QueueableApiStripe(Trigger.new));
            }
        }
    }
}