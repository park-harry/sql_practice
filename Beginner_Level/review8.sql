-- ��� ���̺��� �̸��� SCOTT �� ����� �����͸� �˻��ϴµ� �̸��� �����Ͱ� �빮�ڷ� 
-- ����Ǿ� �ֵ�, �ҹ��ڷ� ���� �Ǿ� �ֵ� ������� �����Ͱ� �˻��ǰ� �Ͻÿ�. 
select * 
from emp 
where lower(ename) = 'scott';

-- �츮�� ���̺��� ��Ż簡 kt �� �л����� �̸��� ��Ż縦 ����Ͻÿ�.
select ename, telecom 
from emp18 
where lower(telecom) = 'kt';

-- ��Ż簡 sk�� �л����� �̸��� ��Ż縦 ����Ͻÿ�.
select ename, telecom 
from emp18 
where lower(telecom) = 'sk';