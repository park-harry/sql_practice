-- �츮 �� ���̺��� �̸����� ����ϰ� �̸��Ͽ��� @�� �ڸ���ȣ�� ����Ͻÿ�.
select email, instr(email,'@') 
from emp18;

-- �츮 �� ���̺��� �̸� ����ϰ� �� ���� �̸��� '��'�ڰ� �� ��° �ڸ��� �ִ��� ����Ͻÿ�.
select ename, instr(ename,'��')
from emp18;

-- �츮 �� ���̺��� �̸��� '��'�ڸ� �����ϰ� �ִ� �л����� �̸��� ����Ͻÿ�.
select ename
from emp18
where ename like '%��%';

select ename 
from emp18 
where instr(ename,'��') <> 0;

-- �츮 �� ���̺��� �̸����� ����ϰ�, �̸��Ͽ��� @ �տ� ö�ڸ� ����Ͻÿ�. 
select email, substr(email,1,instr(email,'@')-1) 
from emp18;