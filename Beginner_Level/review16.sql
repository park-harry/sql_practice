-- ���� ��¥�� ����ϰ� �� ���� ������ ������ ����Ͻÿ�. 
select sysdate, to_char(sysdate,'day')
from dual;

-- �츮 �� ���̺��� �̸�, ����, �¾ ������ ����Ͻÿ�. 
select ename, birth, to_char(birth,'day')
from emp18;

-- �ݿ��Ͽ� �¾ �л����� �̸��� ���ϰ� ������ ����Ͻÿ�. 
select ename, birth, to_char(birth,'day') 
from emp18 
where to_char(birth,'day') = '�ݿ���';

select ename, birth, to_char(birth,'day'), -- �ݿ���
                     to_char(birth,'dy'),  -- ��
                    to_char(birth,'d')   -- 6 (�Ͽ����� 1�� ���ؿ��� �ݿ����� 6) 
    from emp18;
    
-- �̸�, ����, �¾ ���� ����ϴµ� ��ȭ��������� ������ �����ؼ� ����Ͻÿ�. 
select ename, birth, to_char(birth,'day')
from emp18
order by to_char(birth -1 ,'d');

-- �̸�, �Ի���, �Ի��� �⵵, �Ի��� ��, �Ի��� ��, �Ի��� ������ ����Ͻÿ�. 
select ename, hiredate, to_char(hiredate,'RRRR') "�Ի��� �⵵",
      to_char(hiredate,'mm')  "�Ի��� ��",  to_char(hiredate,'dd') "�Ի��� ��",
      to_char(hiredate,'day')  "�Ի��� ����"
from emp;

-- 1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
-- like �� between .. and ��� ����, to_char �̿� 
select ename, hiredate
from emp 
where to_char(hiredate,'RRRR')= '1981';

-- �̸�, ������ ����ϴµ� ������ ����� �� õ ������ ǥ���Ͻÿ�. 
-- �����ǿ����� �ݵ�� �ٿ��� �Ѵ�. 
select ename, to_char(sal,'$9,999') 
from emp;
select ename, to_char(sal,'L9,999') 
from emp;

-- �̸�, ���� * 1020340 �� ����Ͻÿ�. (������ �� SQL �������) 
select ename, to_char(sal*1020340,'L999,999,999,999') 
from emp;

-- 81�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 
select ename, hiredate
from emp 
where hiredate ='81/11/17';
-- ���� SQL �� ����ǿ� ���� �����ϸ� ������ ����. ���� ��¥ ������ ����� ��¥ �����̱� ����.
-- �����: ��/��/�⵵ 
-- �����: �⵵/��/��

-- ����� ȯ������ ��¥ ���� �����غ��� 
alter session set nls_date_format = 'DD/MM/RRRR';
-- 81�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�
select ename, hiredate
from emp 
where hiredate ='17/11/81';-- ����� ��� 
-- Ȯ���� ��� 
select ename, hiredate 
from emp 
where hiredate = to_date('1981/11/17','RRRR/MM/DD');

-- �Ʒ��� sql�� Ʃ���Ͻÿ�. (Ʃ�� ��)  
select ename, hiredate 
    from emp 
    where to_char(hiredate,'rrrr')='1981';
-- (Ʃ�� ��) 
select ename, hiredate
from emp 
where hiredate between to_date('1981/1/1','RRRR/MM/DD') and 
                        to_date('1981/12/31','RRRR/MM/DD')+1;