[Test]
procedure VipDiscount()
begin
    // posts a whole order just to check one discount percentage
    LibrarySales.CreateCustomer(Customer);
    LibrarySales.CreateSalesDocumentWithItem(SalesHeader, SalesLine, ...);
    Codeunit.Run(Codeunit::"Sales-Post", SalesHeader);
    Assert.AreEqual(10, SalesLine."Line Discount %", 'discount');
end;
