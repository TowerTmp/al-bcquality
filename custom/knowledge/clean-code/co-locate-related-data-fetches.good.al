// One procedure reads every record needed for the one result: resolve a barcode to item details
procedure GetItemFromBarcode(BarcodeNo: Code[50]; var ItemNo: Code[20]; var Description: Text[100]; var BaseUoM: Code[10]): Boolean
var
    ItemReference: Record "Item Reference";
    Item: Record Item;
begin
    ItemReference.SetRange("Reference No.", BarcodeNo);
    ItemReference.SetRange("Reference Type", ItemReference."Reference Type"::"Bar Code");
    ItemReference.SetLoadFields("Item No.");
    if not ItemReference.FindFirst() then
        exit(false);

    ItemNo := ItemReference."Item No.";

    Item.SetLoadFields(Description, "Base Unit of Measure");
    if Item.Get(ItemNo) then begin
        Description := Item.Description;
        BaseUoM := Item."Base Unit of Measure";
    end;
    exit(true);
end;
