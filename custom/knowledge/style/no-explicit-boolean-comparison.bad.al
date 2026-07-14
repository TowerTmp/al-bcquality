procedure Ship(Customer: Record Customer; IsValid: Boolean)
begin
    if IsValid = true then
        Process();
    if Customer.Blocked = false then
        Release();
end;
