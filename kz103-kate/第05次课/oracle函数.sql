---
select * from emp

--��ѯ��3ҳ ÿҳ��ʾ5��  ����ҳ
select * from
(select rownum rn, a.* from (select * from emp order by empno) a  )
where rn >10 and rn <= 15


----��1����ȡ��ǰϵͳʱ�䡿
select sysdate from dual
----��2���ַ�������תdate��־��''
create table test1(d1 date ,d2 timestamp)
select *��from test1
----��2.1Ĭ�ϸ�ʽ��
insert into test1(d1) values('09-9��-2017')
----��2.2 yyyy-mm-dd��ʽ ������to_date��
insert into test1(d1) values(to_date('2017-9-9','yyyy-mm-dd'))
----��2.3 yyyy-mm-dd hh:mi:ss��ʽ ������to_date��
-----2017-9-9 12:12:12  hh:12Сʱ��   hh24:24Сʱ��
insert into test1(d1) values(to_date('2017-9-9 12:12:12','yyyy-mm-dd  hh:mi:ss'))
insert into test1(d1) values(to_date('2017-9-9 13:12:12','yyyy-mm-dd  hh24:mi:ss'))
----��2.4 yyyy-mm-dd hh:mi:ss��ʽ ������to_timestamp��
----2017-9-9 12:12:12.3333
insert into test1(d1) values(to_date('2017-9-9 12:12:12.3333','yyyy-mm-dd  hh:mi:ss.ff'))
---����ᱨ��  ԭ��date���͵ľ���Ϊ����
insert into test1(d1) values(to_timestamp('2017-9-9 12:12:12.3333','yyyy-mm-dd  hh:mi:ss.ff'))

---��3��add_months(d,n)��
---�����ǰʱ��3���º������
select add_months(sysdate,3) from dual

Round(date[,fmt])��������������������ֵ
	fmtΪ��ѡ�����Ĭ������Ϊ�������һ�졣
	���ָ����ʽΪ��YEAR���������뵽��Ŀ�ʼ����1��1�ա�
	���ָ����ʽΪ��MONTH���������뵽�µĵ�һ�ա�
	���ָ����ʽΪ��DAY���������뵽����������ա�
select round(to_date('2017-9-11 11:23:23','yyyy-mm-dd hh24:mi:ss')) from dual
select Extract(year from sysdate) from dual

---�����ְʱ�䳬��25���Ա��
select * from emp where months_between(sysdate,hiredate)>25*12


---���2�·���ְ��Ա��
select * from emp where Extract(month from hiredate)=2

---��ȡ�ַ���
select substr('���������˧��',0,2) from dual
select length('���������˧��') from dual
select replace('���������˧��','����','����') from dual
-- ŭ��     65     A                    
-- ��ȥ     97     a
-- ����     48     0
Select chr(66) from dual
Select ascii('A') from dual

---�ַ���ϰ
--1,
select lower(ename) from emp
--2,
select ename from emp where length(ename)>5
--3,
select substr(ename,0,3) from emp
--4,
select replace(ename,'S','5') from emp 
-----������֤��1�ĸ���
----'98311928193991991933221'
select length('98311928193991991933221')-length(replace('98311928193991991933221','1')) from dual

select cos(180) from dual
----������
select mod(5,3) from dual



---��4��date����ת�ַ������ڡ�
select hiredate��from emp  --2071��9��9��
select to_char(hiredate,'yyyy"��"-mm"��"-dd"��"') from emp
select  to_char(sal,'$999,999') from emp  
select * from emp
                                
select ename,sal*12+nvl(comm,0) from emp  


select count(comm) from emp   
