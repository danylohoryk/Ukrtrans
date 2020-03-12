global class ScheduleBatchTransportation implements Schedulable  {
    global void execute(SchedulableContext sc){
        TransportationBatch batch = new TransportationBatch();
        Database.executeBatch(batch);
        ID jobID = System.enqueueJob(new QueueableAccountInsert());
    }
}