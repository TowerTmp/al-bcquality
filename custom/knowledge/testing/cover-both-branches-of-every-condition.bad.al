// Same code under test: a guard with two branches.
codeunit 50417 "Credit Limit Check Bad"
{
    procedure Approve(OrderAmount: Decimal; CreditLimit: Decimal)
    begin
        if OrderAmount > CreditLimit then       // true branch is NEVER tested
            Error('Order exceeds credit limit');
        // false branch
    end;
}

codeunit 50418 "Credit Limit Tests Bad"
{
    Subtype = Test;

    // Only the happy path. The over-limit branch is never exercised, so the
    // Error guard could be deleted and this suite would still pass green.
    // Code coverage shows the Error line as uncovered (red).
    [Test]
    procedure WithinLimitIsApproved()
    var
        CreditLimitCheck: Codeunit "Credit Limit Check Bad";
    begin
        CreditLimitCheck.Approve(90, 100);
    end;

    var
        Assert: Codeunit "Library Assert";
}
