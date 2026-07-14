// Bare ":=" writes the buffer directly and silently skips each field's OnValidate.
// Description, Unit Price, posting groups and Line Amount are never calculated,
// so the inserted line is inconsistent and cannot post correctly.
procedure CreateSalesLine(var SalesLine: Record "Sales Line"; ItemNo: Code[20]; Qty: Decimal; DiscountPct: Decimal)
begin
    SalesLine.Init();
    SalesLine."Document Type" := SalesLine."Document Type"::Order;
    SalesLine."Line No." := 10000;

    SalesLine.Type := SalesLine.Type::Item;
    SalesLine."No." := ItemNo;               // OnValidate skipped: Description/Unit Price blank
    SalesLine.Quantity := Qty;               // OnValidate skipped: Line Amount not calculated
    SalesLine."Line Discount %" := DiscountPct; // OnValidate skipped: discount not applied
    SalesLine.Insert(true);
end;
