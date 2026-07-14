// Field rules live in OnValidate - the one authoritative place, enforced for every writer
table 50300 "ENR Scan Buffer"
{
    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Item No."; Code[20])
        {
            trigger OnValidate()
            begin
                TestField("Item No.");
            end;
        }
        field(3; Quantity; Decimal)
        {
            trigger OnValidate()
            begin
                if Quantity <= 0 then
                    Error(QtyMustBePositiveErr);
            end;
        }
    }

    var
        QtyMustBePositiveErr: Label 'Quantity must be greater than zero.';
}

// Submit trusts entry-time validation; it only checks a state that can change after entry
codeunit 50300 "ENR Scan Submit"
{
    procedure Submit(var ScanBuffer: Record "ENR Scan Buffer")
    begin
        if ScanBuffer.IsEmpty() then
            Error(NothingToSubmitErr);
        // no re-checking of Item No. / Quantity - OnValidate already guaranteed them
        PostBuffer(ScanBuffer);
    end;

    local procedure PostBuffer(var ScanBuffer: Record "ENR Scan Buffer")
    begin
    end;

    var
        NothingToSubmitErr: Label 'There are no lines to submit.';
}
