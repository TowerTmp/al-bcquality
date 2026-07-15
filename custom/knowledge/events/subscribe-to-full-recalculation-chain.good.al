[EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
local procedure OnValidateItemNo(var Rec: Record "Sales Line")
begin
    DiscountMgt.ApplyDiscount(Rec);
end;

[EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
local procedure OnValidateQuantity(var Rec: Record "Sales Line")
begin
    DiscountMgt.ApplyDiscount(Rec);
end;

[EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Unit Price', false, false)]
local procedure OnValidateUnitPrice(var Rec: Record "Sales Line")
begin
    DiscountMgt.ApplyDiscount(Rec);
end;
