// One cohesive codeunit per domain.
codeunit 50130 "CDV Discount Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQty(var Rec: Record "Sales Line") begin DiscountMgt.Apply(Rec); end;
}

codeunit 50131 "CDV Audit Subscribers"  // cross-cutting concern, its own codeunit
{
}
