trigger TriggerAccApi on Account (after insert, after update) {
    if(Trigger.isInsert) {
        Boolean check = false;
        for (Account acc : Trigger.new){
            if(acc.Import__c == false){
                check = true;
            }
        }
        if (check == true){
            ID jobID = System.enqueueJob(new QueueableApiStripe(Trigger.new));
        }
    }
}