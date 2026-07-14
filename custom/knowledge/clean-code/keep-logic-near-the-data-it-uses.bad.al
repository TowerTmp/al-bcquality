// Credit-limit logic buried in sales processing - it envies Customer data
codeunit 50200 "ENR Sales Processing"
{
    procedure PostSalesOrder(var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        Customer.Get(SalesHeader."Sell-to Customer No.");
        Customer.CalcFields("Balance (LCY)");
        if Customer."Balance (LCY)" + SalesHeader.Amount > Customer."Credit Limit" then
            Error(CreditLimitExceededErr);
        // more Customer field access and Modify here...
    end;
}
