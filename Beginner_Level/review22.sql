select sum(bicycle), sum(camera), sum(notebook)
from order2;
-- ���� ���� sql�� �ۼ� ��, ��ǰ�� ���鰳�� �ڵ尡 �ʹ� �������. 

-- column�� row�� �ٲٱ� 
select * 
from order2 
unpivot (���� for item in (bicycle, camera, notebook));

-- ���� unpivot ���� ����� ���̺��� �����Ѵ�. (dba���� Ư��) 
create table order3 as 
select * 
from order2
unpivot (���� for item in (bicycle, camera, notebook));

commit;

select item,sum(����)
from order3
group by item;

-- unpivot ���� �̿��ؼ� column�� row�� �����Ͻÿ�. 
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

-- ���� ����� crime_time2 ��� ���̺�� �����Ͻÿ�. 
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
-- ������ ���� ���� �Ͼ�� �ð��븦 ����Ͻÿ�. 
select time 
from crime_time2
where crime_type = '����'
order by event desc fetch first 1 rows only;

-- ��ȭ�� ���� ���� �Ͼ�� �ð��� ���� 1���� 2���� ����Ͻÿ�. 
select time 
from crime_time2
where crime_type = '��ȭ'
order by event desc fetch first 2 rows only;
