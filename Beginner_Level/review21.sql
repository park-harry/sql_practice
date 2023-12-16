-- 부서번호, 부서번호 별 총 월급을 출력하시오. 
select deptno, sum(sal) 
from emp
group by deptno;

-- 부서번호, 부서번호가 10번이면 월급을 출력, 아니면 0을 출력하시오. 
select deptno, decode(deptno, 10, sal,0) as "10"
from emp;

--위의 sql에 이어서 부서번호가 20 번이면 월급을 출력, 아니면 0을 출력하고 또 부서번호가 
-- 30번이면 월급을 출력하고 아니면 0을 출력하시오. 
select  
    decode(deptno, 10, sal, 0)as "10",
    decode(deptno, 20, sal, 0)as "20",
    decode(deptno, 30, sal, 0)as "30"
from emp;

-- (가로 출력) 
-- 위의 결과를 다시 출력하는데 앞에 부서번호는 지우고 sum 을 써서 월급을 다 더해서
-- 출력하시오.
select  
    sum(decode(deptno, 10, sal, 0))as "10",
    sum(decode(deptno, 20, sal, 0))as "20",
    sum(decode(deptno, 30, sal, 0))as "30"
from emp;

-- 직업, 직업별 총 월급을 출력하시오. (세로로 출력) 
select job, sum(sal) 
from emp 
group by job;

-- -- 직업, 직업별 총 월급을 출력하시오. (가로로 출력) 
select 
    sum(decode(job,'PRESIDENT', sal, 0)) as PRESIDENT,
    sum(decode(job,'MANAGER', sal, 0)) as MANAGER,
    sum(decode(job,'SALESMAN', sal, 0)) as SALESMAN,
    sum(decode(job,'CLERK', sal, 0)) as CLERK,
    sum(decode(job,'ANALYST', sal, 0)) as ANALYST
from emp;

-- 우리 반 테이블에서 통신사를 뽑고 통신사별 평균 나이를 출력하시오. 
select 
    sum(decode(lower(telecom),'kt',avg(age))) as kt,
     sum(decode(lower(telecom),'sk',round(avg(age)))) as sk,
      sum(decode(lower(telecom),'lg',avg(age))) as lg,
       sum(decode(lower(telecom),'알뜰kt',avg(age))) as 알뜰kt
from emp18
group by lower(telecom);


-- (세로 출력) 
-- 입사한 년도 (4자리), 입사한 년도별 총 월급을 출력하시오.
select to_char(hiredate,'RRRR') as 입사년도, sum(sal)
from emp
group by to_char(hiredate,'RRRR');

-- 위의 결과를 가로로 출력하시오. 
select 
    sum(decode(to_char(hiredate,'RRRR'), '1980',sal)) as "1980",
    sum(decode(to_char(hiredate,'RRRR'), '1981',sal)) as "1981",
    sum(decode(to_char(hiredate,'RRRR'), '1982',sal)) as "1982",
    sum(decode(to_char(hiredate,'RRRR'), '1983',sal)) as "1983"
    from emp;

-- 위의 결과를 다시 출력하는데 앞에 job 을 넣고 group by job을 써서 결과 출력
select job,
    sum(decode(to_char(hiredate,'RRRR'), '1980',sal)) as "1980",
    sum(decode(to_char(hiredate,'RRRR'), '1981',sal)) as "1981",
    sum(decode(to_char(hiredate,'RRRR'), '1982',sal)) as "1982",
    sum(decode(to_char(hiredate,'RRRR'), '1983',sal)) as "1983"
from emp
group by job;

-- 다음과 같이 직업별 부서번호별 총 월급을 출력하시오.
select job, 
    sum(decode(deptno,10,sal,0)) as "10",
    sum(decode(deptno,20,sal,0)) as "20",
    sum(decode(deptno,30,sal,0)) as "30"
from emp
group by job;

-- 부서번호, 부서번호 별 총 월급을 가로로 출력하는데 pivot 문 사용하기 
select * 
from (select deptno, sal from emp) 
pivot(sum(sal) for deptno in (10,20,30));

-- pivot 문을 사용해서 직업별 총월급을 세로로 출력하시오. 
select * 
from (select job, sal from emp) 
pivot(sum(sal) for job in 
        ('SALESMAN', 'ANALYST', 'PRESIDENT', 'CLERK', 'MANAGER'));
        
-- 입사한 년도별 총 월급을 pivot 문으로 출력하기 
select * 
from (select to_char(hiredate,'RRRR') as hireyear,sal from emp) 
pivot(sum(sal) for hireyear in ('1980','1981','1982','1983'));

-- 우리 반 테이블에서 성별, 성별 별 평균 나이를 출력하시오. 
select round(남자),round(여자)
from (select gender, age from emp18)
pivot(avg(age) for gender in ('남' as 남자,'여'as 여자));