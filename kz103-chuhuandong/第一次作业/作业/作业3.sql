select * from emp
--1����ѯsmith�Ĺ�����нˮ�Ͳ���
select sal,job,deptno from emp where ename = 'SMITH'
--2����ѯԱ��һ��Ĺ��ʣ�sal*13��
select (sal*13) as "һ��Ĺ���" from emp
--3����ѯ���ʸ���3000��Ա��
select * from emp where sal>3000
--4����ѯ������800��1600֮���Ա��
select * from emp where sal>800 and sal <1600
--5����ѯ1982-1-1����ְ��Ա��
select * from emp where hiredate>'01-1��-1982'
--6����ѯ������S��ʼ��Ա��
select * from emp where ename like 'S%'
--7����ѯԱ�����ֵ�3���ַ���O��Ա��
select * from emp where ename like '__O%'
--8����ѯԱ����Ϊ��7369��7499��7521��Ա��
select * from emp where empno=7369 or empno=7499 or empno=7521
--9����ѯû���ϼ���Ա��
select * from emp where mgr is null
--10����ѯ���ʴ���500����ְλΪmanager������������S��ͷ��Ա��
select * from emp where ename like 'S%' and (sal>500 or job='MANAGER')
--11����ѯԱ����Ϣ�����ղ��ź�������Ա���Ĺ��ʽ�������
select * from emp
order by deptno,sal desc
--12����ѯԱ����Ϣ�����ղ��ź�������Ա������ְʱ�併������
select * from emp
order by deptno,hiredate desc
--13����ѯԱ����Ϣ������Ա������н��������
select * from emp
order by sal
--14����ѯ��߹���Ա������ϸ��Ϣ
select * from emp where sal=(select max(sal) from emp)
--15����ѯ��͹���Ա������ϸ��Ϣ
select * from emp where sal=(select min(sal) from emp)
--16����ѯ���ʸ��ڹ�˾ƽ�����ʵ�Ա����Ϣ
select * from emp where sal>(select avg(sal) from emp)
--17����ѯ����ʾÿ�����ŵ���߹��ʡ���͹��ʡ������ղ��ű�Ž�������
select distinct DEPTNO as ���ź�,min(sal) as "��͹���",max(sal) as "��߹���" from emp
group by DEPTNO
order by DEPTNO
--18����ѯ����ʾÿ������ÿ����λ��ƽ�����ʺ���͹���
select distinct job as "��λ",min(sal) as "��͹���",avg(sal) as "ƽ������" from emp
group by job
--19����ѯ����ʾƽ�����ʵ���2000�Ĳ��źź�����ƽ������
select distinct DEPTNO as "���ź�",avg(sal) as "ƽ������" from emp
group by deptno
having avg(sal)<2000
--20����ѯԱ�����������ʺ͹��ʵȼ�
select a.ename as "Ա������",a.sal as "����",b.grade as "���ʵȼ�" from emp a,salgrade b
where a.sal between b.losal and b.hisal
--21����ѯ����ʾԱ�����������ʡ�������������������
select a.ename,a.sal,b.dname from emp a,dept b
where a.deptno = b.deptno
order by a.DEPTNO
--22����ѯ����ʾָ��Ա�����ϼ��쵼������
select a.ename as "�쵼",b.ename as "Ա��" from emp a,emp b
where a.empno=b.mgr

select ename as "�쵼" from emp where empno = (select mgr from emp where ename='SMITH')
--23����ѯԱ���Ĺ��ʴ���JONES��Ա����Ϣ
select * from EMP where sal>(select sal from emp where ename='JONES')
--24����ѯ����ʾ��SMITHͬ���ŵ�Ա��
select ename from emp where deptno = (select deptno from emp where ename='SMITH')
--25����ѯ����ʾ�Ͳ���10Ա��ͬ��λ��Ա��
select * from emp where job in(select job from emp where deptno=10)
order by deptno
--26����ѯ����ʾ��SMITHͬ����ͬ��λ��Ա��
select * from emp where deptno = (select deptno from emp where ename='SMITH') and job =(select job from emp where ename='SMITH')
--27����ѯÿ�����Ź�����ߵ�Ա����Ϣ
select * from emp a,(select deptno,max(sal) maxsal from emp group by deptno) b
where a.deptno=b.deptno and a.sal=b.maxsal
--28����ѯ���ʱȲ���30������Ա���Ĺ��ʸߵ�Ա�������������ʡ����ű��
select * from emp where sal>(select max(sal) from emp where deptno = 30)
--29����ѯ���ʱȲ���30������һ��Ա�����ʸߵ�Ա�����������ʡ����ű��
select * from emp where sal>(select max(sal) from emp where deptno = 30)
--30����ѯ����ʾ�����Լ�����ƽ�����ʵ�Ա��
select * from emp where sal>(select avg(sal) from emp)
--31����ѯнˮ��ߵ�5��Ա������Ϣ
select * from (select * from emp order by sal desc ) where rownum <=5
