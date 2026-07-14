// Operators trail at the ragged right edge, where they are easy to miss
IsValid :=
    (Customer."Credit Limit (LCY)" > 0) and
    (Customer.Balance <= Customer."Credit Limit (LCY)") and
    (Customer."Payment Terms Code" <> '') and
    not Customer.Blocked;

TotalAmount :=
    LineAmount +
    VATAmount +
    ShippingCost -
    DiscountAmount;
