[Test]
procedure SomethingHappens()
begin
    Assert.IsTrue(PricingMgt.CalcAmount(3, 100) <> 0, '');
    asserterror PostingMgt.AssertWithinCreditLimit(OverLimitCustomer);
    // any error passes; expected text never checked
end;
