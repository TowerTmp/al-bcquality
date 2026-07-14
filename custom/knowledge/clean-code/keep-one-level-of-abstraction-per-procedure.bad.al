// Mixes high-level flow with low-level record detail in one procedure
procedure ProcessSalesOrder(var SalesHeader: Record "Sales Header")
var
    Customer: Record Customer;
    SalesLine: Record "Sales Line";
begin
    Customer.Get(SalesHeader."Sell-to Customer No."); // low-level detail...
    Customer.CalcFields("Balance (LCY)");
    if Customer."Balance (LCY)" > Customer."Credit Limit" then
        Error(CreditLimitExceededErr);

    SalesLine.SetRange("Document No.", SalesHeader."No."); // ...more low-level detail...
    if SalesLine.FindSet() then
        repeat
        until SalesLine.Next() = 0;

    PostDocument(SalesHeader); // ...next to a high-level call
end;
