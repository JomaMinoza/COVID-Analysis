## COVID-19 Analysis Report

### About the Project

This repository is a project of Mapúa Data Science Team under MATH Department. The following data presented are the descriptive and inferential analysis of COVID-19 Cases in the Philippines.

In the process of analysis, all files are to be run in R or RStudio. The scripts were done to provide visual outputs e.g. graphs for visualization.

---

### Scope of the Data

The data was collected through Department of Health's COVID-19 Data Drop using Google Drive. For more details, please go to this [link](https://drive.google.com/drive/folders/1UelgRGmUGNMKH1Q3nzqTj57V41bjmnxg?usp=sharing).

The file used for the analysis is named "DOH COVID Data Drop_2000711 - 04 Case Information (1).csv". The data covered are only cases that are updated last **July 11, 2020**, therefore the analysis are subject to changes in observations in later dates.

---

### Analysis Procedures

After downloading/cloning this repository, run `script.R` to automate the analysis process. The file uses other R files and functions to perform the necessary analysis. You may opt to do the process manually by using the given functions. For more details about the functions, check `CODEBOOK.md`.

Inside `script.R`, there is a code sourcing `descriptive.R`. That R script contains all the descriptive statistics of the COVID-19 Cases. You can find the guides for reproduction by accessing `descriptive.R`. For in-depth detail, visit `COVID-19-Descriptive-Analysis.md`

---

### File Details

The following are the short details of each file found in this repository.

`COVID-19-Descriptive-Analysis.md` - Shows the reproduction of analysis and provides necessary details that are supports from other scripts in this repository.

`COVID-19-Descriptive-Analysis.pdf` - Same as above but in `pdf` format.

`COVID-Analysis.Rproj` - Used for RStudio to automatically set working directories and link this project to the repository.

`filecontrol.R` - A short R file used for checking files and folders and other utility functions.

`datafunctions.R` - A file containing functions to be used for data extraction, cleaning, and filtering.

`descriptive.R` - An R script that contains the guide for displaying the summary of cases and presents descriptive graphs. Refer to `COVID-19-Descriptive-Analysis.md`

`plotfunctions.R` - Contains all plot functions used in data analysis.

`script.R` - An R script that automates the guide for extraction and analysis process. Refer to `COVID-19-Descriptive-Analysis.md`

---

### Cloning Instructions

In order to clone this repository to your local computer, open RStudio then find "New Project..." then click "Version Control". Click "Git" then paste the repository link that can be found by clicking the download code in this repository page.

When cloning this repository through base R console, set your working directory to the desired folder (preferably `/Documents/R`) using git console. Using command `git clone -A`, you will be able to download the whole repository where the output file is a single folder named **COVID-Analysis**

---

### Branching Guidelines

For version control, it is advised to branch from the `master` before performing any statistical analysis. For example: If you would consider performing a different analysis to the data, you have to branch out to `master`, add an R file that performs those analysis, update any existing R files if necessary, then create a pull request for review.
