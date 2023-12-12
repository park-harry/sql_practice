-- dept ���̺� ��ü�� ����Ͻÿ�
select * 
from dept;

-- emp ���̺��� ������ Ȯ���ϴ� ��ɾ� 
desc emp;

-- ��� ���̺��� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp;

-- ��� ���̺��� �̸��� ������ �μ���ȣ�� ����Ͻÿ�. 
select ename, job, deptno
from emp;

-- ��� ���̺��� �����ȣ, �̸�, ����, �Ի����� ����Ͻÿ�.
select empno, ename, sal, hiredate
from emp;

-- ������̺��� �����ȣ, �̸�, ����, ����, Ŀ�̼�, �μ���ȣ�� ����Ͻÿ�.
select empno, ename, sal, job, comm, deptno
from emp;

-- �μ� ���̺��� �μ���ġ�� ����Ͻÿ� 
select loc 
from dept; 

-- �μ� ���̺��� �μ���ġ�� �μ����� ����Ͻÿ�. 
select loc, dname 
from dept;

-- ������ ���� ��µǴ� �÷����� �ѱ۷� ��µǰ� �Ͻÿ� 
select empno as �����ȣ, ename as ����̸�, sal as ���� 
    from emp;
-- as �� ���� ���� 

-- ����̸�, ������ �μ���ȣ�� ����ϴµ� �÷����� �ѱ۷� ����Ͻÿ�.
select ename as ����̸�, job as ����, deptno as �μ���ȣ 
from emp;

-- �μ� ���̺��� �μ� ��ȣ�� �μ� ��ġ�� ����ϴµ� column ����
-- Department number�� Department location ���� ��µǰ� �Ͻÿ�.
select deptno as "Department number", loc as "Department location"
from dept;

--��� ���̺��� �̸�, ����, ���� +300 *2�� ����ϰ� �÷����� ���ʽ��� ����Ͻÿ�.
select ename, sal, sal + 300*2 as bonus
from emp;



