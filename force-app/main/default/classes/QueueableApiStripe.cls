public class QueueableApiStripe implements Queueable, Database.AllowsCallouts {
    private List<Account> accounts;

    public QueueableApiStripe(List<Account> acc){
        this.accounts = acc;
    }

    public void execute(QueueableContext context) {
        for(Account acc : accounts){
            HttpRequestApiStripe.postCustomer(acc.Name, acc.Acc_Email__c);
        }
    }
}