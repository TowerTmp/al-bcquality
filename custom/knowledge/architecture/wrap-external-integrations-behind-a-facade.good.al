interface "CDV IPaymentGateway"
{
    procedure GetBalance(AccountNo: Code[20]; var Balance: Decimal): Boolean;
}

codeunit 50110 "CDV Payment Gateway" implements "CDV IPaymentGateway"
{
    Access = Internal;

    procedure GetBalance(AccountNo: Code[20]; var Balance: Decimal): Boolean
    begin
        // HttpClient, auth, retry, error->message translation all live here
    end;
}

// Business code depends on the interface, not on HttpClient.
// if PaymentGateway.GetBalance(Acc, Balance) then ...
