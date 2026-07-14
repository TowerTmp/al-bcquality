// Operators lead each continuation line; the joining logic reads down the left edge
IsValid :=
    (Customer."Credit Limit (LCY)" > 0)
    and (Customer.Balance <= Customer."Credit Limit (LCY)")
    and (Customer."Payment Terms Code" <> '')
    and not Customer.Blocked;

TotalAmount :=
    LineAmount
    + VATAmount
    + ShippingCost
    - DiscountAmount;
