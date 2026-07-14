tableextension 50100 "ENR Customer" extends Customer
{
    fields
    {
        // Edited this field but left its classification unresolved
        field(50100; "ENR Credit Review Date"; Date)
        {
            DataClassification = ToBeClassified; // should have been fixed while here
        }
        field(50101; "ENR Credit Reviewer"; Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
    }
}
