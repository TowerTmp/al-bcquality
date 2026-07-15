[Test]
procedure LineAmount()
var
    SalesLine: Record "Sales Line";
begin
    // non-temporary: writes to the database from a unit test
    SalesLine.Init();
    SalesLine.Quantity := 3;
    SalesLine."Unit Price" := 100;
    SalesLine.Insert();
    PricingMgt.CalcLineAmount(SalesLine);
    SalesLine.Modify();
end;
