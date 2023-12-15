-- ��� ���̺��� �ִ� ������ ����Ͻÿ�. 
select max(sal) 
from emp;

-- ������ salesman �� ����� �߿��� �ִ� ������ ����Ͻÿ�. 
select max(sal) 
from emp 
where job = 'SALESMAN';

-- ���� ����� �ٽ� ����ϴµ� ������ ���� ����Ͻÿ�. 
select max(sal), job
from emp 
where job = 'SALESMAN'
group by job;

-- ���� ������� where ���� ���� �����ϸ� �� job ���� max(sal)�� ���´�. 
select max(sal), job
from emp 
group by job;

-- �μ���ȣ, �μ���ȣ �� �ִ� ������ ����Ͻÿ�. 
select deptno, max(sal) 
from emp 
group by deptno;

-- ����, ������ �ִ� ������ ����ϴµ� ������ salesman�� �����ϰ� ����Ͻÿ�.
select job, max(sal)
from emp 
where job <> 'SALESMAN'
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ �ִ������ ���� �ͺ��� ����Ͻÿ�.
select job, max(sal)
from emp 
where job <> 'SALESMAN'
group by job
order by max(sal) desc;

-- �츮 �� ���̺� ���� �÷� �߰��ϱ�
alter table emp18 
add age number(10);

update emp18 outer 
set age = (select trunc(months_between(sysdate, birth)/12)
            from emp18 
            where empno = outer.empno);
        
-- (���̵� ��)��Ż�, ��Ż� �� �ִ� ���̸� ����Ͻÿ�.
select lower(telecom),max( age) 
from emp18 
group by lower(telecom);

-- ��� ���̺��� �ּ� ������ ����Ͻÿ�.
select min(sal) 
from emp;

-- ����, ������ �ּҿ����� ����ϴµ� ������ �ּ� ������ ���� �ͺ��� ����Ͻÿ�.
select job, min(sal)
from emp
group by job
order by min(sal) desc;

-- ����, ���� �� �ּ� ���̸� ����Ͻÿ�. 
select gender, min(age)
from emp18 
group by gender;

-- �μ���ȣ, �μ���ȣ �� �ּ� ������ ����ϴµ� �μ� ��ȣ�� 10��, 20���� ��µǰ� �Ͻÿ�. 
select deptno, min(sal) 
from emp
where deptno in (10,20)
group by deptno;

-- �츮�� ���̺��� �� �� ����ϰ� ���� �� �ּ� ���̸� ����Ͻÿ�.
select substr(ename,1,1) as ��, min(age)
from emp18
group by substr(ename,1,1);

-- ��� ���̺��� ��� ������ ����Ͻÿ�. 
select avg(sal) 
from emp;

--����, ������ ��� ������ ����Ͻÿ�. 
select job, round(avg(sal)) 
from emp
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ ��� ������ ���� �ͺ��� ����Ͻÿ�. 
select job, round(avg(sal)) as "��� ����"
from emp
group by job
order by "��� ����" desc;

-- ���� ����� �ٽ� ����ϴµ� ������ salesman�� �����ϰ� ����Ͻÿ�. 
select job, round(avg(sal)) as "��� ����"
from emp
group by job
order by "��� ����" desc;

-- �μ���ȣ, �μ���ȣ �� ��տ����� ����ϴµ� �μ���ȣ�� 20�� �μ��� �����ϰ� 
-- �μ���ȣ �� ��տ����� ���� �ͺ��� ����Ͻÿ�. 
select deptno, round(avg(sal)) 
from emp 
group by deptno
order by avg(sal);

-- �ּҸ� ����ϰ� �� ���� �ּ��� �� ������ ��µǰ� �Ͻÿ�. 
select address, regexp_substr(address,'[^ ]+',1,1)
from emp18;

-- ���� regexp_substr�� �̿��ؼ� �ּҿ� �ּ� �� ��� ���̸� ����Ͻÿ�.
select regexp_substr(address,'[^ ]+',1,1) as �ּ�, round(avg(age))
from emp18
group by regexp_substr(address,'[^ ]+',1,1);
-- ���� sql�� decode�� �̿��ؼ� �ּҿ� �ּҺ� ��� ���̸� ���Ͻÿ�. 
select decode(regexp_substr(address,'[^ ]+',1,1), '����','����Ư����'
                , '�����','����Ư����',regexp_substr(address,'[^ ]+',1,1)) �ּ�,
        round(avg(age))
from emp18
group by regexp_substr(address,'[^ ]+',1,1);

-- �̸��� Ŀ�̼� ��� 
select ename, comm
from emp;

-- Ŀ�̼� ��հ� ��� 
select avg(comm) 
from emp;

-- ��� ���̺��� ������ �� ���� ���Ͻÿ�. 
select sum(sal) 
from emp;

-- ������ ������ �� ������ ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job;

-- ���� ����� �ٽ� ����ϴµ� ������ abcd ������� �����ؼ� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
group by job
order by job;

--���� ����� �ٽ� ����ϴµ� ������ salesman �����ϰ� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
order by job;

--���� ����� �ٽ� ����ϴµ� ������ �� ������ 5000 �̻��� �͸� ����Ͻÿ�. 
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
having sum(sal) >= 5000
order by job;

-- �Ի��� �⵵ ��� (4�ڸ���), �׸��� �⵵�� �� ������ ����Ͻÿ�. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
group by to_char(hiredate, 'RRRR');

-- ���� ����� �ٽ� ����ϴµ� �Ի��� �⵵�� 1980���� �����ϰ� ����Ͻÿ�. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
where to_char(hiredate,'RRRR') <> '1980'
group by to_char(hiredate, 'RRRR');

-- ���� ����� �ٽ� ����ϴµ� �Ի��� �⵵�� �� ������ 4000 �̻��� �͸� ����Ͻÿ�. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
where to_char(hiredate,'RRRR') <> '1980'
group by to_char(hiredate, 'RRRR')
having sum(sal) >= 4000;

-- ���� ����� �ٽ� ����ϴµ� �Ի��� �⵵�� �� ������ ���� �ͺ��� ����Ͻÿ�. 
select to_char(hiredate, 'RRRR'), sum(sal)
from emp
where to_char(hiredate,'RRRR') <> '1980'
group by to_char(hiredate, 'RRRR')
having sum(sal) >= 4000
order by sum(sal) desc;

-- ��� ���̺��� ��ü �Ǽ��� ��� �Ǵ°�? 
select count(*) 
from emp;

-- �׷� �Լ��� null ���� �����ϱ� ������ �Ʒ� �Լ��� ���� 4�� ���´�.
select count(comm) 
from emp;

-- ������ salesman �� ������� �ο����� ����Ͻÿ�. 
select count(*) 
from emp 
where job <> 'SALESMAN';

-- ����, ������ �ο����� ����Ͻÿ�. 
select job, count(*)
from emp 
group by job;

-- ���� ����� ����ϴµ� ���� �� �ο� ���� 2�� �̻��� �͸� ����Ͻÿ�.
select job, count(*) 
from emp 
group by job
having count(*) >= 2;

-- ���� ����� �ٽ� ����ϴµ� ������ �ο����� ���� �ͺ��� ����Ͻÿ�. 
select job, count(*)
from emp 
group by job 
having count(*) >= 2
order by count(*) desc;

-- ���� ����� �ٽ� ����ϴµ� ������ salesman�� �����ϰ� ����Ͻÿ�. 
select job, count(*)
from emp 
where job <> 'SALESMAN'
group by job 
having count(*) >= 2
order by count(*) desc;

-- market_2022 ���̺��� ��ȸ�ϴµ� ��ȣ�� ��Ÿ������ ���ԵǾ� �ִ� �����Ϳ��� �ñ�����,
-- �ñ����� �� �Ǽ��� ����Ͻÿ�.
select �ñ�����, count(*)
from market_2022
where ��ȣ�� like '%��Ÿ����%'
group by �ñ�����;

-- market_2022 ���̺��� ��Ǿ����ߺз��� �� 'Ŀ����/ī��'�� ��ȣ��, ��ȣ�� �Ǽ��� 
-- ����ϴµ� ��ȣ�� �Ǽ��� ���� �ͺ��� ����Ͻÿ�.
select ��ȣ��, count(*)
from market_2022
where ��Ǿ����ߺз��� = 'Ŀ����/ī��'
group by ��ȣ��
order by count(*) desc;

-- ���� ����� �ٽ� ����ϴµ� ��ȣ���� ī��� �����ϰ� ����Ͻÿ�. 
select ��ȣ��, count(*)
from market_2022
where ��Ǿ����ߺз��� = 'Ŀ����/ī��'
group by ��ȣ��
having ��ȣ�� <> 'ī��'
order by count(*) desc;

-- ���� ����� �ٽ� ����ϴµ� ���ĵ� �������� ������ 10���� ����Ͻÿ�. 
select ��ȣ��, count(*)
from market_2022
where ��Ǿ����ߺз��� = 'Ŀ����/ī��' and ��ȣ�� <> 'ī��'
group by ��ȣ��
order by count(*) desc fetch first 10 rows only;

select case when ��ȣ�� like '%��Ÿ����%' then '��Ÿ����'
            when ��ȣ�� like '%�̵��Ŀ��%' then '�̵��Ŀ��' 
            else ��ȣ�� end as ��ȣ��, count(*)
from market_2022
where ��Ǿ����ߺз��� = 'Ŀ����/ī��' and ��ȣ�� <> 'ī��'
group by case when ��ȣ�� like '%��Ÿ����%' then '��Ÿ����'
            when ��ȣ�� like '%�̵��Ŀ��%' then '�̵��Ŀ��' 
            else ��ȣ�� end 
order by count(*) desc fetch first 10 rows only;
