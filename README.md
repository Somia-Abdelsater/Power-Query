
# Power Query Solutions for Common Issues

Welcome to the **Power Query Solutions** repository! This collection aims to provide ready-to-use Power Query scripts to address common data transformation, cleansing, and integration challenges. Whether you're working in Power BI, Excel, or another platform that supports Power Query, these scripts can help streamline your data processes.

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Overview

Power Query is an essential tool for data professionals, allowing for seamless data transformation and preparation. However, users often encounter repetitive tasks and common issues that can be time-consuming to resolve. This repository contains a curated set of Power Query codes to tackle these problems efficiently, organized by category for easy navigation.

## Repository Structure

The repository is organized into the following directories, each containing scripts for specific tasks:

- **Data_Transformation/**: Scripts for common data transformation tasks such as pivoting, unpivoting, and type changes.
- **Error_Handling/**: Solutions for managing and resolving common errors in Power Query.
- **Data_Cleansing/**: Scripts focused on cleaning data, including removing duplicates, handling null values, and trimming whitespace.
- **Data_Integration/**: Codes for merging, appending, and integrating data from various sources.
- **Performance_Optimization/**: Techniques to enhance the performance and efficiency of Power Query operations.
- **Date_Time_Manipulation/**: Scripts for handling and manipulating date and time data, including formatting, calculations, and conversions.

Each folder contains `.pq` or `.txt` files with descriptive names, detailing the issue they solve or the task they perform.

## Getting Started

To use any of the scripts from this repository:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/Power-Query.git
   ```

2. **Navigate to the Desired Folder**:
   - Browse to the folder that matches the issue you're facing or the task you want to perform.

3. **Copy the Code**:
   - Open the `.pq` file and copy the script you need.

4. **Paste into Power Query Editor**:
   - Open Power BI, Excel, or your preferred tool, and paste the script into a new query in the Power Query Editor.

## Usage

Each script includes comments to explain its purpose and usage. Modify the codes to fit your specific requirements. Below is an example for removing duplicates:

### Example: Removing Duplicates

Navigate to `Data_Cleansing/Remove_Duplicates.pq` and use the following script:

```powerquery
let
    // Load the source table
    Source = Excel.CurrentWorkbook(){[Name="YourTableName"]}[Content],
    
    // Remove duplicate rows
    RemoveDuplicates = Table.Distinct(Source)
in
    RemoveDuplicates
```

- Replace `YourTableName` with the name of your table.
- Paste this script into a new query in the Power Query Editor.
- Adjust the column names if necessary.

## Contributing

We welcome contributions to expand and improve this repository! To contribute:

1. Fork the repository.
2. Create a new branch (`feature/your-feature`).
3. Make your changes and commit them with descriptive messages.
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request to the main repository.

Please review our [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact

For questions, feedback, or suggestions, please reach out to:

- [Somia Abdelsater](mailto:your-SomiaAbdelsater@gmail.com)
- Follow me on GitHub: [Somia Abdelsater](https://github.com/SomiaAbdelsater)

