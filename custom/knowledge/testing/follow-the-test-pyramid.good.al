[Test]
procedure VipDiscountIsTenPercent()
var
    TempCustomer: Record Customer temporary;
begin
    TempCustomer."Customer Disc. Group" := 'VIP';
    Assert.AreEqual(10, DiscountMgt.GetDiscountPct(TempCustomer), 'VIP discount %');
end;
