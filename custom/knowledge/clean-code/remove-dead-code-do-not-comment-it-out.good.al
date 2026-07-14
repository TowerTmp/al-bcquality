// Only declare a trigger that does something
trigger OnInsert()
begin
    Validate("Posting Date", WorkDate());
end;

// No empty OnModify/OnDelete triggers - add them if and when they are needed.

procedure ProcessOrder()
begin
    ValidateOrder();
    PostOrder();
end;
