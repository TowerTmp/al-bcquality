[Test]
procedure TestDiscounts()
begin
    Assert.AreEqual(5, DiscountMgt.GetDiscountPct(RegularCustomer), 'regular');
    Assert.AreEqual(10, DiscountMgt.GetDiscountPct(VipCustomer), 'vip');
    Assert.AreEqual(15, DiscountMgt.GetDiscountPct(PremiumCustomer), 'premium');
    // first failure hides the other two; name says nothing
end;
