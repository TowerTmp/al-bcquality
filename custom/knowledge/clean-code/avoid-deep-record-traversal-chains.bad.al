// Deep chain: Sales Line -> Sales Header -> Customer -> Posting Group
procedure ProcessSalesLine(SalesLine: Record "Sales Line")
var
    SalesHeader: Record "Sales Header";
    Customer: Record Customer;
    PostingGroup: Code[20];
begin
    SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
    Customer.Get(SalesHeader."Sell-to Customer No.");
    PostingGroup := Customer."Customer Posting Group"; // coupled to all three tables
end;
