[Test]
procedure OverLimitRaisesSpecificError()
begin
    Assert.AreEqual(300, PricingMgt.CalcAmount(3, 100), 'amount for 3 x 100');
    asserterror PostingMgt.AssertWithinCreditLimit(OverLimitCustomer);
    Assert.ExpectedError('exceeds credit limit');
end;
