// Manual refresh action on the parent doing what UpdatePropagation = Both handles,
// plus a redundant "true" argument on a page that has a SourceTable.
pageextension 50100 "Sales Order Refresh" extends "Sales Order"
{
    actions
    {
        addlast(processing)
        {
            action(RefreshTotals)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.Update(true); // redundant: "true" is the default with a SourceTable
                end;
            }
        }
    }
}

// Worst case: a business codeunit reaching into the UI.
// CurrPage is not valid here and this couples logic to a page, breaking testability.
codeunit 50100 "Sales Total Mgt."
{
    procedure Recalculate(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.CalcFields("Amount Including VAT");
        CurrPage.Update(); // remove: codeunits must not reference CurrPage
    end;
}
