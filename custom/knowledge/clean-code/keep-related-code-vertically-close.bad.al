procedure ProcessCustomer(CustomerNo: Code[20])
begin
    ValidateCustomer(CustomerNo);
    UpdateCustomerStatus(CustomerNo);
end;

// ... ~200 lines of unrelated procedures in between ...

procedure ValidateCustomer(CustomerNo: Code[20])
begin
    // reader must scroll far from ProcessCustomer to find this
end;

// ... ~100 more lines ...

procedure UpdateCustomerStatus(CustomerNo: Code[20])
begin
    // also far from its caller
end;
