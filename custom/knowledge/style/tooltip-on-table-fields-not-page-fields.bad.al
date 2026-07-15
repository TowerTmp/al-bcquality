pageextension 50100 "CDV Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CDV Credit Limit"; Rec."CDV Credit Limit")
            {
                ToolTip = 'Specifies the maximum credit allowed for this customer.';
            }
        }
    }
}
