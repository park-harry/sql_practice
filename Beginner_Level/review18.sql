-- �̸�, �μ���ȣ, ���ʽ��� ����Ͻÿ�. ���ʽ��� �μ���ȣ�� 10���̸� 5000�� ����ϰ� 
-- �μ���ȣ�� 20���̸� 3000�� ����ϰ� ������ �μ���ȣ�� 0�� ����Ͻÿ�.
select ename, deptno, decode(deptno, 10, 5000, 20, 3000,0) as bonus
from emp;

-- �̸�, ����, ���ʽ��� ����ϴµ� ���ʽ��� ������ SALESMAN �̸� 5600, 
-- �׷��� ������ 0�� ����Ͻÿ�. 
select ename, job, decode(job, 'SALESMAN',5600, 0) as bonus
from emp;

-- �̸�, ����, ���ʽ��� ����ϴµ� ���ʽ��� ������ SALESMAN �̸� 5600, ������ analyst�� 
-- 4500, ������ clerk�̸� 2300, ������ ������ 100�� ����ϴµ� ���ʽ��� ���� ������ ����Ͻÿ�. 
select ename, job, 
        decode(job, 'SALESMAN',5600,'ANALYST', 4500, 'CLERK',2300, 1000) as bonus
from emp
order by bonus desc;

-- �̸�, ����, �Ի���, �Ի��� �⵵�� 4�ڸ��� ����ϰ� ���ʽ��� ����ϴµ� ���ʽ��� 
-- �Ի��� �⵵�� 1980�̸� 9000, 1981�̸� 7000, ������ �⵵�� 500�� ����Ͻÿ�.
select ename, sal, hiredate, to_char(hiredate,'RRRR') as "�Ի��� �⵵",
decode (to_char(hiredate,'RRRR'),'1980',9000,'1981',7000,500) as bonus
from emp;

-- �̸�, ����, ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�. 
select ename, job, sal 
from emp 
order by sal desc;

-- �̸��� ���ް� ���ʽ��� ����ϴµ� ���ʽ��� ������ president�� null, ������ ������� �ڱ� ������ 
-- ���ʽ��� ��µǰ� �Ͻÿ�. 
select ename, sal, 
    decode(job,'PRESIDENT',null,sal) as bonus
from emp;

-- ���� ����� �ٽ� ����ϴµ� ���ʽ��� ���� ������� ����Ͻÿ�. 
select ename, sal, 
    decode(job,'PRESIDENT',null,sal) as bonus
from emp
order by bonus desc nulls last;

select ename, sal, 
    decode(job,'PRESIDENT',0,sal) as bonus
from emp
order by bonus desc; 

select ename, sal, 
    decode(job,'PRESIDENT',null,sal) as bonus
from emp
order by to_number(bonus) desc nulls last;

-- �̸�, ����, ���ʽ��� ����ϴµ� ������ 3000 �̻��̸� ���ʽ��� 9000, ������ 1000 �̻��̰� 
-- 3000 ���� ������ ���ʽ��� 2000, �������� 0
select ename, sal, 
    case when sal >= 3000 then 9000 
     when sal >= 1000 then 2000
    else 0 end as bonus
from emp;

-- �̸�, �μ���ȣ, ���ʽ��� ����ϴµ� ���ʽ��� �μ���ȣ 10�̸� 9000, �μ���ȣ 20�̸� 6000,
-- ������ �μ���ȣ�� 0�� ����Ͻÿ�. (case �� ���) 
select ename, deptno, 
    case when deptno = 10 then 9000
        when deptno = 20 then 6000
        else 0 end as bonus 
from emp;

-- �̸�, Ŀ�̼�, ���ʽ��� ����ϴµ� Ŀ�̼��� null �̸� ���ʽ��� 7000, Ŀ�̼��� null �� �ƴϸ� 
-- ���ʽ��� 5000�� ����Ͻÿ�. 
select ename, comm, 
    case when comm is null then 7000
        when comm is not null then 5000 end as bonus 
from emp;

-- �̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� ���� ������� ���� ��������� ����Ͻÿ�. 
select ename, comm
from emp 
order by comm desc nulls last;

-- �̸�, ������ ��ȣ (mgr)�� ����ϴµ� mgr�� ���� ������ ��µǰ� �ϰ� null �� �� �Ʒ���
-- ����Ͻÿ�. 
select ename, mgr 
from emp 
order by mgr desc nulls last;
