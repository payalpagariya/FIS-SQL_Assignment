create database TRAINING

create table DEPT
(
	deptno int primary key, 
	dname varchar(30),
	loc varchar(40)
)
DROP TABLE EMP
create table EMP
(
	empno int primary key,
	ename varchar(30),
	job varchar(30),
	age int,
	mgr_id int,
	hiredate date not null,
	sal float not null,
	comm int,
	deptno int references DEPT(deptno)
)

insert into DEPT values(10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON')
SELECT * FROM DEPT

ALTER TABLE EMP
DROP COLUMN age


INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20)
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30)
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7566,'JONES','MANAGER',7839,'02-APR-81',2975,20)
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,30)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,10)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,20)
INSERT INTO EMP(empno,ename,job,hiredate,sal,deptno) VALUES
(7839,'KING','PRESIDENT','17-NOV-81',5000,10)
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,20)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7900,'JAMES','CLERK',7698,'03-DEC-81',950,20)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno) VALUES
(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,20)
INSERT INTO EMP(empno,ename,job,mgr_id,hiredate,sal,deptno)  VALUES
(7934,'MILLER','CLERK',7782,'23-JAN-82',1300,10)

UPDATE EMP
SET deptno = 30
WHERE ENAME = 'JAMES'

SELECT * FROM EMP

----ASSIGNMENTS----
--1.LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH 'A'  --
SELECT * FROM EMP WHERE ename LIKE 'A%'

--2.LIST OF EMPLOYEES WHO DON'T HAVE MANAGER--
SELECT * FROM EMP WHERE mgr_id IS NULL

--3.LIST EMPLOYEE NAME, NUMBER AND SALARY FOR THOSE WHO EARN IN THE RANGE 1200 TO 1400.--
SELECT ename,empno,sal FROM EMP WHERE SAL > 1200 AND SAL < 1400

--4.GIVE ALL THE EMPLOYEE IN THE RESEARCH DEPARTMENT A 10% PAY RISE. --
--	VERIFY THAT THIS HAS BEEN DONE BY LISTING ALL THEIR DETAILS BEFRE AND AFTER THE RISE.--
SELECT SAL AS 'CURRENT SALARY', (SAL + 0.1*SAL) AS 'RAISED SALARY' FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH') 

--5.FIND THE NUMBER OF CLERKS EMPLOYED. GIVE IT A DESCRIPTIVE HEADING.--
SELECT COUNT(JOB) AS 'NO. OF CLERKS EMPLOYED' FROM EMP WHERE JOB = 'CLERK'

--6.FIND THE AVERAGE SALARY FOR EACH JOB TYPE AND THE NUMBER OF PEOPLE EMPLOYED IN EACH JOB.--
SELECT JOB, AVG(SAL) AS 'AVERAGE SALARY', COUNT(EMPNO) AS 'COUNT' FROM EMP GROUP BY JOB 

--7.LIST THE EMPLOYEES WITH THE LOWEST AND HIGHEST SALARY.--
--SELECT ENAME,SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP )
--SELECT ENAME,SAL FROM EMP WHERE SAL = (SELECT ENAME,MIN(SAL) FROM EMP)
SELECT ENAME,SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP) OR SAL =  (SELECT SAL = MIN(SAL) FROM EMP)

--8.LIST FULL DETAILS OF DEPARTMENTS THAT DON'T HAVE ANY EMPLOYEES.--
SELECT * FROM DEPT WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP)

--9.GET THE NAMES AND SALARIES OF ALL THE ANALYSTS EARNING MORE THAN 1200 WHO ARE BASED IN DEPARTMENT 20. SORT THE ANSWER BY ASCENDING ORDER OF NAME.--
SELECT ENAME,SAL FROM EMP WHERE JOB = 'ANALYST' AND SAL > 1200 AND DEPTNO = 20 ORDER BY ENAME ASC

--10.FOR EACH DEPARTMENT, LIST ITS NAME AND NUMBER TOGETHER WITH THE TOTAL SALARY PAID TO EMPLOYEE IN THAT DEPARTMENT.--
SELECT DISTINCT SUM(E.SAL) AS 'TOTAL SALARY', E.deptno, D.dname FROM EMP E, DEPT D GROUP BY e.DEPTNO, D.dname 

--11.FIND OUT SALARY OF BOTH MILLER AND SMITH.--
SELECT ENAME, SAL FROM EMP WHERE ENAME = 'MILLER' OR ENAME = 'SMITH'

--12.FIND OUT THE NAMES OF THE EMPLOYEES WHOSE NAME BEGIN WITH 'A' OR 'M'--
SELECT ENAME FROM EMP WHERE ENAME LIKE '[AM]%'

--13.COMPUTE YEARLY SALARY OF SMITH.--
SELECT SAL*365 FROM EMP WHERE ENAME = 'SMITH'

--14.LIST THE NAME AND SALARY FOR ALL EMPLOYEES WHOSE SALARY IS NOT IN THE RANGE OF 1500 AND 2850.--
SELECT ENAME, SAL FROM EMP WHERE SAL < 1500 OR SAL > 2850  
