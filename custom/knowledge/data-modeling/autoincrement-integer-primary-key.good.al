// Non-temporary table: the platform assigns "Entry No." on Insert.
table 50100 "Credit Limit Log Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true; // platform generates the next value, concurrency-safe
        }
        field(10; "Customer No."; Code[20]) { Caption = 'Customer No.'; }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}

// Caller: no manual key handling - just Insert().
procedure LogEntry(CustomerNo: Code[20])
var
    LogEntry: Record "Credit Limit Log Entry";
begin
    LogEntry."Customer No." := CustomerNo;
    LogEntry.Insert(true); // "Entry No." filled automatically
end;
