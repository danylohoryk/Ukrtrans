global class ScheduleBatchTransportation implements Schedulable  {
    global void execute(SchedulableContext sc){
        TransportationBatch batch = new TransportationBatch();
        Database.executeBatch(batch);
    }
}