----1����ѯsmith�Ĺ�����нˮ�Ͳ���
select job,sal,deptno from emp where ename='SMITH'
----2����ѯԱ��һ��Ĺ��ʣ�sal*13��
select ename, sal*13 as "��н" from emp
----3����ѯ���ʸ���3000��Ա��
select * from emp where sal>3000 
----4����ѯ������800��1600֮���Ա��
select * from emp where sal between 800 and 1600
----5����ѯ1982-1-1����ְ��Ա��
select * from emp where hiredate > '01/3��/1982'
----6����ѯ������S��ʼ��Ա��
select * from emp where ename like 'S%'
----7����ѯԱ�����ֵ�3���ַ���O��Ա��
select * from emp where ename like '__O%'
----8����ѯԱ����Ϊ��7369��7499��7521��Ա��
select * from emp where empno = 7369 or empno = 7499 or empno = 7521
----9����ѯû���ϼ���Ա��
select * from emp where mgr is null
----10����ѯ���ʴ���500����ְλΪmanager������������S��ͷ��Ա��
select * from emp where (sal>500 or job='manager')and ename like 'S%'
----11����ѯԱ����Ϣ�����ղ��ź�������Ա���Ĺ��ʽ�������
select * from emp order by deptno asc,sal desc
----12����ѯԱ����Ϣ�����ղ��ź�������Ա������ְʱ�併������
select * from emp order by deptno asc,hiredate desc
----13����ѯԱ����Ϣ������Ա������н��������
select * from emp order by  sal  desc
----14����ѯ��߹���Ա������ϸ��Ϣ
select * from emp where sal=(select max(sal) from emp)
----15����ѯ��͹���Ա������ϸ��Ϣ
select * from emp where sal=(select min(sal) from emp)
----16����ѯ���ʸ��ڹ�˾ƽ�����ʵ�Ա����Ϣ
select * from emp where sal>(select avg(sal)  from emp)
----17����ѯ����ʾÿ�����ŵ���߹��ʡ���͹��ʡ������ղ��ű�Ž�������
select distinct deptno as ���ű��,max(sal)as ��߹���,min(sal)as ��͹��� from emp
group by deptno
order by deptno
----18����ѯ����ʾÿ������ÿ����λ��ƽ�����ʺ���͹���
select distinct deptno as ���ű��,avg(sal)as ƽ������,min(sal)as ��͹��� from emp
group by deptno
----19����ѯ����ʾƽ�����ʵ���2000�Ĳ��źź�����ƽ������
select deptno,avg(sal) from emp group by deptno
having avg(sal)>=2000 order by avg(sal) desc;
----20����ѯԱ�����������ʺ͹��ʵȼ�
select a.ename,a.sal,b.grade from emp a, salgrade b 
where a.sal between b.losal and b.hisal
----21����ѯ����ʾԱ�����������ʡ�������������������
select a.ename,a.sal,b.dname from emp a, dept b
where a.deptno=b.deptno 
order by b.deptno
----22����ѯ����ʾָ��Ա�����ϼ��쵼������
select  a.*, b.* from emp a,emp b
where a.mgr = b.empno and a.empno = 7369
----23����ѯԱ���Ĺ��ʴ���JONES��Ա����Ϣ 
select* from emp
where sal>(select sal from emp where ename='JONES')
----24����ѯ����ʾ��SMITHͬ���ŵ�Ա��
select * from emp
where deptno in (select deptno from emp where ename='SMITH')
----25����ѯ����ʾ�Ͳ���10Ա��ͬ��λ��Ա��
select * from emp
where job in(select job from emp where deptno=10)
----26����ѯ����ʾ��SMITHͬ����ͬ��λ��Ա��
select * from emp
where (deptno in (select deptno from emp where ename='SMITH')) and(job in (select job from emp where ename='SMITH')) 
----27����ѯÿ�����Ź�����ߵ�Ա����Ϣ  
select * from emp a,
(select max(sal)maxsal,deptno from emp group by deptno)b
where a.deptno=b.deptno and a.sal=b.maxsal 
----28����ѯ���ʱȲ���30������Ա���Ĺ��ʸߵ�Ա�������������ʡ����ű��
select Ename,sal,deptno from emp
where sal>(select max(sal) from emp where deptno=30)
----29����ѯ���ʱȲ���30������һ��Ա�����ʸߵ�Ա�����������ʡ����ű��
select Ename,sal,deptno from emp
where sal>(select min(sal) from emp where deptno=30)
----30����ѯ����ʾ�����Լ�����ƽ�����ʵ�Ա��
select * from emp
where sal>(select avg(sal) from emp where deptno=10)
----31����ѯнˮ��ߵ�5��Ա������Ϣ
select * from (select * from emp order by sal desc)
where rownum<=5;
----��ѯ��ϰ2
----1.�г�����30�еĹ�Ա
select * from emp where deptno=30
----2.�г����а���Ա����������źͲ���
select a.ename,a.deptno,b.dname from emp a, dept b 
where a.deptno = b.deptno
----3.�ҳ�Ӷ�����н��Ĺ�Ա
select * from emp where comm>sal
----4.�ҳ�Ӷ�����н���20%�Ĺ�Ա
select * from emp where comm>(sal*0.2)
----5.�ҳ�����10�����о���Ͳ���20�����а���Ա����ϸ����
select * from emp where (job='MANAGER' and deptno=10) or (job='CLERK' and deptno=20)
----6.�ҳ���ȡӶ��Ĺ�Ա�Ĳ�ͬ���� 
select distinct job from emp where comm is not null
----7.�ҳ�����ȡӶ�����ȡ��Ӷ�����100�Ĺ�Ա
select ename from emp where comm<100 or comm is null
----8.��ʾ��Ա����ϸ����,����������
select * from emp  order by ename
----9.��ʾ��Ա������������������ޣ������ϵĹ�Ա������ǰ��
select ename from emp   order by hiredate asc
----10.��ʾ��Ա������������н�𣬰������Ľ���˳�����򣬶�������н������
select ename,job,sal from emp order by job desc,sal asc
----11.��ʾ��Ա�����ж��ٸ���ͬ�Ĳ���
select distinct deptno from emp 
----12.��ʾ������һ����Ա�����в��š�
select emp.ename as Ա������,dept.* from emp,dept
where emp.deptno=dept.deptno
----13.��ʾ�������ƺ���Щ���ŵĹ�Ա������ͬʱ�г���Щû�й�Ա�Ĳ���
select a.dname,b.ename from dept a left join emp b
on a.deptno=b.deptno



