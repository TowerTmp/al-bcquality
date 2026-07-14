// High-level entry point first...
procedure ProcessOrder(var SalesHeader: Record "Sales Header")
begin
    ValidateOrder(SalesHeader);
    CalculateTotals(SalesHeader);
    FinalizeOrder(SalesHeader);
end;

// ...then the helpers it calls, in call order
procedure ValidateOrder(var SalesHeader: Record "Sales Header")
begin
    SalesHeader.TestField("Sell-to Customer No.");
    SalesHeader.TestField("Order Date");
end;

procedure CalculateTotals(var SalesHeader: Record "Sales Header")
begin
    // ...
end;
