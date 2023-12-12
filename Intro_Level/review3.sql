-- �̸��� ������ ����ϴµ� ������ ���� ������� ���� ��������� ����Ͻÿ�.
select ename, sal 
from emp
order by sal asc;

-- �̸��� ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�. 
select ename, sal 
from emp
order by sal desc;

-- �̸��� �Ի����� ����ϴµ� �ֱٿ� �Ի��� ������� ��µǰ� �Ͻÿ�. 
select ename, hiredate 
from emp
order by hiredate desc;

-- �츮�� ���̺�(emp18)���� �̸��� ������ ����ϴµ� �����ٶ� ������ �����ؼ� 
-- �̸��� ����Ͻÿ�.
select ename, birth 
from emp18 
order by ename asc;

-- �츮�� ���̺�(emp18)���� �̸��� ������ ����ϴµ� ������ ascending �ϰ� ����Ͻÿ�. 
select ename, birth 
from emp18 
order by birth asc;

-- ��� ���̺��� �̸��� �μ���ȣ�� ������ ����ϴµ� �μ���ȣ�� ascending �ϰ� ��µ� ����
-- �������� ������ descending �ϰ� ����Ͻÿ�. 
select ename, deptno, sal 
from emp 
order by deptno asc, sal desc;

-- �̸�, ����, �Ի����� ����ϴµ� ������ ABCD ������� �����ؼ� ����ϰ� ������ ABCD 
-- ������� �����ؼ� ����Ѱ��� �������� �ΰ� �Ի����� ���� �Ի��� ������� ��µǰ� �Ͻÿ�. 
select ename, job, hiredate 
from emp 
order by job asc, hiredate asc;

-- �̸�, ����, ���� + 300 *2 �� ����ϴµ� ����+300*2 �� ���� ���� ������� ����Ͻÿ�. 
select ename, job, sal +300*2 as bonus 
from emp
order by bonus desc;

-- �츮�� ���̺��� �̸��� �ּҸ� ����ϴµ� �ּҸ� ascending �ϰ� ����ϰ�,
-- �÷����� �ѱ۷� �̸�, �ּҷ� ��µǰ� �Ͻÿ�. 
select ename as �̸�, address as �ּ�
from emp18 
order by �ּ� asc