-- ��� ���̺��� �̸��� ����, ������ ���� �ڸ����� �ݿø��� ���ڸ� ����Ͻÿ�. 
select ename, sal, round(sal,-2)
from emp;

-- ��� ���̺��� �̸��� ������ ����ϴµ� ���ڸ��� �����ؼ� ���ĸ� �� ����� ����Ͻÿ�. 
select ename, sal, trunc(sal,-2)
from emp;

-- �츮�� ���̺��� �̸�, ���̸� ����ϴµ� ���̰� ¦���� ����� ����Ͻÿ�.
select ename,trunc((sysdate-birth)/365)as age
from emp18
where mod(trunc((sysdate-birth)/365),2)=0 ;

-- �츮�� ���̺��� ���̰� ¦���� �л����� �̸��� ���̸� ����ϴµ� ���̰� ���� 
-- �л����� ����Ͻÿ�. 
select ename,trunc((sysdate-birth)/365)as age
from emp18
where mod(trunc((sysdate-birth)/365),2)=0
order by age desc;