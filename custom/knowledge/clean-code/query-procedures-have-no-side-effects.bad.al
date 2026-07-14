// Side effect hidden inside a 'Get' function
procedure GetOutstandingAmount(CustomerNo: Code[20]): Decimal
var
    Customer: Record Customer;
begin
    Customer.Get(CustomerNo);
    Customer."Last Check Date" := Today();
    Customer.Modify(); // writes to the database from a query - callers do not expect this
    exit(Customer."Outstanding Amount");
end;
