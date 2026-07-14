// The spec asked to insert a buffer line - so the procedure only does that, with no telemetry noise
procedure InsertBufferLine(ItemNo: Code[20]; Quantity: Decimal)
var
    ScanBuffer: Record "Scan Buffer";
begin
    ScanBuffer.Init();
    ScanBuffer."Entry No." := NextEntryNo();
    ScanBuffer."Item No." := ItemNo;
    ScanBuffer.Quantity := Quantity;
    ScanBuffer.Insert(true);
end;

local procedure NextEntryNo(): Integer
var
    ScanBuffer: Record "Scan Buffer";
begin
    if ScanBuffer.FindLast() then
        exit(ScanBuffer."Entry No." + 1);
    exit(1);
end;
