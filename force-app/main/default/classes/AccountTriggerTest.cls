@isTest
public class AccountTriggerTest {
@isTest static void AccountMethod()
{
List<Account> accounts=new List<Account>();
for(integer i=1;i<=200;i++)
{
Account a=new Account();
a.Name='Test'+i;
a.BillingState='CA';
accounts.add(a);
}
test.startTest();
insert accounts;
test.stopTest();
List<Account> acc=[Select Id,ShippingState,BillingState from Account];
for(Account a:acc)
{
system.assertEquals(a.BillingState,a.ShippingState);
}


}

}