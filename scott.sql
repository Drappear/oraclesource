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
-- 내부 조인(INNER JOIN)
	-- 등가 조인 : 테이블 연결 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정
	-- 비 등가 조인
-- 외부 조인(OUTER JOIN)
	-- 왼쪽 외부조인(LEFT OUTER JOIN)
	-- 오른쪽 외부조인(RIGHT OUTER JOIN)
	-- 전체 외부조인(FULL OUTER JOIN

SELECT  * FROM EMP, DEPT;


-- 내부조인
-- 등가조인 : EMP테이블의 DEPNO와 DEPT테이블의 DEPT가 일치시 연결
-- 열의 정의가 애매합니다(조인 시 동일한 필드명을 가지고 있을 때)
SELECT e.EMPNO , e.ENAME , d.DEPTNO , d.DNAME , d.LOC
FROM EMP e , DEPT d 
WHERE e.DEPTNO = d.DEPTNO ;


-- sal 3000 이상인 사원 조회
SELECT e.EMPNO , e.ENAME , d.DEPTNO , d.DNAME , d.LOC, e.SAL 
FROM EMP e , DEPT d 
WHERE e.DEPTNO = d.DEPTNO AND e.SAL >= 3000;

-- 비등가조인 : 등가조인 이외의 방식
-- EMP / SALGRADE
SELECT *
FROM  EMP e, SALGRADE s 
WHERE e.SAL BETWEEN  s.LOSAL AND s.HISAL ;

-- 자체 조인
-- MGR의 이름 조회
SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.EMPNO AS "MGR_EMPNO", e2.ENAME AS "MGR_ENAME"
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO ;

-- 외부조인
-- LEFT OUTER JOIN
SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.EMPNO  AS "MGR_EMPNO", e2.ENAME AS "MGR_ENAME"
FROM EMP e1, EMP e2
WHERE e1.MGR = e2.EMPNO(+);

-- RIGHT OUTER JOIN
SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.EMPNO  AS "MGR_EMPNO", e2.ENAME AS "MGR_ENAME"
FROM EMP e1, EMP e2
WHERE e1.MGR(+) = e2.EMPNO;

-- 쿼리문 변화
-- 내부조인 : JOIN ~ ON
-- 외부조인 LEFT/RIGHT OUTER JOIN ~ ON
SELECT e.EMPNO , e.ENAME , d.DEPTNO , d.DNAME , d.LOC, e.SAL 
FROM EMP e JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO 
WHERE e.SAL >= 3000;

SELECT e1.EMPNO, e1.ENAME, e1.MGR, e2.EMPNO  AS "MGR_EMPNO", e2.ENAME AS "MGR_ENAME"
FROM EMP e1 LEFT OUTER JOIN EMP e2
ON e1.MGR = e2.EMPNO;

-- 테이블 3개 JOIN
--SELECT * 
--FROM EMP e1 JOIN EMP e2
--ON e1.MGR = e2.EMPNO JOIN EMP e3 
--ON e1.MGR = e3.EMPNO ;

-- 각 부서별 평균급여, 최대급여, 최소급여, 사원수 조회
-- DEPTNO, DNAME, AVG_SAL, MAX_SAL, MIN_SAL, CNT
SELECT
	e.DEPTNO ,
	d.DNAME ,
	AVG(e.SAL) AS "AVG_SAL",
	MAX(e.SAL) AS "MAX_SAL",
	MIN(e.SAL) AS "MIN_SAL",
	COUNT(*) AS "CNT"
FROM EMP e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
GROUP BY e.DEPTNO, d.DNAME
ORDER BY e.DEPTNO ;

-- 모든 부서정보와 사원 정보를 조회
-- DEPTNO, DNAME, EMPNO, ENAME, JOB, SAL
SELECT d.DEPTNO , d.DNAME , e.EMPNO , e.ENAME , e.JOB , e.SAL 
FROM DEPT d 
LEFT OUTER JOIN EMP e ON d.DEPTNO = e.DEPTNO 
ORDER BY d.DEPTNO, e.EMPNO;


-- 서브 쿼리 : 쿼리문 안에 또 다른 쿼리문(SELECT, UPDATE, DELETE, INSERT)이 포함

-- JONES 의 월급보다 많은 월급을 받는 사원 조회
SELECT *
FROM EMP e 
WHERE e.SAL > 2975;

SELECT *
FROM EMP e 
WHERE e.SAL > (SELECT e2.SAL FROM EMP e2 WHERE e2.ENAME = 'JONES');

-- 실행 결과가 하나인 단일행 서브쿼리
-- >, >=, =, <, <=, <>, !=, ^=

-- KING보다 빠른 입사자 조회
SELECT *
FROM EMP e 
WHERE HIREDATE < (SELECT e2.HIREDATE FROM EMP e2 WHERE e2.ENAME = 'KING');

-- ALLEN 보다 추가수당을 많이 받는 사원 조회
SELECT *
FROM EMP e 
WHERE COMM > (SELECT e2.COMM FROM EMP e2 WHERE e2.ENAME = 'ALLEN');

-- 20번 부서에 근무하는 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 조회
SELECT *
FROM EMP e 
WHERE DEPTNO = 20
AND SAL > (SELECT AVG(e2.SAL) FROM EMP e2);

-- 부서명, 부서위치 추가
SELECT e.ENAME , d.DEPTNO , d.DNAME , d.LOC 
FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO 
WHERE e.DEPTNO = 20
AND e.SAL > (SELECT AVG(e2.SAL) FROM EMP e2);


-- 실행 결과가 여러개인 다중행 서브쿼리
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 TRUE
-- ANY(SOME) : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
-- ALL : 메인 쿼리의 조건식을 서브 쿼리의 결과 모두가 만족하면 TRUE
-- EXISTS : 서브 쿼리의 결과가 존재하면(행이 1개 이상일 경우) TRUE


-- 각 부서별 최고 급여와 동일하거나 큰 급여를 받는 사원 조회
SELECT *
FROM EMP e 
WHERE e.SAL IN (SELECT MAX(e2.SAL) FROM EMP e2 GROUP BY e2.DEPTNO);

-- IN == =ANY
SELECT *
FROM EMP e 
WHERE e.SAL = ANY (SELECT MAX(e2.SAL) FROM EMP e2 GROUP BY e2.DEPTNO);

SELECT *
FROM EMP e 
WHERE e.SAL = SOME (SELECT MAX(e2.SAL) FROM EMP e2 GROUP BY e2.DEPTNO);


-- 30번 부서 급여보다 적은 급여를 받는 사원 조회
-- => 30번 부서의 최대급여보다 적은 사원 조회와 같은 결과
-- 다중행 서브쿼리
SELECT *
FROM EMP e 
WHERE e.SAL < ANY (SELECT e2.SAL FROM EMP e2 WHERE e2.DEPTNO = 30)
ORDER BY e.SAL , e.EMPNO;
-- 단일행 서브쿼리
SELECT *
FROM EMP e 
WHERE e.SAL < (SELECT MAX(e2.SAL) FROM EMP e2 WHERE e2.DEPTNO = 30)
ORDER BY e.SAL , e.EMPNO;


-- 부서번호가 30번인 사원들의 최소 급여보다 더 적은 사원 조회
-- ALL
SELECT *
FROM EMP e 
WHERE e.SAL < ALL (SELECT e2.SAL FROM EMP e2 WHERE e2.DEPTNO = 30)
ORDER BY e.SAL , e.EMPNO;


-- EXISTS
SELECT *
FROM EMP e 
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);

SELECT *
FROM EMP e 
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 50);

-- 비교할 열이 여러 개인 다중열 서브쿼리
SELECT *
FROM EMP e 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP e2 GROUP BY DEPTNO);



-- FROM절 서브쿼리(== 인라인 뷰) 작성
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT절 서브쿼리(== 스칼라 서브쿼리)
SELECT e.EMPNO ,
		e.JOB , 
		e.SAL , 
		(SELECT GRADE FROM SALGRADE s WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL) AS "SALGRADE",
		e.DEPTNO, 
		(SELECT DNAME FROM DEPT d WHERE e.DEPTNO = d.DEPTNO) AS "DNAME"
FROM EMP e;


------------------------------------------------------------------------------------------------
-- INSERT(삽입)

-- 테이블 복사
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

-- 열 이름 나열하는 부분은 생략 가능 : 전체 필드에 값 삽입 시
-- INSERT INTO 테이블명(열이름1, 열이름2.....)
-- VALUES (열 이름에 맞춰 값 나열)

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP
VALUES (60, 'DATABASE1', 'SEOUL1');


CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

SELECT *FROM EMP_TEMP;

-- 전체 필드 값 추가
INSERT INTO EMP_TEMP VALUES(9999, '홍길동', 'PRESIDENT', NULL, '2001-01-01', 5000, 1000, 10);

-- 부분 값 추가
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
VALUES(8888, '성춘향', 'SALESMAN', SYSDATE, 3000, 20);

-- 날짜 형식 순서 바뀌었을 때
-- 날짜 형식의 지정에 불필요한 데이터가 포함되어 있습니다
-- TO_DATE를 이용해 형식을 표시해주면 입력 가능
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
VALUES(7777, '이순신', 'SALESMAN', TO_DATE('07/08/2023','DD/MM/YYYY'), 3000, 20);


-- 테이블 제거
DROP TABLE EMP_TEMP;

-- 테이블 복사 시 테이블의 구조만 복사하고 데이터는 복사하지 않을 때
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;



-- EMP 테이블과 SALGRADE JOIN 후 급여 등급이 1인 사원들만 EMP_TEMP에 삽입
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT e.EMPNO, e.ENAME, e.JOB, e.MGR, e.HIREDATE, e.SAL, e.COMM, e.DEPTNO 
FROM EMP e JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL
WHERE s.GRADE =1;


----------------------------------------------------------------------------
-- UPDATE(수정)

UPDATE 변경 테이블명
SET 변경할 열1=값, 변경할 열2=값...
WHERE 변경할 대상 행 조건

SELECT * FROM DEPT_TEMP;

-- 모든 행의 LOC를 SEOUL로 변경
UPDATE DEPT_TEMP
SET LOC='SEOUL';


--
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

-- 40번 부서의 부서명 DATABASE, LOC SEOUL로 변경
UPDATE DEPT_TEMP2
SET DNAME = 'DATABASE', LOC = 'SEOUL'
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

-- EMP_TEMP 의 사원들 중 급여가 2500 이하인 사원들의 추가수당을 50으로 수정
UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <= 2500;

SELECT * FROM EMP_TEMP;




-----------------------------------------------------------------------------------------
-- DELETE : 데이터 삭제
--DELETE 테이블명 WHERE 삭제조건;
--DELETE FROM 테이블명 WHERE 삭제조건;
--DELETE 테이블명; -- 전체 데이터 삭제

CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- JOB이 MANAGER인 사원 삭제
DELETE EMP_TEMP2 WHERE JOB = 'MANAGER';

DELETE FROM EMP_TEMP2;

-- EMP 테이블 행 전부 추출 후 EMP_TEMP2에 삽입
INSERT INTO EMP_TEMP2 SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- 서브쿼리
-- 급여 등급이 3등급이고, 부서번호가 30번인 사원 삭제
DELETE FROM EMP_TEMP2
WHERE EMPNO 
IN(
	SELECT
		e.EMPNO
	FROM
		EMP_TEMP2 e
	JOIN SALGRADE s ON
		e.SAL BETWEEN s.LOSAL AND s.HISAL
		AND s.GRADE = 3
		AND e.DEPTNO = 30
	);

------------------------------------------------------------------------------------
-- 테이블 복사
-- EMP, DEPT, SALGRADE 테이블 복사
-- EXAM_EMP, EXAM_DEPT, EXAM_SALGRADE 로 생성
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

-- INSERT
-- EXAM_DEPT 테이블에 50, 60, 70, 80 부서 등록
-- 50/ORACLE/BUSAN, 60/SQL/ILSAN, 70/SELECT/INCHEON, 80/DML/BUNDANG
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC)
VALUES(50, 'ORACLE', 'BUSAN');
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC)
VALUES(60, 'SQL', 'ILSAN'); 
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC)
VALUES(70, 'SELECT', 'INCHEON');
INSERT INTO EXAM_DEPT(DEPTNO, DNAME, LOC)
VALUES(80, 'DML', 'BUNDANG');

-- EXAM_EMP 사원 등록
-- 7201, TEST_USER1, MANAGER, 7788, 2016-01-02, 4500, NULL, 50
-- 7202, TEST_USER2, CLERK, 7201, 2016-02-21, 1800, NULL, 50
-- 7203, TEST_USER3, ANALYST, 7201, 2016-04-11, 3400, NULL, 60
-- 7204, TEST_USER4, SALESMAN, 7201, 2016-05-31, 2700, NULL, 60
-- 7205, TEST_USER5, CLERK, 7201, 2016-07-20, 2600, NULL, 70
-- 7206, TEST_USER6, CLERK, 7201, 2016-09-08, 2300, NULL, 70
-- 7207, TEST_USER7, LECTURER, 7201, 2016-10-28, 4500, NULL, 80
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, NULL, 60);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2300, NULL, 70);
INSERT INTO EXAM_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 4500, NULL, 80);

-- UPDATE
--EXAM_EMP 에 속한 사원 중 50번 부서에 근무하는 사원들의 평균 급여보다
--많은 급여를 받고 있는 사원들을 70번 부서로 변경
UPDATE EXAM_EMP SET DEPTNO = 70 
WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO = 50);

--EXAM_EMP 테이블의 60번부서의 사원 중 입사일이 가장 빠른 사원보다
--늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 변경 
UPDATE EXAM_EMP SET SAL = SAL + SAL*0.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO = 60); 

-- DELETE 
-- EXAM_EMP에 속한 사원 중 급여 등급이 5인 사원 삭제
DELETE FROM EXAM_EMP ee WHERE EMPNO 
IN (SELECT e.EMPNO FROM EXAM_EMP e JOIN SALGRADE s 
ON e.SAL BETWEEN s.LOSAL AND s.HISAL AND s.GRADE = 5);


--------------------------------------------------------------------------------------------
-- 트랜잭션 : 최소 수행단위
--			  COMMIT(반영), ROLLBACK(취소)
-- INSERT, DELETE, UPDATE => 데이터 변화
-- AUTO-COMMIT : 자동 반영

-- 취소 불가능한 트랜잭션 시작
CREATE  TABLE DEPT_TCL AS SELECT * FROM DEPT;
-- 트랜잭션 종료

--트랜잭션 시작
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;
--트랜잭션 종료

--트랜잭션 취소
ROLLBACK;



--트랜잭션 시작
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;

-- 트랜잭션 반영
COMMIT;
-- 트랜잭션 종료


SELECT * FROM DEPT_TCL;
DELETE FROM DEPT_TCL WHERE DEPTNO = 50;
COMMIT;

UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
COMMIT;

------------------------------------------------------------------------------
-- DDL(데이터 정의어)
-- 데이터베이스 데이터를 보관하고 관리하기 위해 제공되는 여러 객체의 생성/변경/삭제 관련 기능
-- CREATE(생성) / ALTER(생성된 객체 변경) / DROP(생성된 객체 삭제)

-- 1. 테이블 정의어
CREATE TABLE 테이블명( 
	열이름1 자료형,
	열이름2 자료형,
	열이름3 자료형,
	열이름4 자료형....
)

-- 테이블 이름 작성 규칙
--	 문자로 시작(한글 가능하나 사용하지 않음 / 숫자로 시작 못함)
--	 길이 제한(30byte)
--   같은 소유자 소유의 테이블 이름은 중복 불가능
--   SQL 키워드는 사용 불가(SELECT, INSERT등)

-- 열 이름 생성 규칙
--	 문자로 시작
--	 길이 제한이 있음(3Obyte)
--	 한 테이블에 열 이름 중복 불가
--	 열 이름은 영문자, 숫자, 특수문자(_, #, $) 사용 가능
--	 SQL 키워드는 사용 불가

-- 자료형
--	 문자 : varchar2(길이), nvarchar2(길이), char(길이), nchar(길이)
--			var : 가변(저장된 값의 길이만큼만 사용)
--				ex) name varchar2(10) : 홍길동 - 9byte
--					name char(10) : 홍길동 - 10byte (고정길이)
--				DB 버전에 따라 한글 문자 하나당 2byte or 3byte 할당
--					name varchar2(10) : 홍길동전 - 값의 크기가 커서 오류 발생
--					name nvarchar2(10), nchar(10) : 10이 바이트 개념이아니라 문자 길이 자체를 의미 
--	 숫자 : number(전체자릿수, 소수점자릿수)
--	 날짜 : date
--	 BLOB : 대용량 이진 데이터 저장
--	 CLOB : 대용량 텍스트 데이터 저장

CREATE TABLE EMP_DDL(
	EMPNO NUMBER(4,0),
	ENMAE VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4,0), 
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2,0)
);

SELECT * FROM EMP_DDL;

-- DEPT 테이블의 열구조와 데이터 복사하여 새 테이블 생성
CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;
-- DEPT 테이블의 열구조만 복사하여 새 테이블 생성
CREATE TABLE DEPT_DDL2 AS SELECT * FROM DEPT WHERE 1<>1;

SELECT * FROM DEPT_DDL;
SELECT * FROM DEPT_DDL2;

-- ALTER : 변경
-- 새로운 열 추가 / 열 이름 변경 / 열 삭제 / 열 자료형 변경
-- EMP_DDL에 새로운 열(HP : 010-1234-5678) 추가
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_DDL;

-- EMPNO NUMBER(5)로 변경
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

-- TEL 삭제
ALTER TABLE EMP_DDL DROP COLUMN TELL;

-- 테이블 이름 변경
RENAME EMP_DDL TO EMP_RENAME;

-- DROP : 삭제
DROP TABLE EMP_RENAME;


CREATE TABLE MEMBER(
	ID CHAR(8),
	NAME VARCHAR2(10),
	ADDR VARCHAR2(50),
	NATION CHAR(4),
	EMAIL VARCHAR2(50),
	AGE NUMBER(7,2)	
);

ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

SELECT * FROM MEMBER;

INSERT INTO MEMBER(ID, NAME, ADDR, NATION, EMAIL, AGE)
SELECT 'hong1234', '홍길동', '서울시 구로구 개봉동', '대한민국', 'hong123@naver.com', 25 FROM DUAL
UNION ALL
SELECT 'hong1235', '이승기', '서울시 강서구 화곡동', '대한민국', 'lee89@naver.com', 26 FROM DUAL
UNION ALL
SELECT 'hong1236', '강호동', '서울시 마포구 상수동', '대한민국', 'kang56@naver.com', 42 FROM DUAL
UNION ALL
SELECT 'hong1237', '이수근', '경기도 부천시', '대한민국', 'leesu@naver.com', 42 FROM DUAL
UNION ALL
SELECT 'hong1238', '서장훈', '서울시 강남구 대치동', '대한민국', 'seo568@naver.com', 36 FROM DUAL
UNION ALL
SELECT 'hong1239', '김영철', '서울시 도봉구 도봉동', '대한민국', 'young@naver.com', 41 FROM DUAL
UNION ALL
SELECT 'hong1210', '김장훈', '서울시 노원구 노원1동', '대한민국', 'kim@naver.com', 48 FROM DUAL
UNION ALL
SELECT 'hong1211', '임창정', '서울시 양천구 신월동', '대한민국', 'limchang@naver.com', 45 FROM DUAL
UNION ALL
SELECT 'hong1212', '김종국', '서울시 강남구 도곡동', '대한민국', 'kimjong@naver.com', 44 FROM DUAL
UNION ALL
SELECT 'hong1213', '김범수', '경기도 일산동구 일산동', '대한민국', 'kim77@naver.com', 36 FROM DUAL
UNION ALL
SELECT 'hong1214', '김경호', '인천시 서구 가좌동', '대한민국', 'ho789@naver.com', 26 FROM DUAL
UNION ALL
SELECT 'hong1215', '민경훈', '경기도 수원시 수원1동', '대한민국', 'min@naver.com', 35 FROM DUAL
UNION ALL
SELECT 'hong1216', '바이브', '경기도 용인시 기흥구', '대한민국', 'vibe@naver.com', 33 FROM DUAL;

ALTER TABLE MEMBER MODIFY NATION NCHAR(4);

SELECT * FROM MEMBER;

-- 오라클 객체
-- 인덱스 / 뷰 / 시퀀스 / 동의어 

-- 인덱스 : 빠른 검색
--		1. 자동 생성 : 기본 키 설정 시 인덱스 자동 생성됨
--		2. 직접 인덱스 생성 
-- CREATE INDEX 인덱스명 ON 테이블명(열이름1 ASC/DESC, 열이름2 ....)
-- EMP 테이블의 SAL 컬럼 INDEX 지정
CREATE INDEX idx_emp_sal ON EMP(SAL);

DROP INDEX idx_emp_sal;

-- 뷰 : 가상 테이블
--		1. 편리성 : 복잡한 SELECT문의 복잡도를 완화하기 위해
--					자주 활용하는 SELECT문을 뷰로 저장해 놓은 후 다른 SQL 구문에서 활용 
--		2. 보안성 : 노출되면 안되는 컬럼을 제외하여 접근 허용

-- 뷰 생성할 수 있는 권한 필요
-- CREATE OR REPLACE VIEW 뷰이름(열이름1, 열이름2 ....) AS (SELECT 구문)

-- EMP 테이블의 20번 부서에 해당하는 사원들의 뷰 생성
CREATE VIEW VW_EMP_20 AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 20);

DROP VIEW VW_EMP_20;

CREATE VIEW VW_EMP_20 AS (SELECT * FROM EMP WHERE DEPTNO = 20);

-- 뷰에 데이터 삽입 시 원본 테이블에 삽입이 일어남
INSERT INTO VW_EMP_20 VALUES(6666, '홍길동', 'MANAGER', 7899, '2012-10-01', 1200, 0, 20);

SELECT * FROM VW_EMP_20;
SELECT * FROM EMP;

-- 뷰는 SELECT만 가능하도록 제한
CREATE VIEW VW_EMP_30 AS (SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 30) WITH READ ONLY;


-- ROWNUM : 특수 컬럼(조회된 순서대로 일련번호 부여)
-- ORDER BY 기준이 PK(기본키)가 아니면 번호가 제대로 부여되지 않음
SELECT ROWNUM, e.*
FROM EMP e
ORDER BY SAL DESC;

-- 정렬 기준이 PK가 아니라면 인라인 뷰에서 정렬 후 ROWNUM 번호 부여
SELECT ROWNUM, e.*
FROM (SELECT * FROM EMP ORDER BY SAL DESC) E;






























































































































