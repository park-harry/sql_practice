-- ��� ���̺��� ������ 3000 �̻��� ����� ���
select sal 
from emp
where sal >= 3000;

-- �����ȣ�� 7788���� ����� �����ȣ�� �̸��� ������ ��ȸ�Ͻÿ�.
select empno, ename, sal 
from emp 
where empno = 7788;

-- ������ 2000 �̻��� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where sal >= 2000;

-- ���� 2500 ������ ������� �̸��� ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�. 
select ename, sal 
from emp 
where sal <= 2500
order by sal desc;

-- ������ SALESMAN�� ������� �̸��� ������ ����Ͻÿ�. 
select ename, job 
from emp 
where job = 'SALESMAN';

-- ��� �̸��� SCOTT�� ����� �̸��� ���ް� ������ ����Ͻÿ�. 
select ename, sal, job 
from emp 
where ename = 'SCOTT';

-- �츮�� ���̺��� ������ ������ �л����� �̸��� ������ �ּҸ� ����Ͻÿ�. 
select ename, gender, address 
from emp18 
where gender = '��';

-- �Ի����� 81�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate 
from emp 
where hiredate = '81/11/17';

-- ��Ż簡 kt�� �л����� �̸��� ��Ż縦 ����Ͻÿ�. 
select ename, telecom 
from emp18 
where lower(telecom) = 'kt';

-- ������ SALESMAN�� �ƴ� ������� �̸��� ������ ����Ͻÿ�.
select ename, job 
from emp 
where job <> 'SALESMAN';

-- �μ���ȣ�� 10���� �ƴ� ������� �̸��� ���ް� �μ���ȣ�� ����ϴµ� ������ ���� ������� 
-- ����Ͻÿ�. 
select ename, sal, deptno 
from emp 
where deptno <> 10 
order by sal desc;