procedure GetMaxDiscountPct(CustomerType: Enum "CDV Customer Type"): Decimal
var
    DiscountSetup: Record "CDV Discount Setup";
begin
    DiscountSetup.Get();
    case CustomerType of
        CustomerType::Regular:
            exit(DiscountSetup."Regular Customer Discount %");
        CustomerType::VIP:
            exit(DiscountSetup."VIP Customer Discount %");
    end;
end;
