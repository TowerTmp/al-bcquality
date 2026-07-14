// Customer logic lives in a Customer-focused management codeunit
codeunit 50100 "ENR Credit Limit Mgt."
{
    procedure CheckCreditLimit(CustomerNo: Code[20])
    var
        Customer: Record Customer;
    begin
        Customer.SetLoadFields("Credit Limit", "Balance (LCY)");
        Customer.Get(CustomerNo);
        Customer.CalcFields("Balance (LCY)");
        if Customer."Balance (LCY)" > Customer."Credit Limit" then
            Error(CreditLimitExceededErr, CustomerNo);
    end;
}

// Sales processing just delegates
codeunit 50200 "ENR Sales Processing"
{
    procedure PostSalesOrder(var SalesHeader: Record "Sales Header")
    var
        CreditLimitMgt: Codeunit "ENR Credit Limit Mgt.";
    begin
        CreditLimitMgt.CheckCreditLimit(SalesHeader."Sell-to Customer No.");
    end;
}
