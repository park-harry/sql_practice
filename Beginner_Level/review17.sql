-- �̸��� ����, Ŀ�̼�, ���� + Ŀ�̼��� ����Ͻÿ�. 
select ename, comm, sal + comm
from emp;

-- �̸��� ����, Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� 0���� ����Ͻÿ�. 
select ename, nvl(comm,0)
from emp;

-- �̸�, ������ ����ϴµ� ������ null �� ������� no job���� ����Ͻÿ�. 
select ename, nvl(job, 'no job')
from emp;

-- (���̵� ��) �̸�, ����, Ŀ�̼��� ����ϴµ� Ŀ�̼��� NULL �� ������� NO COMM�̶�� 
-- �۾��� ����Ͻÿ�. 
select ename, sal, nvl(to_char(comm), 'no comm') 
from emp;

-- �̸�, ����, Ŀ�̼�, ���� + Ŀ�̼��� ����Ͻÿ�. 
select ename, sal, comm, nvl2(comm, sal+comm, sal)
from emp;

-- �̸�, mgr�� ����ϴµ� mgr�� null ����� no manager�� ��µǰ� �Ͻÿ�. 
select ename, nvl(to_char(mgr),'no manager')
from emp;
