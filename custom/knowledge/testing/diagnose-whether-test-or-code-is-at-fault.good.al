// Requirement says VIP discount is 10%. Test failed because code returned 8.
// The code is wrong - fix the code, keep the assertion exact.
[Test]
procedure VipDiscountIsTenPercent()
begin
    Assert.AreEqual(10, DiscountMgt.GetDiscountPct(VipCustomer), 'VIP % per FR-3');
end;
