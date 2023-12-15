-- 이름, 부서번호, 보너스를 출력하시오. 보너스는 부서번호가 10번이면 5000을 출력하고 
-- 부서번호가 20번이면 3000을 출력하고 나머지 부서번호는 0을 출력하시오.
select ename, deptno, decode(deptno, 10, 5000, 20, 3000,0) as bonus
from emp;

-- 이름, 직업, 보너스를 출력하는데 보너스가 직업이 SALESMAN 이면 5600, 
-- 그렇지 않으면 0을 출력하시오. 
select ename, job, decode(job, 'SALESMAN',5600, 0) as bonus
from emp;

-- 이름, 직업, 보너스를 출력하는데 보너스가 직업이 SALESMAN 이면 5600, 직업이 analyst면 
-- 4500, 직업이 clerk이면 2300, 나머지 직업은 100을 출력하는데 보너스가 높은 순으로 출력하시오. 
select ename, job, 
        decode(job, 'SALESMAN',5600,'ANALYST', 4500, 'CLERK',2300, 1000) as bonus
from emp
order by bonus desc;

-- 이름, 월급, 입사일, 입사한 년도를 4자리로 출력하고 보너스를 출력하는데 보너스가 
-- 입사한 년도가 1980이면 9000, 1981이면 7000, 나머지 년도면 500을 출력하시오.
select ename, sal, hiredate, to_char(hiredate,'RRRR') as "입사한 년도",
decode (to_char(hiredate,'RRRR'),'1980',9000,'1981',7000,500) as bonus
from emp;

-- 이름, 직업, 월급을 출력하는데 월급이 높은 사원부터 출력하시오. 
select ename, job, sal 
from emp 
order by sal desc;

-- 이름과 월급과 보너스를 출력하는데 보너스가 직업이 president면 null, 나머지 사원들은 자기 월급이 
-- 보너스로 출력되게 하시오. 
select ename, sal, 
    decode(job,'PRESIDENT',null,sal) as bonus
from emp;

-- 위의 결과를 다시 출력하는데 보너스가 높은 사원부터 출력하시오. 
select ename, sal, 
    decode(job,'PRESIDENT',null,sal) as bonus
from emp
order by bonus desc nulls last;

select ename, sal, 
    decode(job,'PRESIDENT',0,sal) as bonus
from emp
order by bonus desc; 

select ename, sal, 
    decode(job,'PRESIDENT',null,sal) as bonus
from emp
order by to_number(bonus) desc nulls last;

-- 이름, 월급, 보너스를 출력하는데 월급이 3000 이상이면 보너스를 9000, 월급이 1000 이상이고 
-- 3000 보다 작으면 보너스를 2000, 나머지는 0
select ename, sal, 
    case when sal >= 3000 then 9000 
     when sal >= 1000 then 2000
    else 0 end as bonus
from emp;

-- 이름, 부서번호, 보너스를 출력하는데 보너스가 부서번호 10이면 9000, 부서번호 20이면 6000,
-- 나머지 부서번호는 0을 출력하시오. (case 문 사용) 
select ename, deptno, 
    case when deptno = 10 then 9000
        when deptno = 20 then 6000
        else 0 end as bonus 
from emp;

-- 이름, 커미션, 보너스를 출력하는데 커미션이 null 이면 보너스를 7000, 커미션이 null 이 아니면 
-- 보너스를 5000을 출력하시오. 
select ename, comm, 
    case when comm is null then 7000
        when comm is not null then 5000 end as bonus 
from emp;

-- 이름과 커미션을 출력하는데 커미션이 높은 사원부터 낮은 사원순으로 출력하시오. 
select ename, comm
from emp 
order by comm desc nulls last;

-- 이름, 관리자 번호 (mgr)을 출력하는데 mgr이 높은 값부터 출력되게 하고 null 을 맨 아래로
-- 출력하시오. 
select ename, mgr 
from emp 
order by mgr desc nulls last;
