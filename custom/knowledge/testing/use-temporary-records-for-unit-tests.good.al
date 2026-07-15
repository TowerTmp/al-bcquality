[Test]
procedure LineAmountIsQtyTimesPrice()
var
    TempSalesLine: Record "Sales Line" temporary;
begin
    TempSalesLine.Quantity := 3;
    TempSalesLine."Unit Price" := 100;
    PricingMgt.CalcLineAmount(TempSalesLine);
    Assert.AreEqual(300, TempSalesLine."Line Amount", 'line amount');
end;
