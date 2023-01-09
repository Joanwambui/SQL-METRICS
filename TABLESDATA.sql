CREATE TABLE client
(
client_id int NOT NULL,
first_name varchar(50) DEFAULT NULL,
middle_name varchar(50) DEFAULT NULL,
last_name varchar(50) DEFAULT NULL,
date_of_birth date DEFAULT NULL
);


insert into client(client_id,first_name,middle_name,last_name,date_of_birth)VALUES
(33,'Susan','Mapenzi','Marigu','1974-06-11'),
(35,'Paul',NULL,'pogba','1993-03-15'),
(36,'Hafsa','Wangui','Munga','1987-05-07'),
(37,'Everlyne',NULL,'Mateng''e','1973-02-27'),
(38,'Barack',NULL,'Obama','1961-08-04'),
(39,'Prudence','Salim','Okeyo','1985-02-16'),
(40,'Rosemary','Pauline','Kinyua','1977-01-27'),
(42,'Elizabeth',NULL,'Mbaji','1975-10-03'),
(43,'Johny','Paul','Orengo','1971-07-29'),
(44,'Merceline','Lucy','Njenga','1982-04-21')


CREATE TABLE loan
(
loan_id int NOT NULL,
client_id int DEFAULT NULL,
vehicle_id int DEFAULT NULL,
principal_amount int DEFAULT NULL,
submitted_on_date date DEFAULT NULL
);

insert into loan(loan_id ,client_id,vehicle_id,principal_amount,submitted_on_date)VALUES
(75676,40784,24,106500,'2019-05-02'),
(75659,40760,26,108400,'2020-12-05'),
(75685,40807,27,101500,'2019-05-02'),
(75657,40796,28,271482,'2019-06-21'),
(75662,40803,29,114400,'2019-05-02'),
(75660,40737,30,95300,'2019-05-02'),
(75656,40815,31,78500,'2019-05-02'), 
(75666,40834,32,111800,'2019-05-02'),
(75658,40811,33,107050,'2019-05-02'), 
(75663,40840,34,101800,'2019-05-02')


CREATE TABLE vehicle
(
vehicle_id int DEFAULT NULL,
make varchar(50) DEFAULT NULL,
model_name varchar(50) DEFAULT NULL
);


insert into vehicle(vehicle_id,make,model_name)VALUES
(24,'Haojin','HJ 150CC-11A'),
(26,'Honda','Ace CB 125CC ES'),
(27,'TVS','HLX 125CC ES'),
(29,'TVS','HLX 150CC X' ),    
(30,'TVS','HLX 100CC KS'),
(31,'Haojin','HJ 125CC-A'),
(32,'Boxer','BM 150CC (4)'), 
(33,'Ferrari','Enzo 6000CC'),
(34,'Boxer','BM 150cc-2'),
(35,'Boxer','BM 150cc-3')