-- �̸��� ������ ����ϴµ� ������ ����� �� ��ü�� 10�ڸ��� ���, ������ ������ �ڸ��� 
-- *�� ä�������ÿ�. 
select ename, lpad(sal,10,'*')
from emp;
select ename, rpad(sal,10,'*')
from emp;

-- �츮 �� ���̺��� ��õ ���������� �����ϴ� �л��� �̸��� �ּҸ� ����Ͻÿ�. 
select ename, address
from emp18 
where trim(address) = '��õ ������';
-- �츮 �� ���̺��� �̸����� ����ϴµ� �̸��� ���� .com �� �߶󳻼� ����Ͻÿ�.
select email, rtrim(email,'.com') 
from emp18;

-- ���� ����� �ٽ� ����ϴµ� .net�� �߶󳻽ÿ�. 
select email, rtrim(rtrim(email,'.net') ,'.com')
from emp18;
-- kimjunhwan11@nate.com -> kimjunhwan11@na �� ���´� 
-- .net �߿� ��� �ϳ��� ö�ڰ� ������ �� �߶󳽴�. 
-- �ذ�:
select email, substr(email, 1,instr(email,'.')-1)
from emp18;