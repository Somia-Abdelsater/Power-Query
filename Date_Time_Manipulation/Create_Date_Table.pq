let
    // Define the start and end dates for the Date table
    StartDate = #date(2023, 1, 1),
    EndDate = Date.From(DateTime.LocalNow()),

    // Calculate the number of days between the start and end dates
    NumberOfDays = Duration.Days(Duration.From(EndDate - StartDate)) + 1,

    // Generate a list of dates from the start date to the end date
    DateList = List.Dates(StartDate, NumberOfDays, #duration(1, 0, 0, 0)),

    // Convert the list of dates into a table
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}, null, ExtraValues.Error),

    // Add various date-related columns
    #"Changed Type" = Table.TransformColumnTypes(DateTable,{{"Date", type date}}),
    #"Add Year" = Table.AddColumn(#"Changed Type", "Year", each Date.Year([Date]), Int64.Type),
    #"Add Month" = Table.AddColumn(#"Add Year", "Month", each Date.Month([Date]), Int64.Type),
    #"Add Day" = Table.AddColumn(#"Add Month", "Day", each Date.Day([Date]), Int64.Type),
    #"Add Quarter" = Table.AddColumn(#"Add Day", "Quarter", each Date.QuarterOfYear([Date]), Int64.Type),
    #"Add Day of Week" = Table.AddColumn(#"Add Quarter", "Day of Week", each Date.DayOfWeek([Date]), Int64.Type),
    #"Add Week of Year" = Table.AddColumn(#"Add Day of Week", "Week of Year", each Date.WeekOfYear([Date]), Int64.Type),
    #"Add Month Name" = Table.AddColumn(#"Add Week of Year", "Month Name", each Date.ToText([Date], "MMMM"), type text),
    #"Add Day Name" = Table.AddColumn(#"Add Month Name", "Day Name", each Date.ToText([Date], "dddd"), type text)
in
    #"Add Day Name"
