// Submit re-validates the very fields the table's OnValidate triggers already guaranteed on entry
codeunit 50300 "ENR Scan Submit"
{
    procedure Submit(var ScanBuffer: Record "ENR Scan Buffer")
    begin
        if ScanBuffer.IsEmpty() then
            Error(NothingToSubmitErr);

        ScanBuffer.FindSet();
        repeat
            if ScanBuffer.Quantity <= 0 then            // already enforced by field OnValidate
                Error(QtyMustBePositiveErr);
            if ScanBuffer."Item No." = '' then          // already enforced by field OnValidate
                Error(ItemNoBlankErr, ScanBuffer."Entry No.");
        until ScanBuffer.Next() = 0;

        PostBuffer(ScanBuffer);
    end;

    local procedure PostBuffer(var ScanBuffer: Record "ENR Scan Buffer")
    begin
    end;

    var
        NothingToSubmitErr: Label 'There are no lines to submit.';
        QtyMustBePositiveErr: Label 'Quantity must be greater than zero.';
        ItemNoBlankErr: Label 'Item No. is blank on entry %1.', Comment = '%1 = Entry No.';
}
