# Covid19_FDA
Solution to the COVID 19 Precision FDA challenge https://precision.fda.gov/challenges/11

This repository consists of different Jupyter notebooks organized in different Folders

-- Descriptive: Takes the raw input data from the 16 files and summarizes by counts (categorical variables) and averages (continuous variables). This notebook creates the train.csv and test.csv files used for analysis. We removed all 2020 information from the train set because this was done in the test set.

Train data-set has 117,959 patients in the patients table. Additionally there are 16 tables with historical data including allergies, conditions, and observations among others. We created a train dataset that includes summary statistics in the longitudinal tables as means and frequency counts. In total we have over 900 variables and 117,959 patients.

-- COVID 19 Status: LightGBM model for Covid 19 status (binary outcome). We are counting the patients that did not receive a test as Covid negative. This assumption may not be valid.

| 117,959 patients in the training set|

|75,417 patients have a COVID test    |
|(105,548 COVID tests)                |

|73,697 are COVID positive|     |1,720 are COVID negative|  |42,542 patients do not have a test We consider them COVID negative|


-- Days hospitalized

-- Days in ICU

-- Controlled Ventilator Status: LightGBM model for Controlled Ventilator status (binary outcome)

-- Mortality: LightGBM model for Mortality due to Covid 19 (binary outcome)

Models include LightGBM and Neural Networks. The summary of the findings is described in results.pdf

Contributors:

Ashley Odom
ashleyodom@1nformatics.com

Maria Wellen
msmelguizo@gmail.com
