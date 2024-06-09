// Power Query Script to Combine Multiple Sheets from an Excel File
// This script reads all sheets from an Excel file and combines them into a single table.

// Load the workbook
let
    // Replace 'YourExcelFile.xlsx' with the path to your Excel file
    Source = Excel.Workbook(File.Contents("C:\Path\To\YourExcelFile.xlsx"), null, true),

    // Filter to only include sheets (exclude tables, if any)
    Sheets = Table.SelectRows(Source, each [Kind] = "Sheet"),

    // Define a function to process each sheet
    ProcessSheet = (sheet as table) as table =>
        let
            // Load the data from the sheet
            Data = sheet{[Item=sheet[Item],Kind="Sheet"]}[Data],

            // Promote headers to use the first row as column names
            PromoteHeaders = Table.PromoteHeaders(Data, [PromoteAllScalars=true]),

            // Add a custom column to indicate the sheet name (useful for tracking the origin of data)
            AddSheetName = Table.AddColumn(PromoteHeaders, "SheetName", each sheet[Item])
        in
            AddSheetName,

    // Apply the ProcessSheet function to each sheet and expand the results into a single table
    CombinedData = Table.Combine(List.Transform(Sheets[Data], each ProcessSheet(_)))
in
    // Output the combined table
    CombinedData
