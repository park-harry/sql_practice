-- �̸��� ������ ����ϴµ� ������ ����� �� ���� 0�� *�� ����Ͻÿ�.
select ename, replace(sal,0,'*') 
from emp;

-- �̸��� ������ ����ϴµ� ������ ����� �� ���� 0~3 ������ *�� ����Ͻÿ�. 
select ename, regexp_replace(sal,'[0-3]','*')
from emp;

-- �츮 �� ���̺��� �̸��� ����ϴµ�, ������ ���� ��µǰ� �Ͻÿ�. 
-- ex) ������ (substr ���) 
select substr(ename,1,2)|| '��' as �͸�
from emp18;

-- (replace ���) 
select replace(ename,substr(ename,-1,1),'��') as �͸�
from emp18;

-- (�������� ��ȣ�� ���� ������ ��ȣȭ)
-- �츮 �� ���̺��� �̸��� ���ϰ� ���� ��¥�� ����Ͻÿ�. 
select ename, birth, sysdate 
from emp18;
-- �̸��� ���̸� ����Ͻÿ�. 
select ename, trunc((sysdate - birth)/365) as age
from emp18;
-- �츮 �� ���̺��� �����͸� �Ʒ��� ���� ����Ͻÿ� 
-- ex) ����� 20��, ������ 30�� 
select ename,  substr(trunc((sysdate - birth)/365),1,1) ||'0��' as age
from emp18;