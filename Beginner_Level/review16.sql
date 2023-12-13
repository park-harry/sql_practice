-- 오늘 날짜를 출력하고 그 옆에 오늘의 요일을 출력하시오. 
select sysdate, to_char(sysdate,'day')
from dual;

-- 우리 반 테이블에서 이름, 생일, 태어난 요일을 출력하시오. 
select ename, birth, to_char(birth,'day')
from emp18;

-- 금요일에 태어난 학생들의 이름과 생일과 요일을 출력하시오. 
select ename, birth, to_char(birth,'day') 
from emp18 
where to_char(birth,'day') = '금요일';

select ename, birth, to_char(birth,'day'), -- 금요일
                     to_char(birth,'dy'),  -- 금
                    to_char(birth,'d')   -- 6 (일요일이 1인 기준에서 금요일은 6) 
    from emp18;
    
-- 이름, 생일, 태어난 요일 출력하는데 월화수목금토일 순으로 정렬해서 출력하시오. 
select ename, birth, to_char(birth,'day')
from emp18
order by to_char(birth -1 ,'d');

-- 이름, 입사일, 입사한 년도, 입사한 달, 입사한 일, 입사한 요일을 출력하시오. 
select ename, hiredate, to_char(hiredate,'RRRR') "입사한 년도",
      to_char(hiredate,'mm')  "입사한 달",  to_char(hiredate,'dd') "입사한 일",
      to_char(hiredate,'day')  "입사한 요일"
from emp;

-- 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오. 
-- like 와 between .. and 사용 금지, to_char 이용 
select ename, hiredate
from emp 
where to_char(hiredate,'RRRR')= '1981';

-- 이름, 월급을 출력하는데 월급을 출력할 때 천 단위를 표시하시오. 
-- 금융권에서는 반드시 붙여야 한다. 
select ename, to_char(sal,'$9,999') 
from emp;
select ename, to_char(sal,'L9,999') 
from emp;

-- 이름, 월급 * 1020340 를 출력하시오. (금융권 쪽 SQL 방식으로) 
select ename, to_char(sal*1020340,'L999,999,999,999') 
from emp;

-- 81년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오. 
select ename, hiredate
from emp 
where hiredate ='81/11/17';
-- 위의 SQL 을 서양권에 가서 수행하면 에러가 난다. 위의 날짜 형식은 동양권 날짜 형식이기 때문.
-- 서양권: 일/월/년도 
-- 동양권: 년도/월/일

-- 서양권 환경으로 날짜 형식 변경해보기 
alter session set nls_date_format = 'DD/MM/RRRR';
-- 81년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오
select ename, hiredate
from emp 
where hiredate ='17/11/81';-- 서양권 방식 
-- 확실한 방법 
select ename, hiredate 
from emp 
where hiredate = to_date('1981/11/17','RRRR/MM/DD');

-- 아래의 sql을 튜닝하시오. (튜닝 전)  
select ename, hiredate 
    from emp 
    where to_char(hiredate,'rrrr')='1981';
-- (튜닝 후) 
select ename, hiredate
from emp 
where hiredate between to_date('1981/1/1','RRRR/MM/DD') and 
                        to_date('1981/12/31','RRRR/MM/DD')+1;