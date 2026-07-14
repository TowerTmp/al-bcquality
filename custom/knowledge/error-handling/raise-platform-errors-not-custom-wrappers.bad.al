// Custom text replaces the platform's own error and drops the field/context it would have shown
procedure GetCustomerName(CustomerNo: Code[20]): Text[100]
var
    Customer: Record Customer;
begin
    if not Customer.Get(CustomerNo) then
        Error('Customer does not exist.');
    exit(Customer.Name);
end;

// Wrapping Modify hides the real reason the write failed behind a vague message
procedure UpdateSalesLine(var SalesLine: Record "Sales Line")
begin
    if not SalesLine.Modify(true) then
        Error('Failed to update the sales line.');
end;

// Throwing on FindFirst = false invents an error the spec never asked for
procedure ApplyDefaultDimension(var SalesLine: Record "Sales Line")
var
    DefaultDimension: Record "Default Dimension";
begin
    DefaultDimension.SetRange("Table ID", Database::Customer);
    DefaultDimension.SetRange("No.", SalesLine."Sell-to Customer No.");
    if not DefaultDimension.FindFirst() then
        Error('No default dimension found.');
    SalesLine."Shortcut Dimension 1 Code" := DefaultDimension."Dimension Value Code";
end;
