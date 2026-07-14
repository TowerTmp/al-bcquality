// Telemetry nobody asked for: it adds noise, a maintained Label, and a privacy surface for a routine insert
procedure InsertBufferLine(ItemNo: Code[20]; Quantity: Decimal)
var
    ScanBuffer: Record "Scan Buffer";
    LineInsertedMsg: Label 'Buffer line inserted: Item No. %1.', Locked = true;
begin
    ScanBuffer.Init();
    ScanBuffer."Entry No." := NextEntryNo();
    ScanBuffer."Item No." := ItemNo;
    ScanBuffer.Quantity := Quantity;
    ScanBuffer.Insert(true);

    Session.LogMessage(
        '0000ISC-01',
        StrSubstNo(LineInsertedMsg, ItemNo),
        Verbosity::Normal,
        DataClassification::SystemMetadata,
        TelemetryScope::ExtensionPublisher,
        'Category', 'ScanBuffer');
end;

local procedure NextEntryNo(): Integer
var
    ScanBuffer: Record "Scan Buffer";
begin
    if ScanBuffer.FindLast() then
        exit(ScanBuffer."Entry No." + 1);
    exit(1);
end;
