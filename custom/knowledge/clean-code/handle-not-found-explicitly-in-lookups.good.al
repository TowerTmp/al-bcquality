// Required lookup - errors clearly on not-found
procedure GetCustomerCreditLimit(CustomerNo: Code[20]): Decimal
var
    Customer: Record Customer;
begin
    if not Customer.Get(CustomerNo) then
        Error(CustomerNotFoundErr, CustomerNo);
    exit(Customer."Credit Limit");
end;

// Optional lookup - forces the caller to check success
procedure TryGetCustomerCreditLimit(CustomerNo: Code[20]; var CreditLimit: Decimal): Boolean
var
    Customer: Record Customer;
begin
    if not Customer.Get(CustomerNo) then
        exit(false);
    CreditLimit := Customer."Credit Limit";
    exit(true);
end;
