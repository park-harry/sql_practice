-- �̸�, ����, ���޿� ���� ������ ����Ͻÿ�. 
select ename, sal, rank() over (order by sal desc) as ����
from emp;
-- �μ� ��ȣ, �̸�, ����, ���޿� ���� ������ ����ϴµ� �μ���ȣ ���� ���� ������ ���� 
-- ������� ������ �ο��Ͻÿ�. 
select deptno, ename, sal, 
        rank() over (partition by deptno order by sal desc) as ����
from emp;

-- ����, �̸�, ����, ������ ����ϴµ� ������ ���� ���� ���� ������ ���� ��� ������ 
-- ������ �ο��Ͻÿ�. 
select job, ename, sal,
        rank() over(partition by job order by sal desc) as ����
from emp;

-- ������ 1000���� 3000 ������ ������� �̸�, ����, ���޿� ���� ������ ����Ͻÿ�.
select ename, sal, rank() over (order by sal desc)as ���� 
from emp 
where sal between 1000 and 3000;


-- �μ���ȣ, �̸�, �Ի���, ������ ����ϴµ� ������ �μ� ��ȣ ���� ���� ���� �Ի��� 
-- ��������� ������ �ο��Ͻÿ�. 
select deptno,ename, hiredate,
        dense_rank() over(partition by deptno order by hiredate) as ����
from emp;

-- ���� 1250�� ��� ���̺��� ������ ������ ��� �Ǵ°�? 
select dense_rank(1250) within group (order by sal desc) as ����
from emp;

-- 81/11/17�� �Ի��� ����� �� ��°�� �Ի��� ����ΰ�? 
select dense_rank('81/11/17') within group (order by hiredate) as ����
from emp;

-- �츮�� ���̺��� ����, �̸�, ����, ������ ����ϴµ� ������ ���� ���� ���� ���̰� 
-- ���� ������� ������ �ο��Ͻÿ�. 
select gender, ename, age, 
    dense_rank() over(partition by gender order by  age desc)as ����
from emp18;

-- �̸��� ���ް� ���޿� ���� ����� ����Ͻÿ�. (���޿� ���� ����� 4������� ������ ��� �ο�) 
select ename, sal, ntile(4) over (order by sal desc) as ����
from emp;

-- �츮�ݿ��� ��Ż簡 kt�� �л����� �̸��� ���̰� ����� ����ϴµ� ����� 3������� ������
-- ����Ͻÿ�
select ename, age, ntile(3) over (order by age desc) as ����
from emp18 
where lower(telecom) = 'kt';

-- �츮�ݿ��� ��Ż簡 kt, sk �� �л����� �̸��� ���̿� ���̿� ���� ����� ����ϴµ� 
-- ����� 5������� ������ ����Ͻÿ�. 
select ename, age, ntile(5) over (order by age desc) as ����
from emp18 
where lower(telecom) in ('kt','sk');

-- �̸�, ����, ���޿� ���� ����, ������ ���� ������ ����Ͻÿ�. 
select ename, sal, 
        rank() over (order by sal desc) as ����, 
        round(cume_dist() over (order by sal desc),2) as ����
from emp;

-- �μ���ȣ, �μ� ��ȣ���� �ش��ϴ� ������� �̸��� ���η� ����Ͻÿ�. 
select deptno, 
    listagg(ename,',') within group (order by ename desc)
from emp 
group by deptno;

-- ����, ���� ���� ���� ������� �̸��� ���η� ����Ͻÿ�. (�̸��� abcd ������� ���) 
select job, 
    listagg(ename,',')within group(order by ename) 
from emp 
group by job;

-- �츮�� ���̺��� ��Ż�, ��Ż� ���� ���� �л����� �̸��� ���η� ����ϴµ� 
-- ���̰� ���� �л������ ��µǰ� �Ͻÿ�. 
select lower(telecom), 
    listagg(ename,',') within group (order by age desc)
from emp18 
group by lower(telecom);

-- (����� �������� ��û�ߴ� sql) ���� ��� + �̸� ���� ���� ��� 
select lower(telecom), 
    listagg(ename||'('||age||')',',') within group (order by age desc)
from emp18 
group by lower(telecom);

-- ��� ��ȣ, ��� �̸�, �ٷ� ������ �����ȣ, �ٷ� �������� �����ȣ�� ����Ͻÿ�. 
select empno, ename, 
    lag(empno,1) over(order by empno) ������,
    lead(empno,1) over (order by empno) ������
from emp;

-- �̸�, �Ի���, �ٷ� ������ �Ի����� ����Ͻÿ�. (�Ի����� ascending �ϰ� ����Ͻÿ�.) 
select ename, hiredate, 
    lag(hiredate,1) over (order by hiredate) "������ �Ի���"
from emp;

-- �̸�, �Ի���, �ٷ� ���� �Ի��� ��� ������ ���� �Ŀ� �Ի��ߴ��� ����Ͻÿ�. 
select ename, hiredate ,
    hiredate -  lag(hiredate,1) over (order by hiredate) as "����"
from emp;