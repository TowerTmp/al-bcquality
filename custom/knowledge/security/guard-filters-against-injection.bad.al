// Unsanitized user input passed straight into SetFilter
procedure GetOrders(CustomerNoFilter: Text)
var
    SalesHeader: Record "Sales Header";
begin
    // Caller can pass '..|..' to match every order, not one customer
    SalesHeader.SetFilter("Sell-to Customer No.", CustomerNoFilter);
end;

// StrSubstNo builds the filter from raw input - operators inject through
procedure GetOrdersByDateRange(FromDate: Text; ToDate: Text)
var
    SalesHeader: Record "Sales Header";
    FilterExpr: Text;
begin
    FilterExpr := StrSubstNo('%1..%2', FromDate, ToDate);
    SalesHeader.SetFilter("Order Date", FilterExpr);
end;
