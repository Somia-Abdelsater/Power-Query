// Power Query Script to Unpivot Columns
// This script transforms data from a wide format to a long format by unpivoting specified columns.

// Load the data from the table
let
    // Replace 'YourTableName' with the actual name of your table or data source
    Source = Excel.CurrentWorkbook(){[Name="YourTableName"]}[Content],

    // Select columns that need to remain unchanged (e.g., identifiers or keys)
    // Replace 'ID' and 'Category' with the actual column names you want to keep as is
    UnchangedColumns = {"ID", "Category"},

    // Unpivot other columns, excluding those specified in UnchangedColumns
    // This will transform columns into attribute-value pairs
    UnpivotedData = Table.UnpivotOtherColumns(Source, UnchangedColumns, "Attribute", "Value")
    
in
    // Output the unpivoted table
    UnpivotedData
