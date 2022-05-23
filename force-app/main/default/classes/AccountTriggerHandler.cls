public class AccountTriggerHandler {
public static void CreateAccounts(List<Account> Acc)
{
for(Account a:acc)
{
a.ShippingState=a.BillingState;
}
}
}