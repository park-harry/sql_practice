select sum(bicycle), sum(camera), sum(notebook)
from order2;
-- 위와 같이 sql을 작성 시, 물품이 수백개면 코드가 너무 길어진다. 

-- column을 row로 바꾸기 
select * 
from order2 
unpivot (개수 for item in (bicycle, camera, notebook));

-- 위의 unpivot 문의 결과로 테이블을 생성한다. (dba만의 특권) 
create table order3 as 
select * 
from order2
unpivot (개수 for item in (bicycle, camera, notebook));

commit;

select item,sum(개수)
from order3
group by item;

-- unpivot 문을 이용해서 column을 row로 변경하시오. 
select * 
from cols 
where table_name = 'CRIME_TIME';

select * 
from crime_time
unpivot( event for time in (F0T3,
                            F3T6,
                            F6T9,
                            F9T12,
                            F12T15,
                            F15T18,
                            F18T21,
                            F21T24));

-- 위의 결과를 crime_time2 라는 테이블로 생성하시오. 
create table crime_time2 as 
select * 
from crime_time
unpivot( event for time in (F0T3,
                            F3T6,
                            F6T9,
                            F9T12,
                            F12T15,
                            F15T18,
                            F18T21,
                            F21T24));
commit;
select * from crime_time2;
-- 살인이 가장 많이 일어나는 시간대를 출력하시오. 
select time 
from crime_time2
where crime_type = '살인'
order by event desc fetch first 1 rows only;

-- 방화가 가장 많이 일어나는 시간대 순위 1위와 2위를 출력하시오. 
select time 
from crime_time2
where crime_type = '방화'
order by event desc fetch first 2 rows only;
