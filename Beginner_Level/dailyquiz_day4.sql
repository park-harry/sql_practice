-- market_2017 과 market_2022 테이블을 이용하시오. 
-- 코로나 이전인 market_2017와 코로나 이후인 market_2022 을 각각 쿼리해서 서울시 강남구에 있는
-- 스타벅스 매장이 몇 개가 없어졌는지 출력하시오. 
select count(*)
from market_2017
where 시군구명 = '강남구' and 상호명 like '%스타벅스%'; -- 79
select count(*)
from market_2022
where 시군구명 = '강남구' and 상호명 like '%스타벅스%'; -- 74 
-- 5개 없어졌다. 


-- 우리 반 테이블에서 이메일 도메인을 출력하고 이메일 도메인 별 건수를 출력하는데 건수가 
-- 높은 것부터 출력하시오. 
select substr(email, instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1) domain, count(*)
from emp18
group by substr(email, instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1)
order by domain desc;

-- 우리 반 테이블에서 성씨를 출력하고 성씨 별 인원수를 출력하는데 다음과 같이 '남궁'이 제대로
-- 출력되게 하시오. 
select case when length(ename) = 4 then substr(ename,1,2)
        else substr(ename,1,1) end as 성씨, count(*) 
from emp18
group by case when length(ename) = 4 then substr(ename,1,2)
        else substr(ename,1,1) end;

--  부서번호, 부서 번호별 총 월급을 출력하는데 천 단위를 부여해서 출력하시오. 
select deptno, to_char(sum(sal),'999,999') 
from emp
group by deptno;

-- (세로 출력) 직업, 직업별 총 월급을 출력하는데 직업이 salesman 은 제외하고 출력하고 
-- 직업별 총 월급이 5000 이상인 것만 출력하고 직업별 총 월급이 높은 것부터 출력하시오.
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
having sum(sal) >=5000
order by sum(sal) desc;

-- 직업, 직업별 최대 월급, 직업별 최소 월급, 직업별 총 월급을 출력하시오. 
select job, max(sal), min(sal), sum(sal) 
from emp 
group by job;
