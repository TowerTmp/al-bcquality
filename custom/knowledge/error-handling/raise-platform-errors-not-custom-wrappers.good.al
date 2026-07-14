// Call the standard operation directly - the platform raises a clear, localized error on failure
procedure GetCustomerName(CustomerNo: Code[20]): Text[100]
var
    Customer: Record Customer;
begin
    Customer.Get(CustomerNo);
    exit(Customer.Name);
end;

// Branch on the find result instead of throwing on "not found"
procedure ApplyDefaultDimension(var SalesLine: Record "Sales Line")
var
    DefaultDimension: Record "Default Dimension";
begin
    DefaultDimension.SetRange("Table ID", Database::Customer);
    DefaultDimension.SetRange("No.", SalesLine."Sell-to Customer No.");
    if DefaultDimension.FindFirst() then
        SalesLine."Shortcut Dimension 1 Code" := DefaultDimension."Dimension Value Code";
end;

// TestField lets the platform name the offending field; custom Error only for the genuine business rule
procedure PostPayment(var CustLedgerEntry: Record "Cust. Ledger Entry")
begin
    CustLedgerEntry.TestField("Posting Date");
    if CustLedgerEntry.Open and (CustLedgerEntry."Remaining Amount" = 0) then
        Error(NothingToApplyErr);
end;

var
    NothingToApplyErr: Label 'There is no remaining amount to apply on this entry.';
