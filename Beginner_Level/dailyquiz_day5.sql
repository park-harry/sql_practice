select nvl(job,'전체 집계'), 
        to_char(sum(sal),'999,999' )as 토탈월급 
from emp 
group by rollup(job);

-- 입사한 년도(4자리), 입사한 년도별 총 월급을 출력하는데 맨 아래에 
-- 전체 총 월급도 출력하시오. 
select to_char(hiredate,'RRRR'), sum(sal) 
from emp
group by rollup (to_char(hiredate,'RRRR'));

-- 부서번호, 직업, 부서번호별 직업별 총 월급을 출력하시오. 
select deptno, job, sum(sal) 
from emp 
group by deptno,job
order by deptno, job;

-- 위의 결과를 다시 출력하는데 ROLLUP을 써서 출력하시오. 
select nvl(to_char(deptno),'TOTAL') as 부서번호, 
        nvl(job,'TOTAL SALARY') as 직업, 
        sum(sal) 
from emp 
group by rollup(deptno,job)
order by deptno, job;

-- 우리 반 테이블에서 성별, 통신사, 평균 나이를 출력하는데 rollup을 이용하여 아래의 
-- 3가지 그룹핑된 결과 집합이 출력되게 하시오. 
select gender, 
    case when gender is null then '전체토탈' 
    else nvl(lower(telecom),'토탈') end as telecom, 
    round(avg(age))
from emp18 
group by rollup(gender, lower(telecom))
order by gender, lower(telecom);

