# Covid19_FDA
Solution to the COVID 19 Precision FDA challenge https://precision.fda.gov/challenges/11

This repository consists of different Jupyter notebooks organized in different Folders

## Descriptive: 
Takes the raw input data from the 16 files and summarizes by counts (categorical variables) and averages (continuous variables). This notebook creates the train.csv and test.csv files used for analysis.

Train data-set has 117,959 patients in the patients table. Additionally there are 16 tables with historical data including allergies, conditions, and observations among others. We created a train dataset that includes summary statistics in the longitudinal tables as means and frequency counts. In total we have over 900 variables and 117,959 patients.
Code available at https://github.com/msmelguizo/Covid19_FDA/blob/master/Descriptive/Creation%20of%20Train%20and%20Test%20datasets%20and%20exploratory%20Analysis.ipynb 

There are 29,492 patients in the test set. The organizers removed the test set information of all 2020 records from the dataset because the goal is to investigate risk factors for COVID prior to the virus being transmited. Preliminary models showed almost perfect predictive accuracy on COVID status, however the predictions on the test set were very narrow and the model predicted very few COVID cases. We conducted adversarial validation to separate train and test sets and concluded that the train and test sets were very different. Therefore we reviewed the dataset and decided to train the models by removing the 2020 training data. Adversarial validation on this revised dataset shows that the databases are equivalent. We decided to proceed with this assumption of training data with information before 2020. In addition, we removed variables that were excluded from the test dataset as we can not make predictions with them. They included: Encounter for symptom (procedure), and Acute respiratory failure (disorder)_x.

Adversarial validation code available at: https://github.com/msmelguizo/Covid19_FDA/blob/master/AdversarialValidation/LightGBM-AdversarialValidation.ipynb

We also removed CITY and ZIP code because we have latitude and longitude.

## Technical Details

For training, we used 5 fold cross validation using the python sklearn library Kfold.

We developed 7 models for our predictions using LightGBM, and 5 models for Neural Networks (NN). For models 2 to 7 we use the 73,697 patients that have a COVID positive test.

Feature engineering: Frequency counts for the categorical variables, and means for the continuous outcomes. 

### LigthGBM Models
For all the models we used the LightGBM [2] library with parameters: 
- 'num_leaves': 15,
- 'boosting_type': 'gbdt',
- 'learning_rate': 0.01, 
- 'colsample_bytree': 0.6189140385454879,
- 'subsample': 0.7098267979279573, 
- ‘reg_alpha': 5,
- 'reg_lambda': 1,
- 'scale_pos_weight': 1.

For binary outcome models:         'metric': {'binary_logloss', 'auc'},
For continuous models: ‘metric’: {'rmse'}

We used these parameters for another model to predict death in an ICU setting and they seem to work well for our purposes.

### Neural Network (NN) Models
For the NN models we used the fastai library [4] with parameters:

- layers=[3600, 1800]
- embedding dropout emb_drop=0.05
- epochs=15
- For categorical outcomes: Loss function categorical crossentropy 
- For continuous outcomes: mse loss


## COVID 19 Status:
- LigthGBM model available at: https://github.com/msmelguizo/Covid19_FDA/tree/master/COVID
- NN model available at:

We started the modeling process counting the patients that did not receive a test as Covid negative. This assumption proved not be valid as we have 25,217 patients in the train set that died prior to 2020. The model was getting biased to predict death, as those patients would not have the chance to contract COVID. Therefore our revised train set excludes the patients that died prior to 2020 and we predict in the test set that the patients with death certificates prior to 2020 will be COVID negative (6,306 patients).

| 117,959 patients in the training set, 25,217 died prior to 2020|

|75,417 patients have a COVID test    |
|(105,548 COVID tests)                |

|73,697 are COVID positive|     |1,720 are COVID negative|  |19,045 patients do not have a test*|
*We consider them COVID negative

Note: Some patients have both a positive and a negative covid test (15,067) we consider these patients covid positive. 

73,697 COVID + (74.5%),  19,045 COVID -  (20.5%)

- LigthGBM 5-Fold CV AUC 0.69201
-- Cutoff: 0.777 optimizing F1 value. 

- NN 5-Fold CV AUC 0.68683
-- Cutoff: 0.034 optimizing F1 value. 

### Risk Factors from LightGBM Model

- Oxygen saturation in arterial blood: Pulmonary health status
- Plain chest X-ray: Pulmonary health status
- Transthoracic echocardiography. : Heart disease status
- Chronic congestive heart failure (disorder): Heart disease status
- Inpatient care plan (record artifact): Overall proxy for health status
- Computed Radiography: Overall proxy for health status
- PACLitaxel 100 MG Injection: Cancer drug
- General examination of patient (procedure): Overall proxy for health status 
- Non-small cell carcinoma of lung TNM stage 1: Cancer status
- Lifestyle education regarding hypertension: Hypertension
- Diabetes_y: Diabetes

### Risk Factors from NN Model

- Transthoracic echocardiography: Heart disease status 
- Plain chest X-ray: Pulmonary health status 	
-	Inpatient care plan (record artifact): Overall proxy for health status	
- Inpatient stay (finding): Overall proxy for health status 	
- Encounter for Problem: Overall proxy for health status 	
- Plain chest X-ray (procedure): Pulmonary health status 	
- Transthoracic three dimensional ultrasonography of the heart: Heart disease status  	
- Heart failure self management plan: Heart disease status 	
- Chronic congestive heart failure (disorder)_ x : Heart disease status 		
- Glomerular filtration rate/1.73 sq M.predicted : Kidney function marker	


## Days hospitalized
- LigthGBM model available at:
-- https://github.com/msmelguizo/Covid19_FDA/blob/master/DaysHospitalized/LightGBMY_N.ipynb
-- https://github.com/msmelguizo/Covid19_FDA/blob/master/DaysHospitalized/LightGBM.ipynb

- NN Model available at: 

Hospitalized
20,393  (27.7%)
LOS 12.6 days

- Two LightGBM models: 
-- Model 1 to predict hospitalizations Y/N
-- 5-Fold CV AUC 0.67070
-- Cutoff: 0.254 optimizing F1 value

-- Model 2 to predict LOS
-- 5 fold rmse 4.46

- NN model:
-- 5 fold rmse 6.58

### Risk Factors for Hospitalization and Length of Stay from LightGBM Model
- Age 
- General examination of patient (procedure): Overall proxy for health status 
- Lifestyle education regarding hypertension: Hypertension
- Healthcare Expenses: Overall proxy for health status 
- QALY: quality-adjusted life-year, is a generic measure of disease burden, including both the quality and the quantity of life lived. [1]

### Protective Factors
- Never smoker
- Female gender

### Risk Factors for Length of Stay from NN Model



## Days in ICU
- LigthGBM model available at: 
-- https://github.com/msmelguizo/Covid19_FDA/blob/master/DaysICU/LightGBMY_N.ipynb
-- https://github.com/msmelguizo/Covid19_FDA/blob/master/DaysICU/LightGBM.ipynb

- NN model available at:

ICU
4,981 (6.8%)
LOS 6.2 days

- Two models: 
-- Model 1 to predict ICU stay Y/N
-- 5-Fold CV AUC 0.77167
-- Cutoff: 0.146 optimizing F1 value

-- Model 2 to predict LOS
-- 5 fold rmse 2.68

- NN model:
- 5 fold rmse

### Risk Factors from LightGBM Model
- Age
- General examination of patient (procedure): Overall proxy for health status 
- Estimated Glomerular Filtration Rate: Kidney function marker
- Body Mass Index: Obesity marker
- DALY: Disability-adjusted life year, is a measure of overall disease burden, expressed as the number of years lost due to ill-health, disability or early death. [3]

## Controlled Ventilator Status: 
- LigthGBM model available at: https://github.com/msmelguizo/Covid19_FDA/blob/master/ControledVentilator/LightGBM.ipynb
- NN Model available at: 

Ventilator
4,210 (5.7%)

- 5-Fold CV AUC 0.80562
- 5-Fold CV AUC 

### Risk Factors from LightGBM Model
- Age
- General examination of patient (procedure): Overall proxy for health status 
- QALY: Quality-adjusted life-year is a generic measure of disease burden, including both the quality and the quantity of life lived.[1]
- Healthcare Expenses: Overall proxy for health status 

### Risk Factors for Length of Stay from NN Model


## Mortality: 
LigthGBM model available at: https://github.com/msmelguizo/Covid19_FDA/blob/master/Death/LightGBM.ipynb

Death
5,568 (7.6%)
- 5-Fold CV AUC 0.85728
- 5-Fold CV AUC 

### Risk Factors from LightGBM Model
- Age
- QALY: Quality-adjusted life-year is a generic measure of disease burden, including both the quality and the quantity of life lived. [1]

### Risk Factors from NN Model
-
-
-
-
-



## Contributors:

Ashley Odom
ashleyodom@1nformatics.com

Maria Wellen
msmelguizo@gmail.com

## References:
[1] https://en.wikipedia.org/wiki/Quality-adjusted_life_year

[2] LightGBM. G. Ke, Q. Meng, T. Finley, T. Wang, W. Chen, W. Ma, Q. Ye, and T.-Y. Liu.  Lightgbm:  Ahighly efficient gradient boosting decision tree. InAdvances in Neural Information ProcessingSystems, pages 3149–3157, 2017.

[3] https://en.wikipedia.org/wiki/Disability-adjusted_life_year

[4] Howard, Jeremy and others. fastai. GitHub. https://github.com/fastai/fastai . 2018

