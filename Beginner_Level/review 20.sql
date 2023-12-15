-- 이름, 월급, 월급에 대한 순위를 출력하시오. 
select ename, sal, rank() over (order by sal desc) as 순위
from emp;
-- 부서 번호, 이름, 월급, 월급에 대한 순위를 출력하는데 부서번호 별로 각각 월급이 높은 
-- 순서대로 순위를 부여하시오. 
select deptno, ename, sal, 
        rank() over (partition by deptno order by sal desc) as 순위
from emp;

-- 직업, 이름, 월급, 순위를 출력하는데 순위가 직업 별로 각각 월급이 높은 사원 순으로 
-- 순위를 부여하시오. 
select job, ename, sal,
        rank() over(partition by job order by sal desc) as 순위
from emp;

-- 월급이 1000에서 3000 사이인 사원들의 이름, 월급, 월급에 대한 순위를 출력하시오.
select ename, sal, rank() over (order by sal desc)as 순위 
from emp 
where sal between 1000 and 3000;


-- 부서번호, 이름, 입사일, 순위를 출력하는데 순위가 부서 번호 별로 각각 먼저 입사한 
-- 사원순으로 순위를 부여하시오. 
select deptno,ename, hiredate,
        dense_rank() over(partition by deptno order by hiredate) as 순위
from emp;

-- 월급 1250은 사원 테이블에서 월급의 순위가 어떻게 되는가? 
select dense_rank(1250) within group (order by sal desc) as 순위
from emp;

-- 81/11/17에 입사한 사원은 몇 번째로 입사한 사원인가? 
select dense_rank('81/11/17') within group (order by hiredate) as 순위
from emp;

-- 우리반 테이블에서 성별, 이름, 나이, 순위를 출력하는데 순위가 성별 별로 각각 나이가 
-- 높은 순서대로 순위를 부여하시오. 
select gender, ename, age, 
    dense_rank() over(partition by gender order by  age desc)as 순위
from emp18;

-- 이름과 월급과 월급에 대한 등급을 출력하시오. (월급에 대한 등급을 4등급으로 나눠서 등급 부여) 
select ename, sal, ntile(4) over (order by sal desc) as 순위
from emp;

-- 우리반에서 통신사가 kt인 학생들의 이름과 나이가 등급을 출력하는데 등급을 3등급으로 나눠서
-- 출력하시오
select ename, age, ntile(3) over (order by age desc) as 순위
from emp18 
where lower(telecom) = 'kt';

-- 우리반에서 통신사가 kt, sk 인 학생들의 이름과 나이와 나이에 대한 등급을 출력하는데 
-- 등급을 5등급으로 나눠서 출력하시오. 
select ename, age, ntile(5) over (order by age desc) as 순위
from emp18 
where lower(telecom) in ('kt','sk');

-- 이름, 월급, 월급에 대한 순위, 순위에 대한 비율을 출력하시오. 
select ename, sal, 
        rank() over (order by sal desc) as 순위, 
        round(cume_dist() over (order by sal desc),2) as 비율
from emp;

-- 부서번호, 부서 번호별로 해당하는 사원들의 이름을 가로로 출력하시오. 
select deptno, 
    listagg(ename,',') within group (order by ename desc)
from emp 
group by deptno;

-- 직업, 직업 별로 속한 사원들의 이름을 가로로 출력하시오. (이름은 abcd 순서대로 출력) 
select job, 
    listagg(ename,',')within group(order by ename) 
from emp 
group by job;

-- 우리반 테이블에서 통신사, 통신사 별로 속한 학생들의 이름을 가로로 출력하는데 
-- 나이가 높은 학생들부터 출력되게 하시오. 
select lower(telecom), 
    listagg(ename,',') within group (order by age desc)
from emp18 
group by lower(telecom);

-- (서울시 공무원이 요청했던 sql) 위의 결과 + 이름 옆에 나이 출력 
select lower(telecom), 
    listagg(ename||'('||age||')',',') within group (order by age desc)
from emp18 
group by lower(telecom);

-- 사원 번호, 사원 이름, 바로 전행의 사원번호, 바로 다음행의 사원번호를 출력하시오. 
select empno, ename, 
    lag(empno,1) over(order by empno) 이전행,
    lead(empno,1) over (order by empno) 다음행
from emp;

-- 이름, 입사일, 바로 전행의 입사일을 출력하시오. (입사일이 ascending 하게 출력하시오.) 
select ename, hiredate, 
    lag(hiredate,1) over (order by hiredate) "전행의 입사일"
from emp;

-- 이름, 입사일, 바로 전에 입사한 사원 다음에 몇일 후에 입사했는지 출력하시오. 
select ename, hiredate ,
    hiredate -  lag(hiredate,1) over (order by hiredate) as "간격"
from emp;