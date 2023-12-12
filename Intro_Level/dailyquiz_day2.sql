-- �츮�� ���̺��� ��Ż簡 kt �� �л����� �̸��� ��Ż縦 ����ϴµ� �˶� kt�� 
-- ��µǾ�� �Ѵ�. (or ��� ����!) 
select ename, telecom 
from emp18 
where lower(telecom) like '%kt%';

-- ������ SALESMAN, ANALYST �� �ƴ� ������� �̸��� ������ ����ϴµ� 
-- ������ ���� ������� ����Ͻÿ�. 
select ename, sal 
from emp
where job not in ('SALESMAN', 'ANALYST')
order by sal desc;

-- �̸��� ����ϴµ� �̸��� A%%B�� A%B�� �����ϰ� ����Ͻÿ�.
select ename 
from emp 
where ename not in ('A%%B','A%B');

-- ���� ����� �ٽ� ����ϴµ� ù ��° ö�ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����Ͻÿ�.
select initcap(ename) 
from emp 
where ename not in ('A%%B','A%B');

-- �츮 �� ���̺��� �̸����� ����ϴµ� �̸��� �̸��� �����θ� ����Ͻÿ�. 
-- ex) �ڼ�ȯ gmail 
select ename,
    substr(email,instr(email,'@')+1,instr(email,'.')-instr(email,'@')-1) as domain
from emp18;

-- ��� ���̺��� �̸��� 'S'�ڸ� �����ϰ� �ִ� ������� �̸��� �Ի����� ����ϴµ� �Ի����� 
-- �ֱٿ� �Ի��� ������� ����Ͻÿ�.
select ename, hiredate 
from emp 
where ename like '%S%'
order by hiredate desc;

-- 1981�⵵�� �Ի��� ������� �̸��� ���ް� �Ի����� ����ϴµ� �Ի����� 
-- �ֱٿ� �Ի��� ������� ����Ͻÿ�.
select ename, sal, hiredate 
from emp 
where hiredate between '1981/1/1' and '1981/12/31'
order by hiredate desc;
