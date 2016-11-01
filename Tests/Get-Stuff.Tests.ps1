Import-Module -Force $PSScriptRoot\..\Get-Stuff.ps1

Describe "Get-Stuff" {
    Context "Test input methods" {
        it "Accepts pipeline input by property name" {
            (New-Object -TypeName psobject -Property @{Entry = 2} | Get-Stuff).entry | Should be 2
        }
        it "Accept pipeline input by value" {
            (3 | Get-Stuff).entry | Should be 3
        }
        it "Accept value my parameter" {
            (Get-Stuff -entry 4).entry | should be 4
        }
    }
    Context "Returns objects as desired"{
        it "Output is pscustomobject" {
            (Get-Stuff -entry 4).gettype().name | Should be 'pscustomobject'
        }

        it "Entry property returns int" {
            (Get-Stuff -entry 5).entry.gettype().name | Should be ([int32]).name
        }

        it "String property returns string" {
            (Get-Stuff -entry 6).mystring.gettype().name | Should be ([string]).name
        }
    
        it "Weekday 1 returns Monday" {
            (get-stuff -entry 1).dayofweek | Should be 'Monday'
        }
    }
}
