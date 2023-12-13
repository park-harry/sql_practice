-- 오늘 날짜 - 입사일을 소수점 이후는 버리고 출력하시오. 
select trunc(sysdate- hiredate)
from emp;

-- 우리 반 테이블에서 이름을 출력하고 태어난 날짜부터 오늘까지 총 몇 주 살았는지 출력하시오.
select ename, trunc((sysdate - birth)/7)
from emp18;

-- 우리 반 테이블에서 이름을 출력하고 태어난 날짜부터 오늘까지 총 몇 달 살았는지 출력하시오.
select ename, trunc(months_between(sysdate,birth))
from emp18;

-- 그동안 살아온 달이 300달 이상인 학생들의 이름과 살아온 개월 수를 출력하시오. 
select ename, trunc(months_between(sysdate,birth)) as "살아온 개월 수"
from emp18
where trunc(months_between(sysdate,birth)) >=300;

-- 오늘 날짜에서 3일을 더한 날짜를 출력하시오. 
select sysdate + 3
from dual;

-- 오늘 날짜에서 3달 뒤dml 날짜를 출력하시오. 
select add_months(sysdate,3)
from dual; 

-- 오늘 날짜에서 3년 뒤 날짜를 출력하시오.
select sysdate + (interval '3' year)
from dual;

-- 이름 뽑고 생일 뽑고, 생일에서 50년을 더한 날짜를 출력하시오. (date format 4자리로 바꾸기)  
alter session set nls_date_format = 'RRRR/MM/DD';
select ename, birth, birth + (interval '50' year) as "50살"
from emp18; 

-- 오늘 날짜에서 바로 돌아오는 월요일의 날짜를 출력하시오. 
select next_day(sysdate, '월요일') 
from dual;

-- 오늘부터 100달 뒤에 돌아오는 월요일의 날짜를 출력하시오. 
select next_day(add_months(sysdate,100), '월요일') 
from dual;

-- 오늘부터 100년 뒤에 돌아오는 월요일의 날짜를 출력하시오. 
select next_day(add_months(sysdate,100*12), '월요일') 
from dual;

-- 오늘 날짜의 달에 마지막 날짜를 출력하시오. 
select sysdate, last_day(sysdate)
from dual;

-- 오늘 날짜에서 하루를 더한 날짜의 날짜를 출력하고 그 옆에 그 날짜의 달의 마지막 날짜를 출력하시오.
select sysdate + 1 , last_day(sysdate+1)
from dual;