// Typed value via SetRange - treated as a literal, no operator can be injected
procedure GetCustomerOrders(CustomerNo: Code[20])
var
    SalesHeader: Record "Sales Header";
begin
    SalesHeader.SetRange("Sell-to Customer No.", CustomerNo);
    if SalesHeader.FindSet() then
        repeat
        // process orders for exactly this customer
        until SalesHeader.Next() = 0;
end;

// A real filter expression is required - validate against an allow-list first
procedure GetOrdersByStatus(StatusFilter: Text)
var
    SalesHeader: Record "Sales Header";
begin
    if not (StatusFilter in ['Open', 'Released', 'Open|Released']) then
        Error('Invalid status filter.');
    SalesHeader.SetFilter(Status, StatusFilter);
end;
