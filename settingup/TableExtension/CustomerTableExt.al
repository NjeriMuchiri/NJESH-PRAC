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
    
    keys
    {
        // Add changes to keys here
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
}
