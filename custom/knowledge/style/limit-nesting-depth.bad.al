// Five levels of control flow in one procedure -> intent buried under indentation
procedure ProcessOrders()
var
    SalesHeader: Record "Sales Header";
    SalesLine: Record "Sales Line";
begin
    if SalesHeader.FindSet() then                                       // level 1
        repeat
            if SalesHeader.Status = SalesHeader.Status::Open then begin // level 2
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                if SalesLine.FindSet() then                            // level 3
                    repeat
                        if SalesLine.Quantity > 0 then                 // level 4
                            if SalesLine.Amount > 100 then             // level 5
                                ProcessHighValueLine(SalesLine);
                    until SalesLine.Next() = 0;
            end;
        until SalesHeader.Next() = 0;
end;
