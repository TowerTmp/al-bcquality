// Pure query - reads and returns, no writes
procedure GetOutstandingAmount(CustomerNo: Code[20]): Decimal
var
    Customer: Record Customer;
begin
    Customer.SetLoadFields("Balance (LCY)");
    Customer.Get(CustomerNo);
    Customer.CalcFields("Balance (LCY)");
    exit(Customer."Balance (LCY)");
end;
