# Covid19_FDA
Solution to the COVID 19 Precision FDA challenge https://precision.fda.gov/challenges/11

This repository consists of different Jupyter notebooks organized in different Folders

## Descriptive: 
Takes the raw input data from the 16 files and summarizes by counts (categorical variables) and averages (continuous variables). This notebook creates the train.csv and test.csv files used for analysis. 

Train data-set has 117,959 patients in the patients table. Additionally there are 16 tables with historical data including allergies, conditions, and observations among others. We created a train dataset that includes summary statistics in the longitudinal tables as means and frequency counts. In total we have over 900 variables and 117,959 patients.

There are 29,492 patients in the test set. Test set information of all 2020 records was removed from the dataset. Preliminary models showed almost perfect predictive accuracy on COVID status, however the predictions on the test set were really narrow and the model predicted very few COVID cases. We conducted adversarial validation to separate train and test sets and concluded that the train and test sets were very different. This made us review the dataset and we decided to train the models by removing the 2020 training data. Adversarial validation on this revised dataset shows that the databases are equivalent. So we decided to proceed with this assumption. In addition, we removed variables that were excluded from the dataset they include: Encounter for symptom (procedure), Acute respiratory failure (disorder)_x.

Additionally we removed CITY and ZIP code because we have latitude and longitude.

## Technical Details

For training, we used 5 fold cross validation using the python sklearn library Kfold.

We developed 7 models for our predictions. For models 2 to 7 we use the 73,697 patients that have a COVID positive test.

Feature engineering: Frequency counts for the categorical variables, and means for the continuous outcomes. 

For all the models we used the LightGBM library with parameters: 
'num_leaves': 15,
'boosting_type': 'gbdt',
'learning_rate': 0.01, 
'colsample_bytree': 0.6189140385454879,
'subsample': 0.7098267979279573, 
‘reg_alpha': 5,
'reg_lambda': 1,
'scale_pos_weight': 1.

For binary outcome models:         'metric': {'binary_logloss', 'auc'},
For continuous models: ‘metric’: {'rmse'}

These parameters we used for another model to predict death in the ICU setting and they seem to work well for our purposes.


## COVID 19 Status:
LightGBM model for Covid 19 status (binary outcome). We are counting the patients that did not receive a test as Covid negative. This assumption may not be valid.

| 117,959 patients in the training set|

|75,417 patients have a COVID test    |
|(105,548 COVID tests)                |

|73,697 are COVID positive|     |1,720 are COVID negative|  |42,542 patients do not have a test*|

*We consider them COVID negative

Note: Some patients have both a positive and a negative covid test (15,067) we consider these patients covid positive. 

73,697 COVID + (62%),  44,262 COVID -  (38%)

5-Fold CV AUC 0.87242
Cutoff:TBD

### Risk Factors
- DALY: Disability adjusted Life year
- QOLS: Quality of life scale
- QALY: Quality adjusted life year
- Oxygen saturation in arterial blood
- Cisplatin 50 MG injection. Cancer drug
- Combined chemortheraphy and radiation therapy. Cancer status
- Echocardiography: Heart disease status

## Days hospitalized

Hospitalized
20,393  (27.7%)
LOS 12.6 days

Two models: 
Model 1 to predict hospitalizations Y/N
5-Fold CV AUC 0.67070
Model 2 to predict LOS
5 fold rmse 

### Risk Factors
-
-
-


### Protective Factors
- Never smoker

## Days in ICU
ICU
4,981 (6.8%)
LOS 6.2 days

Two models: 
Model 1 to predict ICU stay Y/N
5-Fold CV AUC 
Model 2 to predict LOS
5 fold rmse 

### Risk Factors

## Controlled Ventilator Status: LightGBM model for Controlled Ventilator status (binary outcome)

Ventilator
4,210 (5.7%)

5-Fold CV AUC 
Cutoff:TBD


## Mortality: LightGBM model for Mortality due to Covid 19 (binary outcome)
Death
5,568 (7.6%)
5-Fold CV AUC 
Cutoff:TBD

Models include LightGBM and Neural Networks (TBD). The summary of the findings is described in results.pdf

Contributors:

Ashley Odom
ashleyodom@1nformatics.com

Maria Wellen
msmelguizo@gmail.com
