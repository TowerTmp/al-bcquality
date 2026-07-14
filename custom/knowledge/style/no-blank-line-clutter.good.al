procedure CalculateDiscount(Amount: Decimal): Decimal
begin
    exit(Amount * 0.1);
end;

procedure ApplyDiscount(var SalesLine: Record "Sales Line")
begin
    SalesLine.Validate("Line Discount %", CalculateDiscount(SalesLine.Amount));
    SalesLine.Modify(true);
end;
