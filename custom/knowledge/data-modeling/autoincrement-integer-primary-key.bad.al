// PK field lacks AutoIncrement, so the key must be computed manually.
table 50100 "Credit Limit Log Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; } // missing AutoIncrement
        field(10; "Customer No."; Code[20]) { Caption = 'Customer No.'; }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}

// Manual "max + 1" helper: slower and races under concurrent inserts
// (two sessions read the same last number and collide).
procedure LogEntry(CustomerNo: Code[20])
var
    LogEntry: Record "Credit Limit Log Entry";
begin
    if LogEntry.FindLast() then
        LogEntry."Entry No." := LogEntry."Entry No." + 1
    else
        LogEntry."Entry No." := 1;
    LogEntry."Customer No." := CustomerNo;
    LogEntry.Insert(true);
end;
