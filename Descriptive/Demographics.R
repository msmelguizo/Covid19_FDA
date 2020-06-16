library(readr)
library(rms)

train <- read_csv("/media/maria/2TB Monster driv/PrecisionFDA/Descriptive/train.csv")

#Fix names with spaces
names(train) <- make.names(names(train),unique = TRUE)
names(train)

#Demographic characteristics - Train only 

demographics <- summary( COVID_Status ~ DRIVERS + PASSPORT + MARITAL + RACE + ETHNICITY + 
                          GENDER + LAT + LON + HEALTHCARE_EXPENSES + HEALTHCARE_COVERAGE + 
                           Age , test=T,
                        data= train, method='reverse')  

print(demographics, exclude1 = F)

#CITY COUNTY ZIP PLACE_BIRTH

#Allergy table

allergy <- summary(COVID_Status ~ Allergy.to.bee.venom + Allergy.to.dairy.product + 
                     Allergy.to.eggs + Allergy.to.fish + Allergy.to.grass.pollen + 
                     Allergy.to.mould + Allergy.to.nut + Allergy.to.peanuts +
                     Allergy.to.soya + Allergy.to.tree.pollen + Allergy.to.wheat +
                     Dander..animal..allergy + House.dust.mite.allergy +
                     Latex.allergy + Shellfish.allergy, test=T,
                    data= train, method='reverse')

print(allergy, exclude1 = F)

# CarePlans

careplans <- summary(COVID_Status ~ Agreeing.on.diabetes.care.plan +                                                                                 
                     Allergic.disorder.monitoring+                                                                                     
                     Anti.suicide.psychotherapy+                                                                                     
                     Asthma.self.management+                                                                                       
                     Burn.care+                                                                                           
                     Cancer.care.plan +                                                                                               
                     Care.Plan+
                     Care.plan..record.artifact.+                                                                                 
                     Chronic.obstructive.pulmonary.disease.clinical.management.plan +                                                   
                     Demential.management  +                                                                                          
                     Diabetes.self.management.plan +                                                                                  
                     Dialysis.care.plan..record.artifact. +                                                                          
                     Fracture.care  +                                                                                                  
                     Head.injury.rehabilitation +                                                                                      
                     Heart.failure.self.management.plan +                                                                              
                     Hyperlipidemia.clinical.management.plan +                                                                          
                     Inpatient.care.plan..record.artifact. +                                                                            
                     Lifestyle.education.regarding.hypertension +                                                                       
                     Major.depressive.disorder.clinical.management.plan +                                                               
                     Major.surgery.care.management +                                                                                   
                     Mental.health.care.plan +                                                                                         
                     Mental.health.care.plan..record.artifact.+                                                                        
                     Minor.surgery.care.management..procedure. +                                                                       
                     Musculoskeletal.care   +                                                                                          
                     Overactivity.inattention.behavior.management  +                                                                   
                     Physical.therapy.procedure  +                                                                                     
                     Postoperative.care +                                                                                              
                     Psychiatry.care.plan +                                                                                            
                     Respiratory.therapy   +                                                                                           
                     Routine.antenatal.care  +                                                                                         
                     Self.care.interventions..procedure.   +                                                                           
                     Skin.condition.care          +                                                                                    
                     Spinal.cord.injury.rehabilitation  +                                                                              
                      Terminal.care +                                                                                                   
                      Urinary.tract.infection.care  +                                                                                   
                      Wound.care   +                                                                                                    
                      Acute.bronchitis..disorder._x   +                                                                                 
                      Alzheimer.s.disease..disorder._x  +                                                                               
                      Asthma_x  +                                                                                                      
                      At.risk.for.suicide..finding._x  +                                                                                
                      Atopic.dermatitis_x         +                                                                                     
                      Attempted.suicide...cut.stab_x  +                                                                                 
                      Attempted.suicide...suffocation_x   +                                                                             
                      Bullet.wound_x        +                                                                                           
                      Child.attention.deficit.disorder_x   +                                                                            
                      Childhood.asthma_x      +                                                                                         
                      Chronic.congestive.heart.failure..disorder._x  +                                                                   
                      Chronic.obstructive.bronchitis..disorder._x +                                                                       
                      Closed.fracture.of.hip_x   +                                                                                      
                      Concussion.injury.of.brain_x   +                                                                                   
                      Concussion.with.loss.of.consciousness_x +                                                                          
                      Concussion.with.no.loss.of.consciousness_x   +                                                                     
                      Contact.dermatitis_x  +                                                                                            
                      Cystic.Fibrosis_x  +                                                                                               
                      Cystitis_x     +                                                                                                   
                      Diabetes_x   +                                                                                                     
                      Diabetes.from.Cystic.Fibrosis_x  +                                                                                 
                      Drug.overdose_x    +                                                                                               
                      Escherichia.coli.urinary.tract.infection_x +                                                                       
                      Facial.laceration_x  +                                                                                             
                      Familial.Alzheimer.s.disease.of.early.onset..disorder._x +                                                         
                      First.degree.burn_x +                                                                                              
                      Fracture.of.ankle_x  +                                                                                             
                      Fracture.of.clavicle_x   +                                                                                         
                      Fracture.of.forearm_x +                                                                                             
                      Fracture.of.rib_x    +                                                                                             
                      Fracture.of.vertebral.column.without.spinal.cord.injury_x +                                                        
                      Fracture.subluxation.of.wrist_x   +                                                                                
                      Gout_x         +                                                                                                   
                      Hyperlipidemia_x +                                                                                                 
                      Hypertension_x             +                                                                                       
                      Injury.of.anterior.cruciate.ligament_x     +                                                                       
                      Injury.of.medial.collateral.ligament.of.knee_x +                                                                   
                      Injury.of.tendon.of.the.rotator.cuff.of.shoulder_x  +                                                              
                      Laceration.of.foot_x           +                                                                                   
                      Laceration.of.forearm_x       +                                                                                    
                      Laceration.of.hand_x    +                                                                                          
                      Laceration.of.thigh_x    +                                                                                         
                      Localized..primary.osteoarthritis.of.the.hand_x   +                                                                
                      Lupus.erythematosus_x      +                                                                                       
                      Major.depression..single.episode_x  +                                                                              
                      Major.depression.disorder_x    +                                                                                   
                      Male.Infertility_x       +                                                                                         
                      Malignant.tumor.of.colon_x      +                                                                                  
                      Neoplasm.of.prostate_x    +                                                                                        
                      Non.small.cell.carcinoma.of.lung..TNM.stage.1..disorder._x   +                                                     
                      Normal.pregnancy_x   +                                                                                             
                      Osteoarthritis.of.hip_x +                                                                                          
                      Osteoarthritis.of.knee_x    +                                                                                      
                      Overlapping.malignant.neoplasm.of.colon_x  +                                                                       
                      Posttraumatic.stress.disorder_x     +                                                                              
                      Prediabetes_x   +                                                                                                  
                      Primary.fibromyalgia.syndrome_x   +                                                                                
                      Primary.malignant.neoplasm.of.colon_x  +                                                                           
                      Primary.small.cell.malignant.neoplasm.of.lung..TNM.stage.1..disorder._x    +                                       
                      Pulmonary.emphysema..disorder._x   +                                                                               
                      Pyelonephritis_x +                                                                                                  
                      Rheumatoid.arthritis_x    +                                                                                        
                      Rupture.of.patellar.tendon_x  +                                                                                    
                      Second.degree.burn_x     +                                                                                         
                      Secondary.malignant.neoplasm.of.colon_x +                                                                           
                      Smokes.tobacco.daily_x   +                                                                                         
                     Sprain.of.ankle_x +                                                                                                
                     Sprain.of.wrist_x +                                                                                                
                     Suicidal.deliberate.poisoning_x +
                     Tear.of.meniscus.of.knee_x +                                                                                       
                     Third.degree.burn_x +                                                                                              
                     Whiplash.injury.to.neck_x, test=T,
                     data= train, method='reverse')
print(careplans, exclude1 = F)

#conditions


conditions <- summary(COVID_Status ~ Acute.Cholecystitis_x +                                                                                           
              Acute.allergic.reaction +                                                                                         
              Acute.bacterial.sinusitis..disorder._x  +                                                                         
              Acute.bronchitis..disorder._y     +                                                                               
              Acute.respiratory.failure..disorder._x   +                                                                        
              Acute.viral.pharyngitis..disorder._x +                                                                            
              Alcoholism +                                                                                                      
              Alzheimer.s.disease..disorder._y    +                                                                             
              Anemia..disorder._x    +                                                                                          
              Antepartum.eclampsia +                                                                                            
              Appendicitis_x     +                                                                                              
              Asthma_y      +                                                                                                   
              At.risk.for.suicide..finding._y   +                                                                               
              Atopic.dermatitis_y         +                                                                                     
              Atrial.Fibrillation_x       +                                                                                     
              Bleeding.from.anus_x         +                                                                                    
              Blighted.ovum_x                +                                                                                  
              Blindness.due.to.type.2.diabetes.mellitus..disorder.     +                                                        
              Body.mass.index.30....obesity..finding.      +                                                                    
              Body.mass.index.40....severely.obese..finding.     +                                                              
              Brain.damage...traumatic  +                                                                                       
              Bullet.wound_y          +                                                                                         
              Burn.injury.morphologic.abnormality._x+                                                                           
              Carcinoma.in.situ.of.prostate..disorder.   +                                                                      
              Cardiac.Arrest_x          +                                                                                       
              Child.attention.deficit.disorder_y   +                                                                            
              Childhood.asthma_y                  +                                                                             
              Cholelithiasis                               +                                                                   
              Chronic.congestive.heart.failure..disorder._y  +                                                                  
              Chronic.intractable.migraine.without.aura_x    +                                                                  
              Chronic.kidney.disease.stage.1..disorder.      +                                                                  
              Chronic.kidney.disease.stage.2..disorder.      +                                                                  
              Chronic.kidney.disease.stage.3..disorder.     +                                                                   
              Chronic.obstructive.bronchitis..disorder._y    +                                                                  
              Chronic.pain_x                                 +                                                                  
              Chronic.paralysis.due.to.lesion.of.spinal.cord +                                                                  
              Chronic.sinusitis..disorder.                 +                                                                    
              Closed.fracture.of.hip_y                     +                                                                    
              Concussion.injury.of.brain_y                  +                                                                   
              Concussion.with.loss.of.consciousness_y       +                                                                   
              Concussion.with.no.loss.of.consciousness_y     +                                                                  
              Contact.dermatitis_y                         +                                                                    
              Coronary.Heart.Disease                      +                                                                     
              Cystic.Fibrosis_y                          +                                                                      
              Cystitis_y                               +                                                                        
              Diabetes_y                              +                                                                         
              Diabetes.from.Cystic.Fibrosis_y        +                                                                          
              Diabetic.renal.disease..disorder.      +                                                                          
              Diabetic.retinopathy.associated.with.type.II.diabetes.mellitus..disorder.   +                                     
              Drug.overdose_y          +                                                                                        
              Epilepsy            +                                                                                             
              Escherichia.coli.urinary.tract.infection_y    +                                                                   
              Facial.laceration_y          +                                                                                    
              Familial.Alzheimer.s.disease.of.early.onset..disorder._y  +                                                       
              Female.Infertility   +                                                                                            
              Fetus.with.unknown.complication_x    +                                                                            
              First.degree.burn_y          +                                                                                    
              Fracture.of.ankle_y     +                                                                                         
              Fracture.of.clavicle_y  +                                                                                         
              Fracture.of.forearm_y    +                                                                                        
              Fracture.of.rib_y         +                                                                                       
              Fracture.of.the.vertebral.column.with.spinal.cord.injury_x   +                                                    
              Fracture.of.vertebral.column.without.spinal.cord.injury_y  +                                                      
              Fracture.subluxation.of.wrist_y                           +                                                       
              Gout_y            +                                                                                               
              History.of.amputation.of.foot..situation.       +                                                                 
              History.of.appendectomy                   +                                                                       
              History.of.cardiac.arrest..situation.       +                                                                     
              History.of.disarticulation.at.wrist..situation.   +                                                               
              History.of.lower.limb.amputation..situation.    +                                                                 
              History.of.myocardial.infarction..situation.     +                                                                
              History.of.single.seizure..situation.           +                                                                 
              History.of.upper.limb.amputation..situation.     +                                                                
              Hyperglycemia..disorder.                       +                                                                  
              Hyperlipidemia_y                                +                                                                 
              Hypertension_y                                  +                                                                 
              Hypertriglyceridemia..disorder.                +                                                                  
              Idiopathic.atrophic.hypothyroidism_x      +                                                                       
              Impacted.molars_x                       +                                                                         
              Infection.caused.by.Pseudomonas.aeruginosa +                                                                      
              Infection.caused.by.Staphylococcus.aureus   +                                                                    
              Injury.of.anterior.cruciate.ligament_y         +                                                                  
              Injury.of.medial.collateral.ligament.of.knee_y   +                                                                
              Injury.of.tendon.of.the.rotator.cuff.of.shoulder_y   +                                                            
              Laceration.of.foot_y                           +                                                                  
              Laceration.of.forearm_y         +                                                                                 
              Laceration.of.hand_y             +                                                                                
              Laceration.of.thigh_y                +                                                                            
              Localized..primary.osteoarthritis.of.the.hand_y  +                                                                
              Lupus.erythematosus_y                            +                                                                
              Macular.edema.and.retinopathy.due.to.type.2.diabetes.mellitus..disorder.  +                                       
              Major.depression..single.episode_y                     +                                                          
              Major.depression.disorder_y                    +                                                                  
              Male.Infertility_y                            +                                                                   
              Malignant.neoplasm.of.breast..disorder._x       +                                                                 
              Malignant.tumor.of.colon_y                     +                                                                 
              Meconium.Ileus                                  +                                                                 
              Metabolic.syndrome.X..disorder.                   +                                                               
              Metastasis.from.malignant.tumor.of.prostate..disorder.  +                                                         
              Microalbuminuria.due.to.type.2.diabetes.mellitus..disorder. +                                                     
              Miscarriage.in.first.trimester                    +                                                               
              Myocardial.Infarction_x                                 +                                                         
              Neoplasm.of.prostate_y                                    +                                                       
              Neuropathy.due.to.type.2.diabetes.mellitus..disorder._x   +                                                       
              Non.low.risk.pregnancy                                       +                                                    
              Non.small.cell.carcinoma.of.lung..TNM.stage.1..disorder._y    +                                                   
              Non.small.cell.lung.cancer..disorder._x                      +                                                    
              Nonproliferative.diabetic.retinopathy.due.to.type.2.diabetes.mellitus..disorder.   +                              
              Normal.pregnancy_y     +                                                                                          
              Opioid.abuse..disorder. +                                                                                         
              Osteoarthritis.of.hip_y  +                                                                                        
              Osteoarthritis.of.knee_y  +                                                                                       
              Osteoporosis..disorder.    +                                                                                      
              Otitis.media_x                +                                                                                   
              Overlapping.malignant.neoplasm.of.colon_y +                                                                       
              Pathological.fracture.due.to.osteoporosis..disorder. +                                                            
              Perennial.allergic.rhinitis_x                         +                                                           
              Perennial.allergic.rhinitis.with.seasonal.variation_x  +                                                          
              Pneumonia_x                                          +                                                            
              Polyp.of.colon_x                                      +                                                           
              Posttraumatic.stress.disorder_y                    +                                                              
              Prediabetes_y                                       +                                                             
              Preeclampsia                                        +                                                             
              Primary.fibromyalgia.syndrome_y                      +                                                            
              Primary.malignant.neoplasm.of.colon_y                 +                                                           
              Primary.small.cell.malignant.neoplasm.of.lung..TNM.stage.1..disorder._y    +                                      
              Proliferative.diabetic.retinopathy.due.to.type.II.diabetes.mellitus..disorder. +                                  
              Proteinuria.due.to.type.2.diabetes.mellitus..disorder.   +                                                        
              Protracted.diarrhea      +                                                                                        
              Pulmonary.emphysema..disorder._y   +                                                                              
              Pyelonephritis_y   +                                                                                              
              Recurrent.rectal.polyp_x    +                                                                                     
              Recurrent.urinary.tract.infection   +                                                                             
              Rheumatoid.arthritis_y +                                                                                          
              Rupture.of.appendix           +                                                                                   
              Rupture.of.patellar.tendon_y     +                                                                                
              Seasonal.allergic.rhinitis_x      +                                                                               
              Second.degree.burn_y               +                                                                              
              Secondary.malignant.neoplasm.of.colon_y +                                                                         
              Seizure.disorder_x                       +                                                                        
              Sepsis.caused.by.Pseudomonas..disorder._x    +                                                                    
              Sepsis.caused.by.Staphylococcus.aureus_x     +                                                                    
              Sinusitis..disorder._x                   +                                                                        
              Small.cell.carcinoma.of.lung..disorder._x  +                                                                      
              Smokes.tobacco.daily_y        +                                                                                   
              Sprain.of.ankle_y        +                                                                                        
              Sprain.of.wrist_y                +                                                                                
              Streptococcal.sore.throat..disorder._x    +                                                                       
              Stroke_x            +                                                                                             
              Suicidal.deliberate.poisoning_y +                                                                                
              Suspected.lung.cancer..situation._x +                                                                             
              Tear.of.meniscus.of.knee_y    +                                                                                   
              Third.degree.burn_y       +                                                                                       
              Traumatic.brain.injury..disorder.   +                                                                             
              Tubal.pregnancy_x     +                                                                                           
              Viral.sinusitis..disorder._x      +                                                                               
              Whiplash.injury.to.neck_y, test=T,
              data= train, method='reverse')
print(conditions, exclude1 = F)


#Devices

devices <- summary(COVID_Status ~ Coronary.artery.stent..physical.object. +                                                                         
 Implantable.cardiac.pacemaker..physical.object.  +                                                                
 Implantable.defibrillator..device..physical.object., test=T,
 data= train, method='reverse')


print(devices, exclude1 = F) 

#Encounters

encounters <- summary(COVID_Status ~ Admission.to.surgical.department +                                                                                  
            Admission.to.thoracic.surgery.department +                                                                        
            Allergic.disorder.follow.up.assessment    +                                                                       
            Allergic.disorder.initial.assessment +                                                                            
            Asthma.follow.up    +                                                                                             
            Cardiac.Arrest_y    +                                                                                             
            Consultation.for.treatment +                                                                                     
            Death.Certification        +                                                                                      
            Diagnosis.of.cystic.fibrosis.using.sweat.test.and.gene.test  +                                                    
            Discussion.about.treatment..procedure.                +                                                           
            Domiciliary.or.rest.home.patient.evaluation.and.management +                                                      
            Drug.rehabilitation.and.detoxification           +                                                                
            Emergency.Encounter     +                                                                                         
            Emergency.Room.Admission     +                                                                                    
            Emergency.hospital.admission.for.asthma   +                                                                       
            Emergency.room.admission..procedure.   +                                                                          
            Encounter.Inpatient             +                                                                                 
            Encounter.for..check.up.      +                                                                                   
            Encounter.for.Problem        +                                                                                    
            Encounter.for.check.up       +                                                                                    
            Encounter.for.check.up..procedure.  +                                                                             
            Encounter.for.problem            +                                                                                
            Encounter.for.problem..procedure.    +                                                                            
            Encounter.for.symptom          +                                                                                  
            Encounter.for.symptom..procedure.  +                                                                              
            Follow.up.encounter        +                                                                                      
            Follow.up.visit..procedure.  +                                                                                    
            General.examination.of.patient..procedure. +                                                                      
            Gynecology.service..qualifier.value.   +                                                                          
            Hospital.admission     +                                                                                          
            Hypertension.follow.up.encounter     +                                                                            
            Initial.Psychiatric.Interview.with.mental.status.evaluation  +                                                    
            Inpatient.stay..finding.     +                                                                                    
            Inpatient.stay.3.days    +                                                                                        
            Myocardial.Infarction_y  +                                                                                        
            Non.urgent.orthopedic.admission   +                                                                               
            Obstetric.emergency.hospital.admission     +                                                                      
            Office.Visit +                                                                                                    
            Outpatient.procedure    +                                                                                         
            Patient.encounter.procedure    +                                                                                  
            Patient.initiated.encounter     +                                                                                 
            Periodic.reevaluation.and.management.of.healthy.individual..procedure. +                                          
            Postnatal.visit   +                                                                                               
            Postoperative.follow.up.visit..procedure.+                                                                       
            Prenatal.initial.visit     +                                                                                      
            Prenatal.visit               +                                                                                    
            Screening.surveillance..regime.therapy.   +                                                                       
            Stroke_y                             +                                                                            
            Telemedicine.consultation.with.patient   +                                                                        
            Telephone.encounter..procedure.    +                                                                              
            Urgent.care.clinic..procedure.    +                                                                               
            Well.child.visit..procedure.     +                                                                                
            posttraumatic.stress.disorder, test=T,
            data= train, method='reverse')


print(encounters, exclude1 = F) 



encounters_reason <- summary(COVID_Status ~ Acute.Cholecystitis_y  +                                                                                          
      Acute.bacterial.sinusitis..disorder._y +                                                                          
      Acute.bronchitis..disorder._x_1  +                                                                                
      Acute.respiratory.failure..disorder._y  +                                                                         
      Acute.viral.pharyngitis..disorder._y  +                                                                           
      Alzheimer.s.disease..disorder.    +                                                                               
      Anemia..disorder._y       +                                                                                       
      Appendicitis_y   +                                                                                                
      Asthma       +                                                                                                    
      At.risk.for.suicide..finding.    +                                                                                
      Atopic.dermatitis       +                                                                                         
      Attempted.suicide...cut.stab_y  +                                                                                 
      Attempted.suicide...suffocation_y  +                                                                              
      Bleeding.from.anus_y      +                                                                                       
      Blighted.ovum_y       +                                                                                           
      Bullet.wound_x_1     +                                                                                            
      Burn.injury.morphologic.abnormality._y+                                                                           
      Cardiac.Arrest_x_1           +                                                                                    
      Child.attention.deficit.disorder_x_1  +                                                                          
      Childhood.asthma                    +                                                                             
      Chronic.congestive.heart.failure..disorder.    +                                                                  
      Chronic.intractable.migraine.without.aura_y  +                                                                    
      Chronic.obstructive.bronchitis..disorder._x_1   +                                                                 
      Chronic.pain_y                   +                                                                                
      Closed.fracture.of.hip_x_1       +                                                                                
      Complication.occuring.during.pregnancy +                                                                          
      Concussion.injury.of.brain            +                                                                           
      Concussion.with.loss.of.consciousness   +                                                                         
      Concussion.with.no.loss.of.consciousness  +                                                                       
      Congenital.uterine.anomaly                +                                                                       
      Contact.dermatitis           +                                                                                    
      Cystitis                          +                                                                               
      Death.due.to.acute.respiratory.failure   +                                                                        
      Death.due.to.sepsis      +                                                                                        
      Drug.overdose             +                                                                                       
      End.stage.renal.disease..disorder. +                                                                              
      Escherichia.coli.urinary.tract.infection    +                                                                     
      Familial.Alzheimer.s.disease.of.early.onset..disorder.    +                                                       
      Fetus.with.chromosomal.abnormality    +                                                                           
      Fetus.with.unknown.complication_y   +                                                                             
      First.degree.burn                 +                                                                               
      Fracture.of.ankle_x_1             +                                                                               
      Fracture.of.clavicle_x_1           +                                                                              
      Fracture.of.forearm_x_1           +                                                                               
      Fracture.of.rib_x_1                    +                                                                          
      Fracture.of.the.vertebral.column.with.spinal.cord.injury_y    +                                                   
      Fracture.of.vertebral.column.without.spinal.cord.injury  +                                                        
       Fracture.subluxation.of.wrist_x_1                +                                                                
       Gout                                       +                                                                      
       Hyperlipidemia                             +                                                                      
       Idiopathic.atrophic.hypothyroidism_y        +                                                                     
       Impacted.molars_y                            +                                                                    
       Injury.of.anterior.cruciate.ligament_x_1      +                                                                   
       Injury.of.medial.collateral.ligament.of.knee_x_1   +                                                              
       Injury.of.tendon.of.the.rotator.cuff.of.shoulder_x_1  +                                                           
       Laparoscopic.Removal.of.Gall.Bladder_x            +                                                               
       Localized..primary.osteoarthritis.of.the.hand       +                                                             
       Lupus.erythematosus                                 +                                                             
       Major.depression..single.episode_x_1              +                                                               
       Major.depression.disorder                         +                                                               
       Malignant.neoplasm.of.breast..disorder._y          +                                                              
       Malignant.tumor.of.colon_x_1                   +                                                                  
       Myocardial.Infarction_x_1                     +                                                                   
       Neoplasm.of.prostate_x_1                        +                                                                 
       Neuropathy.due.to.type.2.diabetes.mellitus..disorder._y    +                                                      
       Non.small.cell.carcinoma.of.lung..TNM.stage.1..disorder._x_1 +                                                    
       Non.small.cell.lung.cancer..disorder._y                +                                                          
       Normal.pregnancy_x_1                              +                                                               
       Open.Removal.of.Gall.Bladder_x                    +                                                               
       Osteoarthritis.of.hip                            +                                                                
       Osteoarthritis.of.knee                          +                                                                 
       Otitis.media_y                                   +                                                                
       Overlapping.malignant.neoplasm.of.colon_x_1      +                                                                
       Oxygen.Therapy_x                                +                                                                 
       Perennial.allergic.rhinitis_y                   +                                                                 
       Perennial.allergic.rhinitis.with.seasonal.variation_y  +                                                          
       Pneumonia_y                                    +                                                                  
       Polyp.of.colon_y                             +                                                                    
       Posttraumatic.stress.disorder_x_1              +                                                                  
       Primary.fibromyalgia.syndrome                   +                                                                 
       Primary.malignant.neoplasm.of.colon_x_1          +                                                                
       Primary.small.cell.malignant.neoplasm.of.lung..TNM.stage.1..disorder._x_1  +                                      
       Pulmonary.emphysema..disorder._x_1   +                                                                            
       Pyelonephritis                        +                                                                           
       Rheumatoid.arthritis                   +                                                                          
       Rupture.of.patellar.tendon_x_1          +                                                                         
       Seasonal.allergic.rhinitis_y             +                                                                        
       Second.degree.burn                        +                                                                       
       Secondary.malignant.neoplasm.of.colon_x_1  +                                                                      
       Seizure.disorder_y                          +                                                                     
       Sepsis.caused.by.Pseudomonas..disorder._y    +                                                                    
       Sepsis.caused.by.Staphylococcus.aureus_y      +                                                                   
       Sepsis.of.Pseudomonas                          +                                                                  
       Sinusitis..disorder._y                          +                                                                 
       Small.cell.carcinoma.of.lung..disorder._y        +                                                                
       Streptococcal.sore.throat..disorder._y            +                                                               
       Stroke_x_1                                         +                                                              
       Sudden.Cardiac.Death                                 +                                                            
       Suicidal.deliberate.poisoning_x_1                     +                                                           
       Suicide...firearms                                  +                                                             
       Suspected.lung.cancer..situation._y                  +                                                            
       Third.degree.burn_x_1                                 +                                                           
       Tubal.pregnancy_y    +
       Viral.sinusitis..disorder._y, test=T,
       data= train, method='reverse')


print(encounters_reason, exclude1 = F) 





 
imaging <- summary(COVID_Status ~ Ankle  +                                                                                                          
 Arm            +                                                                                                  
 Chest         +                                                                                                   
 Clavicle    +                                                                                                     
 Knee          +                                                                                                   
 Pelvis        +                                                                                                   
 Structure.of.right.upper.quadrant.of.abdomen +                                                                    
 Thoracic                    +                                                                                     
 Thoracic.structure          +                                                                                     
Thoracic.structure..body.structure.+                                                                              
  Wrist                 +                                                                                           
 thoracic               +                                                                                          
 Computed.Radiography        +                                                                                     
 Computed.Tomography    +                                                                                          
  Digital.Radiography   +                                                                                           
 Ultrasound, test=T,
                   data= train, method='reverse')

print(imaging, exclude1 = F) 
 
 
 
vaccines <- summary(COVID_Status ~ DTaP                                                                                                             
         +  HPV..quadrivalent                                                                                                
         + Hep.A..adult                                                                                                     
         + Hep.A..ped.adol..2.dose                                                                                          
         + Hep.B..adolescent.or.pediatric                                                                                   
         + Hep.B..adult                                                                                                     
         +  Hib..PRP.OMP.                                                                                                    
         + IPV                                                                                                              
         + Influenza..seasonal..injectable..preservative.free                                                               
         + MMR                                                                                                              
         + Pneumococcal.conjugate.PCV.13                                                                                    
         + Td..adult..preservative.free                                                                                     
         + Tdap                                                                                                             
         + meningococcal.MCV4P                                                                                              
         + pneumococcal.polysaccharide.vaccine..23.valent                                                                   
         + varicella                                                                                                        
         + zoster, test=T,
         data= train, method='reverse')


print(vaccines, exclude1 = F) 
 
 
medications <- summary(COVID_Status ~ X0.25.ML.Leuprolide.Acetate.30.MG.ML.Prefilled.Syringe   +                                                        
   X1.ML.DOCEtaxel.20.MG.ML.Injection +                                                                             
   X1.ML.Epinephrine.1.MG.ML.Injection         +                                                                     
  X1.ML.Epoetin.Alfa.4000.UNT.ML.Injection..Epogen.+                                                                
  X1.ML.Morphine.Sulfate.5.MG.ML.Injection+                                                                         
  X1.ML.denosumab.60.MG.ML.Prefilled.Syringe+                                                                       
  X1.ML.heparin.sodium..porcine.5000.UNT.ML.Injection+                                                              
  X1.ML.medroxyPROGESTERone.acetate.150.MG.ML.Injection+                                                            
  X1.ML.medroxyprogesterone.acetate.150.MG.ML.Injection+                                                            
  X10.ML.Alfentanil.0.5.MG.ML.Injection+                                                                            
  X10.ML.Doxorubicin.Hydrochloride.2.MG.ML.Injection+                                                               
  X10.ML.Fentanyl.0.05.MG.ML.Injection+                                                                             
  X10.ML.Fluorouracil.50.MG.ML.Injection+                                                                           
  X10.ML.Furosemide.10.MG.ML.Injection+                                                                             
  X10.ML.Pamidronate.Disodium.3.MG.ML.Injection+                                                                    
  X10.ML.oxaliplatin.5.MG.ML.Injection+                                                                             
  X100.ML.Epirubicin.Hydrochloride.2.MG.ML.Injection+                                                               
  X100.ML.Propofol.10.MG.ML.Injection+                                                                              
  X100.ML.zoledronic.acid.0.04.MG.ML.Injection+                                                                     
  X12.HR.Cefaclor.500.MG.Extended.Release.Oral.Tablet+                                                              
  X120.ACTUAT.Fluticasone.propionate.0.044.MG.ACTUAT.Metered.Dose.Inhaler+                                          
  X168.HR.Ethinyl.Estradiol.0.00146.MG.HR...norelgestromin.0.00625.MG.HR.Transdermal.System+                        
  X2.ML.Ondansetron.2.MG.ML.Injection+                                                                              
  X20.ML.Ciprofloxacin.10.MG.ML.Injection+                                                                          
  X24.HR.Donepezil.hydrochloride.10.MG...Memantine.hydrochloride.28.MG.Extended.Release.Oral.Capsule+               
  X24.HR.Metformin.hydrochloride.500.MG.Extended.Release.Oral.Tablet+                                               
  X24.HR.metoprolol.succinate.100.MG.Extended.Release.Oral.Tablet..Toprol.+                                         
  X24hr.nicotine.transdermal.patch+                                                                                 
  X3.ML.Amiodarone.hydrocholoride.50.MG.ML.Prefilled.Syringe+                                                       
  X3.ML.liraglutide.6.MG.ML.Pen.Injector+                                                                           
  X5.ML.SUFentanil.0.05.MG.ML.Injection+                                                                            
  X5.ML.fulvestrant.50.MG.ML.Prefilled.Syringe+                                                                     
  X5.ML.hyaluronidase.oysk.2000.UNT.ML...trastuzumab.120.MG.ML.Injection+                                           
  X60.ACTUAT.Fluticasone.propionate.0.25.MG.ACTUAT...salmeterol.0.05.MG.ACTUAT.Dry.Powder.Inhaler+                  
  Abuse.Deterrent.12.HR.Oxycodone.Hydrochloride.15.MG.Extended.Release.Oral.Tablet+                                 
  Acetaminophen.160.MG.Chewable.Tablet+                                                                             
  Acetaminophen.21.7.MG.ML...Dextromethorphan.Hydrobromide.1.MG.ML...doxylamine.succinate.0.417.MG.ML.Oral.Solution+
  Acetaminophen.300.MG...HYDROcodone.Bitartrate.5.MG.Oral.Tablet+                                                   
  Acetaminophen.325.MG...HYDROcodone.Bitartrate.7.5.MG.Oral.Tablet+                                                 
  Acetaminophen.325.MG...Oxycodone.Hydrochloride.5.MG.Oral.Tablet+                                                  
  Acetaminophen.325.MG...oxyCODONE.Hydrochloride.2.5.MG.Oral.Tablet+                                                
  Acetaminophen.325.MG...oxyCODONE.Hydrochloride.5.MG.Oral.Tablet+                                                  
  Acetaminophen.325.MG.Oral.Tablet+                                                                                 
  Acetaminophen.Hydrocodone+                                                                                        
  Alendronic.acid.10.MG.Oral.Tablet+                                                                                
  Allopurinol.100.MG.Oral.Tablet+                                                                                   
  Alteplase.100.MG.Injection+                                                                                       
  Amlodipine.5.MG.Oral.Tablet+                                                                                      
  Amoxicillin.250.MG...Clavulanate.125.MG.Oral.Tablet+                                                              
  Amoxicillin.250.MG.Oral.Capsule+                                                                                  
  Amoxicillin.500.MG.Oral.Tablet+                                                                                   
  Ampicillin.100.MG.ML.Injectable.Solution+                                                                         
  Aspirin.81.MG.Oral.Tablet+                                                                                        
  Astemizole.10.MG.Oral.Tablet+                                                                                     
  Atenolol.50.MG...Chlorthalidone.25.MG.Oral.Tablet+                                                                
  Atorvastatin.80.MG.Oral.Tablet+                                                                                   
  Atropine.Sulfate.1.MG.ML.Injectable.Solution+                                                                     
  Camila.28.Day.Pack+                                                                                               
  Captopril.25.MG.Oral.Tablet+                                                                                      
  Carbamazepine.Tegretol.+                                                                                          
  Carboplatin.10.MG.ML.Injectable.Solution+                                                                         
  Cefaclor.250.MG.Oral.Capsule+                                                                                     
  Cefuroxime.250.MG.Oral.Tablet+                                                                                    
  Chlorpheniramine.Maleate.2.MG.ML.Oral.Solution+                                                                   
  Chlorpheniramine.Maleate.4.MG.Oral.Tablet+                                                                        
  Cisplatin.50.MG.Injection+                                                                                        
  Clopidogrel.75.MG.Oral.Tablet+                                                                                    
  Colchicine.0.6.MG.Oral.Tablet+                                                                                    
  Cyclophosphamide.1000.MG.Injection+                                                                               
  Diazepam.5.MG.Oral.Tablet+                                                                                        
  Digoxin.0.125.MG.Oral.Tablet+                                                                                     
  Donepezil.hydrochloride.10.MG.Oral.Tablet+                                                                        
  Donepezil.hydrochloride.23.MG.Oral.Tablet+                                                                        
  Doxycycline.Monohydrate.50.MG.Oral.Tablet+                                                                        
  Errin.28.Day.Pack+                                                                                                
  Estrostep.Fe.28.Day.Pack+                                                                                         
  Etonogestrel.68.MG.Drug.Implant+                                                                                  
  Etoposide.100.MG.Injection+                                                                                       
  FLUoxetine.20.MG.Oral.Capsule+                                                                                    
  Fexofenadine.hydrochloride.30.MG.Oral.Tablet+                                                                     
  Fexofenadine.hydrochloride.60.MG.Oral.Tablet+                                                                     
  Furosemide.40.MG.Oral.Tablet+                                                                                     
  Galantamine.4.MG.Oral.Tablet+                                                                                     
  Hydrochlorothiazide.12.5.MG+                                                                                      
  Hydrochlorothiazide.25.MG.Oral.Tablet+                                                                            
  Hydrocortisone.10.MG.ML.Topical.Cream+                                                                            
  Ibuprofen.100.MG.Oral.Tablet+                                                                                     
  Ibuprofen.200.MG.Oral.Tablet+                                                                                     
  Insulin.Lispro.100.UNT.ML.Injectable.Solution..Humalog.+                                                          
  Isoflurane.999.MG.ML.Inhalant.Solution+                                                                           
  Jolivette.28.Day.Pack+                                                                                            
  Kyleena.19.5.MG.Intrauterine.System+                                                                              
  Leucovorin.100.MG.Injection+                                                                                      
  Levonorgestrel.0.00354.MG.HR.Drug.Implant+                                                                        
  Levora.0.15.30.28.Day.Pack+                                                                                       
  Levothyroxine.Sodium.0.075.MG.Oral.Tablet+                                                                        
  Liletta.52.MG.Intrauterine.System+                                                                                
  Loratadine.10.MG.Oral.Tablet+                                                                                     
  Loratadine.5.MG.Chewable.Tablet+                                                                                  
  Memantine.hydrochloride.2.MG.ML.Oral.Solution+                                                                    
  Meperidine.Hydrochloride.50.MG.Oral.Tablet+                                                                       
  Mestranol...Norethynodrel..Enovid.+                                                                               
  Methotrexate.2.5.MG.Oral.Tablet+                                                                                  
  Methylphenidate.Hydrochloride.20.MG.Oral.Tablet+                                                                  
  Midazolam.1.MG.ML.Injectable.Solution+                                                                            
  Milnacipran.hydrochloride.100.MG.Oral.Tablet+                                                                     
  Mirena.52.MG.Intrauterine.System+                                                                                 
  NDA020503.200.ACTUAT.Albuterol.0.09.MG.ACTUAT.Metered.Dose.Inhaler+                                               
  NDA020800.0.3.ML.Epinephrine.1.MG.ML.Auto.Injector+                                                               
  NITROFURANTOIN..MACROCRYSTALS.50.MG.Oral.Capsule+                                                                 
  Naproxen.500.MG.Oral.Tablet+                                                                                      
  Naproxen.sodium.220.MG.Oral.Tablet+                                                                               
  Natazia.28.Day.Pack+                                                                                              
  Nitrofurantoin.5.MG.ML.Oral.Suspension+                                                                           
  Nitroglycerin.0.4.MG.ACTUAT.Mucosal.Spray+                                                                        
  Norinyl.1.50.28.Day.Pack+                                                                                         
  NuvaRing.0.12.0.015.MG.per.24HR.21.Day.Vaginal.Ring+                                                              
  Ortho.Tri.Cyclen.28.Day.Pack+                                                                                     
  PACLitaxel.100.MG.Injection+                                                                                      
  Paclitaxel.100.MG.Injection+                                                                                      
  Pancreatin.600.MG.Oral.Tablet+                                                                                    
  Penicillin.G.375.MG.ML.Injectable.Solution+                                                                       
  Penicillin.V.Potassium.250.MG.Oral.Tablet+                                                                        
  Penicillin.V.Potassium.500.MG.Oral.Tablet+                                                                        
  Phenazopyridine.hydrochloride.100.MG.Oral.Tablet+                                                                 
  Piperacillin.4000.MG...tazobactam.500.MG.Injection+                                                               
  Pulmozyme..Dornase.Alfa.+                                                                                         
  Rocuronium.bromide.10.MG.ML.Injectable.Solution+                                                                  
  Seasonique.91.Day.Pack+                                                                                           
  Sertraline.100.MG.Oral.Tablet+                                                                                    
  Simvastatin.10.MG.Oral.Tablet+                                                                                    
  Simvastatin.20.MG.Oral.Tablet+                                                                                    
  Sodium.Chloride.9.MG.ML.Injectable.Solution+                                                                      
  Tacrine.10.MG.Oral.Capsule+                                                                                       
  Tamoxifen.10.MG.Oral.Tablet+                                                                                      
  Terfenadine.60.MG.Oral.Tablet+                                                                                    
  Trinessa.28.Day.Pack+                                                                                             
  Vancomycin.50.MG.ML.Injectable.Solution+                                                                          
  Verapamil.Hydrochloride.40.MG+                                                                                    
  Verzenio.100.MG.Oral.Tablet+                                                                                      
  Vitamin.B.12.5.MG.ML.Injectable.Solution+                                                                         
  Warfarin.Sodium.5.MG.Oral.Tablet+                                                                                 
  Yaz.28.Day.Pack+                                                                                                  
  amLODIPine.5.MG...Hydrochlorothiazide.12.5.MG...Olmesartan.medoxomil.20.MG.Oral.Tablet+                           
  anastrozole.1.MG.Oral.Tablet+                                                                                     
  canagliflozin.100.MG.Oral.Tablet+                                                                                 
  cetirizine.hydrochloride.10.MG.Oral.Tablet+                                                                       
  clonazePAM.0.25.MG.Oral.Tablet+                                                                                   
  cycloSPORINE..modified.100.MG.Oral.Capsule+                                                                       
  diphenhydrAMINE.Hydrochloride.25.MG.Oral.Tablet+                                                                  
  duloxetine.20.MG.Delayed.Release.Oral.Capsule+                                                                    
  exemestane.25.MG.Oral.Tablet+                                                                                     
  ferrous.sulfate.325.MG.Oral.Tablet+                                                                               
  insulin.human..isophane.70.UNT.ML...Regular.Insulin..Human.30.UNT.ML.Injectable.Suspension..Humulin.+             
  letrozole.2.5.MG.Oral.Tablet+                                                                                     
  palbociclib.100.MG.Oral.Capsule+                                                                                  
  predniSONE.20.MG.Oral.Tablet+                                                                                     
  predniSONE.5.MG.Oral.Tablet+                                                                                      
  pregabalin.100.MG.Oral.Capsule+                                                                                   
  remifentanil.2.MG.Injection+                                                                                      
  ribociclib.200.MG.Oral.Tablet, test=T,
 data= train, method='reverse')



print(medications, exclude1 = F) 


 
observations <- summary(COVID_Status ~  Systolic.Blood.Pressure+                                                                                          
 Diastolic.Blood.Pressure+                                                                                         
 Heart.rate+                                                                                                       
 Respiratory.rate+                                                                                                 
 Body.Weight+                                                                                                      
 Oxygen.saturation.in.Arterial.blood+                                                                              
 Pain.severity...0.10.verbal.numeric.rating..Score....Reported+                                                    
 Body.temperature+                                                                                                 
 Glomerular.filtration.rate.1.73.sq.M.predicted+                                                                   
 Alkaline.phosphatase..Enzymatic.activity.volume..in.Serum.or.Plasma+                                              
 Alanine.aminotransferase..Enzymatic.activity.volume..in.Serum.or.Plasma+                                          
 Albumin..Mass.volume..in.Serum.or.Plasma+                                                                         
 Aspartate.aminotransferase..Enzymatic.activity.volume..in.Serum.or.Plasma+                                        
 Protein..Mass.volume..in.Serum.or.Plasma+                                                                         
 Bilirubin.total..Mass.volume..in.Serum.or.Plasma+                                                                 
 Hemoglobin.A1c.Hemoglobin.total.in.Blood+                                                                         
 MCV..Entitic.volume..by.Automated.count+                                                                          
 MCHC..Mass.volume..by.Automated.count+                                                                            
 Platelets....volume..in.Blood.by.Automated.count+                                                                 
 MCH..Entitic.mass..by.Automated.count+                                                                            
 Hematocrit..Volume.Fraction..of.Blood.by.Automated.count+                                                         
  Leukocytes....volume..in.Blood.by.Automated.count+                                                                
  Erythrocytes....volume..in.Blood.by.Automated.count+                                                              
  Carbon.Dioxide+                                                                                                   
  Calcium+                                                                                                          
  Chloride+                                                                                                         
  Potassium+                                                                                                        
  Urea.Nitrogen+                                                                                                    
  Creatinine+                                                                                                       
  Sodium+                                                                                                           
  Glucose+                                                                                                          
  Body.Height+                                                                                                      
  Body.Mass.Index+                                                                                                  
  Low.Density.Lipoprotein.Cholesterol+                                                                              
  High.Density.Lipoprotein.Cholesterol+                                                                             
  Triglycerides+                                                                                                    
  Total.Cholesterol+                                                                                                
  Hemoglobin.A1c.Hemoglobin.total.in.Blood_1+                                                                       
  Weight.difference..Mass.difference....pre.dialysis...post.dialysis+                                               
  Microalbumin.Creatinine.Ratio+                                                                                    
  Estimated.Glomerular.Filtration.Rate+                                                                             
  DALY+                                                                                                             
  QOLS+                                                                                                             
  QALY+                                                                                                             
  Globulin..Mass.volume..in.Serum.by.calculation+                                                                   
  Platelet.mean.volume..Entitic.volume..in.Blood.by.Automated.count+                                                
  Platelet.distribution.width..Entitic.volume..in.Blood.by.Automated.count+                                         
  Erythrocyte.distribution.width..Entitic.volume..by.Automated.count+                                               
  pH.of.Urine.by.Test.strip+                                                                                        
  Ketones..Mass.volume..in.Urine.by.Test.strip+                                                                     
  Bilirubin.total..Mass.volume..in.Urine.by.Test.strip+                                                             
  Glucose..Mass.volume..in.Urine.by.Test.strip+                                                                     
  Specific.gravity.of.Urine.by.Test.strip+                                                                          
  Protein..Mass.volume..in.Urine.by.Test.strip+                                                                     
  Prostate.specific.Ag..Mass.volume..in.Serum.or.Plasma+                                                            
  Left.ventricular.Ejection.fraction+                                                                               
  FEV1.FVC+                                                                                                         
  Current.every.day.smoker+                                                                                         
  Former.smoker+                                                                                                    
  Never.smoker+                                                                                                     
  Urine.protein.test......finding.+                                                                                 
  Urine.protein.test.......finding.+                                                                                
  Urine.protein.test........finding.+                                                                               
  Cloudy.urine..finding.+                                                                                           
  Translucent..qualifier.value.+                                                                                    
  Foul.smelling.urine..finding.+                                                                                    
 Urine.smell.ammoniacal..finding.+                                                                                 
 Blood.in.urine..finding.+                                                                                         
 Urine.blood.test...negative..finding.+                                                                            
 Brown.color..qualifier.value.+                                                                                    
 Reddish.color.urine+                                                                                              
 Urine.ketone.test......finding.+                                                                                  
 Urine.ketone.test.......finding.+                                                                                 
 Urine.ketone.test........finding.+                                                                                
 Urine.ketone.test...trace..finding.+                                                                              
 Normal.size.prostate+                                                                                             
 Prostate.enlarged.on.PR, test=T,
 data= train, method='reverse')


print(observations, exclude1 = F) 

#Procedures

procedures <- summary(COVID_Status ~  Admission.to.burn.unit +                                                                                         
  Admission.to.long.stay.hospital  +                                                                                  
  Admission.to.orthopedic.department  +                                                                               
  Admission.to.trauma.surgery.department  +                                                                           
  Allergy.screening.test  +                                                                                           
  Alpha.fetoprotein.test  +                                                                                           
  Ankle.X.ray  +                                                                                                      
  Antenatal.RhD.antibody.screening  +                                                                                 
  Appendectomy  +                                                                                                     
  Augmentation.of.labor  +                                                                                            
  Auscultation.of.the.fetal.heart  +                                                                                  
  Bilateral.tubal.ligation  +                                                                                         
  Biopsy.of.breast..procedure.  +                                                                                     
  Biopsy.of.colon  +                                                                                                  
  Biopsy.of.prostate  +                                                                                               
  Blood.typing..RH.typing  +                                                                                          
  Bone.density.scan..procedure.  +                                                                                    
  Bone.immobilization  +                                                                                              
  Brachytherapy.of.breast..procedure.  +                                                                              
  Brief.general.examination..procedure.  +                                                                            
  Catheter.ablation.of.tissue.of.heart  +                                                                             
  Cesarean.section  +                                                                                                 
  Chemotherapy..procedure.  +                                                                                         
  Chest.X.ray  +                                                                                                      
  Childbirth  +                                                                                                       
  Chlamydia.antigen.test  +                                                                                           
  Clavicle.X.ray  +                                                                                                   
  Cognitive.and.behavioral.therapy  +                                                                                 
  Colonoscopy  +                                                                                                      
  Combined.chemotherapy.and.radiation.therapy..procedure.  +                                                          
  Computed.tomography.of.chest.and.abdomen  +                                                                         
  Coronary.artery.bypass.grafting  +                                                                                  
  Counseling.for.termination.of.pregnancy  +                                                                          
  Cytopathology.procedure..preparation.of.smear..genital.source  +                                                    
  Cytopathology.procedure..preparation.of.smear..genital.source..procedure.  +                                        
  Depression.screening  +                                                                                             
  Depression.screening.using.Patient.Health.Questionnaire.Nine.Item.score..procedure.  +                              
  Diagnostic.fiberoptic.bronchoscopy..procedure.  +                                                                   
  Digital.examination.of.rectum  +                                                                                    
  Echocardiography..procedure.  +                                                                                     
  Electrical.cardioversion  +                                                                                         
  Electrocardiographic.procedure  +                                                                                   
  Epidural.anesthesia  +                                                                                              
  Episiotomy  +                                                                                                       
  Evaluation.of.psychiatric.state.of.patient  +                                                                       
  Evaluation.of.uterine.fundal.height  +                                                                              
  Excision.of.axillary.lymph.node..procedure.  +                                                                      
  Excision.of.breast.tissue..procedure.  +                                                                            
  Excision.of.fallopian.tube.and.surgical.removal.of.ectopic.pregnancy  +                                             
  Excision.of.sentinel.lymph.node..procedure.  +                                                                      
  Extraction.of.wisdom.tooth  +                                                                                       
  Fetal.anatomy.study  +                                                                                              
  Fine.needle.aspiration.biopsy.of.lung..procedure.  +                                                                
  Gonorrhea.infection.test  +                                                                                         
  Hearing.examination..procedure.  +                                                                                  
  Hemoglobin...Hematocrit...Platelet.count  +                                                                         
  Hepatitis.B.Surface.Antigen.Measurement  +                                                                          
  Hepatitis.C.antibody.test  +                                                                                        
  High.resolution.computed.tomography.of.chest.without.contrast..procedure.  +                                        
  Hospital.admission..short.term..24.hours  +                                                                         
  Human.epidermal.growth.factor.receptor.2.gene.detection.by.fluorescence.in.situ.hybridization..procedure.  +        
  Human.epidermal.growth.factor.receptor.2.gene.detection.by.immunohistochemistry..procedure.  +                      
  Human.immunodeficiency.virus.antigen.test  +                                                                        
  Incision.of.trachea..procedure.  +                                                                                  
  Induced.termination.of.pregnancy  +                                                                                 
  Information.gathering..procedure.  +                                                                                
  Injection.of.adrenaline  +                                                                                          
  Injection.of.tetanus.antitoxin  +                                                                                   
  Insertion.of.biventricular.implantable.cardioverter.defibrillator  +                                                
  Insertion.of.intrauterine.contraceptive.device  +                                                                   
  Insertion.of.subcutaneous.contraceptive  +                                                                          
  Instrumental.delivery  +                                                                                            
  Interstitial.brachytherapy..procedure.  +                                                                           
  Intracavitary.brachytherapy..procedure.  +                                                                          
  Intramuscular.injection  +                                                                                          
  Intravenous.antibiotic.therapy  +                                                                                   
  Intravenous.blood.transfusion.of.packed.cells..procedure.  +                                                        
  Intravenous.infusion..procedure.  +                                                                                 
  Intravenous.injection..procedure.  +                                                                                
  Intubation  +                                                                                                       
  Knee.X.ray  +                                                                                                       
  Laparoscopic.Removal.of.Gall.Bladder_y  +                                                                           
  Lumpectomy.of.breast..procedure.  +                                                                                 
  Lung.volume.reduction.surgery..procedure.  +                                                                        
  Magnetic.resonance.imaging.for.measurement.of.brain.volume..procedure.  +                                           
  Magnetic.resonance.imaging.of.breast..procedure.  +                                                                 
  Mammogram...symptomatic..procedure.  +                                                                              
  Mammography..procedure.  +                                                                                          
  Manual.pelvic.examination..procedure.  +                                                                            
  Measurement.of.Varicella.zoster.virus.antibody  +                                                                   
  Measurement.of.respiratory.function..procedure.  +                                                                  
  Medical.induction.of.labor  +                                                                                       
  Medication.Reconciliation..procedure.  +                                                                            
  Mental.health.screening..procedure.  +                                                                              
  Methotrexate.injection.into.tubal.pregnancy  +                                                                      
  Nasal.sinus.endoscopy..procedure.  +                                                                                
  Open.Removal.of.Gall.Bladder_y  +                                                                                   
  Oral.Glucose.Tolerance.Test  +                                                                                      
  Oxygen.Therapy_y  +                                                                                                 
  Partial.resection.of.colon  +                                                                                       
  Pelvis.X.ray  +                                                                                                     
  Percutaneous.coronary.intervention  +                                                                               
  Percutaneous.mechanical.thrombectomy.of.portal.vein.using.fluoroscopic.guidance  +                                  
  Peripheral.blood.smear.interpretation  +                                                                            
  Physical.exam.following.abortion  +                                                                                 
  Physical.examination  +                                                                                             
  Physical.examination.following.birth  +                                                                             
  Physical.examination.of.mother  +                                                                                   
  Plain.chest.X.ray  +                                                                                                
  Plain.chest.X.ray..procedure.  +                                                                                    
  Pregnancy.termination.care  +                                                                                       
  Premature.birth.of.newborn  +                                                                                       
  Prostatectomy  +                                                                                                    
  Psychiatric.follow.up  +                                                                                            
  Pulmonary.Function.Test  +                                                                                          
  Pulmonary.rehabilitation..regime.therapy.  +                                                                        
  Radiation.oncology.AND.OR.radiotherapy..procedure.  +                                                               
  Radiation.therapy.care..regime.therapy.  +                                                                          
  Rectal.polypectomy  +                                                                                               
  Referral.to.hypertension.clinic  +                                                                                  
  Removal.of.intrauterine.device  +                                                                                   
  Removal.of.subcutaneous.contraceptive  +                                                                            
  Renal.dialysis..procedure.  +                                                                                       
  Replacement.of.contraceptive.intrauterine.device  +                                                                 
  Review.of.systems..procedure.  +                                                                                    
  RhD.passive.immunization  +                                                                                         
  Rubella.screening  +                                                                                                
  Screening.for.chromosomal.aneuploidy.in.prenatal.amniotic.fluid  +                                                  
  Screening.for.occult.blood.in.feces..procedure.  +                                                                  
  Screening.mammography..procedure.  +                                                                                
  Seizure.Count.Cerebral.Cortex.Electroencephalogram..EEG.  +                                                         
  Sentinel.lymph.node.biopsy..procedure.  +                                                                           
  Skin.test.for.tuberculosis  +                                                                                       
  Spirometry..procedure.  +                                                                                           
  Spontaneous.breech.delivery  +                                                                                      
  Sputum.Culture  +                                                                                                   
  Sputum.examination..procedure.  +                                                                                   
  Sputum.microscopy..procedure.  +                                                                                    
  Standard.pregnancy.test  +                                                                                          
  Streptococcus.pneumoniae.group.B.antigen.test  +                                                                    
  Subcutaneous.immunotherapy  +                                                                                       
  Suicide.risk.assessment..procedure.  +                                                                              
  Surgical.manipulation.of.joint.of.knee  +                                                                           
  Surgical.manipulation.of.shoulder.joint  +                                                                          
  Suture.open.wound  +                                                                                                
  Syphilis.infection.test  +                                                                                          
  Take.blood.sample  +                                                                                                
  Teleradiotherapy.procedure..procedure.  +                                                                           
  Thoracentesis..procedure.  +                                                                                        
  Throat.culture..procedure.  +                                                                                       
  Total.knee.replacement  +                                                                                           
  Total.replacement.of.hip  +                                                                                         
  Transplant.of.lung..procedure.  +                                                                                   
  Transthoracic.echocardiography  +                                                                                   
  Transthoracic.three.dimensional.ultrasonography.of.heart..procedure.  +                                             
  Ultrasonography.of.abdomen..right.upper.quadrant.and.epigastrium  +                                                 
  Ultrasonography.of.bilateral.breasts..procedure.  +                                                                 
  Ultrasound.scan.for.fetal.viability  +                                                                              
  Upper.arm.X.ray  +                                                                                                  
  Urine.culture  +                                                                                                    
  Urine.protein.test  +                                                                                               
  Urine.screening.for.glucose  +                                                                                      
  Urine.screening.test.for.diabetes  +                                                                                
  Vaccination.for.diphtheria..pertussis..and.tetanus  +                                                               
  Vasectomy  +                                                                                                        
  X.ray.or.wrist  +                                                                                                   
  negative.screening.for.depression.on.phq9  +                                                                        
  positive.screening.for.PHQ.9  +                                                                                     
  positive.screening.for.depression.on.phq9, test=T,
 data= train, method='reverse')


print(procedures, exclude1 = F) 
   
   
   
   
   
   
observations_reason <- summary(COVID_Status ~   Acute.bronchitis..disorder._y_1  +                                                                                  
  Acute.viral.pharyngitis..disorder.  +                                                                               
  Appendicitis  +                                                                                                     
  Atrial.Fibrillation_y  +                                                                                            
  Bullet.wound_y_1  +                                                                                                 
  Cardiac.Arrest_y_1  +                                                                                               
  Child.attention.deficit.disorder_y_1 +                                                                             
  Chronic.obstructive.bronchitis..disorder._y_1 +                                                                    
  Closed.fracture.of.hip_y_1 +                                                                                       
  Facial.laceration +                                                                                                
  Fracture.of.ankle_y_1 +                                                                                            
  Fracture.of.clavicle_y_1 +                                                                                         
  Fracture.of.forearm_y_1 +                                                                                          
  Fracture.of.rib_y_1 +                                                                                              
  Fracture.subluxation.of.wrist_y_1 +                                                                                
  Injury.of.anterior.cruciate.ligament_y_1 +                                                                         
  Injury.of.medial.collateral.ligament.of.knee_y_1 +                                                                 
  Injury.of.tendon.of.the.rotator.cuff.of.shoulder_y_1 +                                                             
  Laceration.of.foot +                                                                                               
  Laceration.of.forearm +                                                                                            
  Laceration.of.hand +                                                                                               
  Laceration.of.thigh +                                                                                              
  Major.depression..single.episode_y_1 +                                                                             
  Malignant.neoplasm.of.breast..disorder. +                                                                          
  Malignant.tumor.of.colon_y_1 +                                                                                     
  Myocardial.Infarction_y_1 +                                                                                        
  Neoplasm.of.prostate_y_1 +                                                                                         
  Non.small.cell.carcinoma.of.lung..TNM.stage.1..disorder._y_1 +                                                     
  Normal.pregnancy_y_1 +                                                                                             
  Overlapping.malignant.neoplasm.of.colon_y_1 +                                                                      
  Polyp.of.colon +                                                                                                   
  Posttraumatic.stress.disorder_y_1 +                                                                                
  Primary.malignant.neoplasm.of.colon_y_1 +                                                                          
  Primary.small.cell.malignant.neoplasm.of.lung..TNM.stage.1..disorder._y_1 +                                        
  Pulmonary.emphysema..disorder._y_1 +                                                                               
  Recurrent.rectal.polyp_y +                                                                                         
  Rupture.of.patellar.tendon_y_1 +                                                                                   
  Secondary.malignant.neoplasm.of.colon_y_1 +                                                                        
  Streptococcal.sore.throat..disorder. +                                                                             
  Stroke_y_1 +                                                                                                       
  Suicidal.deliberate.poisoning_y_1 +                                                                                
  Suspected.lung.cancer..situation. +                                                                                
  Third.degree.burn_y_1 +                                                                                            
  Tubal.pregnancy, test=T,
                        data= train, method='reverse')


print(observations_reason, exclude1 = F)   




#Demographics - Train vs Test