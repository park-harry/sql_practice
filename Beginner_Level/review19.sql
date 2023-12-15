-- 사원 테이블에서 최대 월급을 출력하시오. 
select max(sal) 
from emp;

-- 직업이 salesman 인 사원들 중에서 최대 월급을 출력하시오. 
select max(sal) 
from emp 
where job = 'SALESMAN';

-- 위의 결과를 다시 출력하는데 직업도 같이 출력하시오. 
select max(sal), job
from emp 
where job = 'SALESMAN'
group by job;

-- 위의 결과에서 where 절을 빼고 실행하면 각 job 마다 max(sal)이 나온다. 
select max(sal), job
from emp 
group by job;

-- 부서번호, 부서번호 별 최대 월급을 출력하시오. 
select deptno, max(sal) 
from emp 
group by deptno;

-- 직업, 직업별 최대 월급을 출력하는데 직업이 salesman은 제외하고 출력하시오.
select job, max(sal)
from emp 
where job <> 'SALESMAN'
group by job;

-- 위의 결과를 다시 출력하는데 직업별 최대월급이 높은 것부터 출력하시오.
select job, max(sal)
from emp 
where job <> 'SALESMAN'
group by job
order by max(sal) desc;

-- 우리 반 테이블에 나이 컬럼 추가하기
alter table emp18 
add age number(10);

update emp18 outer 
set age = (select trunc(months_between(sysdate, birth)/12)
            from emp18 
            where empno = outer.empno);
        
-- (난이도 중)통신사, 통신사 별 최대 나이를 출력하시오.
select lower(telecom),max( age) 
from emp18 
group by lower(telecom);

-- 사원 테이블에서 최소 월급을 출력하시오.
select min(sal) 
from emp;

-- 직업, 직업별 최소월급을 출력하는데 직업별 최소 월급이 높은 것부터 출력하시오.
select job, min(sal)
from emp
group by job
order by min(sal) desc;

-- 성별, 성별 별 최소 나이를 출력하시오. 
select gender, min(age)
from emp18 
group by gender;

-- 부서번호, 부서번호 별 최소 월급을 출력하는데 부서 번호가 10번, 20번만 출력되게 하시오. 
select deptno, min(sal) 
from emp
where deptno in (10,20)
group by deptno;

-- 우리반 테이블에서 성 을 출력하고 성씨 별 최소 나이를 출력하시오.
select substr(ename,1,1) as 성, min(age)
from emp18
group by substr(ename,1,1);

-- 사원 테이블에서 평균 월급을 출력하시오. 
select avg(sal) 
from emp;

--직업, 직업별 평균 월급을 출력하시오. 
select job, round(avg(sal)) 
from emp
group by job;

-- 위의 결과를 다시 출력하는데 직업별 평균 월급이 높은 것부터 출력하시오. 
select job, round(avg(sal)) as "평균 월급"
from emp
group by job
order by "평균 월급" desc;

-- 위의 결과를 다시 출력하는데 직업이 salesman을 제외하고 출력하시오. 
select job, round(avg(sal)) as "평균 월급"
from emp
group by job
order by "평균 월급" desc;

-- 부서번호, 부서번호 별 평균월급을 출력하는데 부서번호가 20인 부서는 제외하고 
-- 부서번호 별 평균월급이 높은 것부터 출력하시오. 
select deptno, round(avg(sal)) 
from emp 
group by deptno
order by avg(sal);

-- 주소를 출력하고 그 옆에 주소의 한 어절이 출력되게 하시오. 
select address, regexp_substr(address,'[^ ]+',1,1)
from emp18;

-- 위의 regexp_substr을 이용해서 주소와 주소 별 평균 나이를 출력하시오.
select regexp_substr(address,'[^ ]+',1,1) as 주소, round(avg(age))
from emp18
group by regexp_substr(address,'[^ ]+',1,1);
-- 위의 sql에 decode를 이용해서 주소와 주소별 평균 나이를 구하시오. 
select decode(regexp_substr(address,'[^ ]+',1,1), '서울','서울특별시'
                , '서울시','서울특별시',regexp_substr(address,'[^ ]+',1,1)) 주소,
        round(avg(age))
from emp18
group by regexp_substr(address,'[^ ]+',1,1);

-- 이름과 커미션 출력 
select ename, comm
from emp;

-- 커미션 평균값 출력 
select avg(comm) 
from emp;

-- 사원 테이블의 월급의 총 값을 구하시오. 
select sum(sal) 
from emp;

-- 직업과 직업별 총 월급을 출려하시오. 
select job, sum(sal) 
from emp 
group by job;

-- 위의 결과를 다시 출력하는데 직업을 abcd 순서대로 정렬해서 출력하시오. 
select job, sum(sal) 
from emp 
group by job
order by job;

--위의 결과를 다시 출력하는데 직업이 salesman 제외하고 출력하시오. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
order by job;

--위의 결과를 다시 출력하는데 직업별 총 월급이 5000 이상인 것만 출력하시오. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
having sum(sal) >= 5000
order by job;

-- 입사한 년도 출력 (4자리로), 그리고 년도별 총 월급을 출력하시오. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
group by to_char(hiredate, 'RRRR');

-- 위의 결과를 다시 출력하는데 입사한 년도가 1980년은 제외하고 출력하시오. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
where to_char(hiredate,'RRRR') <> '1980'
group by to_char(hiredate, 'RRRR');

-- 위의 결과를 다시 출력하는데 입사한 년도별 총 월급이 4000 이상인 것만 출력하시오. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
where to_char(hiredate,'RRRR') <> '1980'
group by to_char(hiredate, 'RRRR')
having sum(sal) >= 4000;

-- 위의 결과를 다시 출력하는데 입사한 년도별 총 월급이 높은 것부터 출력하시오. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
where to_char(hiredate,'RRRR') <> '1980'
group by to_char(hiredate, 'RRRR')
having sum(sal) >= 4000
order by sum(sal) desc;

-- 사원 테이블의 전체 건수가 어떻게 되는가? 
select count(*) 
from emp;

-- 그룹 함수는 null 값을 무시하기 때문에 아래 함수의 값은 4가 나온다.
select count(comm) 
from emp;

-- 직업이 salesman 인 사원들의 인원수를 출력하시오. 
select count(*) 
from emp 
where job <> 'SALESMAN';

-- 직업, 직업별 인원수를 출력하시오. 
select job, count(*)
from emp 
group by job;

-- 위의 결과를 출력하는데 직업 별 인원 수가 2명 이상인 것만 출력하시오.
select job, count(*) 
from emp 
group by job
having count(*) >= 2;

-- 위의 결과를 다시 출력하는데 직업별 인원수가 높은 것부터 출력하시오. 
select job, count(*)
from emp 
group by job 
having count(*) >= 2
order by count(*) desc;

-- 위의 결과를 다시 출력하는데 직업이 salesman은 제외하고 출력하시오. 
select job, count(*)
from emp 
where job <> 'SALESMAN'
group by job 
having count(*) >= 2
order by count(*) desc;

-- market_2022 테이블을 조회하는데 상호명에 스타벅스가 포함되어 있는 데이터에서 시군구명,
-- 시군구명 별 건수를 출력하시오.
select 시군구명, count(*)
from market_2022
where 상호명 like '%스타벅스%'
group by 시군구명;

-- market_2022 테이블에서 상권업종중분류명 이 '커피점/카페'인 상호명, 상호명별 건수를 
-- 출력하는데 상호명별 건수가 높은 것부터 출력하시오.
select 상호명, count(*)
from market_2022
where 상권업종중분류명 = '커피점/카페'
group by 상호명
order by count(*) desc;

-- 위의 결과를 다시 출력하는데 상호명이 카페는 제외하고 출력하시오. 
select 상호명, count(*)
from market_2022
where 상권업종중분류명 = '커피점/카페'
group by 상호명
having 상호명 <> '카페'
order by count(*) desc;

-- 위의 결과를 다시 출력하는데 정렬된 기준으로 맨위에 10개만 출력하시오. 
select 상호명, count(*)
from market_2022
where 상권업종중분류명 = '커피점/카페' and 상호명 <> '카페'
group by 상호명
order by count(*) desc fetch first 10 rows only;

select case when 상호명 like '%스타벅스%' then '스타벅스'
            when 상호명 like '%이디야커피%' then '이디야커피' 
            else 상호명 end as 상호명, count(*)
from market_2022
where 상권업종중분류명 = '커피점/카페' and 상호명 <> '카페'
group by case when 상호명 like '%스타벅스%' then '스타벅스'
            when 상호명 like '%이디야커피%' then '이디야커피' 
            else 상호명 end 
order by count(*) desc fetch first 10 rows only;
