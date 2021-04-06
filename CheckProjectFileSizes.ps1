<#
.SYNOPSIS
  Simple script that goes through child folders to determine if any files are over a specified size.
  Created to check project files to be below github limits.
.DESCRIPTION
  <Brief description of script>
.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

get-childitem -path './' -recurse| ForEach-Object -Process { 
   if($_.Length -gt 104857600)
   {
        $size = $_.Length / 1048576
        Write-Host $_.Directory $_.BaseName ' is too large - ' $size
   }
  }
