tableextension 50100 "CDV Customer" extends Customer
{
    fields
    {
        field(50100; "CDV Credit Limit"; Decimal)
        {
            Caption = 'Credit Limit';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the maximum credit allowed for this customer.';
        }
    }
}

pageextension 50100 "CDV Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CDV Credit Limit"; Rec."CDV Credit Limit") { }
        }
    }
}
