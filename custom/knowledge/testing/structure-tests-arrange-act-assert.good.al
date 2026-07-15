[Test]
procedure BlockedCustomerCannotBeInvoiced()
var
    TempCustomer: Record Customer temporary;
begin
    // GIVEN
    TempCustomer.Blocked := TempCustomer.Blocked::Invoice;
    // WHEN
    asserterror SalesMgt.AssertCanInvoice(TempCustomer);
    // THEN
    Assert.ExpectedError('blocked for Invoice');
end;
