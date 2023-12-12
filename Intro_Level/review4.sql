-- 사원 테이블에서 월급이 3000 이상인 사람만 출력
select sal 
from emp
where sal >= 3000;

-- 사원번호가 7788번인 사원의 사원번호와 이름과 월급을 조회하시오.
select empno, ename, sal 
from emp 
where empno = 7788;

-- 월급이 2000 이상인 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where sal >= 2000;

-- 월급 2500 이하인 사원들의 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오. 
select ename, sal 
from emp 
where sal <= 2500
order by sal desc;

-- 직업이 SALESMAN인 사원들의 이름과 직업을 출력하시오. 
select ename, job 
from emp 
where job = 'SALESMAN';

-- 사원 이름이 SCOTT인 사원의 이름과 월급과 직업을 출력하시오. 
select ename, sal, job 
from emp 
where ename = 'SCOTT';

-- 우리반 테이블에서 성별이 여자인 학생들의 이름과 성별과 주소를 출력하시오. 
select ename, gender, address 
from emp18 
where gender = '여';

-- 입사일이 81년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate 
from emp 
where hiredate = '81/11/17';

-- 통신사가 kt인 학생들의 이름과 통신사를 출력하시오. 
select ename, telecom 
from emp18 
where lower(telecom) = 'kt';

-- 직업이 SALESMAN이 아닌 사원들의 이름과 직업을 출력하시오.
select ename, job 
from emp 
where job <> 'SALESMAN';

-- 부서번호가 10번인 아닌 사원들의 이름과 월급과 부서번호를 출력하는데 월급이 높은 사원부터 
-- 출력하시오. 
select ename, sal, deptno 
from emp 
where deptno <> 10 
order by sal desc;