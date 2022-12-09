
CREATE SCHEMA practica_dll AUTHORIZATION vrrhkmpe;



CREATE TABLE practica_dll.fleet (
	idfleet SERIAL PRIMARY KEY,
	model varchar(20) NOT NULL,
	brand varchar(40) NOT NULL,
	company varchar(100) NOT NULL
);

CREATE TABLE practica_dll.poliza (
	idpoliza SERIAL PRIMARY KEY,
	insuranceCompany VARCHAR(255),
	price INT NULL,
	currency VARCHAR(10) NOT NULL
);


CREATE TABLE practica_dll.car (
	idcar SERIAL PRIMARY KEY,
	idfleet integer NOT NULL REFERENCES practica_dll.fleet(idfleet) ON UPDATE CASCADE,
	idpoliza integer NOT NULL REFERENCES practica_dll.poliza(idpoliza) ON UPDATE CASCADE,
	license_plate varchar(10) NOT NULL,
	color varchar(50) NOT NULL,
	nkilometers integer NOT NULL,
	npolicy integer NOT NULL,
	acquisition date NULL DEFAULT '2022-12-10'::date,
	country varchar(100) NULL DEFAULT 'SPAIN'::character varying
);

CREATE TABLE practica_dll.inspection (
	idinspectiont SERIAL PRIMARY KEY,
	idcar integer NOT NULL,
	nkm integer NOT NULL,
	inspection_date date NOT NULL,
	imports integer NOT NULL,
	currency VARCHAR(10) NOT NULL,
	commentss varchar(250) NULL,
	CONSTRAINT inspection_fk FOREIGN KEY (idcar) REFERENCES practica_dll.car(idcar)
);

INSERT INTO	practica_dll.fleet (model, brand, company) VALUES ('A1', 'AUDI', 'PEPE SA');
INSERT INTO	practica_dll.fleet (model, brand, company) VALUES ('A2', 'AUDI', 'PEPE SA');
INSERT INTO	practica_dll.fleet (model, brand, company) VALUES ('A3', 'AUDI', 'PEPE SA');
INSERT INTO	practica_dll.fleet (model, brand, company) VALUES ('A4', 'AUDI', 'PEPE SA');
INSERT INTO	practica_dll.fleet (model, brand, company) VALUES ('TROC', 'VOLGSWAGEN', 'PINGU SA');

INSERT INTO	practica_dll.poliza (insuranceCompany, price, currency) VALUES ('PINGU', 700, 'EUR');
INSERT INTO	practica_dll.poliza (insuranceCompany, price, currency) VALUES ('GUSTAVO', 300, 'USD');
INSERT INTO	practica_dll.poliza (insuranceCompany, price, currency) VALUES ('KERMIT', 100000, 'JPAY' );
INSERT INTO	practica_dll.poliza (insuranceCompany, price, currency) VALUES ('LOID', 1,'USD ');

INSERT INTO	practica_dll.car (idfleet, idpoliza, license_plate, color, nkilometers, npolicy, acquisition, country) VALUES (1, 1, 'BBB0001','BLUE', 20000,1, '12-3-2015', 'SPAIN');
INSERT INTO	practica_dll.car (idfleet, idpoliza, license_plate, color, nkilometers, npolicy, acquisition, country) VALUES (2, 2, 'BTB0031','RED', 240000,2, '1-5-2005', 'SPAIN');
INSERT INTO	practica_dll.car (idfleet, idpoliza, license_plate, color, nkilometers, npolicy, acquisition, country) VALUES (4, 3, 'FBB5001','BLACK', 1000,3, '2-7-2022', 'SPAIN');
INSERT INTO	practica_dll.car (idfleet, idpoliza, license_plate, color, nkilometers, npolicy, acquisition, country) VALUES (5, 4, 'HBY0691','RED', 30000,4, '9-2-1999', 'PORTUGAL');

INSERT INTO	practica_dll.inspection (idcar, nkm, inspection_date, imports, currency) VALUES (1, 18000, '3-5-2022',400, 'EUR');
INSERT INTO	practica_dll.inspection (idcar, nkm, inspection_date, imports, currency) VALUES (1, 19000, '5-8-2022',200, 'EUR');
INSERT INTO	practica_dll.inspection(idcar, nkm, inspection_date, imports, currency, commentss) VALUES (3, 23300, '2-7-2016',30, 'USD', 'tot ok');
INSERT INTO	practica_dll.inspection (idcar, nkm, inspection_date, imports, currency) VALUES (2, 30000, '4-3-2008',999, 'USD');
INSERT INTO	practica_dll.inspection (idcar, nkm, inspection_date, imports, currency) VALUES (4, 2034834, '3-3-2000',9897, 'USD');


