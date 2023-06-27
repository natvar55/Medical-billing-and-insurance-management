-- 1) Find the details of the patient whose name is Liam Arabella Bridges and lives in Washington D.C. and has postal code 39050

SELECT * FROM Patient AS p NATURAL JOIN location
WHERE firstName = 'Liam' AND middleName = 'Arabella' AND lastName = 'Bridges' AND postalCode = 39050 AND city = 'Washington D.C.';

-- 2) Find 5 most common diseases

SELECT diseasetype, count(appID) AS cnt
FROM diseaseType 
GROUP BY diseaseType
ORDER BY cnt DESC;

-- 3) Discover all patients who have visited a Dermatologist

SELECT p.firstname, p.middlename, p.lastname, p.gender, p.DOB FROM patient AS p 
NATURAL JOIN appointment AS app
JOIN doctor AS d on d.doctorid = app.doctorid 
WHERE speciality = 'Dermatologist';

-- 4) Find all the patients who has taken treatment from doctor d_43 on '2023-03-01'

SELECT p.firstname, p.middlename, p.lastname, p.gender, p.DOB FROM patient AS p 
NATURAL JOIN appointment AS app
JOIN doctor AS d on d.doctorid = app.doctorid 
WHERE d.doctorid = 'd_43' AND appDate = '2023-03-01';

-- 5) Find the top 5 doctors with the highest total appointment fees

SELECT doctorid, firstname, middlename, lastname, speciality, SUM(appfee) AS totalFee FROM Appointment
NATURAL JOIN doctor
GROUP BY doctorid, firstname, middlename, lastname, speciality
ORDER BY totalFee DESC
LIMIT 5;


-- 6) Find all patients who have had appointments with at least 2 different
-- physicians with same diseaseType

SELECT firstName, middleName, lastName, gender, DOB, diseaseType FROM patient 
NATURAL JOIN appointment 
NATURAL JOIN diseaseType 
GROUP BY diseaseType, patientid 
HAVING COUNT(doctorID) >= 2;

-- 7) Find the number of appointments scheduled for each day

SELECT appDate, count(appID) AS totalAppointments
FROM Appointment
GROUP BY appDate
ORDER BY appDate;

-- 8) Find all the doctors who work in specific hospitalid = h_7

SELECT * FROM doctor 
NATURAL JOIN worksin
WHERE hospitalid = 'h_7';

-- 9) Find how many doctors work in each hospital

SELECT h.hospitalid, h.hospitalname, count(doctorid) AS totalDoctors FROM doctor AS d
NATURAL JOIN worksin AS wi
JOIN hospital AS h on wi.hospitalid = h.hospitalid
GROUP BY h.hospitalid, h.hospitalname;

-- 10) Find the claim id’s and their information who claim status is accepted

SELECT claimid, claimdate, startdos, enddos, placeofservice FROM claim
WHERE claimstatus = '277 Finalized';

-- 11) Find all the patients who were diagnosed with specific cpt code

SELECT firstname, middlename, lastname, gender, dob FROM patient AS p
NATURAL JOIN appointment AS app
NATURAL JOIN chargesanddiagnosis AS cad
WHERE cptcode = 'cpt_58';

-- 12) Find the doctor with npi id = 'NPI1003000239', taxid = 258456339;

SELECT firstname, middlename, lastname FROM doctor
WHERE npi = 'NPI1003000239' AND taxid = 258456339;

-- 13) List all the patient information whose service days are more than 10 days

SELECT patient.* FROM Patient
NATURAL JOIN appointment
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim 
WHERE enddos - startdos > 10;

-- 14) List all the patients whose billing amount is more than $500

select patientid, firstName, middleName, lastName,gender from claim 
natural join descriptionof
natural join ChargesAndDiagnosis
natural join Appointment
natural join Patient
where claimAmt >500;

-- 15) List top 10 patients in terms of claim amt

select patientid, firstName, middleName, lastName,gender from claim 
natural join descriptionof
natural join ChargesAndDiagnosis
natural join Appointment
natural join Patient
where claimAmt >500
order by claimAmt desc
limit 10;
 
-- 16) Find the top 5 insurance companies who has passed the maximum amount

SELECT ic.companyname, SUM(paymentamount) AS totalpayment
FROM insurancecompany AS ic
NATURAL JOIN patientinsurance as pi
JOIN patient AS p ON p.patientid = pi.patientid
JOIN appointment AS app ON app.patientid = p.patientid
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim
NATURAL JOIN insurancepayment AS ip
WHERE ip.paymentstatus = 'Accepted'
GROUP BY ic.companyname
ORDER BY totalpayment DESC
LIMIT 5;

-- 17) Find the company which has rejected the most payments

SELECT ic.companyname, count(paymentid) AS totalRejected
FROM insuranceCompany AS ic
NATURAL JOIN patientInsurance AS pi
JOIN patient AS p on p.patientid = pi.patientid
JOIN appointment AS a on a.patientid = p.patientid
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim AS c
NATURAL JOIN insurancePayment AS ip
WHERE ip.paymentstatus = 'Rejected'
GROUP BY ic.companyname
ORDER BY totalRejected DESC
LIMIT 3;

-- 18) Find the company with most subscribers

SELECT companyname, count(policyno) AS totalSubscribers 
FROM insurancecompany AS ic
NATURAL JOIN patientinsurance AS pi
GROUP BY companyname
ORDER BY totalSubscribers DESC
LIMIT 1;


-- 19) Find the average payment amount for each payment type:

SELECT paymentType, AVG(paymentAmount) AS average_payment
FROM (
  SELECT paymentType, paymentAmount
  FROM PatientPayment
  UNION ALL
  SELECT paymentType, paymentAmount
  FROM InsurancePayment
) AS all_payments
GROUP BY paymentType;

-- 20) Find the top 5 doctors who have the most appointments:

SELECT d.firstName, d.lastName, COUNT(*) AS appointment_count
FROM Doctor d
INNER JOIN Appointment a ON d.doctorID = a.doctorID
GROUP BY d.firstName, d.lastName
ORDER BY appointment_count DESC
LIMIT 5;

-- 21) Find the patients who have made appointments and also have a policy with an insurance company whose name contains the word "Assurance."

SELECT Patient.patientID, Patient.firstname, Patient.lastname
FROM Patient
JOIN Appointment ON Patient.patientID = Appointment.patientID
JOIN PatientInsurance ON Patient.patientID = PatientInsurance.patientID
JOIN InsuranceCompany ON PatientInsurance.insuranceProviderID = InsuranceCompany.insuranceProviderID
WHERE InsuranceCompany.companyname LIKE '%Assurance%'


-- 22)List the number of claims submitted every month

select count(claimid),extract(Month from claimdate) 
from claim group by(extract(Month from claimdate)) ;

-- 23) Find the CPT codes for which no patient is diagnosed

select cptCode, cptDescription from currentProcedureDescription 
natural join
(select cptCode from CurrentProcedureDescription 
except( 
 select distinct cptCode from chargesAndDiagnosis)) as r; 

-- 24) Find the top 5 insurance companies who has passed the maximum amount (Branchwise)

SELECT ic.*, SUM(ip.paymentAmount) AS totalPayments
FROM insuranceCompany AS ic
NATURAL JOIN patientInsurance AS pi
JOIN patient AS p on p.patientid = pi.patientid
JOIN appointment AS a on a.patientid = p.patientid
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim AS c
NATURAL JOIN insurancePayment AS ip
WHERE ip.paymentstatus = 'Accepted'
GROUP BY ic.insuranceproviderid
ORDER BY totalPayments DESC
LIMIT 5;

-- 25) Find the company which has rejected the most payments(Branch Wise)

SELECT ic.*, count(paymentID) AS totalRejected
FROM insuranceCompany AS ic
NATURAL JOIN patientInsurance AS pi
JOIN patient AS p on p.patientid = pi.patientid
JOIN appointment AS a on a.patientid = p.patientid
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim AS c
NATURAL JOIN insurancePayment AS ip
WHERE ip.paymentstatus = 'Rejected'
GROUP BY ic.insuranceproviderid
ORDER BY totalRejected DESC
LIMIT 1;

-- 26) Find the company with most subscribers (Branchwise)

SELECT ic.*, count(policyno) AS totalSubscribers
FROM insurancecompany AS ic
NATURAL JOIN patientinsurance AS pi
GROUP BY ic.insuranceproviderid
ORDER BY totalSubscribers DESC
LIMIT 1;


-- 27)List details of patient whose gender is female and dob is  greater than 2000-01-01

SELECT p.firstName, p.lastName, p.emailID, l.city, l.state, l.country
FROM Patient p
INNER JOIN Location l ON p.postalCode = l.postalCode
WHERE p.gender = 'F' AND p.DOB > '2000-01-01';


-- 28) Find the total outstanding amount 

total Claim amount of all patients - claimAmt where claimStatus or accepted InsuranceAccepted
select sum(totalclaimAmt) as totaloutstandingAmt from
(select sum(claimamt) as totalclaimamt from claim 
union
(select -sum(totalInsuranceAmt) from
(select sum(paymentAmount) as totalInsuranceAmt from insurancePayment as r
union
select sum(paymentAmount) as totalPatientAmt from patientPayment as s)as p))as t;

-- 29) Find the total amount of paid claims 

select sum(totalInsuranceAmt) from
(select sum(paymentAmount) as totalInsuranceAmt from insurancePayment as r
union
select sum(paymentAmount) as totalPatientAmt from patientPayment as s)as p;
 
-- 30) Find the percentage gender ratio of female and male patients.

SELECT
	COUNT(CASE WHEN gender='F' THEN 1 END) as female_patient,
	COUNT(CASE WHEN gender='M' THEN 1 END) as male_patient,
	COUNT(*) as total_patient,
	ROUND((COUNT(CASE WHEN gender='F' THEN 1 END))/SUM(COUNT(*)) OVER(),2) AS female_percentage,
	ROUND((COUNT(CASE WHEN gender='M' THEN 1 END))/SUM(COUNT(*)) OVER(),2) AS male_percentage
FROM patient;

-- 31) List the number of appointments every month for  each hospital 

select count(appid),hospitalid,extract(Month from appdate) 
from appointment 
natural join doctor 
natural join worksin 
group by(extract(Month from appdate)),hospitalid ;

-- 32)  Find the total claimamount gender wise

SELECT  
	SUM(CASE WHEN gender='F' THEN claimamt END) as female_payment,
	SUM(CASE WHEN gender='M' THEN claimamt END) as male_payment,
	SUM(claimamt) as total_claimamt,
	ROUND((SUM(CASE WHEN gender='F' THEN claimamt END)*100)/SUM(claimamt),2) AS female_percentage,
	ROUND((SUM(CASE WHEN gender='M' THEN claimamt END)*100)/SUM(claimamt),2) AS male_percentage
FROM patient p 
JOIN appointment a ON p.patientid=a.patientid
JOIN chargesanddiagnosis cad ON a.appid=cad.appid
JOIN descriptionof d ON cad.procedureid=d.procedureid
JOIN claim c ON d.claimid=c.claimid;


-- 33) List the doctors with highest income 

SELECT doctor.doctorid,doctor.firstName,doctor.middleName,doctor.lastName,doctor.speciality, SUM(COALESCE(ip.paymentamount,0) + COALESCE(pp.paymentamount,0)) as totalincome 
FROM doctor
NATURAL JOIN appointment
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim
LEFT JOIN insurancepayment ip ON ip.claimid = claim.claimid
LEFT JOIN patientpayment pp ON pp.claimid = claim.claimid
GROUP BY doctor.doctorid
ORDER BY totalincome DESC
LIMIT 5;
 

-- 34)List the doctors with highest income  in the last month

SELECT doctor.doctorid, doctor.firstname, doctor.middlename, doctor.lastname, doctor.speciality, SUM(COALESCE(ip.paymentamount,0) + COALESCE(pp.paymentamount,0)) as totalincome 
FROM doctor
NATURAL JOIN appointment
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim
LEFT JOIN insurancepayment ip ON ip.claimid = claim.claimid
LEFT JOIN patientpayment pp ON pp.claimid = claim.claimid
WHERE EXTRACT(MONTH FROM claimdate) = 6
GROUP BY doctor.doctorid, EXTRACT(MONTH FROM claimdate)
ORDER BY totalincome DESC
LIMIT 5;

-- 35) Find the patients who has went to the hospital of the same area they belongs to.

SELECT p.patientid, p.firstname, p.middlename, p.lastname, h.hospitalid, h.hospitalname, h.postalcode, l.city, l.state
FROM patient AS p
NATURAL JOIN appointment AS app
JOIN doctor AS d ON d.doctorid = app.doctorid
JOIN worksin AS wi ON wi.doctorid = d.doctorid
JOIN hospital AS h ON h.hospitalid = wi.hospitalid
JOIN location AS l ON h.postalcode = l.postalcode
WHERE p.postalcode = h.postalcode

-- 36) List the 10 cpt codes  with highest charge fee

select cptdescription,chargefee from currentProceduredescription
order by chargefee desc
limit 10;

-- 37) Find the hospital with the highest amount of income

SELECT h.hospitalname, SUM(COALESCE(ip.paymentamount,0) + COALESCE(pp.paymentamount,0)) AS totalincome 
FROM hospital AS h
JOIN worksin AS wi ON h.hospitalid = wi.hospitalid
JOIN doctor AS d ON d.doctorid = wi.doctorid
JOIN appointment AS app ON app.doctorid = d.doctorid
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim
LEFT JOIN insurancepayment ip ON ip.claimid = claim.claimid
LEFT JOIN patientpayment pp ON pp.claimid = claim.claimid
GROUP BY h.hospitalid
ORDER BY totalincome DESC
LIMIT 5;

-- 38)Find the hospital with the highest amount of income last month

SELECT h.hospitalname, SUM(COALESCE(ip.paymentamount,0) + COALESCE(pp.paymentamount,0)) AS totalincome 
FROM hospital AS h
JOIN worksin AS wi ON h.hospitalid = wi.hospitalid
JOIN doctor AS d ON d.doctorid = wi.doctorid
JOIN appointment AS app ON app.doctorid = d.doctorid
NATURAL JOIN chargesanddiagnosis
NATURAL JOIN descriptionof
NATURAL JOIN claim
LEFT JOIN insurancepayment ip ON ip.claimid = claim.claimid
LEFT JOIN patientpayment pp ON pp.claimid = claim.claimid
WHERE EXTRACT(MONTH FROM claimdate) = 6
GROUP BY h.hospitalid, EXTRACT(MONTH FROM claimdate)
ORDER BY totalincome DESC
LIMIT 5;


-- 39)List the total  payment made by patient
 
SELECT  
	SUM(CASE WHEN paymentresponsibility='Self' THEN paymentamount END) as self_payment
FROM claim c 
JOIN patientpayment p on c.claimid=p.claimid


-- 40)Generate a report of all the patients

SELECT p.patientid,p.firstname,p.middlename,p.lastname,p.gender,p.dob,
p.postalcode,ds.diseasetype,cad.cptcode,cpd.cptdescription,c.claimamt,c.claimstatus
FROM patient p 
JOIN appointment a ON p.patientid=a.patientid
JOIN diseasetype ds ON a.appid=ds.appid
JOIN chargesanddiagnosis cad ON a.appid=cad.appid
JOIN currentproceduredescription cpd ON cad.cptcode=cpd.cptcode
JOIN descriptionof d ON cad.procedureid=d.procedureid
JOIN claim c ON d.claimid=c.claimid;

-- 41)Generate a report of all the patients with status 277 accepted

SELECT p.patientid,p.firstname,p.middlename,p.lastname,p.gender,p.dob,
p.postalcode,ds.diseasetype,cad.cptcode,cpd.cptdescription,c.claimamt,c.claimstatus
FROM patient p 
JOIN appointment a ON p.patientid=a.patientid
JOIN diseasetype ds ON a.appid=ds.appid
JOIN chargesanddiagnosis cad ON a.appid=cad.appid
JOIN currentproceduredescription cpd ON cad.cptcode=cpd.cptcode
JOIN descriptionof d ON cad.procedureid=d.procedureid
JOIN claim c ON d.claimid=c.claimid
WHERE c.claimstatus='277 Finalized';

-- 42)Generate a report of all the patients with status 277 denied

Generate a report of all the patients whose claimstatus is 277 Denied
SELECT p.patientid,p.firstname,p.middlename,p.lastname,p.gender,p.dob,
p.postalcode,ds.diseasetype,cad.cptcode,cpd.cptdescription,c.claimamt,c.claimstatus
FROM patient p 
JOIN appointment a ON p.patientid=a.patientid
JOIN diseasetype ds ON a.appid=ds.appid
JOIN chargesanddiagnosis cad ON a.appid=cad.appid
JOIN currentproceduredescription cpd ON cad.cptcode=cpd.cptcode
JOIN descriptionof d ON cad.procedureid=d.procedureid
JOIN claim c ON d.claimid=c.claimid
WHERE c.claimstatus='277 Denied';

-- 43)  Generate a report of all the patients whose claimstatus is Insurance Accepted

SELECT p.patientid,p.firstname,p.middlename,p.lastname,p.gender,p.dob,
p.postalcode,ds.diseasetype,cad.cptcode,cpd.cptdescription,c.claimamt,c.claimstatus
FROM patient p 
JOIN appointment a ON p.patientid=a.patientid
JOIN diseasetype ds ON a.appid=ds.appid
JOIN chargesanddiagnosis cad ON a.appid=cad.appid
JOIN currentproceduredescription cpd ON cad.cptcode=cpd.cptcode
JOIN descriptionof d ON cad.procedureid=d.procedureid
JOIN claim c ON d.claimid=c.claimid
WHERE c.claimstatus='Insurance Accepted';


-- 44)Generate a report of all the patients whose claimstatus is Insurance Rejected

SELECT p.patientid,p.firstname,p.middlename,p.lastname,p.gender,p.dob,
p.postalcode,ds.diseasetype,cad.cptcode,cpd.cptdescription,c.claimamt,c.claimstatus
FROM patient p 
JOIN appointment a ON p.patientid=a.patientid
JOIN diseasetype ds ON a.appid=ds.appid
JOIN chargesanddiagnosis cad ON a.appid=cad.appid
JOIN currentproceduredescription cpd ON cad.cptcode=cpd.cptcode
JOIN descriptionof d ON cad.procedureid=d.procedureid
JOIN claim c ON d.claimid=c.claimid
WHERE c.claimstatus='Insurance Rejected';

-- 45) Generate the total payment made by insurance

SELECT  
	SUM(CASE WHEN paymentresponsibility='Self' THEN paymentamount END) as self_payment
FROM claim c 
JOIN patientpayment p on c.claimid=p.claimid








