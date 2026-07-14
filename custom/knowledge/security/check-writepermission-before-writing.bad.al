// No permission check - the delete runs and fails late, if at all
procedure DeleteCreditLimitEntry(EntryNo: Integer)
var
    CreditLimitEntry: Record "Credit Limit Entry";
begin
    if CreditLimitEntry.Get(EntryNo) then
        CreditLimitEntry.Delete(true);
end;

// Master data modified with no entitlement check in front of the write
procedure BlockCustomer(CustomerNo: Code[20])
var
    Customer: Record Customer;
begin
    Customer.Get(CustomerNo);
    Customer.Blocked := Customer.Blocked::All;
    Customer.Modify(true);
end;
