trigger TriggerAccApi on Account (after insert, after update) {
    if(Trigger.isInsert) {
        List<Account> accounts = new List<Account>();
        for (Account acc : Trigger.new){
            if(acc.Stripe_Id__c == null){
                accounts.add(acc);
            }
        }
        if (!accounts.isEmpty()){
            ID jobID = System.enqueueJob(new QueueableApiStripe(accounts));
        }
    }
    if (Trigger.isUpdate) {
        for(Account accNew : Trigger.new){
            for(Account accOld : Trigger.old){
                if(accNew.Stripe_Id__c == accOld.Stripe_Id__c && accNew.Update_on_Stripe__c == True){
                    ID jobID = System.enqueueJob(new QueueableApiUpdateCustomer(Trigger.new));
                }
            }
        }
    }
}