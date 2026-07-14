// The dependency is an interface, injected into the code under test.
interface "ISalesTax Calc"
{
    procedure CalculateTax(Amount: Decimal): Decimal;
}

// Code under test depends on the interface, not a concrete codeunit.
codeunit 50410 "Order Total Calc"
{
    var
        TaxCalc: Interface "ISalesTax Calc";
        TaxCalcSet: Boolean;

    procedure SetTaxCalc(NewTaxCalc: Interface "ISalesTax Calc")
    begin
        TaxCalc := NewTaxCalc;
        TaxCalcSet := true;
    end;

    procedure GetOrderTotal(NetAmount: Decimal): Decimal
    begin
        if not TaxCalcSet then
            Error('Tax calculator not configured');
        exit(NetAmount + TaxCalc.CalculateTax(NetAmount));
    end;
}

// A stub double: returns a canned value, no database, no service call.
codeunit 50411 "Stub SalesTax Calc" implements "ISalesTax Calc"
{
    procedure CalculateTax(Amount: Decimal): Decimal
    begin
        exit(Amount * 0.25); // fixed, predictable rate for the test
    end;
}

codeunit 50412 "Order Total Tests"
{
    Subtype = Test;

    [Test]
    procedure TotalAddsTaxFromInjectedCalculator()
    var
        OrderTotalCalc: Codeunit "Order Total Calc";
        StubTax: Codeunit "Stub SalesTax Calc";
    begin
        // [GIVEN] the code under test wired to a stub instead of the real calculator
        OrderTotalCalc.SetTaxCalc(StubTax);

        // [WHEN] the total is requested  [THEN] only our logic is exercised
        Assert.AreEqual(125, OrderTotalCalc.GetOrderTotal(100), 'Total should be net + stubbed tax');
    end;

    var
        Assert: Codeunit "Library Assert";
}
