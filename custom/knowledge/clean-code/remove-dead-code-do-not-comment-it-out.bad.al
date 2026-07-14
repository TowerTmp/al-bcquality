// CC009 - empty triggers add noise
trigger OnModify()
begin
    // TODO: add validation
end;

trigger OnDelete()
begin
    // we might need this later
end;

procedure ProcessOrder()
begin
    ValidateOrder();
    // PostOrder();                     // disabled for testing - delete this, don't keep it
    // if Status = Status::Released then
    //     NotifyCustomer();
end;
