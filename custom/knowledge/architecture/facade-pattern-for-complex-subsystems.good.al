codeunit 50100 "CDV Rebate Facade"
{
    Access = Public;

    procedure CalculateAndPostRebate(CustomerNo: Code[20])
    begin
        ValidateCustomer(CustomerNo);
        PostRebate(CustomerNo, CalcRebateAmount(CustomerNo));
    end;

    local procedure ValidateCustomer(CustomerNo: Code[20]) begin end;
    local procedure CalcRebateAmount(CustomerNo: Code[20]): Decimal begin end;
    local procedure PostRebate(CustomerNo: Code[20]; Amount: Decimal) begin end;
}

// Client: one call, no knowledge of the internals.
// RebateFacade.CalculateAndPostRebate(Customer."No.");
