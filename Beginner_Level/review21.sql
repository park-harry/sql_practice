-- �μ���ȣ, �μ���ȣ �� �� ������ ����Ͻÿ�. 
select deptno, sum(sal) 
from emp
group by deptno;

-- �μ���ȣ, �μ���ȣ�� 10���̸� ������ ���, �ƴϸ� 0�� ����Ͻÿ�. 
select deptno, decode(deptno, 10, sal,0) as "10"
from emp;

--���� sql�� �̾ �μ���ȣ�� 20 ���̸� ������ ���, �ƴϸ� 0�� ����ϰ� �� �μ���ȣ�� 
-- 30���̸� ������ ����ϰ� �ƴϸ� 0�� ����Ͻÿ�. 
select  
    decode(deptno, 10, sal, 0)as "10",
    decode(deptno, 20, sal, 0)as "20",
    decode(deptno, 30, sal, 0)as "30"
from emp;

-- (���� ���) 
-- ���� ����� �ٽ� ����ϴµ� �տ� �μ���ȣ�� ����� sum �� �Ἥ ������ �� ���ؼ�
-- ����Ͻÿ�.
select  
    sum(decode(deptno, 10, sal, 0))as "10",
    sum(decode(deptno, 20, sal, 0))as "20",
    sum(decode(deptno, 30, sal, 0))as "30"
from emp;

-- ����, ������ �� ������ ����Ͻÿ�. (���η� ���) 
select job, sum(sal) 
from emp 
group by job;

-- -- ����, ������ �� ������ ����Ͻÿ�. (���η� ���) 
select 
    sum(decode(job,'PRESIDENT', sal, 0)) as PRESIDENT,
    sum(decode(job,'MANAGER', sal, 0)) as MANAGER,
    sum(decode(job,'SALESMAN', sal, 0)) as SALESMAN,
    sum(decode(job,'CLERK', sal, 0)) as CLERK,
    sum(decode(job,'ANALYST', sal, 0)) as ANALYST
from emp;

-- �츮 �� ���̺��� ��Ż縦 �̰� ��Ż纰 ��� ���̸� ����Ͻÿ�. 
select 
    sum(decode(lower(telecom),'kt',avg(age))) as kt,
     sum(decode(lower(telecom),'sk',round(avg(age)))) as sk,
      sum(decode(lower(telecom),'lg',avg(age))) as lg,
       sum(decode(lower(telecom),'�˶�kt',avg(age))) as �˶�kt
from emp18
group by lower(telecom);


-- (���� ���) 
-- �Ի��� �⵵ (4�ڸ�), �Ի��� �⵵�� �� ������ ����Ͻÿ�.
select to_char(hiredate,'RRRR') as �Ի�⵵, sum(sal)
from emp
group by to_char(hiredate,'RRRR');

-- ���� ����� ���η� ����Ͻÿ�. 
select 
    sum(decode(to_char(hiredate,'RRRR'), '1980',sal)) as "1980",
    sum(decode(to_char(hiredate,'RRRR'), '1981',sal)) as "1981",
    sum(decode(to_char(hiredate,'RRRR'), '1982',sal)) as "1982",
    sum(decode(to_char(hiredate,'RRRR'), '1983',sal)) as "1983"
    from emp;

-- ���� ����� �ٽ� ����ϴµ� �տ� job �� �ְ� group by job�� �Ἥ ��� ���
select job,
    sum(decode(to_char(hiredate,'RRRR'), '1980',sal)) as "1980",
    sum(decode(to_char(hiredate,'RRRR'), '1981',sal)) as "1981",
    sum(decode(to_char(hiredate,'RRRR'), '1982',sal)) as "1982",
    sum(decode(to_char(hiredate,'RRRR'), '1983',sal)) as "1983"
from emp
group by job;

-- ������ ���� ������ �μ���ȣ�� �� ������ ����Ͻÿ�.
select job, 
    sum(decode(deptno,10,sal,0)) as "10",
    sum(decode(deptno,20,sal,0)) as "20",
    sum(decode(deptno,30,sal,0)) as "30"
from emp
group by job;

-- �μ���ȣ, �μ���ȣ �� �� ������ ���η� ����ϴµ� pivot �� ����ϱ� 
select * 
from (select deptno, sal from emp) 
pivot(sum(sal) for deptno in (10,20,30));

-- pivot ���� ����ؼ� ������ �ѿ����� ���η� ����Ͻÿ�. 
select * 
from (select job, sal from emp) 
pivot(sum(sal) for job in 
        ('SALESMAN', 'ANALYST', 'PRESIDENT', 'CLERK', 'MANAGER'));
        
-- �Ի��� �⵵�� �� ������ pivot ������ ����ϱ� 
select * 
from (select to_char(hiredate,'RRRR') as hireyear,sal from emp) 
pivot(sum(sal) for hireyear in ('1980','1981','1982','1983'));

-- �츮 �� ���̺��� ����, ���� �� ��� ���̸� ����Ͻÿ�. 
select round(����),round(����)
from (select gender, age from emp18)
pivot(avg(age) for gender in ('��' as ����,'��'as ����));