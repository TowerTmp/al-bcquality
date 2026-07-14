// Business fields set via Validate so each OnValidate trigger fires and
// recalculates dependent fields (Description, Unit Cost, amounts, posting groups).
procedure CreateSalesLine(var SalesLine: Record "Sales Line"; ItemNo: Code[20]; Qty: Decimal; DiscountPct: Decimal)
begin
    SalesLine.Init();
    // Identifier fields: no OnValidate side effects, direct assignment is fine
    SalesLine."Document Type" := SalesLine."Document Type"::Order;
    SalesLine."Line No." := 10000;

    // Business fields: Validate in dependency order so cascading logic runs
    SalesLine.Validate(Type, SalesLine.Type::Item);
    SalesLine.Validate("No.", ItemNo);              // fills Description, Unit Price, posting groups
    SalesLine.Validate(Quantity, Qty);              // recalculates Line Amount
    SalesLine.Validate("Line Discount %", DiscountPct); // reapplies discount to Line Amount
    SalesLine.Insert(true);
end;
