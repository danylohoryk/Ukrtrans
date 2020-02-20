trigger TriggerAccApi on Account (after insert, after update) {
    if(Trigger.isInsert) {
        ID jobID = System.enqueueJob(new QueueableApiStripe(Trigger.new));
    }
}