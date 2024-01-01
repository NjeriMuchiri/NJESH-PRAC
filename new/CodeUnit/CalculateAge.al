codeunit 50108 AgeCalculation
{
    procedure CalculateAge(DateOfBirth: Date): Text
    var
        Age: Integer;
        AgeText: Text;
    begin
        // Calculate the age based on the current date
        Age := TODAY - DateOfBirth;

        // Format the age as a text string
        AgeText := FORMAT(Age);

        // Return the age as a text value
        EXIT(AgeText);
    end;
}
