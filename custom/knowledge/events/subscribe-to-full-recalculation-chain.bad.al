// Only the item is handled. BC recalculates the discount when Quantity or
// Unit Price validate, so the custom value is overwritten on the next edit.
[EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
local procedure OnValidateItemNo(var Rec: Record "Sales Line")
begin
    DiscountMgt.ApplyDiscount(Rec);
end;
