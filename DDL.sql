CREATE TABLE  Patient  (
   patientID  varchar PRIMARY KEY,
   firstName  varchar,
   middleName  varchar,
   lastName  varchar,
   gender  varchar,
   emailID  varchar,
   DOB  date,
   postalCode  int
);


CREATE TABLE  PatientInsurance  (
   policyNo  varchar PRIMARY KEY,
   insuranceProviderID  varchar,
   patientID  varchar,
   subscriberDOB  date,
   subscriberName  varchar
);

CREATE TABLE  Appointment  (
   AppID  varchar PRIMARY KEY,
   patientID  varchar,
   doctorID  varchar,
   AppDate  date,
   AppFee  int,
   Appstatus  varchar
);

CREATE TABLE  DiseaseType  (
   AppID  varchar,
   DiseaseType  varchar,
  PRIMARY KEY ( AppID ,  DiseaseType )
);

CREATE TABLE  InsuranceCompany  (
   insuranceProviderID  varchar PRIMARY KEY,
   emailID  varchar,
   companyAddress  varchar,
   companyName  varchar
);

CREATE TABLE  ChargesAndDiagnosis  (
   procedureID  varchar PRIMARY KEY,
   AppID  varhchar,
   cptCode  varchar,
   quantity  int
);

CREATE TABLE  Doctor  (
   doctorID  varchar PRIMARY KEY,
   officeNo  int,
   firstName  varchar,
   middleName  varchar,
   lastName  varchar,
   NPI  varchar,
   email  varchar,
   speciality  varchar,
   taxID  int
);

CREATE TABLE  Claim  (
   claimID  varchar PRIMARY KEY,
   claimDate  date,
   claimStatus  varchar,
   paymentResponsibility  varchar,
   startDOS  date,
   endDOS  date,
   claimAmt int,
   placeOfService  varchar
);

CREATE TABLE  DescriptionOf  (
   procedureID  varchar,
   claimID  varchar,
  PRIMARY KEY ( procedureID ,  claimID )
);

CREATE TABLE  Hospital  (
   hospitalID  varchar PRIMARY KEY,
   hospitalName  varchar,
   postalCode  int,
   email  varchar
);

CREATE TABLE  WorksIn  (
   hospitalID  varchar,
   doctorID  varchar,
  PRIMARY KEY ( hospitalID ,  doctorID )
);

CREATE TABLE  PatientPayment  (
   paymentID  varchar PRIMARY KEY,
   claimID  varchar,
   paymentStatus  varchar,
   paymentAmount  int,
   paymentDate  date,
   paymentType  varchar
);

CREATE TABLE  InsurancePayment  (
   paymentID  varchar PRIMARY KEY,
   claimID  varchar,
   paymentStatus  varchar,
   paymentType  varchar,
   paymentDate  date,
   paymentAmount  int
);

CREATE TABLE  Location  (
   postalCode  int PRIMARY KEY,
   city  varchar,
   state  varchar,
   country  varchar
);

CREATE TABLE  CurrentProcedureDescription  (
   cptCode  varchar PRIMARY KEY,
   cptDescription  varchar UNIQUE,
   chargeFee  int
);
CREATE TABLE contactno_doctor (
    id VARCHAR NOT NULL,
    mobileno VARCHAR(10),
    PRIMARY KEY (id,mobileno),
    CONSTRAINT fk_id
        FOREIGN KEY (id)
        REFERENCES Doctor(doctorID)
);

CREATE TABLE contactno_insurance (
    id VARCHAR NOT NULL,
    mobileno VARCHAR(10),
    PRIMARY KEY (id,mobileno),
    CONSTRAINT fk_id
        FOREIGN KEY (id)
        REFERENCES insurancecompany(insuranceProviderID)
);

CREATE TABLE contactno_patient (
    id VARCHAR NOT NULL,
    mobileno VARCHAR(10),
    PRIMARY KEY (id,mobileno),
    CONSTRAINT fk_id
        FOREIGN KEY (id)
        REFERENCES patient(patientID)
);

ALTER TABLE  WorksIn  ADD FOREIGN KEY ( hospitalID ) REFERENCES  Hospital  ( hospitalID );

ALTER TABLE  WorksIn  ADD FOREIGN KEY ( doctorID ) REFERENCES  Doctor  ( doctorID );

ALTER TABLE  DiseaseType  ADD FOREIGN KEY ( AppID ) REFERENCES  Appointment  ( AppID );

ALTER TABLE  Appointment  ADD FOREIGN KEY ( doctorID ) REFERENCES  Doctor  ( doctorID );

ALTER TABLE  PatientInsurance  ADD FOREIGN KEY ( patientID ) REFERENCES  Patient  ( patientID );

ALTER TABLE  contactno_patient  ADD FOREIGN KEY ( ID ) REFERENCES  Patient  ( patientID );

ALTER TABLE  Appointment  ADD FOREIGN KEY ( patientID ) REFERENCES  Patient  ( patientID );

ALTER TABLE  PatientInsurance  ADD FOREIGN KEY ( insuranceProviderID ) REFERENCES  InsuranceCompany  ( insuranceProviderID );

ALTER TABLE  ChargesAndDiagnosis  ADD FOREIGN KEY ( AppID ) REFERENCES  Appointment  ( AppID );

ALTER TABLE  contactno_doctor  ADD FOREIGN KEY ( ID ) REFERENCES  Doctor  ( doctorID );

ALTER TABLE  DescriptionOf  ADD FOREIGN KEY ( claimID ) REFERENCES  Claim  ( claimID );

ALTER TABLE  DescriptionOf  ADD FOREIGN KEY ( procedureID ) REFERENCES  ChargesAndDiagnosis  ( procedureID );

ALTER TABLE  PatientPayment  ADD FOREIGN KEY ( claimID ) REFERENCES  Claim  ( claimID );

ALTER TABLE  InsurancePayment  ADD FOREIGN KEY ( claimID ) REFERENCES  Claim  ( claimID );

ALTER TABLE  Patient  ADD FOREIGN KEY ( postalCode ) REFERENCES  Location  ( postalCode );

ALTER TABLE  Hospital  ADD FOREIGN KEY ( postalCode ) REFERENCES  Location  ( postalCode );

ALTER TABLE  contactno_insurance  ADD FOREIGN KEY ( ID ) REFERENCES  InsuranceCompany  ( insuranceProviderID );

ALTER TABLE  CurrentProcedureDescription  ADD FOREIGN KEY ( cptCode ) REFERENCES  ChargesAndDiagnosis  ( cptCode );




