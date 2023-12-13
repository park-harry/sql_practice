-- 우리 반 테이블에서 1993년과 1998년에 태어난 학생들의 이름과 생일과 나이를 출력하는데 
-- 나이가 높은 학생부터 출력하고 column 명을 한글로 이름, 생일, 나이로 출력하시오.
-- 어느 나라에 가서도 조회될 수 있도록 SQL을 작성하시오. 
select ename 이름, birth 생일, trunc(months_between(sysdate,birth)/12) 나이
from emp18
where birth between to_date('1993/1/1','RRRR/MM/DD') 
        and to_date('1998/12/31','RRRR/MM/DD')+1
order by 나이 desc;

-- market_2022 테이블에서 상호명에 스타벅스를 포함하고 있는 모든 행과 열을 출력하시오.  
select *
from market_2022
where 상호명 like '%스타벅스%';

-- market_2022 에서 시군구명 컬럼의 데이터를 출력하는데 중복을 제거해서 출력하시오. 
select distinct 시군구명
from market_2022;

-- 강남구에 있는 스타벅스 매장의 모든 컬럼과 데이터를 출력하시오. 
select * 
from market_2022
where 시군구명= '강남구' and 상호명 like '%스타벅스%' ;

-- 이름, 월급, 입사일, 입사한 년도를 4자리로 출력하시오. 
select ename, sal, hiredate, to_char(hiredate,'RRRR') as "입사한 년도"
from emp;