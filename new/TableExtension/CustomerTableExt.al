tableextension 50100 CustomerTableExt extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Customer County"; Enum Counties)
        {
            DataClassification = ToBeClassified;
        }
    }
    
}
 