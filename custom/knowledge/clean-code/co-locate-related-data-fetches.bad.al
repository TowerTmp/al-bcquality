// One result split across a chain of procedures that only call each other - and Item is read twice
procedure GetItemFromBarcode(BarcodeNo: Code[50]; var ItemNo: Code[20]; var Description: Text[100]; var BaseUoM: Code[10])
begin
    ResolveAndDescribe(BarcodeNo, ItemNo, Description, BaseUoM);   // just forwards...
end;

local procedure ResolveAndDescribe(BarcodeNo: Code[50]; var ItemNo: Code[20]; var Description: Text[100]; var BaseUoM: Code[10])
var
    Item: Record Item;
begin
    ResolveBarcode(BarcodeNo, ItemNo);      // ...to another link...
    Item.Get(ItemNo);                       // re-reads Item
    BaseUoM := Item."Base Unit of Measure";
    Description := Item.Description;
end;

local procedure ResolveBarcode(BarcodeNo: Code[50]; var ItemNo: Code[20])
var
    ItemReference: Record "Item Reference";
begin
    ItemReference.SetRange("Reference No.", BarcodeNo);
    ItemReference.SetRange("Reference Type", ItemReference."Reference Type"::"Bar Code");
    if ItemReference.FindFirst() then
        ItemNo := ItemReference."Item No.";
end;
