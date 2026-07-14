// Command - changes state, returns nothing
procedure ValidateAmount(Amount: Decimal)
begin
    if Amount <= 0 then
        Error(AmountMustBePositiveErr);
end;

// Query - returns a value, changes nothing
procedure IsAmountValid(Amount: Decimal): Boolean
begin
    exit(Amount > 0);
end;

// Accepted exception - TryFunction returns success
[TryFunction]
procedure TryValidateAmount(Amount: Decimal)
begin
    if Amount <= 0 then
        Error(AmountMustBePositiveErr);
end;
