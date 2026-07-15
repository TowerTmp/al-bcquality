[Test]
procedure CustomerChecks()
begin
    TempCustomer.Blocked := TempCustomer.Blocked::Invoice;
    Assert.IsTrue(TempCustomer.Blocked <> TempCustomer.Blocked::" ", 'blocked');
    TempCustomer."Credit Limit (LCY)" := 100;
    Assert.AreEqual(100, TempCustomer."Credit Limit (LCY)", 'limit');
    asserterror SalesMgt.AssertCanInvoice(TempCustomer);
end;
