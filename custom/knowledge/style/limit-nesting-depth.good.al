// Guard clause + extracted helper keep each procedure within three levels
procedure ProcessOrders()
var
    SalesHeader: Record "Sales Header";
begin
    if not SalesHeader.FindSet() then
        exit;
    repeat
        if SalesHeader.Status = SalesHeader.Status::Open then
            ProcessOpenOrder(SalesHeader);
    until SalesHeader.Next() = 0;
end;

procedure ProcessOpenOrder(SalesHeader: Record "Sales Header")
var
    SalesLine: Record "Sales Line";
begin
    SalesLine.SetRange("Document No.", SalesHeader."No.");
    if not SalesLine.FindSet() then
        exit;
    repeat
        if (SalesLine.Quantity > 0) and (SalesLine.Amount > 100) then
            ProcessHighValueLine(SalesLine);
    until SalesLine.Next() = 0;
end;
