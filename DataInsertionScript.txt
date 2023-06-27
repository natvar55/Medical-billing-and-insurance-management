set search_path to project;

-- FUNCTION TO ASSIGN RANDOM FIRST NAMES
CREATE OR REPLACE FUNCTION first_name()
RETURNS text AS $$
BEGIN
    RETURN (SELECT first_name FROM (
        SELECT first_name
        FROM (
            SELECT unnest('{Ethan, Emma, Noah, Olivia, Liam, Ava, Jackson, Sophia, Aiden, Isabella, Caden, Mia, Grayson, Charlotte, Elijah, Harper, Lucas, Amelia, Mason, Abigail, Logan, Emily, Oliver, Elizabeth, Carter, Sofia, Owen, Avery, Brayden, Chloe, Samuel, Ella, Alexander, Scarlett, Benjamin, Victoria, Caleb, Madison, Luke, Grace, Christian, Riley, Daniel, Zoey, Gabriel, Penelope, Matthew, Layla, Ryan, Aubrey, Connor, Natalie, Josiah, Lily, Landon, Addison, William, Brooklyn, Julian, Hannah, Caleb, Mila, Isaac, Leah, Levi, Zoey, Nathan, Audrey, David, Bella, Adam, Savannah, Joseph, Aaliyah, Dylan, Ellie, Isaiah, Skylar, Evan, Paisley, Luke, Ariana, Jason, Eva, Carson, Claire, Cameron, Violet, Brandon, Madelyn, Tyler, Caroline, Michael, Anna, Logan, Kennedy, Dominic, Samantha, Henry, Stella, Ian, Maya, Sebastian, Addison, Levi, Hailey, Zachary, Elizabeth, Wyatt, Paisley, Jayden, Lila, Gabriel, Aurora, Owen, Maya, Andrew, Arianna, Josiah, Piper, Grayson, Naomi, Julian, Savannah, Justin, Peyton, Anthony, Kaylee, Colton, Julia, Jaxon, Taylor, Eli, Eliana, Braylon, Alexa, Lincoln, Gabriella, Jordan, Katherine, Xavier, Brooke, Easton, Penelope, Nathaniel, Eva, Jace, Maria, Gavin, Sadie, Evan, Ellie, Marcus, Mackenzie, Ryder, Hadley, Cooper, Arianna, Ayden, Ruby, Roman, Melanie, Miles, Reagan, Hayden, Faith, Parker, Isabelle, Ashton, Clara, Blake, Lauren, Nolan, Gabrielle, Kaden, Lily, Harrison, Annabelle, Adrian, Kinsley, Cole, Arielle, Easton, Ellie, Christopher, Melody, Cooper, Rachel, Austin, Molly, Jeremiah, Jasmine, Kai, Alexandra, Dominic, Jocelyn, Charles, Trinity, Hunter, Emerson, Peter, Valerie, Sean, Paige, Wyatt, Camila, Colton, Nora, Vincent, Maya, Damian, Angelina, Maxwell, Josephine, Carson, Alyssa, Brady, Reese, Tristan, Maria, Robert, Jordyn, Micah, Angel, Camden, Callie, Nathaniel, Jordan, George, Aria, Spencer, Ruby, Kai, Isla, Ryder, Makayla, Luis, Kayla, Leo, Sydney, Jonah, Sophie, Colin, Autumn, Hayden, Brooke, Leo, Adalynn, Nicholas, Violet, Jeremiah, Eva, Axel, Payton, Eric, Genesis, Sawyer, Mary, Roman, Brielle, Cole, Faith, Nolan, Trinity, Kian, Nora, Oliver, Aurora, Sawyer, Arabella, Jason, Madelyn, George, Harley, Kai, Ariella, Victor, Aurora, Trevor, Scarlett, Josue, Cora, Brady, Serenity, Landon, Athena, Justin, Summer, Jayce, Sierra, Julian, Jada, Eric, Peyton, Lane, Isabelle, Fernando, Elianna, Alejandro, Adeline, Luis, Rachel, Adriel, Gracie, Santiago, Paige, Nathalia, Jax, London, Bennett, Liliana, Colin, Jade, Simon, Kaylee, Jared, Alaina, Ruben, Adriana, Tate, Gabriela, Gunner, Raelynn, Jesse}'::text[]) AS first_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN RANDOM MIDDLE NAMES
CREATE OR REPLACE FUNCTION middle_name()
RETURNS text AS $$
BEGIN
    RETURN (SELECT middle_name FROM (
        SELECT middle_name
        FROM (
            SELECT unnest('{Ethan, Emma, Noah, Olivia, Liam, Ava, Jackson, Sophia, Aiden, Isabella, Caden, Mia, Grayson, Charlotte, Elijah, Harper, Lucas, Amelia, Mason, Abigail, Logan, Emily, Oliver, Elizabeth, Carter, Sofia, Owen, Avery, Brayden, Chloe, Samuel, Ella, Alexander, Scarlett, Benjamin, Victoria, Caleb, Madison, Luke, Grace, Christian, Riley, Daniel, Zoey, Gabriel, Penelope, Matthew, Layla, Ryan, Aubrey, Connor, Natalie, Josiah, Lily, Landon, Addison, William, Brooklyn, Julian, Hannah, Caleb, Mila, Isaac, Leah, Levi, Zoey, Nathan, Audrey, David, Bella, Adam, Savannah, Joseph, Aaliyah, Dylan, Ellie, Isaiah, Skylar, Evan, Paisley, Luke, Ariana, Jason, Eva, Carson, Claire, Cameron, Violet, Brandon, Madelyn, Tyler, Caroline, Michael, Anna, Logan, Kennedy, Dominic, Samantha, Henry, Stella, Ian, Maya, Sebastian, Addison, Levi, Hailey, Zachary, Elizabeth, Wyatt, Paisley, Jayden, Lila, Gabriel, Aurora, Owen, Maya, Andrew, Arianna, Josiah, Piper, Grayson, Naomi, Julian, Savannah, Justin, Peyton, Anthony, Kaylee, Colton, Julia, Jaxon, Taylor, Eli, Eliana, Braylon, Alexa, Lincoln, Gabriella, Jordan, Katherine, Xavier, Brooke, Easton, Penelope, Nathaniel, Eva, Jace, Maria, Gavin, Sadie, Evan, Ellie, Marcus, Mackenzie, Ryder, Hadley, Cooper, Arianna, Ayden, Ruby, Roman, Melanie, Miles, Reagan, Hayden, Faith, Parker, Isabelle, Ashton, Clara, Blake, Lauren, Nolan, Gabrielle, Kaden, Lily, Harrison, Annabelle, Adrian, Kinsley, Cole, Arielle, Easton, Ellie, Christopher, Melody, Cooper, Rachel, Austin, Molly, Jeremiah, Jasmine, Kai, Alexandra, Dominic, Jocelyn, Charles, Trinity, Hunter, Emerson, Peter, Valerie, Sean, Paige, Wyatt, Camila, Colton, Nora, Vincent, Maya, Damian, Angelina, Maxwell, Josephine, Carson, Alyssa, Brady, Reese, Tristan, Maria, Robert, Jordyn, Micah, Angel, Camden, Callie, Nathaniel, Jordan, George, Aria, Spencer, Ruby, Kai, Isla, Ryder, Makayla, Luis, Kayla, Leo, Sydney, Jonah, Sophie, Colin, Autumn, Hayden, Brooke, Leo, Adalynn, Nicholas, Violet, Jeremiah, Eva, Axel, Payton, Eric, Genesis, Sawyer, Mary, Roman, Brielle, Cole, Faith, Nolan, Trinity, Kian, Nora, Oliver, Aurora, Sawyer, Arabella, Jason, Madelyn, George, Harley, Kai, Ariella, Victor, Aurora, Trevor, Scarlett, Josue, Cora, Brady, Serenity, Landon, Athena, Justin, Summer, Jayce, Sierra, Julian, Jada, Eric, Peyton, Lane, Isabelle, Fernando, Elianna, Alejandro, Adeline, Luis, Rachel, Adriel, Gracie, Santiago, Paige, Nathalia, Jax, London, Bennett, Liliana, Colin, Jade, Simon, Kaylee, Jared, Alaina, Ruben, Adriana, Tate, Gabriela, Gunner, Raelynn, Jesse}'::text[]) AS middle_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN RANDOM LAST NAMES
CREATE OR REPLACE FUNCTION last_name()
RETURNS text AS $$
BEGIN
    RETURN (SELECT last_name FROM (
        SELECT last_name
        FROM (
            SELECT unnest('{Smith, Johnson, Williams, Brown, Jones, Miller, Davis, Garcia, Rodriguez, Martinez, Hernandez, Lopez, Gonzalez, Perez, Taylor, Anderson, Wilson, Jackson, Collins, Lee, Baker, Nelson, Mitchell, Perez, Campbell, Carter, Parker, Evans, Edwards, Flores, Green, Hall, Turner, King, White, Young, Scott, Adams, Baker, Bailey, Bell, Bennett, Brooks, Butler, Carter, Clark, Coleman, Collins, Cook, Cooper, Cox, Cruz, Diaz, Dixon, Ellis, Freeman, Gardner, Gomez, Graham, Gray, Griffin, Hamilton, Harper, Harrison, Hart, Hayes, Hicks, Hill, Howard, Hughes, Hunter, Jackson, James, Jenkins, Johnson, Jones, Kelly, Kennedy, Kim, King, Knight, Lane, Lee, Lewis, Long, Martinez, Mason, Matthews, May, McDonald, Miller, Mitchell, Moore, Morales, Morgan, Morris, Murphy, Murray, Myers, Nelson, Nguyen, Ortiz, Owens, Parker, Patel, Patterson, Payne, Pearson, Perez, Perry, Peterson, Phillips, Powell, Price, Ramirez, Ramos, Reed, Reyes, Reynolds, Richardson, Rivera, Roberts, Robinson, Rodriguez, Rogers, Ross, Ruiz, Russell, Sanchez, Sanders, Scott, Shaw, Simmons, Simpson, Smith, Snyder, Spencer, Stevens, Stewart, Sullivan, Taylor, Thomas, Thompson, Torres, Turner, Vasquez, Wade, Walker, Wallace, Walsh, Ward, Washington, Watson, Weaver, Webb, Welch, Wells, West, Wheeler, White, Williams, Willis, Wilson, Wood, Wright, Young, Zimmerman, Bailey, Bates, Berry, Blake, Bowen, Brady, Bridges, Briggs, Brock, Buck, Burgess, Burns, Burton, Butler, Byrd, Cameron, Carpenter, Carroll, Casey, Chambers, Chandler, Chapman, Christensen, Clarke, Clay, Clayton, Cobb, Cohen, Cole, Coleman, Collins, Conner, Conrad, Cook, Cooper, Cope, Copeland, Costa, Cox, Crawford, Cross, Crouch, Cummings, Curry, Curtis, Dale, Dalton, Daniel, Davidson, Davis, Dean, Delgado, Dennis, Diaz, Dixon, Dodson, Dominguez, Douglas, Doyle, Drake, Duncan, Dunn, Edwards, Elliott, Ellis, Erickson, Espinoza, Estes, Estrada, Evans, Farmer, Farrell, Ferguson, Fernandez, Fields, Fisher, Fleming, Fletcher, Flores, Flowers, Floyd, Flynn, Ford, Foster, Fowler, Fox, Franklin, Freeman, French, Fuller, Gallagher, Garcia, Gardner, Garrett, Garrison, Gates, George, Gibbs, Gibson, Gilbert, Gill, Gillespie, Gomez, Gonzalez, Goodman, Gordon, Graham, Grant, Graves, Gray, Green, Greene, Gregory, Griffin, Griffith, Gross, Guerrero, Gutierrez, Guzman, Hahn, Haley, Hall, Hamilton, Hammond, Hancock, Hansen, Hanson, Hardin, Harding, Hardy, Harper, Harris, Harrison, Hart, Harvey, Hawkins, Hayes, Haynes, Hebert, Henderson, Henry, Herrera, Herring, Hicks, Higgins, Hill, Hines, Hodges, Hoffman, Hogan, Holden, Holland, Holloway, Holmes, Holt, Hood, Hopkins, Horton, House, Houston, Howard, Howell, Hubbard, Hudson, Huff, Huffman, Hughes, Hulbert, Hull, Humphrey, Hunt, Hunter, Hurst, Hutchinson, Ingram, Jackson, Jacobs, James, Jenkins, Jennings, Jensen, Jimenez, Johnson, Johnston, Jones, Jordan, Joseph, Joyce, Justice, Kane, Kaufman, Keith, Keller}'::text[]) AS last_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN DOCTOR SPECIALITY
CREATE OR REPLACE FUNCTION speciality()
RETURNS text AS $$
BEGIN
    RETURN (SELECT first_name FROM (
        SELECT first_name
        FROM (
            SELECT unnest('{ Family medicine, Internal Medicine, Pediatrician, Obstetricians/gynecologist (OBGYNs), Cardiologist, Oncologist, Gastroenterologist, Pulmonologist, Infectious disease, Nephrologist, Endocrinologist, Ophthalmologist, Otolaryngologist, Dermatologist , Psychiatrist}'::text[]) AS first_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN HOSPITAL NAMES
CREATE OR REPLACE FUNCTION hospital_name()
RETURNS text AS $$
BEGIN
    RETURN (SELECT first_name FROM (
        SELECT first_name
        FROM (
            SELECT unnest('{  Mayo Clinic, Cleveland Clinic, Johns Hopkins Hospital, Massachusetts General Hospital, University of Michigan Hospitals-Michigan Medicine, UCLA Medical Center, New York-Presbyterian Hospital-Columbia and Cornell, UCSF Medical Center, Brigham and Women’s Hospital, Cedars-Sinai Medical Center, Northwestern Memorial Hospital, Stanford Health Care-Stanford Hospital, Hospitals of the University of Pennsylvania-Penn Presbyterian, Barnes-Jewish Hospital/Washington University, Mount Sinai Hospital}'::text[]) AS first_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN CITY
CREATE OR REPLACE FUNCTION city()
RETURNS text AS $$
BEGIN
    RETURN (SELECT first_name FROM (
        SELECT first_name
        FROM (
            SELECT unnest('{New York City, Los Angeles, Chicago, Houston, Phoenix, Philadelphia, San Antonio, San Diego, Dallas, San Jose, Austin, Jacksonville, Fort Worth, Columbus, San Francisco, Charlotte, Indianapolis, Seattle, Denver, Washington D.C. }'::text[]) AS first_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN STATE
CREATE OR REPLACE FUNCTION state()
RETURNS text AS $$
BEGIN
    RETURN (SELECT first_name FROM (
        SELECT first_name
        FROM (
            SELECT unnest('{ New York City, Los Angeles, Chicago, Houston, Phoenix, Philadelphia, San Antonio, San Diego, Dallas, San Jose, Austin, Jacksonville, Fort Worth, Columbus, San Francisco, Charlotte, Indianapolis, Seattle, Denver, Washington D.C.}'::text[]) AS first_name     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN GENDER
CREATE OR REPLACE FUNCTION generate_gender(gender FLOAT)
RETURNS CHAR(1) AS $$
BEGIN
    IF gender > 0.5 THEN
        RETURN 'M';
    ELSEIF gender <=0.5 THEN
        RETURN 'F';
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN APPOINTMENT FEE
CREATE OR REPLACE FUNCTION fee(prob FLOAT)
RETURNS INT AS $$
BEGIN
    IF prob > 0.8 THEN
        RETURN 70;
    ELSEIF prob <= 0.8 THEN
        RETURN 50;
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN APPOINTMENT STATUS
CREATE OR REPLACE FUNCTION status(prob FLOAT)
RETURNS text AS $$
BEGIN
    IF prob > 0.8 THEN
        RETURN 'Not Visited';
    ELSEIF prob <= 0.8 THEN
        RETURN 'Visited';
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN INSURANCE COMPANY ADDRESS
CREATE OR REPLACE FUNCTION companyaddress()
RETURNS text AS $$
BEGIN
    RETURN (SELECT companyaddress FROM (
        SELECT companyaddress
        FROM (
            SELECT unnest('{"The Tower at Midtown", "The Commerce Center", "The Plaza at Park Avenue", "The Metropolitan Tower", "The Corporate Commons", "The Business District", "The Promenade Plaza", "The Innovation Center", "The Executive Suites", "The Commerce Exchange", "The Business Park", "The Professional Plaza", "The Corporate Center", "The Commerce Tower", "The Executive Tower", "The Innovation Campus", "The Corporate Park", "The Enterprise Building", "The Business Exchange", "The Commerce Campus", "The Professional Tower", "The Executive Campus", "The Business Suites", "The Corporate Suites", "The Innovation Suites", "The Commerce Suites", "The Professional Exchange", "The Executive Exchange", "The Business Tower", "The Corporate Exchange"}'::text[]) AS companyaddress     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN INSURANCE COMPANY NAME
CREATE OR REPLACE FUNCTION companyname()
RETURNS text AS $$
BEGIN
    RETURN (SELECT companyname FROM (
        SELECT companyname
        FROM (
            SELECT unnest('{State Farm,GEICO,Allstate,Progressive,Nationwide,Liberty Mutual,Farmers Insurance,USAA,Travelers,American Family Insurance,Chubb,The Hartford,Erie Insurance,Amica Mutual Insurance,MetLife,Mercury Insurance,AAA,AIG,Safeco Insurance,The General Insurance,Esurance,National General Insurance,Plymouth Rock Assurance,Kemper,MAPFRE Insurance,Hanover Insurance,COUNTRY Financial,Grange Insurance,Auto-Owners Insurance, The Cincinnati Insurance Company.}'::text[]) AS companyname     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN PAYMENT STATUS
CREATE OR REPLACE FUNCTION paymentstatus(prob float)
RETURNS text AS $$
BEGIN
    IF prob > 0.8 THEN
        RETURN 'Rejected';
    ELSEIF prob <= 0.8 THEN
        RETURN 'Accepted';
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN PAYMENT TYPE
CREATE OR REPLACE FUNCTION paymenttype()
RETURNS text AS $$
BEGIN
    RETURN (SELECT paymenttype FROM (
        SELECT paymenttype
        FROM (
            SELECT unnest('{"Electronic Fund Transfer","Credit Card","Debit Card","Online Payment","Cheque","Cash"}'::text[]) AS paymenttype     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN PAYMENT AMOUNT
CREATE OR REPLACE FUNCTION paymentamount()
RETURNS int AS $$
BEGIN
    RETURN (SELECT paymentamount FROM (
        SELECT paymentamount
        FROM (
            SELECT unnest(ARRAY[900,1034,2203,1130,1175,708,479,111,387,1262,647,2050,871,1114,2476,989,1702,899,641,787,357,2117,1442,373,1873,1596,1960,951,296,1505,1151,2197,1437,533,1110,424,1756,2225,2276,932,535,1136,1372,1681,2474,1079,2355,847,234,1319,1037,1488,1418,514,1629,1412,2336,1058,745,427,2408,234,1136,981,434,979,1665,549,554,221,345,964,1400,1754,630,1143,1220,751,2259,825,1766,1561,343,1267,915,435,2044,1602,2433,329,854,684,2058,104,1746,1922,2405,571,1543,169]::int[]) AS paymentamount     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN CPTCODE IN CHARGEANDDIAGNOSIS
CREATE OR REPLACE FUNCTION cptcode()
RETURNS text AS $$
BEGIN
    RETURN (SELECT cptcode FROM (
        SELECT cptcode
        FROM (
            SELECT unnest('{00600, 96900, 97010, 97802, 97810, 98925, 99000, 99100, 99151, 99170, 99439, 99450, 99460, 00671, 97780, 97799, 97151, 00681, 99468, 90791, 96570, 94005, 95250, 95732, 82044, 85025, 86003, 86874, 87077, 88007, 88108, 88269, 88309, 88743, 89190, 89296, 90376, 90472, 90480, 90903, 90969, 91020}'::text[]) AS cptcode     
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO ASSIGN PLACE OF SERVICE
CREATE OR REPLACE FUNCTION place_of_service()
RETURNS text AS $$
BEGIN
    RETURN (SELECT placeofservice FROM (
        SELECT placeofservice
        FROM (
            SELECT unnest('{OT1,OT2,OT3,OT4,OT5,GR1,GR2,GR3,GR4,GR5,SP1,SP2,SP3,SP4,SP5}'::text[]) AS placeofservice   
        ) AS names
        ORDER BY random()
        LIMIT 1
    ) AS name);
END;
$$ LANGUAGE plpgsql;


-- FUNCTION TO ASSIGN PAYMENT RESP
CREATE OR REPLACE FUNCTION paymentresponsibility(prob FLOAT)
RETURNS text AS $$
BEGIN
    IF prob <= 0.3 THEN
        RETURN 'Self';
    ELSEIF prob > 0.3 AND prob < 0.6 THEN
        RETURN 'Insurance Company';
    ELSE
        RETURN 'Both';
    END IF;
END;
$$ LANGUAGE plpgsql;



-- FUNCTION TO GENERATE A RANDOM NUMBER BETWEEN GIVEN LIMITS
CREATE OR REPLACE FUNCTION random_between(low INT ,high INT) 
   RETURNS INT AS
$$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;

----------------------------------------- END OF FUNCTIONS ---------------------------------------------




INSERT INTO Location (postalCode, city, state, country)
SELECT 
    generate_series(39002,39052), 
    city(), 
    state(), 
    'USA' 
;



INSERT INTO Patient (patientID, firstName, middleName, lastName, gender, emailID, DOB, postalCode)
SELECT 
	'p_' || generate_series(1,350),
    first_name(), 
    middle_name(), 
    last_name(), 
    generate_gender(random()), 
    'patient_' || generate_series(1,350) || '@gmail.com', 
    '1990-01-01'::date + (random() * (now() - '1990-01-01'::date))::interval,
    floor(random() * (39052-39002+1) + 39002)::int;
;



INSERT INTO Hospital (hospitalID,hospitalName,postalCode,email)
SELECT 
	'h_' || generate_series(1,20), 
    hospital_name(), 
    floor(random() * (39052-39002+1) + 39002)::int,
	'hospital_' || generate_series(1,20) || '@gmail.com';   
;



INSERT INTO Doctor (doctorID,officeNo,firstName,middleName,lastName,NPI,email,speciality,taxID)
SELECT 
	'd_' || generate_series(1,50), 
    generate_series(1,50), 
    first_name(),
	middle_name(),
	last_name(),
	'NPI'||generate_series(1003000201,1003000250)	,
	'doctor_' || generate_series(1,50) || '@gmail.com',
	speciality(),
	generate_series(258456301,258456350);    
;



INSERT INTO Appointment(AppID,patientID,doctorID,AppDate,AppFee,Appstatus)
SELECT
	'app_' || generate_series(1,350),
	'p_' || generate_series(1,350),
	'd_' || floor(random() * (50-1+1) + 1)::int,
	'2023-01-01'::date + (random() * (now() - '2023-01-01'::date))::interval,
	fee(random()),
	status(random())
	
UPDATE Appointment SET AppFee = 0 WHERE Appstatus = 'Not Visited';



INSERT INTO insurancecompany (insuranceproviderid,emailiD,companyaddress, companyname)
SELECT 
	'provider_' || generate_series(1,25),
    'insuranceprovider_' || generate_series(1,25) || '@example.com',
	companyaddress(),
	companyname();
;



INSERT INTO PatientInsurance(policyno,insuranceproviderid,patientid,subscriberdob,subscribername)
SELECT 
	'policy_' || generate_series(1,350),
	'provider_' || floor(random() * (25-1+1) + 1)::int,
	'p_' || generate_series(1,350),
	'1970-01-01'::date + floor(random() * 10000)::int,
	first_name()



INSERT INTO CurrentProcedureDescription (cptCode, cptDescription, chargeFee)
VALUES 
    ('cpt_1', 'Flu vaccine administration', 50),
    ('cpt_2', 'Common cold diagnosis', 100),
    ('cpt_3', 'Asthma management', 150),
    ('cpt_4', 'Hypertension screening', 120),
    ('cpt_5', 'Diabetes management', 200),
    ('cpt_6', 'Cancer screening', 200),
    ('cpt_7', 'Hypertension management', 150),
    ('cpt_8', 'Heart disease diagnosis', 300),
    ('cpt_9', 'Stroke rehabilitation', 250),
    ('cpt_10', 'Diabetes education', 100),
    ('cpt_11', 'Evaluation and management of attention deficit hyperactivity disorder (ADHD)', 245),
    ('cpt_12', 'Evaluation and management of autism spectrum disorder', 300),
    ('cpt_13', 'Treatment of ear infection (otitis media)', 150),
    ('cpt_14', 'Treatment of asthma exacerbation', 200),
    ('cpt_15', 'Management of type 2 diabetes mellitus', 100),
    ('cpt_16', 'Diagnostic mammography for breast cancer screening', 350),
    ('cpt_17', 'Treatment of ovarian cancer', 500),
    ('cpt_18', 'Treatment of cervical cancer', 450),
    ('cpt_19', 'Treatment of endometriosis', 275),
    ('cpt_20', 'Hormone replacement therapy for menopausal symptoms', 175),
    ('cpt_21', 'Coronary angiography for diagnosis of coronary artery disease', 800),
    ('cpt_22', 'Treatment of acute myocardial infarction (heart attack)', 1500),
    ('cpt_23', 'Management of arrhythmia with implantable cardioverter-defibrillator (ICD)', 1200),
    ('cpt_24', 'Treatment of heart failure exacerbation', 1000),
    ('cpt_25', 'Management of hypertension with medication therapy', 75),
    ('cpt_26', 'Breast cancer surgery with lymph node dissection', 4000),
    ('cpt_27', 'Chemotherapy for non-small cell lung cancer', 3500),
    ('cpt_28', 'Colonoscopy with biopsy for colon cancer screening and diagnosis', 750),
    ('cpt_29', 'Induction chemotherapy for acute myeloid leukemia', 2000),
    ('cpt_30', 'Radiation therapy for Hodgkin''s lymphoma', 3000),
    ('cpt_31', 'Esophagogastroduodenoscopy (EGD) for diagnosis of gastroesophageal reflux disease (GERD)', 400),
    ('cpt_32', 'Treatment of Crohn''s disease with immunomodulators', 950),
    ('cpt_33', 'Treatment of ulcerative colitis with biologics', 1200),
    ('cpt_34', 'Management of irritable bowel syndrome (IBS) with dietary modifications and medication therapy', 175),
    ('cpt_35', 'Treatment of acute pancreatitis', 800),
    ('cpt_36', 'Pulmonary function tests for diagnosis of asthma', 250),
    ('cpt_37', 'Treatment of COPD exacerbation', 300),
    ('cpt_38', 'Treatment of emphysema with bronchodilators and corticosteroids', 250),
    ('cpt_39', 'Lobectomy for lung cancer treatment', 5000),
('cpt_40', 'Management of pulmonary fibrosis with oxygen therapy and corticosteroids', 1200),
('cpt_41', 'Diagnosis of COVID-19 with nucleic acid amplification test (NAAT)', 250),
('cpt_42', 'Diagnosis of HIV infection with enzyme immunoassay (EIA) and confirmatory Western blot test', 500),
('cpt_43', 'Diagnosis of tuberculosis with chest X-ray and sputum culture', 350),
('cpt_44', 'Diagnosis of malaria with blood smear examination', 400),
('cpt_45', 'Diagnosis of Zika virus infection with reverse transcription polymerase chain reaction (RT-PCR)', 300),
('cpt_46', 'Extracorporeal shock wave lithotripsy (ESWL) for kidney stone removal', 5000),
('cpt_47', 'Management of chronic kidney disease with angiotensin-converting enzyme (ACE) inhibitors', 1500),
('cpt_48', 'Genetic testing for polycystic kidney disease', 2000),
('cpt_49', 'Management of nephrotic syndrome with corticosteroids', 1200),
('cpt_50', 'Diagnosis of acute kidney injury with blood and urine tests', 800),
('cpt_51', 'Management of diabetes with oral hypoglycemic agents and insulin therapy', 1000),
('cpt_52', 'Diagnosis of thyroid disorders with thyroid-stimulating hormone (TSH) and free thyroxine (FT4) tests', 600),
('cpt_53', 'Bone mineral density testing for osteoporosis screening', 750),
('cpt_54', 'Management of metabolic syndrome with lifestyle modifications and medication therapy', 900),
('cpt_55', 'Diagnosis of Cushing''s syndrome with 24-hour urinary free cortisol test', 1000),
('cpt_56', 'Phacoemulsification with intraocular lens implantation for cataract removal', 5000),
('cpt_57', 'Management of glaucoma with topical beta blockers and prostaglandin analogs', 1500),
('cpt_58', 'Diagnosis of macular degeneration with fundus photography and optical coherence tomography (OCT)', 2000),
('cpt_59', 'Management of diabetic retinopathy with laser photocoagulation and intravitreal injections', 3000),
('cpt_60', 'Management of dry eye syndrome with artificial tears and cyclosporine eye drops', 1200),
('cpt_61', 'Diagnosis of sinusitis with nasal endoscopy and computed tomography (CT) scan', 1000),
('cpt_62', 'Management of tinnitus with cognitive behavioral therapy and sound therapy', 800),
('cpt_63', 'Hearing aid fitting for management of hearing loss', 2500),
('cpt_64', 'Diagnosis of vertigo with Dix-Hallpike test and electronystagmography (ENG)', 1200),
('cpt_65', 'Continuous positive airway pressure (CPAP) therapy for sleep apnea', 2000),
('cpt_66', 'Topical retinoids for management of acne vulgaris', 700),
('cpt_67', 'Management of eczema with topical corticosteroids and moisturizers', 600),
('cpt_68', 'Management of psoriasis with topical vitamin D analogs and biologics', 1500),
('cpt_69', 'Excisional biopsy for diagnosis and treatment of skin cancer', 760),
('cpt_70', 'Management of rosacea with topical metronidazole and oral tetracyclines', 200),
('cpt_71', 'Selective serotonin reuptake inhibitors (SSRIs) for management of depression', 300),
('cpt_72', 'Cognitive behavioral therapy (CBT) for management of anxiety disorders', 500),
('cpt_73', 'Mood stabilizers for management of bipolar disorder', 400),
('cpt_74', 'Atypical antipsychotics for management of schizophrenia', 700),
('cpt_75', 'Stimulant medications for management', 600);


INSERT INTO chargesanddiagnosis (procedureid, appid, cptcode, quantity)
SELECT 
	'procedure_' || generate_series(1,350),
	'app_' || generate_series(1,350),
    cptcode(), 
    random_between(1,5); 
;


INSERT INTO claim (claimID, claimdate, claimstatus, paymentresponsibility, startdos, enddos,placeofservice)
SELECT 
	'claim_' || generate_series(1,350),
	NULL,
    NULL,  
    paymentresponsibility(random()),  
    NULL,
	NULL,
	place_of_service();
;

UPDATE claim
SET startdos = appointment.appdate + floor(random() * 10)::integer
FROM descriptionof
JOIN chargesanddiagnosis ON descriptionof.procedureid = chargesanddiagnosis.procedureid
JOIN appointment ON chargesanddiagnosis.appid = appointment.appid
WHERE claim.claimid = descriptionof.claimid;

UPDATE claim 
SET enddos=startdos + floor(random()*15)::integer



INSERT INTO descriptionof (procedureid, claimid)
SELECT 
	'procedure_' || generate_series(1,350),
	'claim_' || generate_series(1,350);
;



INSERT INTO insurancepayment (paymentID, claimid, paymentstatus, paymenttype, paymentdate, paymentamount)
SELECT 
	'payment_' || generate_series(1,350),
	'claim_' || generate_series(1,350),
    paymentstatus(random()), 
    paymenttype(),  
    NULL,
    NULL;
;

UPDATE insurancepayment
SET paymentdate = claim.enddos + floor(random_between(10,30))::integer
FROM claim
WHERE claim.claimid = insurancepayment.claimid;



INSERT INTO patientpayment (paymentID, claimid, paymentstatus, paymentamount, paymentdate, paymenttype)
SELECT 
	'payment_' || generate_series(1,350),
	'claim_' || generate_series(1,350),
    paymentstatus(random()), 
	paymentamount(),
    NULL,  
    paymenttype();
;

UPDATE patientpayment
SET paymentdate = claim.enddos + floor(random_between(10,30))::integer
FROM claim
WHERE claim.claimid = patientpayment.claimid;



UPDATE claim
SET claimdate = pp.paymentdate + random_between(10,30)
FROM patientpayment pp
JOIN claim c ON pp.claimid = c.claimid;

UPDATE claim
SET claimdate = ip.paymentdate + random_between(10,30)
FROM insurancepayment ip
JOIN claim c ON ip.claimid = c.claimid
WHERE c.claimdate <= ip.paymentdate;



-- INSURANCE ONLY PAYMENT
UPDATE insurancepayment 
SET paymentamount = chargefee + random_between(500,1000)
FROM claim
JOIN descriptionof ON descriptionof.claimid = claim.claimid
JOIN chargesanddiagnosis ON descriptionof.procedureid = chargesanddiagnosis.procedureid
JOIN currentproceduredescription ON chargesanddiagnosis.cptcode = currentproceduredescription.cptcode
WHERE insurancepayment.claimid = claim.claimid AND paymentresponsibility = 'Insurance Company' AND paymentstatus = 'Accepted';



-- SELF ONLY PAYMENT
UPDATE patientpayment 
SET paymentamount = chargefee + random_between(500,1000)
FROM claim
JOIN descriptionof ON descriptionof.claimid = claim.claimid
JOIN chargesanddiagnosis ON descriptionof.procedureid = chargesanddiagnosis.procedureid
JOIN currentproceduredescription ON chargesanddiagnosis.cptcode = currentproceduredescription.cptcode
WHERE patientpayment.claimid = claim.claimid AND paymentresponsibility = 'Self' AND paymentstatus = 'Accepted';

-- DELETING TUPLES FROM IP HAVING ONLY SELF PAY
DELETE FROM insurancepayment ip
WHERE claimid IN (SELECT claimid FROM claim WHERE paymentresponsibility = 'Self');

-- DELETING TUPLES FROM PP HAVING ONLY INSURANCE PAY
DELETE FROM patientpayment pp
WHERE claimid IN (SELECT claimid FROM claim WHERE paymentresponsibility = 'Insurance Company');



-- ASSIGNING PATIENT PAYMENT FOR BOTH PAY
UPDATE patientpayment 
SET paymentamount = chargefee * random_between(20,40) / 100
FROM claim
JOIN descriptionof ON descriptionof.claimid = claim.claimid
JOIN chargesanddiagnosis ON descriptionof.procedureid = chargesanddiagnosis.procedureid
JOIN currentproceduredescription ON chargesanddiagnosis.cptcode = currentproceduredescription.cptcode
WHERE patientpayment.claimid = claim.claimid AND paymentresponsibility = 'Both' AND paymentstatus = 'Accepted';


-- ASSIGNING INSURANCE PAYMENT FOR BOTH PAY
UPDATE insurancepayment 
SET paymentamount = chargefee - patientpayment.paymentamount + random_between(200,1000)
FROM claim
JOIN patientpayment ON patientpayment.claimid = claim.claimid
JOIN descriptionof ON descriptionof.claimid = claim.claimid
JOIN chargesanddiagnosis ON descriptionof.procedureid = chargesanddiagnosis.procedureid
JOIN currentproceduredescription ON chargesanddiagnosis.cptcode = currentproceduredescription.cptcode
WHERE insurancepayment.claimid = claim.claimid AND paymentresponsibility = 'Both' AND insurancepayment.paymentstatus = 'Accepted';



-- ASSIGN '277 Finalized' FOR INSURANCE ONLY ACCEPTED
UPDATE claim 
SET claimstatus = '277 Finalized'
FROM insurancepayment 
WHERE insurancepayment.claimid = claim.claimid 
AND claim.paymentresponsibility = 'Insurance Company' 
AND insurancepayment.paymentstatus = 'Accepted'



-- ASSIGN '277 Finalized' FOR SELF ONLY ACCEPTED
UPDATE claim 
SET claimstatus = '277 Finalized'
FROM patientpayment 
WHERE patientpayment.claimid = claim.claimid 
AND claim.paymentresponsibility = 'Self' 
AND patienpayment.paymentstatus = 'Accepted'



INSERT INTO diseasetype (appid, diseasetype)
SELECT 
	'app_' || generate_series(1,350),
   'NULLDisease'; 
;

-- UPDATING DISEASE ACCORDING TO DOCTOR SPECIALITY
UPDATE DiseaseType 
SET DiseaseType = get_disease_for_speciality(Doctor.speciality)
FROM Appointment
JOIN Doctor ON Appointment.doctorID = Doctor.doctorID
WHERE Appointment.AppID = DiseaseType.AppID ;



-- FUNCTION TO ASSIGN DISEASE ACCORDING TO DOCTOR SPECIALITY
CREATE OR REPLACE FUNCTION get_disease_for_speciality(speciality text)
RETURNS text AS $$
BEGIN
    IF speciality = 'Family medicine' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Flu, Common Cold, Asthma, Hypertension, Diabetes}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Internal Medicine' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Heart Disease, Diabetes, Hypertension, Osteoporosis, Arthritis}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Pediatrician' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Asthma, Common Cold, Chickenpox, Eczema, ADHD}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Obstetricians/gynecologist (OBGYNs)' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Endometriosis, Polycystic Ovary Syndrome (PCOS), Cervical Cancer, Ovarian Cancer, Breast Cancer}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Cardiologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Coronary Artery Disease, Heart Attack, Arrhythmia, Heart Failure, Valvular Heart Disease}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Oncologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Breast Cancer, Lung Cancer, Prostate Cancer, Colon Cancer, Leukemia}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Gastroenterologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Gastroesophageal Reflux Disease (GERD), Irritable Bowel Syndrome (IBS), Ulcerative Colitis, Crohn’s Disease, Pancreatitis}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Pulmonologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Asthma, Chronic Obstructive Pulmonary Disease (COPD), Pneumonia, Lung Cancer, Pulmonary Fibrosis}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Infectious disease' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{HIV/AIDS, Tuberculosis, Malaria, Influenza, Ebola}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Nephrologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Kidney Stones, Chronic Kidney Disease, Polycystic Kidney Disease, Glomerulonephritis, Nephrotic Syndrome}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Endocrinologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Diabetes, Hypothyroidism, Hyperthyroidism, Cushing Syndrome, Addison’s Disease}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Ophthalmologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM(SELECT unnest('{Cataracts, Glaucoma, Diabetic Retinopathy, Age-Related Macular Degeneration, Retinal Detachment}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Otolaryngologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM (SELECT unnest('{Sinusitis, Tinnitus, Hearing loss, Vertigo, Sleep apnea}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);
    ELSIF speciality = 'Dermatologist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM (SELECT unnest('{Acne, Eczema, Psoriasis, Skin cancer, Rosacea}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2);

    ELSIF speciality = 'Psychiatrist' THEN
        RETURN (SELECT diseasetype FROM (SELECT diseasetype FROM (SELECT unnest('{Depression, Anxiety disorders, Bipolar disorder, Schizophrenia, ADHD}'::text[])AS diseasetype  ) AS diseasetype1 ORDER BY random() LIMIT 1) AS diseasetype2); 
	END IF;
	
END;
$$ LANGUAGE plpgsql;



UPDATE ChargesAndDiagnosis
SET cptCode = get_cptcode_for_disease(DiseaseType.DiseaseType)
FROM Appointment
JOIN DiseaseType ON Appointment.AppID = DiseaseType.AppID
WHERE Appointment.AppID = ChargesAndDiagnosis.AppID;

CREATE OR REPLACE FUNCTION get_cptcode_for_disease(diseasename text)
RETURNS text AS $$
BEGIN
    IF diseasename = 'Flu' THEN RETURN 'cpt_1';
    ELSIF diseasename = 'Common Cold' THEN RETURN 'cpt_2';
    ELSIF diseasename = 'Asthma' THEN RETURN 'cpt_3';
    ELSIF diseasename = 'Hypertension' THEN RETURN 'cpt_4';
    ELSIF diseasename = 'Diabetes' THEN RETURN 'cpt_5';
    ELSIF diseasename = 'Heart Disease' THEN RETURN 'cpt_6';
    ELSIF diseasename = 'Diabetes' THEN RETURN 'cpt_7';
    ELSIF diseasename = 'Hypertension' THEN RETURN 'cpt_8';
    ELSIF diseasename = 'Osteoporosis' THEN RETURN 'cpt_9';
    ELSIF diseasename = 'Arthritis' THEN RETURN 'cpt_10';
    ELSIF diseasename = 'Asthma' THEN RETURN 'cpt_11';
    ELSIF diseasename = 'Common Cold' THEN RETURN 'cpt_12';
    ELSIF diseasename = 'Chickenpox,' THEN RETURN 'cpt_13';
    ELSIF diseasename = 'Eczema' THEN RETURN 'cpt_14';
    ELSIF diseasename = 'ADHD' THEN RETURN 'cpt_15';
    ELSIF diseasename = 'Endometriosis' THEN RETURN 'cpt_16';
    ELSIF diseasename = 'Polycystic Ovary Syndrome (PCOS)' THEN RETURN 'cpt_17';
    ELSIF diseasename = 'Cervical Cancer' THEN RETURN 'cpt_18';
    ELSIF diseasename = 'Ovarian Cancer' THEN RETURN 'cpt_19';
    ELSIF diseasename = 'Breast Cancer' THEN RETURN 'cpt_20';
    ELSIF diseasename = 'Coronary Artery Disease' THEN RETURN 'cpt_21';
    ELSIF diseasename = 'Heart Attack' THEN RETURN 'cpt_22';
    ELSIF diseasename = 'Arrhythmia' THEN RETURN 'cpt_23';
    ELSIF diseasename = 'Heart Failure' THEN RETURN 'cpt_24';
    ELSIF diseasename = 'Valvular Heart Disease' THEN RETURN 'cpt_25';
    ELSIF diseasename = 'Breast Cancer' THEN RETURN 'cpt_26';
    ELSIF diseasename = 'Lung Cancer' THEN RETURN 'cpt_27';
    ELSIF diseasename = 'Prostate Cancer' THEN RETURN 'cpt_28';
    ELSIF diseasename = 'Colon Cancer' THEN RETURN 'cpt_29';
    ELSIF diseasename = 'Leukemia' THEN RETURN 'cpt_30';
    ELSIF diseasename = 'Gastroesophageal Reflux Disease (GERD)' THEN RETURN 'cpt_31';
    ELSIF diseasename = 'Irritable Bowel Syndrome (IBS)' THEN RETURN 'cpt_32';
    ELSIF diseasename = 'Ulcerative Colitis' THEN RETURN 'cpt_33';
    ELSIF diseasename = 'Crohn’s Disease' THEN RETURN 'cpt_34';
    ELSIF diseasename = 'Pancreatitis' THEN RETURN 'cpt_35';
    ELSIF diseasename = 'Asthma' THEN RETURN 'cpt_36';
    ELSIF diseasename = 'Chronic Obstructive Pulmonary Disease (COPD)' THEN RETURN 'cpt_37';
    ELSIF diseasename = 'Pneumonia' THEN RETURN 'cpt_37';
    ELSIF diseasename = 'Lung Cancer' THEN RETURN 'cpt_39';
    ELSIF diseasename = 'Pulmonary Fibrosis' THEN RETURN 'cpt_40';
    ELSIF diseasename = 'HIV/AIDS' THEN RETURN 'cpt_10';
    ELSIF diseasename = 'Tuberculosis' THEN RETURN 'cpt_42';
    ELSIF diseasename = 'Malaria' THEN RETURN 'cpt_43';
    ELSIF diseasename = 'Influenza' THEN RETURN 'cpt_44';
    ELSIF diseasename = 'Ebola' THEN RETURN 'cpt_45';
    ELSIF diseasename = 'Kidney Stones' THEN RETURN 'cpt_46';
    ELSIF diseasename = 'Chronic Kidney Disease' THEN RETURN 'cpt_47';
    ELSIF diseasename = 'Polycystic Kidney Disease' THEN RETURN 'cpt_48';
    ELSIF diseasename = 'Glomerulonephritis' THEN RETURN 'cpt_49';
    ELSIF diseasename = 'Nephrotic Syndrome' THEN RETURN 'cpt_50';
    ELSIF diseasename = 'Diabetes' THEN RETURN 'cpt_51';
    ELSIF diseasename = 'Hypothyroidism' THEN RETURN 'cpt_52';
    ELSIF diseasename = 'Hyperthyroidism' THEN RETURN 'cpt_53';
    ELSIF diseasename = 'Cushing Syndrome' THEN RETURN 'cpt_54';
    ELSIF diseasename = 'Addison’s Diseas' THEN RETURN 'cpt_55';
    ELSIF diseasename = 'Cataracts' THEN RETURN 'cpt_56';
    ELSIF diseasename = 'Glaucoma' THEN RETURN 'cpt_57';
    ELSIF diseasename = 'Diabetic Retinopathy' THEN RETURN 'cpt_58';
    ELSIF diseasename = 'Age-Related Macular Degeneration' THEN RETURN 'cpt_59';
    ELSIF diseasename = 'Retinal Detachment' THEN RETURN 'cpt_60';
    ELSIF diseasename = 'Sinusitis' THEN RETURN 'cpt_61';
    ELSIF diseasename = 'Tinnitus' THEN RETURN 'cpt_62';
    ELSIF diseasename = 'Hearing loss' THEN RETURN 'cpt_63';
    ELSIF diseasename = 'Vertigo' THEN RETURN 'cpt_64';
    ELSIF diseasename = 'Sleep apnea' THEN RETURN 'cpt_65';
    ELSIF diseasename = 'Acne' THEN RETURN 'cpt_66';
    ELSIF diseasename = 'Eczema' THEN RETURN 'cpt_67';
    ELSIF diseasename = 'Psoriasis' THEN RETURN 'cpt_68';
    ELSIF diseasename = 'Skin cancer' THEN RETURN 'cpt_69';
    ELSIF diseasename = 'Rosacea' THEN RETURN 'cpt_70';
    ELSIF diseasename = 'Depression' THEN RETURN 'cpt_71';
    ELSIF diseasename = 'Anxiety disorders' THEN RETURN 'cpt_72';
    ELSIF diseasename = 'Bipolar disorder' THEN RETURN 'cpt_73';
    ELSIF diseasename = 'Schizophrenia' THEN RETURN 'cpt_74';
    ELSIF diseasename = 'ADHD' THEN RETURN 'cpt_75';
	ELSE RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;



-- ASSIGN 'Insurance Accepted' FOR BOTH PAY, INSURANCE ACCEPTED
UPDATE claim 
SET claimstatus = 'Insurance Accepted'
FROM insurancepayment 
WHERE insurancepayment.claimid = claim.claimid 
AND claim.paymentresponsibility = 'Both' 
AND insurancepayment.paymentstatus = 'Accepted'


UPDATE claim
SET claimstatus = 'Insurance Rejected'
FROM insurancepayment
WHERE insurancepayment.claimid = claim.claimid
AND claim.paymentresponsibility = 'Both'
AND insurancepayment.paymentstatus = 'Rejected'



-- ASSIGN '277 Finalized' FOR BOTH PAY, SELF ACCEPTED ELSE 'Insurance Accepted' if SELF REJECTED
UPDATE claim 
SET claimstatus = '277 Finalized'
FROM patientpayment
WHERE patientpayment.claimid = claim.claimid
AND claim.paymentresponsibility = 'Both'
AND patientpayment.paymentstatus = 'Accepted'
AND claimstatus = 'Insurance Accepted'








-- ASSIGN '277 Denied' FOR BOTH PAY, BOTH REJ
UPDATE claim
SET claimstatus = '277 Denied'
FROM patientpayment
WHERE patientpayment.claimid = claim.claimid
AND claim.paymentresponsibility = 'Both'
AND patientpayment.paymentstatus = 'Rejected'
AND claim.claimstatus = 'Insurance Rejected'



--Worksin entry

INSERT INTO worksin (hospitalid, doctorid)
SELECT 
	'h_' || random_between(1,20),
   'd_' || generate_series(1,50)

--Newly made codes for insertion in payments
-- 1)
UPDATE insurancepayment ip
SET paymentamount = claim.claimamt
FROM claim
WHERE ip.claimid = claim.claimid
AND claimstatus = '277 Finalized'
AND paymentresponsibility = 'Insurance Company'
AND paymentstatus = 'Accepted'


-- 2)
UPDATE patientpayment pp
SET paymentamount = claim.claimamt
FROM claim
WHERE pp.claimid = claim.claimid
AND claimstatus = '277 Finalized'
AND paymentresponsibility = 'Self'
AND paymentstatus = 'Accepted'


-- 3)
UPDATE insurancepayment ip
SET paymentamount = floor(0.7*claim.claimamt)
FROM claim
WHERE ip.claimid = claim.claimid
AND claimstatus = '277 Finalized'
AND paymentresponsibility = 'Both'
AND paymentstatus = 'Accepted'

UPDATE patientpayment pp
SET paymentamount = floor(0.3*claim.claimamt)
FROM claim
WHERE pp.claimid = claim.claimid
AND claimstatus = '277 Finalized'
AND paymentresponsibility = 'Both'
AND paymentstatus = 'Accepted'


-- 4)
UPDATE insurancepayment ip
SET paymentamount = floor(random_between(60,80) * claimamt / 100)
FROM claim
WHERE ip.claimid = claim.claimid
AND claimstatus = 'Insurance Accepted'
AND paymentresponsibility = 'Both'
AND paymentstatus = 'Accepted'



-- 5)
UPDATE patientpayment pp
SET paymentamount = floor(random_between(20,40) * claimamt / 100)
FROM claim
WHERE pp.claimid = claim.claimid
AND claimstatus = 'Insurance Rejected'
AND paymentresponsibility = 'Both'
AND paymentstatus = 'Accepted'

------------------------------------------------------- DONE -------------------------------------------------------



