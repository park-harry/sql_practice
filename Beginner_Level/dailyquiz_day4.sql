-- market_2017 �� market_2022 ���̺��� �̿��Ͻÿ�. 
-- �ڷγ� ������ market_2017�� �ڷγ� ������ market_2022 �� ���� �����ؼ� ����� �������� �ִ�
-- ��Ÿ���� ������ �� ���� ���������� ����Ͻÿ�. 
select count(*)
from market_2017
where �ñ����� = '������' and ��ȣ�� like '%��Ÿ����%'; -- 79
select count(*)
from market_2022
where �ñ����� = '������' and ��ȣ�� like '%��Ÿ����%'; -- 74 
-- 5�� ��������. 


-- �츮 �� ���̺��� �̸��� �������� ����ϰ� �̸��� ������ �� �Ǽ��� ����ϴµ� �Ǽ��� 
-- ���� �ͺ��� ����Ͻÿ�. 
select substr(email, instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1) domain, count(*)
from emp18
group by substr(email, instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1)
order by domain desc;

-- �츮 �� ���̺��� ������ ����ϰ� ���� �� �ο����� ����ϴµ� ������ ���� '����'�� �����
-- ��µǰ� �Ͻÿ�. 
select case when length(ename) = 4 then substr(ename,1,2)
        else substr(ename,1,1) end as ����, count(*) 
from emp18
group by case when length(ename) = 4 then substr(ename,1,2)
        else substr(ename,1,1) end;

--  �μ���ȣ, �μ� ��ȣ�� �� ������ ����ϴµ� õ ������ �ο��ؼ� ����Ͻÿ�. 
select deptno, to_char(sum(sal),'999,999') 
from emp
group by deptno;

-- (���� ���) ����, ������ �� ������ ����ϴµ� ������ salesman �� �����ϰ� ����ϰ� 
-- ������ �� ������ 5000 �̻��� �͸� ����ϰ� ������ �� ������ ���� �ͺ��� ����Ͻÿ�.
select job, sum(sal) 
from emp 
where job <> 'SALESMAN'
group by job
having sum(sal) >=5000
order by sum(sal) desc;

-- ����, ������ �ִ� ����, ������ �ּ� ����, ������ �� ������ ����Ͻÿ�. 
select job, max(sal), min(sal), sum(sal) 
from emp 
group by job;
