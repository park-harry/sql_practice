-- dept 테이블 전체를 출력하시오
select * 
from dept;

-- emp 테이블의 구조를 확인하는 명령어 
desc emp;

-- 사원 테이블에서 이름과 월급을 출력하시오. 
select ename, sal 
from emp;

-- 사원 테이블에서 이름과 직업과 부서번호를 출력하시오. 
select ename, job, deptno
from emp;

-- 사원 테이블에서 사원번호, 이름, 월급, 입사일을 출력하시오.
select empno, ename, sal, hiredate
from emp;

-- 사원테이블에서 사원번호, 이름, 월급, 직업, 커미션, 부서번호를 출력하시오.
select empno, ename, sal, job, comm, deptno
from emp;

-- 부서 테이블에서 부서위치만 출력하시오 
select loc 
from dept; 

-- 부서 테이블에서 부서위치와 부서명을 출력하시오. 
select loc, dname 
from dept;

-- 다음과 같이 출력되는 컬럼명을 한글로 출력되게 하시오 
select empno as 사원번호, ename as 사원이름, sal as 월급 
    from emp;
-- as 는 생략 가능 

-- 사원이름, 직업과 부서번호를 출력하는데 컬럼명을 한글로 출력하시오.
select ename as 사원이름, job as 직업, deptno as 부서번호 
from emp;

-- 부서 테이블에서 부서 번호와 부서 위치를 출력하는데 column 명이
-- Department number와 Department location 으로 출력되게 하시오.
select deptno as "Department number", loc as "Department location"
from dept;

--사원 테이블에서 이름, 월급, 월급 +300 *2를 출력하고 컬럼명을 보너스로 출력하시오.
select ename, sal, sal + 300*2 as bonus
from emp;



