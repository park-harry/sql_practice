-- �̸�, �̸��� ö���� ������ ����Ͻÿ�.
select ename, length(ename) 
from emp18;

-- �츮�� ���̺��� �̸�, �̸���, �̸����� ö���� ������ ����ϴµ� �̸����� ö���� ������
-- ���� �ͺ��� ����Ͻÿ�. 
select ename, email, length(email) 
from emp18 
order by length(email) desc;

-- ���� ����� �ٽ� ����ϴµ� �̸����� ö���� ���̰� 20�� �̻��� �л��鸸 ����Ͻÿ�. 
select ename, email, length(email) 
from emp18 
where length(email) >=20
order by length(email) desc;
