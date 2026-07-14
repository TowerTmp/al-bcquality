/// <summary>
/// Validates the customer credit limit before posting, because reversing a
/// posted document is expensive.
/// </summary>
procedure ValidateCreditLimitBeforePosting(CustomerNo: Code[20])
begin
    if IsOverCreditLimit(CustomerNo) then
        Error(CreditLimitExceededErr, CustomerNo);
end;

procedure IsOverCreditLimit(CustomerNo: Code[20]): Boolean
var
    Customer: Record Customer;
begin
    Customer.Get(CustomerNo);
    Customer.CalcFields("Balance (LCY)");
    exit(Customer."Balance (LCY)" > Customer."Credit Limit");
end;
