// Power Query Script for Performance Optimization: Filtering Rows Early
// This script demonstrates how to filter data at the beginning of the query to optimize performance.

// Load the data from a large table or data source
let
    // Replace 'YourTableName' with the actual name of your table or data source
    Source = Excel.Workbook(File.Contents("C:\Path\To\YourLargeDataFile.xlsx"), null, true),
    DataTable = Source{[Name="YourTableName"]}[Data],

    // Remove unnecessary columns early
    // Specify the columns you need for your analysis
    SelectedColumns = Table.SelectColumns(DataTable, {"Date", "ProductID", "SalesAmount", "Region"}),

    // Filter rows early based on a specific condition to reduce data size
    // Example: Keep only sales records from the current year
    CurrentYear = DateTime.ToText(DateTime.LocalNow(), "yyyy"),
    FilteredRows = Table.SelectRows(SelectedColumns, each Text.StartsWith(DateTime.ToText([Date], "yyyy"), CurrentYear)),

    // Further transformation steps can go here
    // Example: Calculate total sales by product
    GroupedData = Table.Group(FilteredRows, {"ProductID"}, {{"TotalSales", each List.Sum([SalesAmount]), type number}})
    
in
    // Output the optimized table
    GroupedData
