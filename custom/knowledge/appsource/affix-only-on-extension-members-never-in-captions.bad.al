table 50100 "ABC Credit Limit Entry"
{
    Caption = 'ABC Credit Limit Entry';          // affix leaked into the UI
    fields
    {
        field(2; "ABC Credit Limit"; Decimal)     // redundant affix on own-table field
        {
            Caption = 'ABC Credit Limit';         // affix leaked into the UI
        }
    }
}
