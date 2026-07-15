actions
{
    area(Processing)
    {
        action(CheckCreditLimit)
        {
            Caption = 'Check Credit Limit';
            ApplicationArea = All;
            trigger OnAction() begin CreditLimitMgt.Check(Rec."No."); end;
        }
    }
    area(Promoted)
    {
        group(Category_Process)
        {
            Caption = 'Process';
            actionref(CheckCreditLimit_Promoted; CheckCreditLimit) { }
        }
    }
}
