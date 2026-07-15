// Own table: fields carry NO affix (the table name already has it); captions are clean.
table 50100 "ABC Credit Limit Entry"
{
    Caption = 'Credit Limit Entry';
    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Credit Limit"; Decimal) { Caption = 'Credit Limit'; }
    }
}

// Extension of a base table: added field IS affixed; caption stays clean.
tableextension 50100 "ABC Customer" extends Customer
{
    fields
    {
        field(50100; "ABC Credit Limit"; Decimal) { Caption = 'Credit Limit'; }
    }
}
