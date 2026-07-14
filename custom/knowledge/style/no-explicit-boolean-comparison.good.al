procedure Ship(Customer: Record Customer; IsValid: Boolean)
begin
    if IsValid then
        Process();
    if not Customer.Blocked then
        Release();
end;
