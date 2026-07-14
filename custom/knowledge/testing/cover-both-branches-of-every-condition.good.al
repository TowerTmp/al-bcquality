// Code under test: one if-guard with a true branch (error) and a
// false branch (allowed), plus a boundary the tests exercise explicitly.
codeunit 50415 "Credit Limit Check"
{
    procedure Approve(OrderAmount: Decimal; CreditLimit: Decimal)
    begin
        if OrderAmount > CreditLimit then       // true branch  -> rejected
            Error('Order exceeds credit limit');
        // false branch -> approved (nothing to do)
    end;
}

codeunit 50416 "Credit Limit Tests"
{
    Subtype = Test;

    // False branch: condition NOT triggered -> the rule allows the order.
    [Test]
    procedure WithinLimitIsApproved()
    var
        CreditLimitCheck: Codeunit "Credit Limit Check";
    begin
        // [GIVEN] amount below the limit  [WHEN] Approve  [THEN] no error
        CreditLimitCheck.Approve(90, 100);
    end;

    // True branch: condition triggered -> the rule rejects the order.
    [Test]
    procedure OverLimitIsRejected()
    var
        CreditLimitCheck: Codeunit "Credit Limit Check";
    begin
        // [GIVEN] amount above the limit  [WHEN] Approve  [THEN] specific error
        asserterror CreditLimitCheck.Approve(150, 100);
        Assert.ExpectedError('Order exceeds credit limit');
    end;

    // Edge case: exactly at the boundary -> false branch, approved.
    [Test]
    procedure ExactlyAtLimitIsApproved()
    var
        CreditLimitCheck: Codeunit "Credit Limit Check";
    begin
        // [GIVEN] amount equal to the limit  [WHEN] Approve  [THEN] no error
        CreditLimitCheck.Approve(100, 100);
    end;

    var
        Assert: Codeunit "Library Assert";
}
