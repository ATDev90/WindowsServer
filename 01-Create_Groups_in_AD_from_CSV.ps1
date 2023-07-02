Import-Module ActiveDirectory

$csvPath = 'C:\temp\Groups.csv'

#Use the -Delimiter part if yout CSV is seperated by ;
$csvData = Import-Csv -Path $csvPath -Delimiter ';'

foreach($row in $csvData)
{
    # Read value from CSV line by line
    $name = $row.name
    $path = $row.path
    $scope = $row.scope
    $category = $row.category
    $description = $row.description
    
    # Create the group in Active Directory
    try {
            New-ADGroup -Name $name -Path $path -GroupScope $scope -GroupCategory $category -Description $description
            Write-Host "group $name was created."
    } 
    
    # Write Error message if groupe can not be created
    catch {
            Write-Host "Error with creating group $name"
    }
}
