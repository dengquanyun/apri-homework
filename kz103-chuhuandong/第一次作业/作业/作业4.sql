--1.�г�����30�еĹ�Ա
select * from emp where deptno=30;
--2.�г����а���Ա����������źͲ���
select ename,empno,deptno from emp where job='CLERK';
--3.�ҳ�Ӷ�����н��Ĺ�Ա
select ename from emp where comm>sal;
--4.�ҳ�Ӷ�����н���20%�Ĺ�Ա
select ename from emp where comm>(sal*0.2);
--5.�ҳ�����10�����о���Ͳ���20�����а���Ա����ϸ����
select * from emp where (deptno=10 and job='MANAGER') or (deptno = 20 and job='CLERK');
--6.�ҳ���ȡӶ��Ĺ�Ա�Ĳ�ͬ���� 
select job from emp where comm is not null;
--7.�ҳ�����ȡӶ�����ȡ��Ӷ�����100�Ĺ�Ա
select ename from emp where comm is null or comm<100;
--8.��ʾ��Ա����ϸ����,����������
select * from emp order by ename;
--9.��ʾ��Ա������������������ޣ������ϵĹ�Ա������ǰ��
select ename from emp order by hiredate ;
--10.��ʾ��Ա������������н�𣬰������Ľ���˳�����򣬶�������н����
select ename , job , sal from emp order by job desc , sal ;
--11.��ʾ��Ա�����ж��ٸ���ͬ�Ĳ���
select distinct deptno from emp;
--12.��ʾ������һ����Ա�����в��š�
select b.ss,a.deptno from dept a,
(select deptno,count(ename) ss from emp group by deptno) b
where a.deptno = b.deptno and ss>=1;
--13.��ʾ�������ƺ���Щ���ŵĹ�Ա������ͬʱ�г���Щû�й�Ա�Ĳ���
select a.*,b.* from dept a
left join
emp b
on a.deptno = b.deptno 

