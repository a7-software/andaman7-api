---
layout: comments
title: Medical data types
---
{% include JB/setup %}

<div id="toc"></div>

## Version 8

### AMIs

#### Administrative

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Namespace entry     | `ami.namespaceEntry`      |  | string |  |  |
Last name           | `ami.lastName`            |  | string |  |  |
First name          | `ami.firstName`           |  | string |  |  |
Calling name        | `ami.callingName`         |  | string |  |  |
Third name          | `ami.thirdName`           |  | string |  |  |
Sex                 | `ami.sex`                 |  | `sl.sex` | `li.man`, `li.woman`, `li.unknow` |
Language            | `ami.language`            |  | `sl.language` | `li.french`, `li.english`, `li.german`, `li.dutch`, `li.italian`, `li.spanish` |  |
Nationality         | `ami.nationality`         |  | string |  |  |
Picture             | `ami.picture`             |  | string |  |  |
Marital status      | `ami.maritalStatus`       |  | `sl.maritalStatus` | `li.single`, `li.married`, `li.cohabitant`, `li.divorced`, `li.other` | `qualifier.startDate` |
Kids                | `ami.kids`                |  | number |  |  |
Blood group         | `ami.bloodGroup`          |  | `sl.bloodGroup` | `li.O-`, `li.O+`, `li.A-`, `li.A+`, `li.B-`, `li.B+`, `li.AB-`, `li.AB+` |  |
Birth date          | `ami.birthDate`           |  | date |  |  |
Birth place         | `ami.birthPlace`          |  | string |  |  |
Death date          | `ami.deathDate`           |  | date |  |  |
Death place         | `ami.deathPlace`          |  | string |  |  |
Address             | `ami.address`             |  | string |  |  |
Number              | `ami.number`              |  | number |  |  |
Zip code            | `ami.zipCode`             |  | number |  |  |
Box                 | `ami.box`                 |  | string |  |  |
Town                | `ami.town`                |  | string |  |  |
Country             | `ami.country`             |  | string |  |  |
Personal phone      | `ami.personalPhone`       |  | string |  |  |
Professional phone  | `ami.professionalPhone`   |  | string |  |  |
Personal mail       | `ami.personalMail`        |  | string |  |  |
Professional mail   | `ami.professionalMail`    |  | string |  |  |
Mobile phone        | `ami.mobilePhone`         |  | string |  |  |
Fax                 | `ami.fax`                 |  | string |  |  |
Doctor function     | `ami.doctorFunction`      |  | `sl.doctorFunction` | `li.generalist`, `li.gyneco`, `li.neurologue`, `li.dentiste`, `li.podologue`, `li.pharmacien`, `li.infirmier`, `li.phsychologue`, `li.physiotherapy`, `li.ostheopathy`, `li.dietitian`, `li.other` |  |
Function            | `ami.function`            |  | `sl.regime` | `li.worker`, `li.patient`, `li.student`, `li.apprentice`, `li.selfEmployed`, `li.interim`, `li.employee`, `li.volunteer`, `li.thirdParty`, `li.civilServant` |  |
Employ              | `ami.employ`              |  | `sl.regime` | `li.worker`, `li.patient`, `li.student`, `li.apprentice`, `li.selfEmployed`, `li.interim`, `li.employee`, `li.volunteer`, `li.thirdParty`, `li.civilServant` | `qualifier.employer`, `qualifier.startDate`, `qualifier.endDate` |
{: class="table table-bordered table-striped table-hover table-condensed table-responsive"}

#### Contacts

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Doctor              | `ami.doctor`              |  | string |  | `qualifier.speciality`, `qualifier.address`, `qualifier.phone`, `qualifier.mobilePhone`, `qualifier.mail` |
Emergency contact   | `ami.ememrgencyContact`   |  | string |  | `qualifier.relation`, `qualifier.phone`, `qualifier.email`, `qualifier.address` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Insurances

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Mutual fundation    | `ami.mutualFundation`   |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Insurance           | `ami.insurance`         |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Complementary insurance | `ami.complementaryInsurance`  |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Biometry

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Height              | `ami.height`              |  | number |  | `qualifier.unit` (length unit) |
Weight              | `ami.weight`              |  | number |  | `qualifier.unit` (mass unit) |
BMI                 | `ami.bmi`                 |  | number |  |  |
Waist               | `ami.waist`               |  | number |  | `qualifier.unit` (length unit) |
Hips                | `ami.hips`                |  | number |  | `qualifier.unit` (length unit) |
Waist hips ratio    | `ami.waistHipsRatio`      |  | number |  |  |
Adiposity           | `ami.adiposity`           |  | number |  |  |
Fever               | `ami.fever`               |  | number |  | `qualifier.unit` (temperature unit |
Tension             | `ami.tension`             |  | string |  | `qualifier.date`, `qualifier.result` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Habits

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Smoker frequency    | `ami.smokerFrequency`     |  | `sl.smokerFrequency` | `li.nonSmoker`, `li.exSmoker`, `li.smoker` | `qualifier.startDate`, `qualifier.quantity`, `qualifier.type` (smoker type) |
Drinker             | `ami.drinker`             |  | `sl.drinkerType` | `li.abstainer`, `li.exDrinker`, `li.casual`, `li.drinker` | `qualifier.type` (drinking frequency), `qualifier.quantity` (drinking quantity) |
Drug                | `ami.drug`                |  | `sl.drugAddiction` | `li.nonAddict`, `li.exAddict`, `li.addict` | `qualifier.type` (drug type), `qualifier.quantity` (drug quantity) |
Sport               | `ami.sport`               |  | `sl.sportFrequency` | `li.recreation`, `li.competition`, `li.never` | `qualifier.type` (sport type), `qualifier.startDate` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Documents

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Test results        | `ami.document.testResult` | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Prescription        | `ami.document.prescription` | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Note                | `ami.document.note`       | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
X-Ray               | `ami.document.xRay`       | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Report              | `ami.document.report`     | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Picture             | `ami.document.picture`    | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Blood analysis      | `ami.document.bloodAnalysis`  | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Draft               | `ami.document.draft`      | | document |  | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Notes

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Personal note       | `ami.personalNote`        |  | note |  |  |
Private note        | `ami.privateNode`         |  | note |  |  |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Consultation

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Consultation        | `ami.consultation`        |  | string |  | `qualifier.date`, `qualifier.reason`, `qualifier.doctor`, `qualifier.question`, `qualifier.result` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Drugs

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Vaccine             | `ami.vaccine`             |  | string |  | `qualifier.date`, `qualifier.type`, `qualifier.catchup`, `qualifier.quantity`, `qualifier.administrationType` |
Medication          | `ami.medication`          |  | string |  | `qualifier.dose`, `qualifier.frequency`, `qualifier.reason`, `qualifier.startDate`, `qualifier.endDate`, `qualifier.sideEffect` |
Prescription        | `ami.prescription`        |  | string |  | `qualifier.date`, `qualifier.rechargeAmount`, `qualifier.registrationNumber` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Antecedents

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Therapy             | `ami.therapy`             |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Work accident       | `ami.workAccident`        |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Familial antecedent | `ami.familialAntecedent`  |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Medical antecedent  | `ami.medicalAntecedent`   |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Chirurgical antecedent  | `ami.chirurgicalAntecedent`   |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Hospital stay       | `ami.hospitalStay`        |  | string |  | `qualifier.date`, `qualifier.reason`, `qualifier.result`, `qualifier.hospital`, `qualifier.duration` |
Surgery             | `ami.surgery`             |  | string |  | `qualifier.date`, `qualifier.result`, `qualifier.hospital`, `qualifier.doctor` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Diseases

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Disease             | `ami.disease`             |  | string |  | `qualifier.startDate`, `qualifier.endDate` |
Allergy             | `ami.allergy`             |  | string |  | `qualifier.result` (test result), `qualifier.severity` (allergy severity), `qualifier.date`, `qualifier.symptoms`, `qualifier.prescribedDrug` |
Family allergy      | `ami.famillyAllergy`      |  | string |  | `qualifier.date`, `qualifier.symptoms`, `qualifier.prescribedDrug` |
Intolerance         | `ami.intolerance`         |  | string |  | `qualifier.result` (test result), `qualifier.severity` (allergy severity), `qualifier.date`, `qualifier.symptoms`, `qualifier.prescribedDrug` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Blood analysis

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Cholesterol         | `ami.cholesterol`         |  | string |  | `qualifier.date`, `qualifier.ldl`, `qualifier.hdl`, `qualifier.triglycerides` |
Glucose             | `ami.glucode`             |  | string |  | `qualifier.date`, `qualifier.name`, `qualifier.type` |
Glycated hemoglobin | `ami.glycatedHemoglobin`  |  | string |  | `qualifier.date`, `qualifier.result` |
Prostate-Specific Antigen   | `ami.psa`         |  | string |  | `qualifier.date`, `qualifier.result` |
{: class="table table-bordered table-striped table-hover table-condensed"}

#### Medical imaging

Name | Key | Description | Type | Possible values | Qualifiers |
---- | --- | ----------- | ---- | --------------- | ---------- |
Coloscopy           | `ami.coloscopy`           |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Electroencephalography  | `ami.eeg`             |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Electrocardiography | `ami.ecg`                 |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Magnetic resonance imaging  | `ami.irm`         |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
CT scan             | `ami.tdm`                 |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Positron emission tomography    | `ami.tdm`     |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Radiography         | `ami.radiography`         |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Mammography         | `ami.mammography`         |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Echography          | `ami.echography`          |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
Endoscopy           | `ami.endoscopy`           |  | string |  | `qualifier.date`, `qualifier.monitoring`, `qualifier.result` |
{: class="table table-bordered table-striped table-hover table-condensed"}

### Qualifiers

Name | Key | Description | Type | Possible values |
---- | --- | ----------- | ---- | --------------- |
Note                | `default.note`            |  | string |  |
Employer            | `qualifier.employer`      |  | string |  |
Speciality          | `qualifier.speciality`    |  | string |  |
Address             | `qualifier.address`       |  | string |  |
Phone               | `qualifier.phone`         |  | string |  |
Mobile phone        | `qualifier.mobilePhone`   |  | string |  |
Email               | `qualifier.email`         |  | string |  |
Relationship        | `qualifier.relation`      |  | `sl.relationship` | `li.father`, `li.mother`, `li.sister`, `li.brother`, `li.friend`, `li.husband`, `li.wife`, `li.other` |
Start date          | `qualifier.startDate`     |  | date |  |
End date            | `qualifier.endDate`       |  | date |  |
Length unit         | `qualifier.unit`          |  | `sl.unit.length` | `li.meter`, `li.centimeter`, `li.millimeter`, `li.yard`, `li.foot`, `li.inch` |
Mass unit           | `qualifier.unit`          |  | `sl.unit.mass` | `li.kilogram`, `li.gram`, `li.milligram`, `li.stone`, `li.pound`, `li.ounce`, `li.dram` |
Temperature unit    | `qualifier.unit`          |  | `sl.unit.temperature` | `li.celsius`, `li.fahrenheit` |
Date                | `qualifier.date`          |  | date |  |
Result              | `qualifier.result`        |  | string |  |
Test result         | `qualifier.result`        |  | `sl.testResult` | `li.positive`, `li.negative`, `li.undefined` |
Quantity            | `qualifier.quantity`      |  | number |  |
Smoker type         | `qualifier.type`          |  | `sl.smokerType` | `li.cigarette`, `li.cigare`, `li.other` |
Drinking frequency  | `qualifier.type`          |  | `sl.drinkingFrequency` | `li.frequent`, `li.notFrequent`, `li.never` |
Drinking quantity   | `qualifier.quantity`      |  | `sl.drinkingQuantity` | `li.1-2g/day`, `li.3-4g/day`, `li.5-6g/day`, `li.7-9g/day`, `li.>9g/day` |
Drug type           | `qualifier.type`          |  | `sl.drugType` | `li.cannabis`, `li.cocaine`, `li.amphetamine`, `li.xtc`, `li.ghb`, `li.hallucinogen`, `li.heroin`, `li.other` |
Drug quantity       | `qualifier.quantity`      |  | `sl.drugQuantity` | `li.1-2`, `li.3-4`, `li.5-6`, `li.7-9`, `li.>=10` |
Sport type          | `qualifier.type`          |  | `sl.sportType` | `li.bicycle`, `li.football`, `li.running`, `li.swimming`, `li.fishing`, `li.other` |
Description         | `qualifier.description`   |  | string |  |
File name           | `qualifier.filename`      |  | string |  |
MIME type           | `qualifier.mimetype`      |  | string |  |
Reason              | `qualifier.reason`        |  | string |  |
Doctor              | `qualifier.doctor`        |  | string |  |
Question            | `qualifier.question`      |  | string |  |
Type                | `qualifier.type`          |  | string |  |
Catchup             | `qualifier.catchup`       |  | date |  |
Quantity            | `qualifier.quantity`      |  | string |  |
Administration type | `qualifier.administrationType`    |  | string |  |
Dose                | `qualifier.dose`          |  | string |  |
Frequency           | `qualifier.frequency`     |  | string |  |
Side effect         | `qualifier.sideEffect`    |  | string |  |
Recharge amount     | `qualifier.rechargeAmount` |  | string |  |
Registration number | `qualifier.registrationNumber` |  | string |  |
Hospital            | `qualifier.hospital`      |  | string |  |
Duration            | `qualifier.duration`      |  | string |  |
Severity            | `qualifier.severity`      |  | `sl.allergySeverity` | `li.serious`, `li.soft`, `li.verySerious`, `li.average` |
Symptoms            | `qualifier.symptoms`      |  | string |  |
Prescribed drug     | `qualifier.prescribedDrug` |  | string |  |
LDL                 | `qualifier.ldl`           |  | string |  |
HDL                 | `qualifier.hdl`           |  | string |  |
Triglycerides       | `qualifier.triglycerides` |  | string |  |
Name                | `qualifier.name`          |  | string |  |
Monitoring          | `qualifier.monitoring`    |  | string |  |
{: class="table table-bordered table-striped table-hover table-condensed"}


### AmiSets

### AmiRefs


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul',
            headers: 'h1, h2, h3'
        });
    });
    
</script>