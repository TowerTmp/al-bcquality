procedure CreateSalesOrder(
    CustomerNo: Code[20];
    OrderDate: Date;
    ShipToAddress: Text[100];
    PaymentTerms: Code[10]): Code[20]
var
    SalesHeader: Record "Sales Header";
begin
    SalesHeader.Init();
    SalesHeader.Validate("Sell-to Customer No.", CustomerNo);
    SalesHeader.Insert(true);
    exit(SalesHeader."No.");
end;
