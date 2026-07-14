tableextension 50100 "ENR Customer" extends Customer
{
    fields
    {
        // Existing field being edited - fixed its ToBeClassified while here
        field(50100; "ENR Credit Review Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        // New field added by this change
        field(50101; "ENR Credit Reviewer"; Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
    }
}
