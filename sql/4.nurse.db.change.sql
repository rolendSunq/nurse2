drop table schedule CASCADE CONSTRAINTS;

CREATE TABLE schedule (
	sno number(14) NOT NULL, /* yyyyMMdd + schedule_seq */
	type char(1) NOT NULL, /* 1:오전(0700-1500), 2:오후(1500-2200), 3:야간(2200~2400~0700), 4:자유선택 */
	title VARCHAR2(100) NOT NULL, /* 직원명 */
	startdate char(12) NOT NULL, /* startdte */
	enddate char(12) NOT NULL, /* enddte */
	allday varchar2(5) NOT NULL, /* true or false */
	url VARCHAR2(100), /* 링크 */
	manager number(5),
	dno number(3),
	jobno number(5) NOT NULL,
	/* 2차 추가 */
	className varchar2(15), /*e.g: eventColor312*/
	editable varchar2(5), /* true or false */
	backgroundColor varchar2(7), /*#ffffff*/
	borderColor varchar2(7),
	textColor varchar2(7)
);

CREATE UNIQUE INDEX schedule_sno_idx
	ON schedule (
		sno desc
	);

ALTER TABLE schedule
	ADD
		CONSTRAINT schedule_sno_pk
		PRIMARY KEY (
			sno
		);

--Test Data
/*
insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'1','이연희','201311010700','201311051500',
'false',null,null,null,5,
'eventColor1','true',null,null,null);

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'2','이연희','201311112200','201311120700',
'false',null,null,null,4,
null,'true','#55b473','#55b473','#ffffff');

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'3','이연희','201311132200','201311140700',
'false',null,null,null,4,
null,'true','#55b473','#55b473','#ffffff');

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'1','한효주','201311050700','201311051500',
'false',null,null,null,5,
'eventColor1','true',null,null,null);

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'2','한효주','201311112200','201311120700',
'false',null,null,null,4,
null,'true','#55b473','#55b473','#ffffff');

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'3','한효주','201311102200','201311120700',
'false',null,null,null,4,
null,'true','#55b473','#55b473','#ffffff');

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'1','이영애','201311210700','201311211500',
'false',null,null,null,5,
'eventColor1','true',null,null,null);

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'2','이영애','201311182200','201311190700',
'false',null,null,null,4,
null,'true','#55b473','#55b473','#ffffff');

insert into schedule values(
'20131105' || schedule_seq.NEXTVAL,'3','이영애','201311072200','201311080700',
'false',null,null,null,4,
null,'true','#55b473','#55b473','#ffffff');

20131114 SQL 넣습니다.
select title, count(day) day, count(evening) evening, count(night) night
from (
    select title, 
           CASE  
                when type=1 then 1 
                end
           day,
           CASE  
                when type=2 then 1 
                end
            evening,
           CASE  
                when type=3 then 1 
                end
           night
    from schedule

)
group by title
;



select a.name,a.jobno,substr(b.startdate,7,2) as day,b.type 
		from nurse a, schedule b
    where a.jobno=b.jobno
		and b.startdate>='201311010000' and b.startdate<='201312010000'
		and b.type in ('1','2','3') 
		and substr(b.startdate,9,4)!='0000'
		order by b.jobno asc, b.startdate asc
*/