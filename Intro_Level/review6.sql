-- 우리반 테이블에서 성별이 남자인 학생들의 모든 컬럼의 데이터를 출력하시오. 
select * 
from emp18 
where gender = '남';

-- 사원 테이블에서 월급이 3000이 아닌 사원들의 이름과 월급과 직업을 
-- 출력하는데 입사일이 최근에 입사한 사원부터 출력하시오. 
select ename, sal, job
from emp
where sal <> 3000 
order by hiredate desc;

-- 부서번호가 20번인 사원들의 이름과 직업과 월급을 출력하는데 직업은
-- ascending하게 출력한 것을 기준으로 월급을 descending 하게 출력하시오.
select ename, job, sal 
from emp 
where deptno = 20 
order by job asc, sal desc;

-- 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하시오.
select ename, sal 
from emp
where sal between 1000 and 3000;

-- 입사일이 81/1/1 부터 81/12/31 사이에 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate 
from emp 
where hiredate between '81/1/1' and '81/12/31';

-- 우리반 테이블에서 1990년대에 태어난 학생들의 이름과 생일을 출력하시오
select ename, birth 
from emp18 
where birth between '1990/1/1' and '1999/12/31';

-- 월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급을 출력하시오.
select ename, sal 
from emp 
where sal not between 1000 and 3000;

--사원 테이블에서 1981년도에 입사하지 않은 사원들의 이름과 입사일을 출력하시오.
select ename, hiredate 
from emp 
where hiredate not between '1981/1/1' and '1981/12/31';

-- 사원 테이블에서 이름이 S로 시작하는 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename like 'S%';

-- 사원 테이블에서 이름의 끝 철자가 T로 끝나는 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename like '%T';

-- 우리반 테이블에서 성씨가 김씨인 학생들의 이름과 주소를 출력하시오. 
select ename, address
from emp18 
where ename like '김%';

-- 우리반 테이블에서 성씨가 김씨가 아닌 학생들의 이름과 주소를 출력하시오.
select ename, address
from emp18 
where ename not like '김%';

-- 우리반 테이블에서 전공(major)에 '경영'을 포함하고 있는 학생들의 이름과 전공을 출력하시오. 
select ename, major 
from emp18 
where major like '%경영%';

-- 우리반 테이블에서 naver 메일을 사용하는 학생들의 이름과 이메일을 출력하시오.
select ename, email 
from emp18 
where email like '%naver%';

--사원 테이블에서 이름의 2번째 철자기 %인 사원들의 이름과 월급을 출력하시오. 
select ename, sal 
from emp 
where ename like '_m%%' escape 'm'; 

--사원 테이블에서 이름의 2번째 철자가 M인 사원들의 이름을 출력하시오. 
select ename 
from emp 
where ename like '_M%';

--사원 테이블에서 이름의 3번째 철자가 L인 사원들의 이름을 출력하시오. 
select ename
from emp 
where ename like '__L%';

-- 이름의 2번째 철자와 3번째 철자가 %인 사원의 이름을 출력하시오.
select ename 
from emp 
where ename like '_m%m%%' escape 'm';

-- 우리반 테이블에서 서울시에서 거주하는 학생들의 이름과 주소를 출력하시오.
select ename, address 
from emp18 
where address like '%서울%';

-- 우리반 테이블에서 생일이 11월 달인 학생들의 이름과 생일을 출력하시오.
select ename, birth 
from emp18 
where birth like '%/11/%';

-- 커미션이 null인 사원들의 이름과 커미션을 출력하시오. 
select ename, comm
from emp 
where comm is null;

-- 커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오. 
select ename, comm
from emp 
where comm is not null;

-- 사원번호가 7788, 7902, 7369 번인 사원들의 사원번호와 이름을 조회하시오. 
select empno, ename 
from emp 
where empno in (7788,7902,7369);

-- 직업이 SALESMAN, ANALYST 인 사원들의 이름과 직업을 출력하시오. 
select ename, job 
from emp 
where job in ('SALESMAN', 'ANALYST');

-- 우리반 테이블에서 성 이 김씨, 이씨, 박씨 인 학생들의 이름과 주소를 출력하시오.
select ename, address
from emp18 
where substr(ename,1,1) in ('김','이','박');

select ename, address
from emp18 
where ename like '김%' 
    or ename like '이%'
    or ename like '박%';
    
-- 부서번호가 10번, 20번이 아닌 사원들의 이름과 부서번호를 출력하시오. 
select ename, deptno 
from emp 
where deptno not in (10,20);

-- 부서번호가 10번, 20번인 사원들의 이름과 월급과 부서번호를 출력하는데 
-- 월급이 높은 사원부터 출력하시오. 
select ename, deptno 
from emp 
where deptno in (10,20)
order by sal desc;
