-- 사원 테이블에서 이름과 월급, 월급의 십의 자리에서 반올림한 숫자를 출력하시오. 
select ename, sal, round(sal,-2)
from emp;

-- 사원 테이블에서 이름과 월급을 출력하는데 십자리를 포함해서 이후를 다 지우고 출력하시오. 
select ename, sal, trunc(sal,-2)
from emp;

-- 우리반 테이블에서 이름, 나이를 출력하는데 나이가 짝수인 사람만 출력하시오.
select ename,trunc((sysdate-birth)/365)as age
from emp18
where mod(trunc((sysdate-birth)/365),2)=0 ;

-- 우리반 테이블에서 나이가 짝수인 학생들의 이름과 나이를 출력하는데 나이가 높은 
-- 학생부터 출력하시오. 
select ename,trunc((sysdate-birth)/365)as age
from emp18
where mod(trunc((sysdate-birth)/365),2)=0
order by age desc;