/**
--테이블 존재여부 확인
select * from menu;
select * from menuauth;
select * from depart;
select * from nurse;
select * from notice;
select * from upfile;
select * from schedule;

--테이블 삭제
drop table menu CASCADE CONSTRAINTS;
drop table menuauth CASCADE CONSTRAINTS;
drop table depart CASCADE CONSTRAINTS;
drop table nurse CASCADE CONSTRAINTS;
drop table notice CASCADE CONSTRAINTS;
drop table upfile CASCADE CONSTRAINTS;
drop table schedule CASCADE CONSTRAINTS;

--테이블 제약사항 존재여부 확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME in ('MENU','MENUAUTH','DEPART','NURSE','NOTICE','UPFILE','SCHEDULE');

--시퀀스 존재여부 확인
select * from user_sequences

--현재 시퀀스 조회
select 시퀀스네임.currval from dual

--시퀀스 삭제
drop SEQUENCE notice_seq;
drop SEQUENCE schedule_seq;
**/

----------------------------------------------------------
-- 프로젝트: 간호사 근무일정 관리 테이블 생성 쿼리
----------------------------------------------------------

CREATE TABLE depart (
	dno number(3) NOT NULL, /* deptno */
	dname VARCHAR2(40), /* deptname */
	manager number(3) /* manager */
);

CREATE UNIQUE INDEX depart_dno_idx
	ON depart (
		dno ASC
	);

ALTER TABLE depart
	ADD
		CONSTRAINT depart_dno_pk
		PRIMARY KEY (
			dno
		);
    
-----------------------------------------------------------

CREATE TABLE nurse (
	jobno number(5) NOT NULL, /* jobno */
	name VARCHAR2(20) NOT NULL, /* name */
	dno number(3), /* deptno */
	id VARCHAR2(40) NOT NULL, /* id */
	pwd VARCHAR2(20) NOT NULL, /* pwd */
	email VARCHAR2(40), /* email */
	phone VARCHAR2(20), /* phone */
	telecom VARCHAR2(20), /* telecom */
	cellphone VARCHAR2(20), /* cellphone */
	state VARCHAR2(20), /* state */
	photo VARCHAR2(40), /* photo */
	ssn VARCHAR2(13), /* ssn */
	sex char(1), /* 1:남자, 2:여자 */
	zipcode number(6), /* zipcode */
	address1 VARCHAR2(100), /* address1 */
	address2 VARCHAR2(100), /* address2 */
	hiredate char(8), /* hiredate */
	certnum char(6), /* certnum */
	birthday char(8), /* birthday */
	firedate char(8), /* firedate */
	dowork CHAR(1), /* 1:재직 0:퇴직 */
	manager number(5) /* manager's jobno */
);


CREATE UNIQUE INDEX nurse_jobno_idx
	ON nurse (
		jobno desc
	);

ALTER TABLE nurse
	ADD
		CONSTRAINT nurse_jobno_pk
		PRIMARY KEY (
			jobno
		);

-----------------------------------------------------------


CREATE TABLE notice(
	sno number(7) NOT NULL, /* sno */
	name VARCHAR2(60) NOT NULL, /* name */
	subject VARCHAR2(200), /* subject */
	readcount number(6), /* readcount */
	gno number(7), /* gno */
	srtno number(4), /* srtno */
	gap number(3), /* gap */
	regdate timestamp, /* regdate */
	content varchar2(4000), /* content */
	flag char(1), /* 1:공지, 0:일반글 */
	jobno number(5) /* jobno */
);

CREATE UNIQUE INDEX notice_gno_srtno_idx
	ON notice(
		gno desc,
		srtno asc
	);

ALTER TABLE notice
	ADD
		CONSTRAINT notice_sno_pk
		PRIMARY KEY (
			sno
		);

-----------------------------------------------------------


CREATE TABLE upfile (
	sno number(7) NOT NULL, /* sno */
	fno number(2) NOT NULL, /* fsno */
	filename VARCHAR2(60) /* filename */
);

CREATE UNIQUE INDEX upfile_sno_fno_idx
	ON upfile (
		sno desc,
		fno ASC
	);

ALTER TABLE upfile
	ADD
		CONSTRAINT upfile_sno_fno_pk
		PRIMARY KEY (
			sno,
			fno			
		);
    
-----------------------------------------------------------


CREATE TABLE schedule (
	sno number(14) NOT NULL, /* yyyyMMdd + schedule_seq */
	type char(1), /* 1:오전, 2:오후, 3:야간 */
	id VARCHAR2(40), /* id */
	title VARCHAR2(100), /* title */
	startdate char(12), /* startdte */
	enddate char(12), /* enddte */
	allday varchar2(5), /* allday */
	url VARCHAR2(100), /* url */
	jobno number(5) NOT NULL /* jobno */
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

-----------------------------------------------------------


CREATE TABLE menu (
	menuno number(3) NOT NULL, /* menuno */
	title VARCHAR2(60) NOT NULL /* title */
);

CREATE UNIQUE INDEX menu_menuno_idx
	ON menu (
		menuno ASC
	);

ALTER TABLE menu
	ADD
		CONSTRAINT menu_menuno_pk
		PRIMARY KEY (
			menuno
		);
    
-----------------------------------------------------------


CREATE TABLE menuauth (
	jobno number(5) NOT NULL, /* jobno */
	menuno number(3) NOT NULL /* menuno */
);

CREATE UNIQUE INDEX menuauth_jobno_menuno_idx
	ON menuauth (
		jobno ASC,
		menuno ASC
	);

ALTER TABLE menuauth
	ADD
		CONSTRAINT menuauth_jobno_menuno_pk
		PRIMARY KEY (
			jobno,
			menuno
		);

-----------------------------------------------------------

ALTER TABLE nurse
	ADD
		CONSTRAINT nurse_depart_dno_fk
		FOREIGN KEY (
			dno
		)
		REFERENCES depart(
			dno
		);

ALTER TABLE notice
	ADD
		CONSTRAINT notice_nurse_jobno_fk
		FOREIGN KEY (
			jobno
		)
		REFERENCES nurse (
			jobno
		);

ALTER TABLE schedule
	ADD
		CONSTRAINT schedule_nurse_jobno_fk
		FOREIGN KEY (
			jobno
		)
		REFERENCES nurse (
			jobno
		);

ALTER TABLE menuauth
	ADD
		CONSTRAINT menuauth_menu_menuno_fk
		FOREIGN KEY (
			menuno
		)
		REFERENCES menu (
			menuno
		);

ALTER TABLE menuauth
	ADD
		CONSTRAINT menuauth_nurse_jobno_fk
		FOREIGN KEY (
			jobno
		)
		REFERENCES nurse (
			jobno
		);

declare
   c int;
begin
   --select count(*) INTO c from user_tables where table_name = upper('table_name');
   SELECT COUNT(CONSTRAINT_NAME) INTO c FROM USER_constraints WHERE constraint_name = upper('upfile_notice_sno_fk');
   if c = 1 then
      execute immediate 'alter table upfile DROP CONSTRAINT upfile_notice_sno_fk';
   end if;
end;
		
ALTER TABLE upfile
	ADD
		CONSTRAINT upfile_notice_sno_fk
		FOREIGN KEY (
			sno
		)
		REFERENCES notice(
			sno
		) ON DELETE CASCADE;

-----------------------------------------------------------

--공지사항 게시판 시퀀스
CREATE SEQUENCE notice_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;

--스케쥴 시퀀스 6자리 순환
CREATE SEQUENCE schedule_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 999999
	NOCACHE
	CYCLE;