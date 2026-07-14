// Does both: mutates the line (command) AND returns a value (query)
procedure ValidateAndGetAmount(var SalesLine: Record "Sales Line"): Decimal
begin
    SalesLine.TestField("No.");
    SalesLine.Validate("Unit Price", GetStandardPrice());
    SalesLine.Modify(); // command
    exit(SalesLine."Line Amount"); // query
end;
