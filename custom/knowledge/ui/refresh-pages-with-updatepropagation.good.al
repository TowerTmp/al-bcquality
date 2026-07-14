// Parent page: the part declares UpdatePropagation = Both, so subpage changes
// refresh the parent total automatically - no refresh code on the parent.
pageextension 50100 "Sales Order Refresh" extends "Sales Order"
{
    layout
    {
        modify(SalesLines)
        {
            UpdatePropagation = Both; // platform propagates subpage updates to the parent
        }
    }
}

// Subpage: one CurrPage.Update() in the trigger drives the propagation.
// UI-refresh stays in the page; business logic lives in the codeunit.
pageextension 50101 "Sales Line Refresh" extends "Sales Order Subform"
{
    layout
    {
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                CurrPage.Update(); // refreshes this subpage AND the parent total
            end;
        }
    }
}
