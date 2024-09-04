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
-- SQL에서 문자열은 홑따옴표('')만 사용
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