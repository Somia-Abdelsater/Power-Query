// Power Query Script to Remove Duplicates
// This script removes duplicate rows from a specified table.

// Load the data from the table
let
    // Replace 'YourTableName' with the actual name of your table or data source
    Source = Excel.CurrentWorkbook(){[Name="YourTableName"]}[Content],

    // Remove duplicate rows based on all columns
    RemoveDuplicates = Table.Distinct(Source)

in
    // Output the cleaned table
RemoveDuplicates
