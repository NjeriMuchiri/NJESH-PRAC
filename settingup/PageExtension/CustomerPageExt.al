pageextension 50100 CustomerPageExt extends "Customer Card"
{
    layout
    {
        addafter(City)
        {
            field("Customer County"; Rec."Customer County")
            {
            }
        }
    }
    
    var
        myInt: Integer;
}