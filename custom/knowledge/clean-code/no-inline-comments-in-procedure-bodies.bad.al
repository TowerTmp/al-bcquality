procedure ValidateCreditLimit(CustomerNo: Code[20])
var
    Customer: Record Customer;
begin
    // Get the customer record                     <- noise: the code already says this
    Customer.Get(CustomerNo);

    // Calculate the balance
    Customer.CalcFields("Balance (LCY)");

    // Check if customer is over credit limit
    if Customer."Balance (LCY)" > Customer."Credit Limit" then
        Error(CreditLimitExceededErr, CustomerNo);

    // Old validation - keeping for reference       <- delete; version control has it
    // if Customer."Payment Terms Code" = 'COD' then
    //     exit;
end;
