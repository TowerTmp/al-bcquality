// FR-7: posting is blocked when the customer is over their credit limit.
[Test]
procedure FR7_PostingBlockedWhenOverCreditLimit()
begin
    asserterror PostingMgt.AssertWithinCreditLimit(OverLimitCustomer);
    Assert.ExpectedError('credit limit');
end;
