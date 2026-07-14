// Helpers appear first; the reader meets detail with no context
procedure ValidateOrder(var SalesHeader: Record "Sales Header")
begin
    SalesHeader.TestField("Sell-to Customer No.");
end;

procedure CalculateTotals(var SalesHeader: Record "Sales Header")
begin
    // ...
end;

// The flow that gives them meaning is buried at the bottom
procedure ProcessOrder(var SalesHeader: Record "Sales Header")
begin
    ValidateOrder(SalesHeader);
    CalculateTotals(SalesHeader);
end;
