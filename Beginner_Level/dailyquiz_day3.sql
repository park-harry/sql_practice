-- �츮 �� ���̺��� 1993��� 1998�⿡ �¾ �л����� �̸��� ���ϰ� ���̸� ����ϴµ� 
-- ���̰� ���� �л����� ����ϰ� column ���� �ѱ۷� �̸�, ����, ���̷� ����Ͻÿ�.
-- ��� ���� ������ ��ȸ�� �� �ֵ��� SQL�� �ۼ��Ͻÿ�. 
select ename �̸�, birth ����, trunc(months_between(sysdate,birth)/12) ����
from emp18
where birth between to_date('1993/1/1','RRRR/MM/DD') 
        and to_date('1998/12/31','RRRR/MM/DD')+1
order by ���� desc;

-- market_2022 ���̺��� ��ȣ�� ��Ÿ������ �����ϰ� �ִ� ��� ��� ���� ����Ͻÿ�.  
select *
from market_2022
where ��ȣ�� like '%��Ÿ����%';

-- market_2022 ���� �ñ����� �÷��� �����͸� ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct �ñ�����
from market_2022;

-- �������� �ִ� ��Ÿ���� ������ ��� �÷��� �����͸� ����Ͻÿ�. 
select * 
from market_2022
where �ñ�����= '������' and ��ȣ�� like '%��Ÿ����%' ;

-- �̸�, ����, �Ի���, �Ի��� �⵵�� 4�ڸ��� ����Ͻÿ�. 
select ename, sal, hiredate, to_char(hiredate,'RRRR') as "�Ի��� �⵵"
from emp;