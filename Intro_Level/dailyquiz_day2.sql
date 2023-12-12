-- 우리반 테이블에서 통신사가 kt 인 학생들의 이름과 통신사를 출력하는데 알뜰 kt도 
-- 출력되어야 한다. (or 사용 금지!) 
select ename, telecom 
from emp18 
where lower(telecom) like '%kt%';

-- 직업이 SALESMAN, ANALYST 가 아닌 사원들의 이름과 월급을 출력하는데 
-- 월급이 높은 사원부터 출력하시오. 
select ename, sal 
from emp
where job not in ('SALESMAN', 'ANALYST')
order by sal desc;

-- 이름을 출력하는데 이름이 A%%B와 A%B는 제외하고 출력하시오.
select ename 
from emp 
where ename not in ('A%%B','A%B');

-- 위의 결과를 다시 출력하는데 첫 번째 철자는 대문자로, 나머지는 소문자로 출력하시오.
select initcap(ename) 
from emp 
where ename not in ('A%%B','A%B');

-- 우리 반 테이블에서 이메일을 출력하는데 이름과 이메일 도메인만 출력하시오. 
-- ex) 박성환 gmail 
select ename,
    substr(email,instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1) as domain
from emp18;

-- 사원 테이블에서 이름에 'S'자를 포함하고 있는 사원들의 이름과 입사일을 출력하는데 입사일이 
-- 최근에 입사한 사원부터 출력하시오.
select ename, hiredate 
from emp 
where ename like '%S%'
order by hiredate desc;

-- 1981년도에 입사한 사원들의 이름과 월급과 입사일을 출력하는데 입사일이 
-- 최근에 입사한 사원부터 출력하시오.
select ename, sal, hiredate 
from emp 
where hiredate between '1981/1/1' and '1981/12/31'
order by hiredate desc;
