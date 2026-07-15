actions
{
    area(Processing)
    {
        action(CheckCreditLimit)
        {
            Caption = 'Check Credit Limit';
            ApplicationArea = All;
            Promoted = true;                 // AL0533/AL0534 (deprecated on BC21+)
            PromotedCategory = Process;
            PromotedIsBig = true;
            trigger OnAction() begin CreditLimitMgt.Check(Rec."No."); end;
        }
    }
}
