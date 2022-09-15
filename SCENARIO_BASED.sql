--CREATE DATABASE TEST_DB
--DROP TABLE air_passenger_profile 
CREATE TABLE air_passenger_profile(PROFILE_ID VARCHAR(10) PRIMARY KEY,
									PASSWORD VARCHAR(10),
									FIRST_NAME VARCHAR(10),
									LAST_NAME VARCHAR(10),
									ADDRESS VARCHAR(100),
									MOBILE_NUMBER BIGINT CONSTRAINT CHK_MOB_SIZE CHECK (MOBILE_NUMBER >= 1 AND MOBILE_NUMBER <=9999999999),
									EMAIL_ID VARCHAR(30)
									)

CREATE TABLE air_flight(
					FLIGHT_ID VARCHAR(10) PRIMARY KEY,
					AIRLINE_ID VARCHAR(10),
					AIRLINE_NAME VARCHAR(30),
					FROM_LOCATION VARCHAR(20),
					TO_LOCATION VARCHAR(20),
					DEPARTURE_TIME TIME,
					ARRIVAL_TIME TIME,
					DURATION TIME,
					TOTAL_SEATS INT
					)

CREATE TABLE air_flight_details(FLIGHT_ID VARCHAR(10) REFERENCES air_flight(FLIGHT_ID),
								FLIGHT_DEPARTURE_DATE DATE PRIMARY KEY,
								PRICE DECIMAL(8,2),
								AVAILABLE_SEATS INT
								)

CREATE TABLE air_ticket_info(TICKET_ID VARCHAR(10) PRIMARY KEY,
							PROFILE_ID VARCHAR(10) REFERENCES air_passenger_profile(PROFILE_ID),
							FLIGHT_ID VARCHAR(10) REFERENCES air_flight(FLIGHT_ID),
							FLIGHT_DEPARTURE_DATE DATE REFERENCES air_flight_details(FLIGHT_DEPARTURE_DATE),
							STATUS VARCHAR(10)
							)

CREATE TABLE air_credit_card_details(PROFILE_ID VARCHAR(10) REFERENCES air_passenger_profile(PROFILE_ID),
									CARD_NUMBER BIGINT CONSTRAINT CHK_CARD_SIZE CHECK (CARD_NUMBER >= 1 AND CARD_NUMBER <=9999999999999999),
									CARD_TYPE VARCHAR(10),
									EXPIRATION_MONTH INT CONSTRAINT CHKM_SIZE CHECK (EXPIRATION_MONTH >= 1 AND EXPIRATION_MONTH <=12),
									EXPIRATION_YEAR INT CONSTRAINT CHKY_SIZE CHECK (EXPIRATION_YEAR >= 1 AND EXPIRATION_YEAR <=9999)
									)

INSERT INTO air_passenger_profile VALUES ('PFL001','QWE', 'LATHA','SANKAR','123 BROAD CROSS ST, CHENNAI-48',9876543210,'LATHA@GMAIL.COM'),
										('PFL002','WER', 'ARUN','ROY','645 SPRING ROAD, HYDERABAD-75',8094564243,'ARUN@GMAIL.COM'),
										('PFL003','ERT', 'AMIT','KOCHI','123 7TH STREET, CHENNAI-49',9845763201,'AMIT@GMAIL.COM'),
										('PFL004','RTY', 'AARTHI','RAMESH','343 6TH STREET, HYDERABAD-76',9595652530,'AARTHI@GMAIL.COM'),
										('PFL005','TYU', 'SIVA','KUMAR','125 8TH STREET, CHENNAI-46',9884416986,'SIVA@GMAIL.COM'),
										('PFL006','YUI', 'RAMESH','KOCHI','111 ABC ROAD, HYDERABAD-76',9432198760,'RAMESH@GMAIL.COM'),
										('PFL007','UIO', 'GAYATHRI','SHINDE','',8073245678,'GAYATHRI@GMAIL.COM'),
										('PFL008','IOP', 'GANESH','SHARMA','45 3RD ST, HYDERABAD-24',9375237890,'GANESH@GMAIL.COM'),
										('PFL009','ASD', 'RAM','PATEL','119 2ND CROSS ST, ERNAKULAM-12',9374667890,'RAM@GMAIL.COM')

SELECT * FROM air_passenger_profile

UPDATE air_passenger_profile
SET ADDRESS = '22 3RD ST, CHENNAI-33'
WHERE PROFILE_ID = 'PFL007'


INSERT INTO air_flight VALUES (1011,'A1','ABC','HYDERABAD','CHENNAI','12:30:00','12:30:00','01:00:00',55),
							(1262,'A2','DEF','HYDERABAD','CHENNAI','06:00:00','07:00:00','01:00:00',55),
							(1265,'A1','ABC','CHENNAI','HYDERABAD','21:25:00','22:30:00','01:05:00',55),
							(289,'A4','JKL','CHENNAI','KOCHI','08:40:00','09:50:00','01:10:00',50),
							(3004,'A3','GHI','BENGALURU','CHENNAI','09:05:00','10:05:00','01:00:00',40),
							(3013,'A3','GHI','CHENNAI','BENGALURU','07:40:00','08:45:00','01:05:00',40),
							(3148,'A2','DEF','CHENNAI','BENGALURU','20:15:00','21:20:00','01:05:00',40),
							(3241,'A4','JKL','CHENNAI','KOCHI','10:40:00','20:50:00','01:10:00',50),
							(3244,'A1','ABC','KOCHI','CHENNAI','21:10:00','22:20:00','01:10:00',50),
							(3307,'A2','DEF','BENGALURU','CHENNAI','18:45:00','19:45:00','01:00:00',40),
							(916,'A3','GHI','CHENNAI','HYDERABAD','19:55:00','21:00:00','01:05:00',55)

SELECT * FROM air_flight
						
INSERT INTO air_flight_details VALUES (1011,'2013-05-09',4614.00,2),
									(1011,'2013-04-30',4614.00,4),
									(1011,'2013-05-22',4614.00,7),
									(1262,'2013-05-20',4086,3),
									(1262,'2013-05-29',4086,1),
									(1265,'2013-04-29',4086,1),
									(1265,'2013-05-14',4086,2),
									(1265,'2013-05-18',4086,3),
									(1265,'2013-05-19',4086,4),
									(289,'2013-05-06',4430,4),
									(289,'2013-05-08',4430,3),
									(289,'2013-05-27',4430,6),
									(289,'2013-05-31',4430,1),
									(3004,'2013-05-02',4980,2),
									(3004,'2013-05-01',4980,5),
									(3004,'2013-05-24',4980,3),
									(3148,'2013-05-03',5113,3),
									(3148,'2013-05-21',5113,7),
									(3244,'2013-05-13',5021,5),
									(916,'2013-05-16',4086,3)
SELECT * FROM air_flight_details

INSERT INTO air_ticket_info VALUES ('TKT01','PFL001','1011','2013-05-09','BOOKED'),
									('TKT02','PFL006','289','2013-05-08','BOOKED'),
									('TKT03','PFL002','3244','2013-05-13','BOOKED'),
									('TKT04','PFL007','1262','2013-05-20','BOOKED'),
									('TKT05','PFL009','916','2013-05-16','BOOKED'),
									('TKT06','PFL001','1265','2013-04-29','BOOKED')

SELECT * FROM air_ticket_info


INSERT INTO air_credit_card_details VALUES ('PFL002',1122334455667788,'GOLD',3,2015),
											('PFL006',9988776655332211,'GOLD',6,2014),
											('PFL008',1230984756982347,'GOLD',4,2016),
											('PFL001',6354648366348586,'INSTANT',10,2016),
											('PFL007',6473822922999999,'INSTANT',11,2015),
											('PFL006',9988776655332211,'PLATINUM',9,2015),
											('PFL004',7382382929292274,'PLATINUM',2,2014)

SELECT * FROM air_credit_card_details


--1
SELECT A.FLIGHT_ID,A.FROM_LOCATION,A.TO_LOCATION,B.MONTH_NAME,B.AVG_PRICE
FROM air_flight A,
(SELECT FLIGHT_ID,MONTH(FLIGHT_DEPARTURE_DATE) AS MONTH_NAME, AVG(PRICE) AS AVG_PRICE 
	FROM air_flight_details 
	GROUP BY FLIGHT_ID,MONTH(FLIGHT_DEPARTURE_DATE)) B
WHERE A.FLIGHT_ID = B.FLIGHT_ID AND A.AIRLINE_NAME='ABC'
ORDER BY A.FLIGHT_ID,B.MONTH_NAME

--2
SELECT A.PROFILE_ID,A.FIRST_NAME,A.ADDRESS,M.NO_OF_TICKETS 
FROM air_passenger_profile A,
(SELECT MIN(S.TOTAL) AS NO_OF_TICKETS 
	FROM(SELECT PROFILE_ID,COUNT(TICKET_ID) AS TOTAL 
		FROM air_ticket_info GROUP BY PROFILE_ID)S )M,
(SELECT PROFILE_ID,COUNT(TICKET_ID) AS TOTAL FROM air_ticket_info GROUP BY PROFILE_ID) T
WHERE M.NO_OF_TICKETS=T.TOTAL AND A.PROFILE_ID=T.PROFILE_ID
ORDER BY A.FIRST_NAME

--3
SELECT F.FROM_LOCATION,F.TO_LOCATION,S.MONTH_NAME ,SUM(S.NO_OF_SERVICES) AS 'NO_OF SERVICES' 
FROM air_flight F JOIN
	(SELECT FLIGHT_ID,MONTH(FLIGHT_DEPARTURE_DATE) AS MONTH_NAME,COUNT(FLIGHT_DEPARTURE_DATE) AS NO_OF_SERVICES
		FROM air_flight_details
		GROUP BY FLIGHT_ID,MONTH(FLIGHT_DEPARTURE_DATE ))S
ON S.FLIGHT_ID=F.FLIGHT_ID 
GROUP BY F.FROM_LOCATION,F.TO_LOCATION,S.MONTH_NAME
ORDER BY F.FROM_LOCATION,F.TO_LOCATION,S.MONTH_NAME



--4
SELECT C.PROFILE_ID,C.FIRST_NAME,C.ADDRESS,M.NO_OF_TICKETS 
FROM air_passenger_profile C,
	(SELECT MAX(S.TOTAL) AS NO_OF_TICKETS 
	FROM(SELECT PROFILE_ID,COUNT(TICKET_ID) AS TOTAL FROM air_ticket_info GROUP BY PROFILE_ID)S
	)M,
	(SELECT PROFILE_ID,COUNT(TICKET_ID) AS TOTAL FROM air_ticket_info GROUP BY PROFILE_ID
	)T
WHERE M.NO_OF_TICKETS=T.TOTAL AND C.PROFILE_ID=T.PROFILE_ID
ORDER BY C.FIRST_NAME

--5
SELECT * FROM air_flight
SELECT * FROM air_ticket_info
SELECT P.PROFILE_ID,P.FIRST_NAME,P.LAST_NAME,T.FLIGHT_ID,T.FLIGHT_DEPARTURE_DATE,T.NO_OF_TICKETS
FROM 
air_passenger_profile P JOIN
	(SELECT PROFILE_ID,FLIGHT_ID,FLIGHT_DEPARTURE_DATE,COUNT(TICKET_ID) AS NO_OF_TICKETS
	FROM air_ticket_info 
	WHERE FLIGHT_ID IN
		(SELECT FLIGHT_ID FROM air_flight WHERE FROM_LOCATION='CHENNAI' AND TO_LOCATION='HYDERABAD')
	GROUP BY PROFILE_ID,FLIGHT_ID,FLIGHT_DEPARTURE_DATE)T
ON P.PROFILE_ID=T.PROFILE_ID
ORDER BY P.PROFILE_ID,T.FLIGHT_ID,T.FLIGHT_DEPARTURE_DATE

--6 
SELECT FD.FLIGHT_ID,F.FROM_LOCATION,F.TO_LOCATION, FD.PRICE 
FROM 
air_flight_details FD JOIN air_flight F 
ON F.FLIGHT_ID=FD.FLIGHT_ID
WHERE MONTH(FLIGHT_DEPARTURE_DATE)=04 
ORDER BY FD.FLIGHT_ID,F.FROM_LOCATION

--7
SELECT F.FLIGHT_ID,F.FROM_LOCATION,F.TO_LOCATION ,AVG(FD.PRICE) AS 'AVERAGE PRICE' 
FROM 
air_flight F JOIN air_flight_details FD 
ON F.FLIGHT_ID=FD.FLIGHT_ID
GROUP BY F.FLIGHT_ID,F.FROM_LOCATION,F.TO_LOCATION

--8
SELECT DISTINCT P.PROFILE_ID,CONCAT(P.FIRST_NAME,',',P.LAST_NAME) AS CUSTOMER_NAME,P.ADDRESS
FROM air_passenger_profile P JOIN air_ticket_info T 
ON
	P.PROFILE_ID=T.PROFILE_ID JOIN air_flight F
	ON
	F.FLIGHT_ID=T.FLIGHT_ID 
	AND F.FROM_LOCATION ='CHENNAI' 
	AND F.TO_LOCATION ='HYDERABAD'
ORDER BY P.PROFILE_ID

--9
SELECT PROFILE_ID FROM air_ticket_info GROUP BY PROFILE_ID 
HAVING COUNT(PROFILE_ID)>= ALL
(SELECT COUNT(PROFILE_ID) FROM air_ticket_info GROUP BY PROFILE_ID)
ORDER BY PROFILE_ID

--10
SELECT F.FLIGHT_ID,F.FROM_LOCATION,F.TO_LOCATION,COUNT(T.TICKET_ID) AS NO_OF_TICKETS
FROM air_flight F 
JOIN air_ticket_info T
ON F.FLIGHT_ID=T.FLIGHT_ID
WHERE F.AIRLINE_NAME='ABC'
GROUP BY F.FLIGHT_ID,F.FROM_LOCATION,F.TO_LOCATION HAVING COUNT(T.TICKET_ID)>=1
ORDER BY FLIGHT_ID


--11
SELECT a.FLIGHT_ID,COUNT(a.FLIGHT_DEPARTURE_DATE) AS NO_OF_SERVICES,SUM(b.PRICE) as TOTAL_PRICE FROM air_ticket_info a JOIN air_flight_details b 
ON a.FLIGHT_ID = b.FLIGHT_ID GROUP BY a.FLIGHT_ID ORDER BY TOTAL_PRICE DESC,a.FLIGHT_ID DESC;

--12
SELECT FLIGHT_ID,FLIGHT_DEPARTURE_DATE,COUNT(TICKET_ID) AS NO_OF_PASSENGERS FROM air_ticket_info
GROUP BY FLIGHT_ID,FLIGHT_DEPARTURE_DATE ORDER BY FLIGHT_ID,FLIGHT_DEPARTURE_DATE;

--13
SELECT PROFILE_ID FROM air_ticket_info GROUP BY PROFILE_ID HAVING COUNT(TICKET_ID) = (
	SELECT MIN(C) FROM ( SELECT COUNT(TICKET_ID) AS C FROM air_ticket_info GROUP BY PROFILE_ID) t) 
ORDER BY PROFILE_ID;

--14
SELECT * FROM air_flight
SELECT DISTINCT a.PROFILE_ID,a.FIRST_NAME,a.MOBILE_NUMBER,a.EMAIL_ID FROM air_passenger_profile a JOIN air_ticket_info b 
ON a.PROFILE_ID = b.PROFILE_ID JOIN air_flight c ON b.FLIGHT_ID = c.FLIGHT_ID
WHERE c.FROM_LOCATION='Hyderabad' and c.TO_LOCATION='Chennai' ORDER BY a.PROFILE_ID;

--15



--16
SELECT * FROM air_passenger_profile
SELECT a.PROFILE_ID,a.FIRST_NAME,a.ADDRESS AS BASE_LOCATION,COUNT(b.TICKET_ID) AS NO_OF_TICEKTS
FROM air_passenger_profile a JOIN air_ticket_info b ON a.PROFILE_ID = b.PROFILE_ID 
WHERE a.ADDRESS LIKE '%KOCHI' GROUP BY a.PROFILE_ID,A.FIRST_NAME,A.ADDRESS ORDER BY a.FIRST_NAME;

--17
SELECT a.FLIGHT_ID,a.FROM_LOCATION,a.TO_LOCATION,COUNT(b.FLIGHT_DEPARTURE_DATE) AS NO_OF_SERVICES 
FROM air_flight a JOIN air_flight_details b ON a.FLIGHT_ID = b.FLIGHT_ID
WHERE MONTH(B.FLIGHT_DEPARTURE_DATE)=5 GROUP BY a.FLIGHT_ID,a.FROM_LOCATION,a.TO_LOCATION ORDER BY FLIGHT_ID;

--18a
SELECT PROFILE_ID,LAST_NAME,MOBILE_NUMBER,EMAIL_ID FROM air_passenger_profile WHERE ADDRESS LIKE '%Chennai%' ORDER BY PROFILE_ID;

--18b
SELECT COUNT(FLIGHT_ID) AS FLIGHT_COUNT FROM air_flight WHERE DEPARTURE_TIME BETWEEN '06:00:00' AND '18:00:00' AND FROM_LOCATION='Chennai';

--19
SELECT * FROM air_passenger_profile
SELECT * FROM air_ticket_info
SELECT DISTINCT a.PROFILE_ID,a.FIRST_NAME,a.EMAIL_ID,a.MOBILE_NUMBER FROM air_passenger_profile a join air_ticket_info b ON a.PROFILE_ID = b.PROFILE_ID
WHERE b.FLIGHT_ID='3148' ORDER BY a.FIRST_NAME;

--20
SELECT DISTINCT FLIGHT_ID,FROM_LOCATION,TO_LOCATION,DEPARTURE_TIME,
CASE WHEN DEPARTURE_TIME BETWEEN '05:00:01.0000000' AND '12:00:00.0000000' THEN 'Morning'
	 WHEN DEPARTURE_TIME BETWEEN '12:00:01.0000000' AND '18:00:00.0000000' THEN 'Afternoon'
	 WHEN DEPARTURE_TIME BETWEEN '18:00:01.0000000' AND '23:59:59.0000000' THEN 'Evening'
	 WHEN DEPARTURE_TIME BETWEEN '00:00:01.0000000' AND '05:00:00.0000000' THEN 'Night' 
	 ELSE 'NONE' end 'TIME_OF_SERVICE'
FROM air_flight ORDER BY FLIGHT_ID;


--21
SELECT FLIGHT_ID , FLIGHT_DEPARTURE_DATE, CASE WHEN PRICE < 3000 THEN 'AIR PASSENGER'
												WHEN PRICE > 3000 AND PRICE < 4000 THEN 'AIR BUS'
												WHEN PRICE > 4000 THEN 'EXECUTIVE PASSENGER'
												ELSE 'NONE'
												END AS 'FLIGHT TYPE'
												FROM air_flight_details
												GROUP BY FLIGHT_ID, FLIGHT_DEPARTURE_DATE, PRICE
												ORDER BY FLIGHT_ID, FLIGHT_DEPARTURE_DATE


--22
SELECT * FROM air_credit_card_details
SELECT CARD_TYPE ,COUNT(CARD_TYPE) AS 'CARD_COUNT' FROM air_credit_card_details GROUP BY CARD_TYPE 

--23
SELECT SUBSTRING(PROFILE_ID, 4,6) AS 'SERIAL_NO' ,FIRST_NAME, MOBILE_NUMBER,EMAIL_ID FROM air_passenger_profile 
WHERE EMAIL_ID LIKE ('%GMAIL.COM%') ORDER BY FIRST_NAME 


--24(INCOMPLETE)



--25
SELECT FROM_LOCATION, COUNT(FROM_LOCATION) AS 'NO_OF_FLIGHTS' FROM air_flight GROUP BY FROM_LOCATION


--26
SELECT A.FLIGHT_ID, B.FROM_LOCATION, B.TO_LOCATION, A.FLIGHT_DEPARTURE_DATE, COUNT(TICKET_ID) AS 'NO_OF_PASSENGERS' 
FROM air_ticket_info A JOIN air_flight B
ON A.FLIGHT_ID = B.FLIGHT_ID 
WHERE STATUS = 'BOOKED'
GROUP BY A.FLIGHT_ID, A.FLIGHT_DEPARTURE_DATE, B.FROM_LOCATION, B.TO_LOCATION


--27
SELECT B.FLIGHT_ID, B.FROM_LOCATION, B.TO_LOCATION, B.TOTAL_SEATS, (B.TOTAL_SEATS - A.AVAILABLE_SEATS) AS 'NO_OF_SEATS_BOOKED' 
FROM air_flight_details A JOIN air_flight B 
ON A.FLIGHT_ID = B.FLIGHT_ID 
WHERE A.AVAILABLE_SEATS < 1.0*B.TOTAL_SEATS

--28
SELECT * FROM air_flight
SELECT A.FLIGHT_ID, B.FLIGHT_DEPARTURE_DATE, A.FROM_LOCATION, A.TO_LOCATION, A.DURATION 
FROM air_flight A JOIN air_flight_details B 
ON A.FLIGHT_ID = B.FLIGHT_ID AND A.DURATION < '01:10:00' 
ORDER BY B.FLIGHT_ID ASC
--GROUP BY A.FLIGHT_ID, B.FLIGHT_DEPARTURE_DATE, A.FROM_LOCATION

--29 (nc)
SELECT * FROM air_flight_details
SELECT * FROM air_flight
SELECT B.FLIGHT_ID, A.FROM_LOCATION,A.TO_LOCATION,COUNT(FLIGHT_DEPARTURE_DATE) AS NO_OF_SERIES, PRICE AS AVERAGE_PRICE FROM air_flight A, air_flight_details B
	WHERE AVG(PRICE) > ALL(SELECT AVG(PRICE) FROM air_flight_details GROUP BY FLIGHT_ID)
--OR	
SELECT A.FLIGHT_ID, A.FROM_LOCATION, A.TO_LOCATION, COUNT(B.FLIGHT_DEPARTURE_DATE) AS NO_OF_SERIES, AVG(PRICE) AS AVERAGE_PRICE
FROM air_flight A JOIN
	(SELECT FLIGHT_ID, AVG(PRICE) AS AVG_P,PRICE,FLIGHT_DEPARTURE_DATE FROM air_flight_details GROUP BY FLIGHT_ID HAVING AVG(PRICE)) B
ON A.FLIGHT_ID = B.FLIGHT_ID
ORDER BY AVERAGE_PRICE
