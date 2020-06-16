# Covid19_FDA
Solution to the COVID 19 Precision FDA challenge https://precision.fda.gov/challenges/11

This repository consists of different Jupyter notebooks organized in different Folders

-- Descriptive: Takes the raw input data from the 16 files and summarizes by counts (categorical variables) and averages (continuous variables). This notebook creates the train.csv and test.csv files used for analysis.

-- COVID 19 Status: LightGBM model for Covid 19 status (binary outcome). We are counting the patients that did not receive a test as Covid negative. This assumption may not be valid.

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
