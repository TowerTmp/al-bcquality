procedure GetMaxDiscountPct(CustomerType: Enum "CDV Customer Type"): Decimal
begin
    case CustomerType of
        CustomerType::Regular:
            exit(5);   // hardcoded business value - needs a redeploy to change
        CustomerType::VIP:
            exit(10);  // and cannot differ per company/tenant
    end;
end;
