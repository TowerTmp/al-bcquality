// Code under test hard-references a concrete dependency that talks to
// an external service, so it cannot be tested in isolation.
codeunit 50413 "Order Total Calc Bad"
{
    procedure GetOrderTotal(NetAmount: Decimal): Decimal
    var
        LiveTaxService: Codeunit "Live SalesTax Service"; // real HTTP call inside
    begin
        exit(NetAmount + LiveTaxService.CalculateTax(NetAmount));
    end;
}

codeunit 50414 "Order Total Tests Bad"
{
    Subtype = Test;

    [Test]
    procedure TotalAddsTax()
    var
        OrderTotalCalc: Codeunit "Order Total Calc Bad";
    begin
        // The test cannot control the dependency: it depends on the live tax
        // service being reachable and returning a known rate. If the service is
        // down or the rate changes, the test fails for reasons unrelated to the
        // logic under test — and the failure path can never be exercised at all.
        Assert.AreEqual(125, OrderTotalCalc.GetOrderTotal(100), 'Total should be net + tax');
    end;

    var
        Assert: Codeunit "Library Assert";
}
