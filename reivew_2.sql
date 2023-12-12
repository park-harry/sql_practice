-- emp18 ���̺��� �л��� �̸��� �ּҸ� ����Ͻÿ�. 
select ename || ' �л��� ' || address || '�� ��� �ִ�.' as "�л� �ּ�" 
from emp18;

-- ��� ���̺��� �ߺ��� ������ �����ϰ� ����Ͻÿ�
select distinct job 
from emp;

-- ��� ���̺��� �μ���ȣ�� ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct deptno 
from emp;

-- �츮�� ���̺� (emp18)���� ��Ż縦 ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct lower(telecom) 
from emp18;

-- ��� ���̺��� �ߺ��� ���ŵ� �μ���ȣ�� ������ ����Ͻÿ�. 
select distinct deptno, job 
from emp;
-- distinct�� �ѹ��� �� �� �ִ�. 

-- �츮�� ���̺��� ������ ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�.
select distinct major 
from emp18;

-- �츮�� ���̺��� ������ �Ʒ��� ���� ����Ͻÿ�. 
-- ex) ����� �л��� ������ ���� �̰� ��Ż�� KT �̸�, ��⵵ ���ֽÿ��� ��� �ֽ��ϴ�.
select ename||' �л��� ������ '||gender||'�̰�, ��Ż�� '||telecom||
        '�̸�, '||address||'�� ��� �ֽ��ϴ�.'
from emp18;

-- ��� ���̺��� ������ ��ȣ (mgr)�� ����ϴµ� �ߺ��� �����ؼ� ����Ͻÿ�. 
select distinct mgr
from emp
where mgr is not null;