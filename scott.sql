-- SQL 쿼리문은 대소문자를 구별하지 않음
-- 단, 비밀번호는 구별함

-- DML : 데이터 조작어 (CRUD : CREAT, READ, UPDATE, DELETE)

-- SELECT 컬럼명 --------- 5
-- FROM 테이블명 ---------- 1
-- WHERE 조건절 ---------- 2
-- GROUP BY 컬럼명 ------- 3
-- HAVING 집계함수 조건절 -- 4
-- ORDER BY 컬럼명... ---- 6


-- EMP(EMPLOYEE - 사원 테이블)
-- DEPT(DEPARTMENT - 부서 테이블)
-- SALGRADE (급여 테이블)

-- 전체 조회
SELECT * FROM EMP e;

-- 컬럼 지정 선택 조회
SELECT EMPNO, ENAME, MGR FROM EMP e;

-- 중복 조회 : DISTINCT
SELECT DISTINCT DEPTNO 
FROM EMP e ;

-- 별칭
SELECT EMPNO AS "사원번호"
FROM EMP e ;

SELECT EMPNO "사원번호"
FROM EMP e ;

SELECT EMPNO AS 사원번호
FROM EMP e ;

--

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+COMM AS "연봉"
FROM EMP e ;

-- 조회 후 정렬(오름차순 - ASC, 내림차순 - DESC)
-- 오름차순 ASC는 생략 가능

-- SAL 내림차순
SELECT ENAME, SAL 
FROM EMP e 
ORDER BY SAL DESC;

-- SAL 오름차순
SELECT ENAME, SAL 
FROM EMP e 
ORDER BY SAL ASC;

-- EMPNO 내림차순
SELECT *
FROM EMP e 
ORDER BY EMPNO DESC;

-- DEPTNO 오름차순, SAL 내림차순
SELECT *
FROM EMP e
ORDER BY DEPTNO ASC, SAL DESC;

-- 실습 문제
SELECT
	EMPNO "EMPLOYEE_NO",
	ENAME "EMPLOYEE_NAME",
	MGR "MANABER",
	SAL "SALARY",
	COMM "COMMISSION",
	DEPTNO "DEPARTMENT_NO"
FROM
	EMP e
ORDER BY
	DEPTNO DESC,
	ENAME ASC;
	
-- 조건 지정 선택 조회
-- SELECT... FROM... WHERE

-- 부서번호가 30번인 사원 전체 조회
SELECT *
FROM EMP e 
WHERE DEPTNO = 30;

-- 사원번호가 7839인 사원 조회
SELECT *
FROM EMP e 
WHERE EMPNO = 7839;

-- 부서 번호가 30이고 직책이 SALESMAN인 사원
-- SQL에서 문자열은 따옴표('')만 사용
SELECT *
FROM EMP e 
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- 사원번호가 7698이고 부서번호가 30인 사원 조회
SELECT *
FROM EMP e 
WHERE EMPNO = 7698
AND DEPTNO = 30;

-- 부서번호가 30이거나 직책이 CLERK인 사원 조회
SELECT *
FROM EMP e 
WHERE DEPTNO = 30
OR JOB = 'CLERK';

-- 연봉이 36000인 사원 조회
SELECT *
FROM EMP e 
WHERE SAL*12 = 36000;

-- 급여가 3000보다 큰 사원 조회
SELECT *
FROM EMP e 
WHERE SAL > 3000;

-- 급여가 3000이상인 사원 조회
SELECT *
FROM EMP e 
WHERE SAL >= 3000;

-- ENAME이 F이후 문자열로 시작하는 사원 조회
SELECT *
FROM EMP e
WHERE e.ENAME >= 'F';

-- 급여 2500이상이고 직업이 ANALYST인 사원 조회
SELECT *
FROM EMP e 
WHERE SAL>=2500
AND JOB = 'ANALYST';

-- JOB이 MANAGER, SALESMAN, CLERK인 사원 조회
SELECT *
FROM EMP e 
WHERE JOB = 'MANAGER'
OR JOB ='SALESMAN'
OR JOB = 'CLERK';

-- SAL이 3000이 아닌 사원 조회
SELECT *
FROM EMP e 
WHERE SAL != 3000;

SELECT *
FROM EMP e 
WHERE SAL <> 3000;

SELECT *
FROM EMP e 
WHERE SAL ^= 3000;

-- IN
-- JOB이 MANAGER, SALESMAN, CLERK인 사원 조회
SELECT *
FROM EMP e 
WHERE JOB 
IN ('MANAGER', 'SALESMAN', 'CLERK');

-- JOB이 MANAGER, SALESMAN, CLERK가 아닌 사원 조회
SELECT *
FROM EMP e 
WHERE JOB != 'MANAGER'
AND JOB <> 'SALESMAN'
AND JOB ^= 'CLERK';

--IN
SELECT *
FROM EMP e 
WHERE JOB 
NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 부서번호가 10번이거나 20번인 사원 조회
SELECT *
FROM EMP e 
WHERE DEPTNO = 10
OR DEPTNO = 20;

-- BETWEEN A AND B : 일정 범위 내의 데이터 조회
-- 급여가 2000이상이고 3000이하 직원 조회
SELECT *
FROM EMP e 
WHERE SAL BETWEEN 2000 AND 3000;

-- NOT BETWEEN A AND B : 일정 범위 외의 데이터 조회
-- 급여 2000이상 3000이하가 아닌 직원 조회
SELECT *
FROM EMP e 
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드(%, _)
-- ENAME = 'JONES' : 전체 일치
-- ENAME에 J또는 A가 들어간... : 부분일치 LIKE사용

-- J% :  J로 시작하면 그 뒤에 어떤 문자가 몇개가 오던지 상관없음
SELECT *
FROM EMP e 
WHERE ENAME LIKE 'J%';

-- _L% : 첫 시작 문자 하나는 상관없으나(_) /두번째 문자는 (L)/ 그 뒤는 상관없음(%)
SELECT *
FROM EMP e 
WHERE ENAME LIKE '_L%';

-- 사원명에 AM 문자가 포함된 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE '%AM%';

-- 사원명에 AM 문자를 포함하지 않는 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME NOT LIKE '%AM%';

-- IS NULL
-- SELECT * FROM EMP WHERE COMM = NULL; X
SELECT *
FROM EMP e 
WHERE COMM IS NULL;

SELECT *
FROM EMP e 
WHERE COMM IS NOT NULL;

-- 집합 연산자
-- UNION : 합집합(결과 값의 중복 제거)
-- UNION ALL : 합집합(중복)
-- MINUS : 차집합
-- INTERSECT : 교집합

-- UNION
-- 부서번호가 10번인 사원 조회(사번, 이름, 급여, 부서번호)
-- 부서번호가 20번인 사원 조회(사번, 이름, 급여) => 컬럼이 동일해야함

SELECT EMPNO , ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10
UNION 
SELECT EMPNO , ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 20;


--------------------------------
-- 함수
--  1. 오라클 함수
--  2. 사용자 정의 함수

--------------------------------
-- 오라클 내장 함수
--  1. 단일행 함수 : 데이터가 한 행씩 입력되고 입력된 한 행당 결과가 하나씩 나오는 함수
--  2. 다중행 함수 : 여러 행이 입력되고 결과가 하나의 행으로 반환되는 함수

-- 문자 함수
-- UPPER(문자열) : 괄호 안 문자열을 모두 대문자로
-- LOWER(문자열) : 괄호 안 문자열을 모두 소문자로
-- INITCAP(문자열) : 괄호 안 문자 데이터 중 첫 문자만 대문자, 나머지는 소문자로
-- LENGTH(문자열) : 문자열 길이
-- LENGTHB(문자열) : 문자열 바이트 수
-- SUBSTR(문자열, 시작위치) / SUBSTR(문자열, 시작위치, 추출길이) : 문자열 일부 추출
-- INSTR(문자열, 찾으려는 문자) : 특정 문자나 문자열이 어디에 포함되어 있는지
-- INSTR(문자열, 찾으려는 문자, 대상 문자열 시작 위치, 시작 위치에서 찾으려는 문자가 몇번째인지)
-- REPLACE(문자열, 찾는문자, 대체문자)
-- CONCAT(문자열1, 문자열2) : 문자열 연결
-- TRIM / LTRIM / RTRIM : 특정 문자를 제거(주로 공백 제거 사용)

-- 데이터는 대소문자 구분함
SELECT ENAME , UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) 
FROM EMP e ;

SELECT *
FROM EMP e 
WHERE UPPER(ENAME) = UPPER('smith');

SELECT *
FROM EMP e 
WHERE UPPER(ENAME) LIKE UPPER('%smith%');


-- LENGTH, LENGTHB
-- DUAL : 오라클에서 제공하는 기본 테이블(함수 적용 결과 보기)
SELECT LENGTH ('한글'), LENGTHB('한글'), LENGTH ('AB'), LENGTHB('AB')
FROM DUAL;

-- SUBSTR
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5) 
FROM EMP e ;

-- INSTR
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
	INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;

-- 사원 이름에 S가 있는 행 구하기
	-- LIKE
SELECT *
FROM EMP e 
WHERE ENAME LIKE '%S%';

	-- INSTR
SELECT *
FROM EMP e 
WHERE INSTR(ENAME, 'S') > 0;

-- REPLACE
SELECT '010-1234-5678' AS "변경전",
REPLACE('010-1234-5678', '-', ' ') AS "공백",
REPLACE('010-1234-5678', '-') AS "- 제거"
FROM DUAL;

-- EMPNO, ENAME 연결 조회
-- 2개씩 밖에 연결 못하기 때문에 여러개 연결하기 위해서는 CONCAT안에 CONCAT사용
SELECT CONCAT(EMPNO, ENAME) 
FROM EMP e 

--   || == CONCAT
SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
FROM EMP e;

SELECT '[' || TRIM(' _ORACLE_ ') || ']' AS "TRIM",
		'[' || LTRIM(' _ORACLE_ ') || ']' AS "LTRIM",
		'[' || LTRIM('<_ORACLE_>', '_<') || ']' AS "LTRIM2",
		'[' || RTRIM(' _ORACLE_ ') || ']' AS "RTRIM",
		'[' || RTRIM('<_ORACLE_>', '>_') || ']' AS "RTRIM2"
FROM DUAL;


----------------------------------
-- 숫자함수
-- ROUND(숫자, 반올림 위치)
-- TRUNC(숫자, 버림 위치)
-- CEIL(숫자)
-- FLOOR(숫자)
-- MOD(숫자, 나눌숫자) == %

-- ROUND
SELECT ROUND(1234.5678) AS "ROUND",
		ROUND(1234.5678, 0) AS "ROUND 0",
		ROUND(1234.5678, 1) AS "ROUND 1",
		ROUND(1234.5678, 2) AS "ROUND 2",
		ROUND(1234.5678, -1) AS "ROUND -1",
		ROUND(1234.5678, -2) AS "ROUND -2"
FROM DUAL;

-- TRUNC
SELECT TRUNC(1234.5678) AS "TRUNC",
		TRUNC(1234.5678, 0) AS "TRUNC 0",
		TRUNC(1234.5678, 1) AS "TRUNC 1",
		TRUNC(1234.5678, 2) AS "TRUNC 2",
		TRUNC(1234.5678, -1) AS "TRUNC -1",
		TRUNC(1234.5678, -2) AS "TRUNC -2"
FROM DUAL;

-- CEIL / FLOOR
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

-- MOD
SELECT MOD(15, 6)
FROM DUAL;

---------------------------------------
-- 날짜함수

-- SYSDATE : 오라클 서버가 설치된 OS의 현재 날짜와 시간 사용
SELECT SYSDATE FROM DUAL;

-- 날짜 데이터 + 숫자 : 날짜 데이터에 숫자만큼의 일수를 더한 날짜
-- 날짜 데이터 - 날짜 데이터 : 일수 차이 (더하기는 안됨)
SELECT SYSDATE , SYSDATE -1, SYSDATE +1 FROM DUAL;

-- ADD_MONTHS(날짜 데이터, 더할 개월수)
SELECT SYSDATE , ADD_MONTHS(SYSDATE, 3) FROM DUAL; 
-- 입사 20주년 조회
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 240) AS "입사 20주년" 
FROM EMP e 

-- MONTHS_BETWEEN(날짜 데이터, 날짜 데이터) : 두 날짜 데이터 간의 개월수 차이
SELECT ENAME , HIREDATE , SYSDATE,
		MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
		MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
FROM EMP e;

-- NEXT_DAY(날짜데이터, 요일문자) : 날짜 데이터에서 돌아오는 요일의 날짜 반환
-- LAST_DAY(날짜데이터) : 특정 날짜가 속한 달의 마지막 날짜 조회
SELECT SYSDATE , NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE) FROM DUAL; 

-------------------------------------------------------
-- 형 변환 함수

-- NUMBER + '문자숫자' : 연산해줌
SELECT EMPNO , ENAME , EMPNO +'500'
FROM EMP e ;

-- 수치 부적합
-- SELECT EMPNO , ENAME , EMPNO +'abcd'
-- FROM EMP e ;

-- TO_CHAR(날짜 데이터, '출력되길 원하는 문자 형태')
-- TO_NUMBER(문자 데이터, '인식되길 원하는 숫자 형태')
-- TO_DATE(문자데이터, '인식되길 원하는 날짜 형태')

-- 날짜 => 문자
SELECT SYSDATE , TO_CHAR(SYSDATE,'YYYY/MM/DD') AS "현재 날짜"
FROM DUAL;

SELECT SYSDATE , TO_CHAR(SYSDATE,'MM') AS "현재 월",  
				TO_CHAR(SYSDATE,'MON') AS "현재 월2", 
				TO_CHAR(SYSDATE,'MONTH') AS "현재 월3"
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS "일자",
		TO_CHAR(SYSDATE, 'DAY') AS "일자2"
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재시간,
				TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재시간2,
				TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재시간3,
				TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS 현재시간4
FROM DUAL;

-- 문자 => 숫자
SELECT 1300 - '1500', '1300' + 1500
FROM DUAL;

SELECT '1300' + '1500'
FROM DUAL;

-- 수치 부적함 ( , 가 포함되어 문자로 처리)
-- SELECT '1,300' + '1,500'
-- FROM DUAL;

-- 9(숫자 한자리를 의미 : 빈자리 채우지 않음), 0(숫자 한자리 : 빈자리 채움)
SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500', '999,999')
FROM DUAL;

-- 문자 => 날짜
SELECT TO_DATE('2024-09-05', 'YYYY-MM-DD') AS "TODATE1",
		TO_DATE('20240905', 'YYYY-MM-DD') AS "TODATE2"
FROM DUAL;

-- EMP 테이블에서 1981-06-01 이후에 입사한 사원 조회
SELECT *
FROM EMP e 
WHERE HIREDATE >= '1981-06-01';

SELECT *
FROM EMP e 
WHERE HIREDATE >= TO_DATE('1981-06-01');

-- NULL 처리 함수
-- NULL과 산술연산이 안됨 => NULL을 다른 값으로 변경
-- NVL(NULL값, 대체값)
-- NVL2(NULL값, NULL이 아닌경우, NULL인 경우)
-- SAL = NULL (X)
-- SAL IS NULL(O)

SELECT EMPNO , ENAME , SAL , COMM, SAL+COMM, SAL+NVL(COMM, 0)
FROM EMP e ;

-- 널이 아니면 SAL*12+COMM
-- 널이면 SAL*12
SELECT EMPNO , ENAME , SAL , COMM , 
		NVL2(COMM, '0', 'X'), 
		NVL2(COMM, SAL*12+COMM, SAL*12)
FROM EMP e ;

----------------------------------------------------------
-- DECODE 함수 / CASE 문
-- DECODE(데이터, 조건1, 조건1 만족시, 조건2, 조건2 만족시..)

-- JOB이 MANAGER 라면 SAL * 1.1
-- JOB이 SALESMAN 이라면 SAL * 1.5
-- JOB이 ANALYST 라면 SAL
-- 이외는 SAL * 1.03

-- DECODE
SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	SAL ,
		DECODE(JOB,
		'MANAGER', SAL * 1.1, 
		'SALESMAN', SAL * 1.5, 
		'ANALYST', SAL,
		SAL * 1.03) AS "UPSAL"
FROM EMP e ;

-- CASE
SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	SAL ,
	CASE JOB
		WHEN 'MANAGER' THEN SAL * 1.1 
		WHEN 'SALESMAN' THEN SAL * 1.5 
		WHEN 'ANALYST' THEN SAL
		ELSE SAL * 1.03
	END AS "UPSAL"
FROM EMP e ;


-- COMM이 NULL일때 '해당사항없음'
-- COMM = 0 일때 '수당없음'
-- COMM > 0 일때 '수당 : COMM'
SELECT
	EMPNO ,
	ENAME ,
	COMM,
	CASE
		WHEN COMM IS NULL THEN '해당사항없음'
		WHEN COMM = 0 THEN '수당없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS "COMMISSION여부"
FROM
	EMP e ;

-- EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다.
-- 하루 근무시간을 8시간으로 봤을 때
-- 사원들의 하루 급여와 시급을 계산하여 결과 출력
-- EMPNO, ENAME, SAL, DAY_PAY, TIME_PAY 출력
-- 단, 하루 급여는 소수점 셋째자리에서 버리고, 시급은 두번째 소수점에서 반올림하기
SELECT EMPNO , ENAME , SAL , 
		TRUNC(SAL/21.5, 3) AS "DAY_PAY", 
		ROUND(SAL/21.5/8, 2) AS "TIME_PAY"
FROM EMP e ;

-- EMP 테이블에서 사원들은 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원들의 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 출력한다
-- EMPNO, ENAME, HIRE_DATE, R_JOB
SELECT EMPNO , ENAME , HIREDATE , 
		TO_CHAR(ADD_MONTHS(HIREDATE, 3), 'YYYY-MM-DD') AS "R_JOB" 
FROM EMP e ;
-- + 추가수당
-- COMM 이 없으면 'N/A', 있으면 COMM 출력
SELECT EMPNO , ENAME , HIREDATE ,
		TO_CHAR(ADD_MONTHS(HIREDATE, 3), 'YYYY-MM-DD') AS "R_JOB" ,
		CASE 
			WHEN COMM IS NULL THEN 'N/A'
			WHEN COMM IS NOT NULL THEN COMM||''
		END	AS COMM
FROM EMP e ;

SELECT EMPNO , ENAME , HIREDATE ,
		TO_CHAR(ADD_MONTHS(HIREDATE, 3), 'YYYY-MM-DD') AS "R_JOB" ,
		NVL(TO_CHAR(COMM), 'N/A') AS COMM 
FROM EMP e ;

-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 변환해서 CHG_MGR에 출력
-- EMPNO, ENAME, MGR, CHG_MGR
-- MGR이 NULL 이면 '0000'
-- MGR 의 앞 두자리가 75이면 '5555'
-- MGR 의 앞 두자리가 76이면 '6666'
-- MGR 의 앞 두자리가 77이면 '7777'
-- MGR 의 앞 두자리가 78이면 '8888'
-- MGR 의 앞 두자리가 79이면 MGR 그대로 출력
SELECT
	EMPNO ,
	ENAME ,
	MGR ,
	CASE		
		WHEN MGR IS NULL THEN '0000'
		WHEN MGR LIKE '75%' THEN '5555'
		WHEN MGR LIKE '76%' THEN '6666'
		WHEN MGR LIKE '77%' THEN '7777'
		WHEN MGR LIKE '78%' THEN '8888'
		WHEN MGR LIKE '79%' THEN MGR||''
	END AS "CHG_MGR"
FROM EMP e;

-----------------------------------------------------------------
-- 다중행 함수
-- SUM(합계를 낼 열)
SELECT SUM(SAL)
FROM EMP;

SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL)
FROM EMP;

SELECT COUNT(DISTINCT SAL), COUNT(ALL SAL), COUNT(SAL)
FROM EMP;

SELECT MAX(SAL), MIN(SAL) FROM EMP;
SELECT MAX(SAL), MIN(SAL) FROM EMP WHERE DEPTNO = 10;

-- 부서번호가 20번인 사원의 최근 입사일
SELECT MAX(HIREDATE)
FROM EMP e 
WHERE DEPTNO = 20;

SELECT AVG(DISTINCT SAL), AVG(ALL SAL), AVG(SAL)
FROM EMP;

-- 부서번호가 30번인 사원들의 평균 추가수당
SELECT AVG(COMM)
FROM EMP e 
WHERE DEPTNO = 30;

-- GROUP BY : 결과 값을 원하는 열로 묶어 출력
-- 각 부서별 평균 급여 출력
SELECT DEPTNO, AVG(SAL) 
FROM EMP e 
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 각 부서별, 직책별 평균 급여 출력
SELECT DEPTNO, JOB, AVG(SAL) 
FROM EMP e 
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB ;

-- GROUP BY절 사용시에는 SELECT절에서 사용할 수 있는 열이 제한됨
-- SELECT 가능 : GROUP BY에 쓰여진 열, 다중행 함수

-- GROUP BY 표현식이 아닙니다.
-- SELECT ENAME , AVG(SAL)
-- FROM EMP e 
-- GROUP BY DEPTNO ;

-- GROUP BY ~ HAVING : GROUP BY절에 조건을 줄 때 사용
-- 각 부서의 직책별 평균 급여(평균 급여가 2000 이상인 그룹만 조회)
SELECT DEPTNO, JOB , AVG(SAL) 
FROM EMP e 
GROUP BY DEPTNO , JOB 
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO , JOB;

---------------------------------------------------------------------
-- 부서별 평균급여, 최고급여, 최저급여, 사원 수 출력
-- 평균 급여 출력 시 소수점을 제외하고 출력
SELECT DEPTNO , TRUNC(AVG(SAL),0) AS "평균급여", MAX(SAL) AS "최고급여", MIN(SAL) AS "최저급여", COUNT(EMPNO) AS "사원 수" 
FROM EMP e 
GROUP BY DEPTNO 
ORDER BY DEPTNO;

-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT JOB, COUNT(JOB)
FROM EMP e 
GROUP BY JOB 
HAVING COUNT(JOB) >= 3;

-- 사원들의 입사년도를 기준으로 부서별로 몇 명의 입사인원이 있는지 출력
SELECT TO_CHAR(HIREDATE, 'YYYY'), DEPTNO ,COUNT(TO_CHAR(HIREDATE, 'YYYY')) 
FROM EMP e 
GROUP BY DEPTNO , TO_CHAR(HIREDATE, 'YYYY') 
ORDER BY TO_CHAR(HIREDATE, 'YYYY') ;

-------------------------------------------------------------------------------
-- JOIN : 두개 이상의 테이블을 연결하여 하나의 테이블처럼 출력
-- 내부 조인
-- 등가 조인 : 테이블 연결 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정
-- 비 등가 조인
-- 외부 조인

SELECT  * FROM EMP, DEPT;


-- 내부조인
-- 등가조인 : EMP테이블의 DEPNO와 DEPT테이블의 DEPT가 일치시 연결
-- 열의 정의가 애매합니다(조인 시 동일한 필드명을 가지고 있을 때)
SELECT e.EMPNO , e.ENAME , d.DEPTNO , d.DNAME , d.LOC 
FROM EMP e , DEPT d 
WHERE e.DEPTNO = d.DEPTNO ;
















