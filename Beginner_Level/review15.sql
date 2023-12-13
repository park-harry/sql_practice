-- ���� ��¥ - �Ի����� �Ҽ��� ���Ĵ� ������ ����Ͻÿ�. 
select trunc(sysdate- hiredate)
from emp;

-- �츮 �� ���̺��� �̸��� ����ϰ� �¾ ��¥���� ���ñ��� �� �� �� ��Ҵ��� ����Ͻÿ�.
select ename, trunc((sysdate - birth)/7)
from emp18;

-- �츮 �� ���̺��� �̸��� ����ϰ� �¾ ��¥���� ���ñ��� �� �� �� ��Ҵ��� ����Ͻÿ�.
select ename, trunc(months_between(sysdate,birth))
from emp18;

-- �׵��� ��ƿ� ���� 300�� �̻��� �л����� �̸��� ��ƿ� ���� ���� ����Ͻÿ�. 
select ename, trunc(months_between(sysdate,birth)) as "��ƿ� ���� ��"
from emp18
where trunc(months_between(sysdate,birth)) >=300;

-- ���� ��¥���� 3���� ���� ��¥�� ����Ͻÿ�. 
select sysdate + 3
from dual;

-- ���� ��¥���� 3�� ��dml ��¥�� ����Ͻÿ�. 
select add_months(sysdate,3)
from dual; 

-- ���� ��¥���� 3�� �� ��¥�� ����Ͻÿ�.
select sysdate + (interval '3' year)
from dual;

-- �̸� �̰� ���� �̰�, ���Ͽ��� 50���� ���� ��¥�� ����Ͻÿ�. (date format 4�ڸ��� �ٲٱ�)  
alter session set nls_date_format = 'RRRR/MM/DD';
select ename, birth, birth + (interval '50' year) as "50��"
from emp18; 

-- ���� ��¥���� �ٷ� ���ƿ��� �������� ��¥�� ����Ͻÿ�. 
select next_day(sysdate, '������') 
from dual;

-- ���ú��� 100�� �ڿ� ���ƿ��� �������� ��¥�� ����Ͻÿ�. 
select next_day(add_months(sysdate,100), '������') 
from dual;

-- ���ú��� 100�� �ڿ� ���ƿ��� �������� ��¥�� ����Ͻÿ�. 
select next_day(add_months(sysdate,100*12), '������') 
from dual;

-- ���� ��¥�� �޿� ������ ��¥�� ����Ͻÿ�. 
select sysdate, last_day(sysdate)
from dual;

-- ���� ��¥���� �Ϸ縦 ���� ��¥�� ��¥�� ����ϰ� �� ���� �� ��¥�� ���� ������ ��¥�� ����Ͻÿ�.
select sysdate + 1 , last_day(sysdate+1)
from dual;