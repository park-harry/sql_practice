select nvl(job,'��ü ����'), 
        to_char(sum(sal),'999,999' )as ��Ż���� 
from emp 
group by rollup(job);

-- �Ի��� �⵵(4�ڸ�), �Ի��� �⵵�� �� ������ ����ϴµ� �� �Ʒ��� 
-- ��ü �� ���޵� ����Ͻÿ�. 
select to_char(hiredate,'RRRR'), sum(sal) 
from emp
group by rollup (to_char(hiredate,'RRRR'));

-- �μ���ȣ, ����, �μ���ȣ�� ������ �� ������ ����Ͻÿ�. 
select deptno, job, sum(sal) 
from emp 
group by deptno,job
order by deptno, job;

-- ���� ����� �ٽ� ����ϴµ� ROLLUP�� �Ἥ ����Ͻÿ�. 
select nvl(to_char(deptno),'TOTAL') as �μ���ȣ, 
        nvl(job,'TOTAL SALARY') as ����, 
        sum(sal) 
from emp 
group by rollup(deptno,job)
order by deptno, job;

-- �츮 �� ���̺��� ����, ��Ż�, ��� ���̸� ����ϴµ� rollup�� �̿��Ͽ� �Ʒ��� 
-- 3���� �׷��ε� ��� ������ ��µǰ� �Ͻÿ�. 
select gender, 
    case when gender is null then '��ü��Ż' 
    else nvl(lower(telecom),'��Ż') end as telecom, 
    round(avg(age))
from emp18 
group by rollup(gender, lower(telecom))
order by gender, lower(telecom);

