-- �츮�� ���̺��� ������ ������ �л����� ��� �÷��� �����͸� ����Ͻÿ�. 
select * 
from emp18 
where gender = '��';

-- ��� ���̺��� ������ 3000�� �ƴ� ������� �̸��� ���ް� ������ 
-- ����ϴµ� �Ի����� �ֱٿ� �Ի��� ������� ����Ͻÿ�. 
select ename, sal, job
from emp
where sal <> 3000 
order by hiredate desc;

-- �μ���ȣ�� 20���� ������� �̸��� ������ ������ ����ϴµ� ������
-- ascending�ϰ� ����� ���� �������� ������ descending �ϰ� ����Ͻÿ�.
select ename, job, sal 
from emp 
where deptno = 20 
order by job asc, sal desc;

-- ������ 1000���� 3000 ������ ������� �̸��� ������ ����Ͻÿ�.
select ename, sal 
from emp
where sal between 1000 and 3000;

-- �Ի����� 81/1/1 ���� 81/12/31 ���̿� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate 
from emp 
where hiredate between '81/1/1' and '81/12/31';

-- �츮�� ���̺��� 1990��뿡 �¾ �л����� �̸��� ������ ����Ͻÿ�
select ename, birth 
from emp18 
where birth between '1990/1/1' and '1999/12/31';

-- ������ 1000���� 3000 ���̰� �ƴ� ������� �̸��� ������ ����Ͻÿ�.
select ename, sal 
from emp 
where sal not between 1000 and 3000;

--��� ���̺��� 1981�⵵�� �Ի����� ���� ������� �̸��� �Ի����� ����Ͻÿ�.
select ename, hiredate 
from emp 
where hiredate not between '1981/1/1' and '1981/12/31';

-- ��� ���̺��� �̸��� S�� �����ϴ� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename like 'S%';

-- ��� ���̺��� �̸��� �� ö�ڰ� T�� ������ ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename like '%T';

-- �츮�� ���̺��� ������ �达�� �л����� �̸��� �ּҸ� ����Ͻÿ�. 
select ename, address
from emp18 
where ename like '��%';

-- �츮�� ���̺��� ������ �达�� �ƴ� �л����� �̸��� �ּҸ� ����Ͻÿ�.
select ename, address
from emp18 
where ename not like '��%';

-- �츮�� ���̺��� ����(major)�� '�濵'�� �����ϰ� �ִ� �л����� �̸��� ������ ����Ͻÿ�. 
select ename, major 
from emp18 
where major like '%�濵%';

-- �츮�� ���̺��� naver ������ ����ϴ� �л����� �̸��� �̸����� ����Ͻÿ�.
select ename, email 
from emp18 
where email like '%naver%';

--��� ���̺��� �̸��� 2��° ö�ڱ� %�� ������� �̸��� ������ ����Ͻÿ�. 
select ename, sal 
from emp 
where ename like '_m%%' escape 'm'; 

--��� ���̺��� �̸��� 2��° ö�ڰ� M�� ������� �̸��� ����Ͻÿ�. 
select ename 
from emp 
where ename like '_M%';

--��� ���̺��� �̸��� 3��° ö�ڰ� L�� ������� �̸��� ����Ͻÿ�. 
select ename
from emp 
where ename like '__L%';

-- �̸��� 2��° ö�ڿ� 3��° ö�ڰ� %�� ����� �̸��� ����Ͻÿ�.
select ename 
from emp 
where ename like '_m%m%%' escape 'm';

-- �츮�� ���̺��� ����ÿ��� �����ϴ� �л����� �̸��� �ּҸ� ����Ͻÿ�.
select ename, address 
from emp18 
where address like '%����%';

-- �츮�� ���̺��� ������ 11�� ���� �л����� �̸��� ������ ����Ͻÿ�.
select ename, birth 
from emp18 
where birth like '%/11/%';

-- Ŀ�̼��� null�� ������� �̸��� Ŀ�̼��� ����Ͻÿ�. 
select ename, comm
from emp 
where comm is null;

-- Ŀ�̼��� null�� �ƴ� ������� �̸��� Ŀ�̼��� ����Ͻÿ�. 
select ename, comm
from emp 
where comm is not null;

-- �����ȣ�� 7788, 7902, 7369 ���� ������� �����ȣ�� �̸��� ��ȸ�Ͻÿ�. 
select empno, ename 
from emp 
where empno in (7788,7902,7369);

-- ������ SALESMAN, ANALYST �� ������� �̸��� ������ ����Ͻÿ�. 
select ename, job 
from emp 
where job in ('SALESMAN', 'ANALYST');

-- �츮�� ���̺��� �� �� �达, �̾�, �ھ� �� �л����� �̸��� �ּҸ� ����Ͻÿ�.
select ename, address
from emp18 
where substr(ename,1,1) in ('��','��','��');

select ename, address
from emp18 
where ename like '��%' 
    or ename like '��%'
    or ename like '��%';
    
-- �μ���ȣ�� 10��, 20���� �ƴ� ������� �̸��� �μ���ȣ�� ����Ͻÿ�. 
select ename, deptno 
from emp 
where deptno not in (10,20);

-- �μ���ȣ�� 10��, 20���� ������� �̸��� ���ް� �μ���ȣ�� ����ϴµ� 
-- ������ ���� ������� ����Ͻÿ�. 
select ename, deptno 
from emp 
where deptno in (10,20)
order by sal desc;
