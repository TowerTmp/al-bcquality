// A helper owns the distant hop; callers stay shallow
procedure GetCustomerPostingGroup(CustomerNo: Code[20]): Code[20]
var
    Customer: Record Customer;
begin
    Customer.SetLoadFields("Customer Posting Group");
    Customer.Get(CustomerNo);
    exit(Customer."Customer Posting Group");
end;

procedure ProcessSalesLine(SalesLine: Record "Sales Line")
var
    SalesHeader: Record "Sales Header";
    PostingGroup: Code[20];
begin
    SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
    PostingGroup := GetCustomerPostingGroup(SalesHeader."Sell-to Customer No.");
end;
