-- ��� ���̺��� �̸��� ù��° ö�ڸ� ����Ͻÿ�. 
select substr(ename,1,1) 
from emp;

-- ��� ���̺��� �̸��� ����ϰ� �̸��� �� ��° ö�ڸ� ����Ͻÿ�. 
select ename, substr(ename,2,1)
from emp;

-- �츮�� ���̺��� �̸�, �̸��� ���� ����Ͻÿ�. 
select ename, substr(ename,1,1)
from emp18;

-- �츮�� ���̺��� ���� ��, ��, �� �� �л����� �̸��� ������ ����Ͻÿ�.
select ename, birth 
from emp18 
where substr(ename,1,1) in ('��','��','��');

-- �̸� ����ϴµ� �� �� ö�ڸ� ����Ͻÿ�. 
select ename, substr(ename,-1,1) 
from emp;

-- �츮�� ���̺��� �ּҸ� ����ϴµ� ���� 3���ڸ� ����Ͻÿ�. 
select address, substr(address,-3) 
from emp18;

