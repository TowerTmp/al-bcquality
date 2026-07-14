// All statements at the same (high) level - reads as a narrative
procedure ProcessSalesOrder(var SalesHeader: Record "Sales Header")
begin
    ValidateCustomerCredit(SalesHeader);
    CalculateDiscounts(SalesHeader);
    PostDocument(SalesHeader);
    NotifyCustomer(SalesHeader);
end;

// Detail lives in a focused helper at the low level
procedure ValidateCustomerCredit(SalesHeader: Record "Sales Header")
var
    Customer: Record Customer;
begin
    Customer.SetLoadFields("Credit Limit", "Balance (LCY)");
    Customer.Get(SalesHeader."Sell-to Customer No.");
    Customer.CalcFields("Balance (LCY)");
    if Customer."Balance (LCY)" > Customer."Credit Limit" then
        Error(CreditLimitExceededErr, Customer."No.");
end;
