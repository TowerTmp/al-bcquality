// Business rule and message text are named
var
    CreditLimitExceededErr: Label 'Customer %1 exceeds credit limit of %2.', Comment = '%1 = Customer No., %2 = Credit Limit';

procedure ValidateCreditLimit(CustomerNo: Code[20]; OutstandingAmount: Decimal)
var
    MaxCreditLimit: Decimal;
begin
    MaxCreditLimit := GetMaxCreditLimit();
    if OutstandingAmount > MaxCreditLimit then
        Error(CreditLimitExceededErr, CustomerNo, MaxCreditLimit);
end;
