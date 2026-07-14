// A single record carries related values; no flag arguments
procedure PostSalesDocument(var SalesHeader: Record "Sales Header")
begin
    ValidateSalesHeader(SalesHeader);
    CreatePostedDocument(SalesHeader);
    UpdateSourceDocument(SalesHeader);
end;

// Three focused parameters, each purpose obvious from the signature
procedure CreateCreditMemo(CustomerNo: Code[20]; Amount: Decimal; ReasonCode: Code[10])
begin
    // clear purpose, manageable parameter count
end;
