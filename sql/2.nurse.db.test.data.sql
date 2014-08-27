insert into depart values(
1,'간호실',null);
insert into depart values(
2,'간호1팀',1);
insert into depart values(
3,'간호2팀',1);

---------------------------------------------------
insert into nurse values
(1,'이영애',1,'queen','1111','lightel@naver.com','02-2066-31889','SKT','010-6475-2951','수간호사',null,'7207041056434',
'2','152099','서울시 영등포구 당산동','멋진빌딩 302호','20110624','123456','19720704',null,'1',null);
insert into nurse values
(2,'김태희',2,'kim','1111','lightel@naver.com','02-2066-31889','LGT','010-6475-2951','1팀장',null,'7707041056434',
'2','152099','서울시 영등포구 당산동','멋진빌딩 302호','20120624','123456','19720704',null,'1',null);
insert into nurse values
(3,'한예슬',3,'han','1111','lightel@naver.com','02-2066-31889','KT','010-6475-2951','2팀장',null,'8007041056434',
'2','152099','서울시 영등포구 당산동','멋진빌딩 302호','20120824','123456','19720704',null,'1',null);
insert into nurse values
(4,'한효주',2,'hyo','1111','lightel@naver.com','02-2066-31889','SKT','010-6475-2951','1팀원',null,'8207041056434',
'2','152099','서울시 영등포구 당산동','멋진빌딩 302호','20130624','123456','19720704',null,'1',null);
insert into nurse values
(5,'이연희',3,'lee','1111','lightel@naver.com','02-2066-31889','SKT','010-6475-2951','2팀원',null,'8807041056434',
'2','152099','서울시 영등포구 당산동','멋진빌딩 302호','20130624','123456','19720704',null,'1',null);
--퇴사직원
insert into nurse values
(6,'수지',3,'soo','1111','lightel@naver.com','02-2066-31889','SKT','010-6475-2951','2팀원',null,'8807041056434',
'2','152099','서울시 영등포구 당산동','멋진빌딩 302호','20130724','123456','19720704','20130807','0',null);

--Q: 간호사 테이블안에 상사번호를 넣어야 할까? 넣자 --> 추가 칼럼명: manager

---------------------------------------------------

--공지글 > 공지글 작성 시 체크박스를 두어 (기본값은 선택!) 공지글인지 일반글인지 구분해서 작성할 수 있게 지원
insert into notice values(
notice_seq.NEXTVAL,'이영애','간호사업무매뉴얼',0,notice_seq.NEXTVAL,1,0,sysdate,'간호사 업무 매뉴얼 내용<br><br>끝.','1',1);
--일반글
insert into notice values(
notice_seq.NEXTVAL,'한효주','안녕하세요!',0,notice_seq.NEXTVAL,1,0,sysdate,'좋은 하루 보내세요~!<br><br>끝.','0',4);


--게시판 첨부파일 관리 테이블
insert into upfile values(2,1,'간호사업무매뉴얼');

---------------------------------------------------
  
insert into schedule values(
'20131101' || schedule_seq.NEXTVAL,'1','id','[오전]이연희','201311010700','201311031600','none',null,5);

---------------------------------------------------

insert into menu values(
1,'간호사관리');
insert into menu values(
2,'스케쥴관리');
insert into menu values(
3,'게시판관리');


insert into menuauth values(1,1);
insert into menuauth values(1,2);
insert into menuauth values(1,3);

---------------------------------------------------

commit;

select * from menu;
select * from menuauth;
select * from depart;
select * from nurse;
select * from notice;
select * from upfile;
select * from schedule;
