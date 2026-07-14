// Magic number and inline message; meaning is lost
procedure ValidateCreditLimit(CustomerNo: Code[20]; OutstandingAmount: Decimal)
begin
    if OutstandingAmount > 100000 then // what is 100000?
        Error('Customer %1 exceeds credit limit of %2.', CustomerNo, 100000);
end;

// magic percentage - discount? VAT? fee?
procedure CalculateDiscount(Amount: Decimal): Decimal
begin
    exit(Amount * 0.15);
end;
