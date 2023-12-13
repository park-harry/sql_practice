-- 이름과 월급을 출력하는데 월급을 출력할 때 전체를 10자리로 잡고, 월급의 나머지 자리에 
-- *을 채워넣으시오. 
select ename, lpad(sal,10,'*')
from emp;
select ename, rpad(sal,10,'*')
from emp;

-- 우리 반 테이블에서 인천 논현동에서 거주하는 학생의 이름과 주소를 출력하시오. 
select ename, address
from emp18 
where trim(address) = '인천 논현동';
-- 우리 반 테이블에서 이메일을 출력하는데 이메일 끝에 .com 을 잘라내서 출력하시오.
select email, rtrim(email,'.com') 
from emp18;

-- 위의 결과를 다시 출력하는데 .net도 잘라내시오. 
select email, rtrim(rtrim(email,'.net') ,'.com')
from emp18;
-- kimjunhwan11@nate.com -> kimjunhwan11@na 로 나온다 
-- .net 중에 어느 하나의 철자가 있으면 다 잘라낸다. 
-- 해결:
select email, substr(email, 1,instr(email,'.')-1)
from emp18;