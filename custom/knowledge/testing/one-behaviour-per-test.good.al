[Test]
procedure RegularCustomerGetsFivePercent()
begin
    Assert.AreEqual(5, DiscountMgt.GetDiscountPct(RegularCustomer), 'regular %');
end;

[Test]
procedure VipCustomerGetsTenPercent()
begin
    Assert.AreEqual(10, DiscountMgt.GetDiscountPct(VipCustomer), 'VIP %');
end;
