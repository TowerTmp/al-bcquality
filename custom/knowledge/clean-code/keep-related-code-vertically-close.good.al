procedure ProcessCustomer(CustomerNo: Code[20])
begin
    ValidateCustomer(CustomerNo);
    UpdateCustomerStatus(CustomerNo);
end;

// Helpers sit immediately below their caller
procedure ValidateCustomer(CustomerNo: Code[20])
var
    Customer: Record Customer;
begin
    Customer.Get(CustomerNo);
    TestCustomerFields(Customer);
end;

procedure UpdateCustomerStatus(CustomerNo: Code[20])
var
    Customer: Record Customer;
begin
    Customer.Get(CustomerNo);
    Customer.Validate(Blocked, Customer.Blocked::" ");
    Customer.Modify(true);
end;
