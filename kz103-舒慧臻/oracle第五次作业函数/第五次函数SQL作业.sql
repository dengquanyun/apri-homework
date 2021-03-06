----查询所有学员从入学到今天，一共度过了多少天 
select months_between(sysdate,stujointime)*30 from studentinfo;

----查询你的出生日期到现在相隔的年数（月数/12）
select months_between(sysdate,'18-3月-1999')/12 from studentinfo;

----查询每月2号入学的学员信息
select * from studentinfo where extract(day from stujointime)=2;

----查询所有学员的毕业日期，假定按每个学员入学时间1年半之后将毕业。
select add_months(stujointime,18) from studentinfo;

----查询星期四入学的学员姓名，性别，年龄，班级编号   =2?
select stuname , stusex, stuage,sclassid from studentinfo where to_char(stujointime,'day')='星期四' and sclassid=2;

----查询‘2007-3-10’之前入学的学员信息
select * from studentinfo where months_between('10-3月-2007',stujointime)<0;

----查询所有学员姓名的长度
select length(stuname) from studentinfo;

----查询身份证中第9，10位为‘89’的学员信息（要求使用字符串函数）
select * from studentinfo where substr(stucard,9,2)='89';

----修改班主任信息，将邮箱中的‘yahoo’替换为‘geekgroup’
select replace(teacheremail,'yahoo','geekgroup') from teacherinfo;

----编写查询语句去掉字符串‘   爱你我爱你   ’中的空格
select trim('   爱你我爱你   ') from teacherinfo;

----计算每个学员身份证中字符‘1’出现的次数
select length(stucard)-length(replace(stucard,'1')) from studentinfo;

----求小于-58.9的最大整数
select floor(-58.9) from studentinfo;

----求大于78.8的最小整数
select ceil(78.8) from studentinfo;

----求64除以7的余数
select mod(64,7) from studentinfo;

----查询所有学员入学时间，要求显示格式为‘2007年03月02日’
select to_char(stujointime,'yyyy"年"mm"月"dd"日"') from studentinfo;

----查询当前时间，要求显示格式为‘22时57:37’
select to_char(sysdate , 'hh24"时"mi:ss') from studentinfo;

----17、查询2007年入学的学员信息
select * from studentinfo where to_char(stujointime,'yyyy')='2007';

----【分组函数练习】

----查询所有学员的平均年龄（要求保留两位小数）
select trunc(avg(stuage),2) from studentinfo;

----查询所有考试的总成绩
select sum(examresult) from studentexam;

----查询SQL考试的最低分数
select min(examresult) from studentexam where examsubject='SQL';

----查询Java考试成绩最高的学员姓名
select b.stuname from
(select estuid from studentexam where examresult=
(select max(examresult) from studentexam where examsubject='Java')) a,
studentinfo b
where a.estuid = b.stuid

----查询学员‘火云邪神’一共参加了几次考试
select count(estuid) from studentexam where estuid=(select stuid from studentinfo where stuname='火云邪神');

----查询各科目的平均成绩
select avg(examresult) from studentexam group by examsubject;

----查询每个班级学员的最小年龄
select min(stuage) from studentinfo group by sclassid;

----查询考试不及格的人数
select count(examresult) from studentexam where examresult<60;

----查询各学员的总成绩，要求筛选出总成绩在140分以上的
select sum(examresult),estuid from studentexam group by estuid having sum(examresult)>140;

----查询男女学员的平均年龄
select avg(stuage) from studentinfo group by stusex;

----查询每门功课的平均分，要求显示平均分在80分以上的(包括80分)
select avg(examresult),examsubject from studentexam group by examsubject having avg(examresult)>=80;
 

