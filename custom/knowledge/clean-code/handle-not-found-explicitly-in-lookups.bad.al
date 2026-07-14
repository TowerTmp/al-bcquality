// Silently returns 0 when the customer does not exist
procedure GetCustomerCreditLimit(CustomerNo: Code[20]): Decimal
var
    Customer: Record Customer;
begin
    if Customer.Get(CustomerNo) then
        exit(Customer."Credit Limit");
    // falls through -> returns 0; caller cannot tell "no customer" from "limit is 0"
end;
