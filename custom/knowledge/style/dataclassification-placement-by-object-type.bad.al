// tableextension: DataClassification is not valid at the object body level here...
tableextension 50100 "ENR Customer" extends Customer
{
    DataClassification = CustomerContent;

    fields
    {
        field(50100; "ENR Credit Limit"; Decimal)
        {
            // ...and the added field wrongly relies on inheritance that extensions do not provide
        }
    }
}

// table: the same value repeated on every field instead of once at the object level
table 50100 "ENR Credit Limit Entry"
{
    fields
    {
        field(1; "Entry No."; Integer) { DataClassification = CustomerContent; }
        field(10; "Customer No."; Code[20]) { DataClassification = CustomerContent; }
        field(20; "Credit Limit"; Decimal) { DataClassification = CustomerContent; }
    }
}
