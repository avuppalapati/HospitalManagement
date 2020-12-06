# -*- coding: utf-8 -*-
"""
Spyder Editor
Olive

"""
from faker import Faker
import pandas as pd
import numpy as np
from faker.providers import BaseProvider

fake = Faker()


# ----------------------------------------------------------------------------
# New definitions: diagnosis, plan, department,
#IMPORT ORDER nurse, department, doctor, insurance, ec, patient


class DiagnosisProvider(BaseProvider):
    def diagnosis(self):
        diagnosis = ['Hypertension', 'Hyperlipidemia', 'Diabetes', 'Anxiety', 
                     'Covid-19', 'Allergic rhinitis', 'Reflux esophagitis', 
                     'Hypothyroidism', 'Osteoarthritis', 'Fibromyalgia ',
                     'Acute laryngopharyngitis', 'Depressive disorder', 'Acute bronchitis'
                     'Asthma', 'Nail fungus', 'Urinary tract infection', 'ADHD',
                     'Peanut allergies', 'Dry skin', 'Dead']
        return np.random.choice(diagnosis)

class MedDepartmentProvider(BaseProvider):
    def medDepartment(self):
        department = ['ICU', 'Gastroenterology', 'General Surgery', 'Gynecology', 
                     'Neurology', 'Oncology', 'Orthopaedics', 
                     'Urology', 'Emergency Services', 'Cardiology',
                     'ENT', 'Psychology', 'Traditional Chinese Medicine'
                     'Plastic Surgery', 'Dermatology']
        return np.random.choice(department)

fake.add_provider(DiagnosisProvider)
fake.add_provider(MedDepartmentProvider)


# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
#define it for the DF

def gen_namegender(size):
    name = []
    gender = []
    for i in range(size):
        combine(gender, name)
    return name, gender

def combine(x, y):
   g = 'M' if np.random.randint(0,2) == 0 else 'F'
   n = fake.name_male() if g=='M' else fake.name_female()
   return {x.append(g),y.append(n)}

def gen_ssn(size):
    ssnL = []
    for i in range(size):
        ssnL.append(fake.pyint(min_value=100000000, max_value=999999999))
        
    return ssnL

def dob(min, max, size):
    dob = []
    for i in range(size):
        x = fake.date_of_birth(minimum_age=min, maximum_age=max)
        dob.append(x.strftime('%Y-%m-%d'))
    return dob
    
def weight(min, size):
        weight = np.random.randint(min, 300, size=size)
        return weight

def phone(size):
    phone= []
    for i in range(size):
        phone.append(fake.pyint(min_value=10000000000, max_value=99999999999))
    return phone

def department(size):
    department = []
    for i in range(size):
        department.append(fake.medDepartment())
    return department

def diagnosis(size):
    diagnosis = []
    for i in range(size):
        diagnosis.append(fake.diagnosis())
    return diagnosis

def insurance(size):
    insurance = []
    for i in range(size):
        insurance.append(fake.insurance())
    return insurance

def plan(size):
    plan = []
    for i in range(size):
        plan.append(fake.insuredPlan())
    return plan

def specID(min, max, size):
    spec = []
    for i in range(size):
        spec.append(fake.pyint(min_value=min, max_value=max))
    return spec


# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
# DEFINE THE COSTRAINTS WHEN YOU CONSTRUCT THE DATA mdjsfhiau
# 

# ----------------------------------------------------------------------------
#NURSES
nnum = 15
ntemp = gen_namegender(nnum)
ndf = pd.DataFrame(columns=['nssn', 'nname', 'sex', 'dob'])
ndf['nssn'] = gen_ssn(nnum)
ndf['nname'] = ntemp[0]
ndf['sex'] = ntemp[1]
ndf['dob'] = dob(22, 75, nnum)

ndf.to_csv('nurses.csv')


# ----------------------------------------------------------------------------
#DEPARTMENTS
ddf = pd.DataFrame(columns=['did', 'dname'])
ddf['did'] = specID(1000, 9999, 10) 
ddf['dname'] = ['ICU', 'Gastroenterology', 'General Surgery', 'Gynecology', 
                     'Urology', 'Emergency Services', 'Cardiology',
                     'Psychology', 'Traditional Chinese Medicine',
                     'Dermatology']
##ddf['head'] = #Replace manually 
ddf.to_csv('departments.csv')

class DeptProvider(BaseProvider):
    def dept(self):
        plan = ddf['did']
        return np.random.choice(plan)
    
fake.add_provider(DeptProvider)


# ----------------------------------------------------------------------------

def dept(size):
    z = []
    for i in range(size):
        z.append(fake.dept())
    return z
# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
#DoctORS

drnum = 30
drtemp = gen_namegender(drnum)
docdf = pd.DataFrame(columns=['dssn', 'drname', 'dob', 'sex', 'dept_id'])
docdf['dssn'] = gen_ssn(drnum)
docdf['drname'] = drtemp[0]
docdf['sex'] = drtemp[1]
docdf['dob'] = dob(30, 75, drnum)
docdf['dept_id'] = dept(drnum)
docdf.to_csv('doctors.csv')

# ----------------------------------------------------------------------------
#Emergency Contact

ecnum = 40
ectemp = gen_namegender(ecnum)
ecdf = pd.DataFrame(columns=['essn', 'ecname', 'phone'])
ecdf['essn'] = gen_ssn(ecnum)
ecdf['ecname'] = ectemp[0]
ecdf['phone'] = phone(ecnum)
docdf.to_csv('emergency_contact.csv')

# ----------------------------------------------------------------------------
#Insurance
idf = pd.DataFrame(columns=['iid', 'iname'])
idf['iid'] = specID(1000, 9999, 10)

idf['iname'] = ['UnitedHealth', 'Kaiser Foundation', 'Anthem Inc.', 
                     'Humana', 'Cigna Health', 'Wellcare', 
                     'Blue Cross Blue Shield', 'Carefirst Inc.', 'Metropolitan',
                     'Highmark Group']


# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------
#PATIENTS
pnum = 40
temp = gen_namegender(pnum)
pdf = pd.DataFrame(columns=['pssn', 'pname', 'sex', 'dob', 'weight', 'diagnosis'])
pdf['pssn'] = gen_ssn(pnum)
pdf['pname'] = temp[0]
pdf['sex'] = temp[1]
pdf['dob'] = dob(12, 110, pnum)
pdf['weight'] = weight(80, pnum)
pdf['diagnosis'] = diagnosis(pnum)

# ----------------------------------------------------------------------------
# New providers
class InProvider(BaseProvider):
    def ins(self):
        x = idf['iid'] 
        return np.random.choice(x)
    
fake.add_provider(InProvider)

def ins(size):
    z = []
    for i in range(size):
        z.append(fake.ins())
    return z




class DocProvider(BaseProvider):
    def doc(self):
        x = docdf['dssn']
        return np.random.choice(x)
    
fake.add_provider(DocProvider)
def doc(size):
    z = []
    for i in range(size):
        z.append(fake.doc())
    return z




class NursProvider(BaseProvider):
    def nurs(self):
        x = ndf['nssn']
        return np.random.choice(x)
    
fake.add_provider(NursProvider)
def nurs(size):
    z = []
    for i in range(size):
        z.append(fake.nurs())
    return z



# ----------------------------------------------------------------------------
##FK
pdf['doctor_id'] = doc(pnum)
pdf['insurance_id'] = ins(pnum)
pdf['nurse_id'] = nurs(pnum)
pdf['ec_id'] = ecdf['essn']

pdf.to_csv('patients.csv')







