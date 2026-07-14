// Confirm the user may write before deleting anything
procedure DeleteCreditLimitEntry(EntryNo: Integer)
var
    CreditLimitEntry: Record "Credit Limit Entry";
    InsufficientPermErr: Label 'You do not have permission to delete credit limit entries.';
begin
    if not CreditLimitEntry.WritePermission then
        Error(InsufficientPermErr);

    if CreditLimitEntry.Get(EntryNo) then
        CreditLimitEntry.Delete(true);
end;

// Fail fast before running a posting routine the user is not entitled to
procedure PostCreditLimitAdjustment(EntryNo: Integer)
var
    CreditLimitEntry: Record "Credit Limit Entry";
    NoPostPermErr: Label 'You do not have permission to post credit limit adjustments.';
begin
    if not CreditLimitEntry.WritePermission then
        Error(NoPostPermErr);
    // perform the adjustment posting
end;
