public class QueueableApiUpdateCustomer implements Queueable, Database.AllowsCallouts {
    private List<Account> accounts;

    public QueueableApiUpdateCustomer(List<Account> acc) {
        this.accounts = acc;
    }

    public void execute(QueueableContext context) {
        for(Account acc : accounts){
            HttpRequestApiStripe.postCustomerToUpdate(acc.Name, acc.Acc_Email__c, acc.Stripe_Id__c);
        }
    }
}
