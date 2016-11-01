function Get-Stuff
{

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory,ValueFromPipeline,valuefrompipelinebypropertyname)]
        [ValidateRange(1,6)] 
        [int]$entry        
    )
    begin
    {}
    process
    {
        $output = [PSCustomObject]@{
            Entry = $entry
            DayOfWeek = $null
            MyString = "My entry is $entry"
        }

        $output.dayofweek = [dayofweek]$entry
        return $output
    }
    end
    {}

}