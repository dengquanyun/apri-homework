----1����ѯ����ѧԱ��Ϣ
select * from studentinfo
----2����ѯ����ѧԱ�����������䣨Ҫ��������������ʾ��
select stuname as "����",stuage as "����" from studentinfo
----3����ѯѧԱ�����乲���ļ���ֵ��Ҫ�󲻼����ظ��
select distinct stuage from studentinfo
----4����ѯ����Ů��ѧԱ����Ϣ
select * from studentinfo where stusex='Ů'
----5����ѯ�����к��С����ֵ�ѧ������Ϣ��
select * from studentinfo where stuname like '%��%'
----6����ѯѧԱ��Ϣ��Ҫ����ʾЧ�����£�
select '����'||stuname||'��'||'����'||stuage||'��'||'��ס'||stuaddress as ѧԱ��Ϣ from studentinfo
----7����ѯ����С��20�꣬��ס��ɳ������ѧԱ��Ϣ
select * from studentinfo where stuage<20 and stuaddress like '%��ɳ%'
----8����ѯ������16-18��(����16,18��)��ѧԱ��Ϣ
select * from studentinfo where stuage between 16 and 18
----9����ѯ���֤�а����С�1989���ַ���ѧԱ��Ϣ
select * from studentinfo where stucard like '%1989%'
----10����ѯ��2007-3-5������ѧ��ѧԱ��Ϣ
select * from studentinfo where stujointime > '05/3��/07'
----11����ѯ�����ַΪyahoo�İ�������Ϣ
select * from TeacherInfo where TeacherEmail like '%yahoo%'
----12����ѯ�ֻ��ԡ�139����ͷ�İ�������Ϣ
select * from teacherinfo where TeacherTel like'%139%'
----13����ѯ���䲻Ϊ������ѧԱ��ѧ�ţ�������סַ
select stunumber,stuname,stuaddress from studentinfo where stuage is not null and stusex='��'
----14����ѯѧ���ڡ�001��,��003��,��004������֮���ѧԱ��������ѧʱ��
select stuname,stujointime from studentinfo where (stunumber >1 and stunumber<3)or(stunumber>3 and stunumber <4) 
----15����ѯ����ѧԱ��Ϣ���������併������
select * from studentinfo order by stuage desc;
----16����ѯ���гɼ��������Է����������򣬷�����ͬ�ģ���ѧԱ�����������
select * from studentexam order by examresult desc,examid asc;
