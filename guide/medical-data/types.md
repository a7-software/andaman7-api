---
layout: comments
title: Medical data types
---
{% include JB/setup %}

<div id="toc"></div>

## AMIs

### Administrative

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Namespace entry     | `ami.namespaceEntry`      | 8 | | string |  |
Last name           | `ami.lastName`            | 8 | | string |  |
First name          | `ami.firstName`           | 8 | | string |  |
Calling name        | `ami.callingName`         | 8 | | string |  |
Third name          | `ami.thirdName`           | 8 | | string |  |
Sex                 | `ami.sex`                 | 8 | | `sl.sex` |  |
Language            | `ami.language`            | 8 | | `sl.language` |  |
Nationality         | `ami.nationality`         | 8 | | string |  |
Picture             | `ami.picture`             | 8 | | string |  |
Marital status      | `ami.maritalStatus`       | 8 | | `sl.maritalStatus` | `qualifier.startDate` |
Kids                | `ami.kids`                | 8 | | number |  |
Blood group         | `ami.bloodGroup`          | 8 | | `sl.bloodGroup` |  |
Birth date          | `ami.birthDate`           | 8 | | date |  |
Birth place         | `ami.birthPlace`          | 8 | | string |  |
Death date          | `ami.deathDate`           | 8 | | date |  |
Death place         | `ami.deathPlace`          | 8 | | string |  |
Address             | `ami.address`             | 8 | | string |  |
Number              | `ami.number`              | 8 | | number |  |
Zip code            | `ami.zipCode`             | 8 | | number |  |
Box                 | `ami.box`                 | 8 | | string |  |
Town                | `ami.town`                | 8 | | string |  |
Country             | `ami.country`             | 8 | | string |  |
Personal phone      | `ami.personalPhone`       | 8 | | string |  |
Professional phone  | `ami.professionalPhone`   | 8 | | string |  |
Personal mail       | `ami.personalMail`        | 8 | | string |  |
Professional mail   | `ami.professionalMail`    | 8 | | string |  |
Mobile phone        | `ami.mobilePhone`         | 8 | | string |  |
Fax                 | `ami.fax`                 | 8 | | string |  |
Doctor function     | `ami.doctorFunction`      | 8 | | `sl.doctorFunction` |  |
Function            | `ami.function`            | 8 | | `sl.regime` |  |
Employ              | `ami.employ`              | 8 | | `sl.regime` | `qualifier.employer`, `qualifier.startDate`, `qualifier.endDate` |
{: class="table table-bordered table-striped table-hover table-condensed table-responsive"}

### Contacts

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Doctor              | `ami.doctor`              | 8 | | string | `qualifier.speciality`, `qualifier.address`, `qualifier.phone`, `qualifier.mobilePhone`, `qualifier.mail` |
Emergency contact   | `ami.ememrgencyContact`   | 8 | | string | `qualifier.relation`, `qualifier.phone`, `qualifier.email`, `qualifier.address` |
{: class="table table-bordered table-striped table-hover table-condensed"}

### Insurances

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Mutual fundation    | `ami.mutualFundation`   | 8 | | string | `qualifier.startDate`, `qualifier.endDate` |
Insurance           | `ami.insurance`         | 8 | | string | `qualifier.startDate`, `qualifier.endDate` |
Complementary insurance | `ami.complementaryInsurance`  | 8 | | string | `qualifier.startDate`, `qualifier.endDate` |
{: class="table table-bordered table-striped table-hover table-condensed"}

### Biometry

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Height              | `ami.height`              | 8 | | number | `qualifier.unit` (length unit) |
Weight              | `ami.weight`              | 8 | | number | `qualifier.unit` (mass unit) |
BMI                 | `ami.bmi`                 | 8 | | number |  |
Waist               | `ami.waist`               | 8 | | number | `qualifier.unit` (length unit) |
Hips                | `ami.hips`                | 8 | | number | `qualifier.unit` (length unit) |
Waist hips ratio    | `ami.waistHipsRatio`      | 8 | | number |  |
Adiposity           | `ami.adiposity`           | 8 | | number |  |
Fever               | `ami.fever`               | 8 | | number | `qualifier.unit` (temperature unit |
Tension             | `ami.tension`             | 8 | | string | `qualifier.date`, `qualifier.result` |
{: class="table table-bordered table-striped table-hover table-condensed"}

### Habits

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Smoker frequency    | `ami.smokerFrequency`     | 8 | | `sl.smokerFrequency` | `qualifier.startDate`, `qualifier.quantity`, `qualifier.type` (smoker type) |
Drinker             | `ami.drinker`             | 8 | | `sl.drinkerType` | `qualifier.type` (drinking frequency), `qualifier.quantity` (drinking quantity) |
Drug                | `ami.drug`                | 8 | | `sl.drugAddiction` | `qualifier.type` (drug type), `qualifier.quantity` (drug quantity) |
Sport               | `ami.sport`               | 8 | | `sl.sportFrequency` | `qualifier.type` (sport type), `qualifier.startDate` |
{: class="table table-bordered table-striped table-hover table-condensed"}

### Documents

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Test results        | `ami.document.testResult` | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Prescription        | `ami.document.prescription` | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Note                | `ami.document.note`       | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
X-Ray               | `ami.document.xRay`       | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Report              | `ami.document.report`     | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Picture             | `ami.document.picture`    | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Blood analysis      | `ami.document.bloodAnalysis`  | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
Draft               | `ami.document.draft`      | 8 | | document | `qualifier.description`, `qualifier.filename`, `qualifier.mimetype` |
{: class="table table-bordered table-striped table-hover table-condensed"}

### Notes

Name | Key | Version | Description | Type | Qualifiers |
--- | ------- | ---- | ----------- | ---- | ---------- |
Personal note       | `ami.personalNote`        | 8 | | note |  |
Private note        | `ami.privateNode`         | 8 | | note |  |
{: class="table table-bordered table-striped table-hover table-condensed"}

## Qualifiers

Name | Key | Version | Description | Type |
---- | --- | ------- | ----------- | ---- |
Note                | `default.note`            | 8 |  | string |
Employer            | `qualifier.employer`      | 8 |  | string |
Speciality          | `qualifier.speciality`    | 8 |  | string |
Address             | `qualifier.address`       | 8 |  | string |
Phone               | `qualifier.phone`         | 8 |  | string |
Mobile phone        | `qualifier.mobilePhone`   | 8 |  | string |
Email               | `qualifier.email`         | 8 |  | string |
Relationship        | `qualifier.relation`      | 8 |  | `sl.relationship` |
Start date          | `qualifier.startDate`     | 8 |  | date |
End date            | `qualifier.endDate`       | 8 |  | date |
Length unit         | `qualifier.unit`          | 8 |  | `sl.unit.length` |
Mass unit           | `qualifier.unit`          | 8 |  | `sl.unit.mass` |
Temperature unit    | `qualifier.unit`          | 8 |  | `sl.unit.temperature` |
Date                | `qualifier.date`          | 8 |  | date |
Result              | `qualifier.result`        | 8 |  | string |
Test result         | `qualifier.result`        | 8 |  | `sl.testResult` |
Quantity            | `qualifier.quantity`      | 8 |  | number |
Smoker type         | `qualifier.type`          | 8 |  | `sl.smokerType` |
Drinking frequency  | `qualifier.type`          | 8 |  | `sl.drinkingFrequency` |
Drinking quantity   | `qualifier.quantity`      | 8 |  | `sl.drinkingQuantity` |
Drug type           | `qualifier.type`          | 8 |  | `sl.drugType` |
Drug quantity       | `qualifier.quantity`      | 8 |  | `sl.drugQuantity` |
Sport type          | `qualifier.type`          | 8 |  | `sl.sportType` |
Description         | `qualifier.description`   | 8 |  | string |
File name           | `qualifier.filename`      | 8 |  | string |
MIME type           | `qualifier.mimetype`      | 8 |  | string |
Reason              | `qualifier.reason`        | 8 |  | string |
Doctor              | `qualifier.doctor`        | 8 |  | string |
Question            | `qualifier.question`      | 8 |  | string |
Type                | `qualifier.type`          | 8 |  | string |
Catchup             | `qualifier.catchup`       | 8 |  | date |
Quantity            | `qualifier.quantity`      | 8 |  | string |
Administration type | `qualifier.administrationType`    | 8 |  | string |
Dose                | `qualifier.dose`          | 8 |  | string |
Frequency           | `qualifier.frequency`     | 8 |  | string |
Side effect         | `qualifier.sideEffect`    | 8 |  | string |
Recharge amount     | `qualifier.rechargeAmount` | 8 |  | string |
Registration number | `qualifier.registrationNumber` | 8 |  | string |
Hospital            | `qualifier.hospital`      | 8 |  | string |
Duration            | `qualifier.duration`      | 8 |  | string |
Severity            | `qualifier.severity`      | 8 |  | `sl.allergySeverity` |
Symptoms            | `qualifier.symptoms`      | 8 |  | string |
Prescribed drug     | `qualifier.prescribedDrug` | 8 |  | string |
LDL                 | `qualifier.ldl`           | 8 |  | string |
HDL                 | `qualifier.hdl`           | 8 |  | string |
Triglycerides       | `qualifier.triglycerides` | 8 |  | string |
Name                | `qualifier.name`          | 8 |  | string |
Monitoring          | `qualifier.monitoring`    | 8 |  | string |
------------------- | ------------------------- | - | --------- |
{: class="table table-bordered table-striped table-hover table-condensed"}


## Selection lists


## AmiSets

## AmiRefs


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul',
            headers: 'h1, h2, h3'
        });
    });
    
</script>