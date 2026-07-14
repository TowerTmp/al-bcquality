// table: declared once at object level, applies to every field
table 50100 "ENR Credit Limit Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer) { }
        field(10; "Customer No."; Code[20]) { }
        field(20; "Credit Limit"; Decimal) { }
    }
}

// tableextension: no object-level default exists, so set it inside each added field
tableextension 50100 "ENR Customer" extends Customer
{
    fields
    {
        field(50100; "ENR Credit Limit"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50101; "ENR Risk Score"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }
}
