## COVID-19 Analysis Report

### About the Project

This repository is a short project by KaidenFrizu through analysis of [DOH Data Drop](https://drive.google.com/drive/folders/1UelgRGmUGNMKH1Q3nzqTj57V41bjmnxg?usp=sharing) provided by Department of Health - Philippines.

In the process of analysis, all files are to be run in R or RStudio. The scripts were done to provide visual outputs e.g. graphs for visualization and further analysis.

---

### Scope of the Data

The data was collected through Department of Health's COVID-19 Data Drop using [Google Drive](https://drive.google.com/drive/folders/1UelgRGmUGNMKH1Q3nzqTj57V41bjmnxg?usp=sharing). The file used for the analysis is named `DOH COVID Data Drop_2000728 - 04 Case Information.csv`. The data covered are only cases that are updated last **July 28, 2020**, therefore the analysis are subject to changes in observations in later dates.

---

### Analysis Procedures

The following analysis can be viewed in [`COVID-19-Descriptive-Analysis.md`](https://github.com/KaidenFrizu/COVID-Analysis/blob/master/COVID-19-Descriptive-Analysis.md) where it contains all necessary information for analysis reproduction. For technical details of the functions used, visit [`CODEBOOK.md`](https://github.com/KaidenFrizu/COVID-Analysis/blob/master/CODEBOOK.md)

---

### License

This project uses MIT License. This means that you are freely to modify this project for personal use. You can also contribute to the development of this project using the repository. For more details, visit [LICENSE](https://github.com/KaidenFrizu/COVID-Analysis/blob/master/LICENSE)

---

### File Details

The following are the short details of each file found in this repository.

`CODEBOOK.md` - Displays the technical details of function arguments, variables and function list.

`CODEBOOK.pdf` - Same as above but in `pdf` format.

`COVID-19-Descriptive-Analysis.md` - Shows the reproduction of analysis and provides necessary details that are supports from other scripts in this repository.

`COVID-19-Descriptive-Analysis.pdf` - Same as above but in `pdf` format.

`COVID-19-Descriptive-Analysis_files/` - A folder that contains all images used in `COVID-19-Descriptive-Analysis.md`.

`COVID-Analysis.Rproj` - Used for RStudio to automatically set working directories and link this project to the repository.

`filecontrol.R` - A short R file used for checking files and folders and other utility functions.

`datafunctions.R` - A file containing functions to be used for data extraction, cleaning, and filtering.

`plotfunctions.R` - Contains all plot functions used in data analysis.

---

### Cloning Instructions

In order to clone this repository to your local computer, open RStudio then find "New Project..." then click "Version Control". Click "Git" then paste the repository link that can be found by clicking the download code in this repository page.

When cloning this repository through base R console, set your working directory to the desired folder (preferably `/Documents/R`) using git console. Using command `git clone -A`, you will be able to download the whole repository where the output file is a single folder.

---

### Branching Guidelines

For version control, it is advised to branch from the `master` before performing any statistical analysis. For example: If you would consider performing a different analysis to the data, you have to branch out to `master`, add an R file that performs those analysis, update any existing R files if necessary, then create a pull request for review.
