--�����Ĳ���
/*
�麯���ֳ�Ϊ�ۺϺ���
  ������ֵ������ֻ�᷵��һ��ֵ
  �麯����������ѡ���б���ѯ��having�Ӿ�
���к���
  ����һ��ֵ�����һ��ֵ


*/

--��ѯ����Ա����нˮ�ܺ�
select sum(sal) from emp;
--�鿴�����ж�������¼
select deptno,count(*) from emp group by deptno where count(*) >3;

--�ַ�����
--concat����ʾ�ַ���������  ��ͬ��||
select concat('my name is ', ename) from emp;
--���ַ���������ĸ��д
select initcap(ename) from emp;
--���ַ���ȫ��ת��Ϊ��д
select upper(ename) from emp;
--���ַ���ȫ��ת��ΪСд
select lower(ename) from emp;
--����ַ���
select lpad(ename,10,'*') from emp;
select rpad(ename,10,'*') from emp;
--ȥ���ո�
select trim(ename) from emp;
select ltrim(ename) from emp;
select rtrim(ename) from emp;
--����ָ���ַ�����λ��
select instr('ABABCDEF','A') from emp;
--�鿴�ַ����ĳ���
select length(ename) from emp;
--��ȡ�ַ����Ĳ���
select substr(ename,0,2) from emp;
--�滻����
select replace('ababefg','ab','hehe') from emp;

--��ֵ����
--��С�����������������������ָ��С�����ֵ�λ��
select round(123.123,2) from dual;
select round(123.128,2) from dual;
select round(-123.128,2) from dual;

--�ض�����,����λ��ȥ���н�ȡ�����ǲ��������������Ĳ���
select trunc(123.128,2) from dual;
--ȡģ����
select mod(10,4) from dual;
select mod(-10,4) from dual;
--����ȡ��
select ceil(12.12) from dual;
--����ȡ��
select floor(13.99) from dual;
--ȡ����ֵ
select abs(-100) from dual;
--��ȡ����ֵ
select sign(-100) from dual;
--x��y����
select power(2,3) from dual;

--���ں���
select sysdate from dual;
select current_date from dual;
--add_months,���ָ�����·�
select add_months(hiredate,2),hiredate from emp;
--�����������������·ݵ����һ��
select last_day(sysdate) from dual;
--���������������·�
select months_between(sysdate,hiredate) from emp;
--������������ĵ�һ��
select sysdate ��ʱ����,
round(sysdate) ���0������,
round(sysdate,'day') ���������,
round(sysdate,'month') ����³�,
round(sysdate,'q') �����������, 
round(sysdate,'year') ���������� from dual;
--�������ܵ����ڼ�
select next_day(sysdate,'����һ') from dual;
--��ȡ�����е�ʱ��
select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) Сʱ,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) ����,
extract(second from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) ��
 from dual;
--�������ڵ�ʱ���
select localtimestamp from dual;
select current_date from dual;
select current_timestamp from dual;
--��ָ����ʱ�䵥λ������ֵ
select
trunc(sysdate)+(interval '1' second), --��1��(1/24/60/60)
trunc(sysdate)+(interval '1' minute), --��1����(1/24/60)
trunc(sysdate)+(interval '1' hour), --��1Сʱ(1/24)
trunc(sysdate)+(INTERVAL '1' DAY),  --��1��(1)
trunc(sysdate)+(INTERVAL '1' MONTH), --��1��
trunc(sysdate)+(INTERVAL '1' YEAR), --��1��
trunc(sysdate)+(interval '01:02:03' hour to second), --��ָ��Сʱ����
trunc(sysdate)+(interval '01:02' minute to second), --��ָ�����ӵ���
trunc(sysdate)+(interval '01:02' hour to minute), --��ָ��Сʱ������
trunc(sysdate)+(interval '2 01:02' day to minute) --��ָ������������
from dual;


/*

ת������
     ��oracle�д�����ֵ����ʽת������ʽת��
     ��ʽת��ָ�����ַ�������ת��Ϊ��ֵ��������
��ʽת����
    to_char: ������ֵ��������ת���ַ�����ʱ�򣬱���Ҫ�涨��ʽ
*/
select '999'+10 from dual;
--date ��to_char
select to_char(sysdate,'YYYY-MI-SS HH24:MI:SS') from dual;
-- number : to_char
select to_char(123.456789,'9999') from dual;
select to_char(123.456789,'0000.00') from dual;
select to_char(123.456789,'$0000.00') from dual;
select to_char(123.456789,'L0000.00') from dual;
select to_char(123456789,'999,999,999,999') from dual;
--to_date:ת��֮���ǹ̶��ĸ�ʽ
select to_date('2019/10/10 10:10:10','YYYY-MM-DD HH24:MI:SS') from dual;
--to_number:ת������
select to_number('123,456,789','999,999,999') from dual;


--��ʾû���ϼ�����Ĺ�˾����
select ename,nvl(to_char(mgr),'boss') from emp where mgr is null;
--��ʾԱ����Ӷ����6���º���һ�������������
select hiredate,next_day(add_months(hiredate,6),'������') from emp;

--��������
--decode,case when

--����ͬ���ŵ���Ա��н��10������10%��20������20%��30������30%
select ename,sal,deptno,decode(deptno,10,sal*1.1,20,sal*1.2,30,sal*1.3) from emp;
select ename,
       sal,
       deptno,
       case deptno
         when 10 then
          sal * 1.1
         when 20 then
          sal * 1.2
         when 30 then
          sal * 1.3
       end
  from emp;
------------------------------

create table test(
   id number(10) primary key,
   type number(10) ,
   t_id number(10),
   value varchar2(5)
);
insert into test values(100,1,1,'����');
insert into test values(200,2,1,'��');
insert into test values(300,3,1,'50');

insert into test values(101,1,2,'����');
insert into test values(201,2,2,'��');
insert into test values(301,3,2,'30');

insert into test values(102,1,3,'����');
insert into test values(202,2,3,'Ů');
insert into test values(302,3,3,'10');

select * from test;
/*
����
�������ʾת��Ϊ
����      �Ա�     ����
--------- -------- ----
����       ��        50
*/
select decode(type, 1, value) ����,
       decode(type, 2, value) �Ա�,
       decode(type, 3, value) ����
  from test;
select min(decode(type, 1, value)) ����,
       min(decode(type, 2, value)) �Ա�,
       min(decode(type, 3, value)) ����
  from test group by t_id; 

/*
�麯��,һ������£��麯����Ҫ��groupby���ʹ��
�麯��һ������ѡ���б����having�����ж�
���õ��麯����5��
avg()  ƽ��ֵ,ֻ������ֵ���͵�����
min()  ��Сֵ���������κ�����
max()  ���ֵ���������κ�����
count() ��¼��,�����ʱ���������ֵ������ǿ�ֵ
    countһ��������ȡ���еļ�¼��������ȡ������ʱ�����ʹ��*����ĳһ���������
       ��������ʹ�ô����������棬���Ǵ�����Ч�ʵĽǶȿ��ǣ�����ʹ�����ֻ���ĳһ���������
       ����Ҫʹ��*
       
sum()   ��ͣ�ֻ�ʺ���ֵ���͵�����
*/
select avg(sal) from emp;
select min(sal) from emp;
select max(sal) from emp;
select count(sal) from emp;
select sum(sal) from emp;
--group by,����ĳЩ��ͬ��ֵȥ���з������
--group���з��������ʱ�򣬿���ָ��һ���л��߶���У����ǵ�ʹ����groupby ֮��
--ѡ���б���ֻ�ܰ����麯����ֵ����group by ����ͨ�ֶ�
--��ÿ�����ŵ�ƽ��нˮ
select avg(sal) from emp group by deptno;
--��ƽ���������2000�Ĳ���
select avg(sal),deptno from emp where sal is not null group by deptno having avg(sal) >2000 order by avg(sal);

select count(10000) from emp;
--�����¹�Ա�Ĺ���>2000 ����
select deptno,count(1) from emp where sal>2000 group by deptno
--����нˮ���
select deptno,max(sal) from emp group by deptno;
--�������� ������С���������ҳ���,֪������
select deptno,min(hiredate),max(hiredate) from emp group by deptno;
select ename, deptno
  from emp e
 where hiredate in (select min(hiredate) from emp group by deptno)
    or hiredate in (select max(hiredate) from emp group by deptno)
select * from emp

select mm2.deptno, e1.ename, e1.hiredate
  from emp e1,
       (select min(e.hiredate) mind, max(e.hiredate) maxd, e.deptno
          from emp e
         group by e.deptno) mm2
 where (e1.hiredate = mm2.mind
    or e1.hiredate = mm2.maxd)
    and e1.deptno = mm2.deptno;
