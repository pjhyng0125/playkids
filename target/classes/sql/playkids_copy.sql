/* business */
drop table business;
CREATE TABLE business (
	bid VARCHAR2(50) NOT NULL, /* 기업아이디 */
	bpw VARCHAR2(100), /* 패스워드 */
	bname VARCHAR2(30), /* 기업명 */
	bintro VARCHAR2(500), /* 업체소개 */
	bphone VARCHAR2(20), /* 연락처 */
	baddress VARCHAR2(100), /* 주소 */
	bregdate DATE, /* 가입일 */
	baccount VARCHAR2(20), /* 계좌번호 */
	bprofit number default 0
);

COMMENT ON TABLE business IS 'business';

COMMENT ON COLUMN business.bid IS '기업아이디';

COMMENT ON COLUMN business.bpw IS '패스워드';

COMMENT ON COLUMN business.bname IS '기업명';

COMMENT ON COLUMN business.bintro IS '업체소개';

COMMENT ON COLUMN business.bphone IS '연락처';

COMMENT ON COLUMN business.baddress IS '주소';

COMMENT ON COLUMN business.bregdate IS '가입일';

COMMENT ON COLUMN business.baccount IS '계좌번호';

CREATE UNIQUE INDEX PK_business
	ON business (
		bid ASC
	);

ALTER TABLE business
	ADD
		CONSTRAINT PK_business
		PRIMARY KEY (
			bid
		);

/* class sequence */
drop sequence class_seq;
create sequence class_seq
start with 1
increment by 1
nocycle
nocache;
		
/* class */
drop table class;
CREATE TABLE class (
	cno NUMBER,
	bid VARCHAR2(50), /* 기업아이디 */
	ctype VARCHAR2(30) NOT NULL, /* 클래스타입 */
	cname VARCHAR2(30) NOT NULL, /* 클래스명 */
	cpic VARCHAR2(30), /* 클래스사진 */
	cage VARCHAR2(10) NOT NULL, /* 권장나이 */
	cintro VARCHAR2(500) NOT NULL, /* 클래스소개 */
	cdate DATE NOT NULL, /* 클래스예정날짜 */
	prepare VARCHAR2(300) NOT NULL, /* 준비물 */
	notice VARCHAR2(500) NOT NULL, /* 유의사항 */
	price NUMBER NOT NULL, /* 금액 */
	cteachername VARCHAR2(20) NOT NULL, /* 강사명 */
	cteacherpic VARCHAR2(30), /* 강사사진 */
	cteacher VARCHAR2(500) NOT NULL, /* 강사소개 */
	cregdate DATE default sysdate NOT NULL,	/*클래스등록일*/
	park VARCHAR2(3) ,
	protect VARCHAR2(3),
	together VARCHAR2(3),
	autho CHAR(1) default '0' /* 인증 */
);

COMMENT ON TABLE class IS 'class';

COMMENT ON COLUMN class.ctype IS '클래스타입';

COMMENT ON COLUMN class.cname IS '클래스명';

COMMENT ON COLUMN class.cdate IS '클래스등록일';

COMMENT ON COLUMN class.cpic IS '클래스사진';

COMMENT ON COLUMN class.bid IS '기업아이디';

COMMENT ON COLUMN class.cage IS '권장나이';

COMMENT ON COLUMN class.cintro IS '클래스소개';

COMMENT ON COLUMN class.cteacher IS '강사소개';

COMMENT ON COLUMN class.cteacherpic IS '강사사진';

COMMENT ON COLUMN class.prepare IS '준비물';

COMMENT ON COLUMN class.notice IS '유의사항';

COMMENT ON COLUMN class.price IS '금액';

COMMENT ON COLUMN class.autho IS '인증';

CREATE UNIQUE INDEX PK_class
	ON class (cno ASC);
	
ALTER TABLE class
	ADD
		CONSTRAINT PK_class
		PRIMARY KEY (cno);

/* location */
CREATE TABLE location (
	bid VARCHAR2(50) NOT NULL, /* 기업아이디 */
	si VARCHAR2(20), /* 시이름 */
	gu VARCHAR2(20) /* 구이름 */
);

COMMENT ON TABLE location IS 'location';

COMMENT ON COLUMN location.bid IS '기업아이디';

COMMENT ON COLUMN location.si IS '시이름';

COMMENT ON COLUMN location.gu IS '구이름';

CREATE UNIQUE INDEX PK_location
	ON location (
		bid ASC
	);

ALTER TABLE location
	ADD
		CONSTRAINT PK_location
		PRIMARY KEY (
			bid
		);

/* member */
drop table member;
CREATE TABLE member (
	mid VARCHAR2(50) NOT NULL, /* 회원아이디 */
	mpw VARCHAR2(100), /* 패스워드 */
	mname VARCHAR2(30), /* 이름 */
	maddress VARCHAR2(50), /* 주소 */
	mphone VARCHAR2(20), /* 연락처 */
	mbirth Date, /* 생년월일 */
	minterest VARCHAR2(30), /* 관심분야 */
	mregdate DATE default sysdate NOT NULL,
	mcash NUMBER default 0
);

select * from MEMBER;

COMMENT ON TABLE member IS 'member';

COMMENT ON COLUMN member.mid IS '회원아이디';

COMMENT ON COLUMN member.mpw IS '패스워드';

COMMENT ON COLUMN member.mname IS '이름';

COMMENT ON COLUMN member.maddress IS '주소';

COMMENT ON COLUMN member.mphone IS '연락처';

COMMENT ON COLUMN member.mbirth IS '생년월일';

COMMENT ON COLUMN member.minterest IS '관심분야';

COMMENT ON COLUMN member.mregdate IS '가입일';

COMMENT ON COLUMN member.mcash IS '캐쉬';

CREATE UNIQUE INDEX PK_member
	ON member (
		mid ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			mid
		);

/* childinfo sequence */
drop sequence childinfo_seq;
create sequence childinfo_seq
start with 1
increment by 1
nocycle
nocache;
		
drop table childinfo;
/* childinfo */
CREATE TABLE childinfo (
	dno NUMBER NOT NULL, /* 번호 */
	mid VARCHAR2(50) NOT NULL, /* 회원아이디 */
	dname VARCHAR2(50), /* 자녀이름 */
	dgender VARCHAR2(5), /* 자녀성별 */
	dbirth date /* 자녀생년월일 */
);

COMMENT ON TABLE childinfo IS 'childinfo';

COMMENT ON COLUMN childinfo.dno IS '번호';

COMMENT ON COLUMN childinfo.mid IS '회원아이디';

COMMENT ON COLUMN childinfo.dname IS '자녀이름';

COMMENT ON COLUMN childinfo.dgender IS '자녀성별';

COMMENT ON COLUMN childinfo.dbirth IS '자녀생년월일';

CREATE UNIQUE INDEX PK_childinfo
	ON childinfo (
		dno ASC
	);

ALTER TABLE childinfo
	ADD
		CONSTRAINT PK_childinfo
		PRIMARY KEY (
			dno
		);

/* agegrade */
CREATE TABLE agegrade (
	grade VARCHAR2(10), /* 나이등급 */
	min NUMBER, /* 최소나이 */
	max NUMBER /* 최대나이 */
);

COMMENT ON TABLE agegrade IS 'agegrade';

COMMENT ON COLUMN agegrade.grade IS '나이등급';

COMMENT ON COLUMN agegrade.min IS '최소나이';

COMMENT ON COLUMN agegrade.max IS '최대나이';

/* board */

create table board(
	bno number constraint tbl_board_pk primary key,
	mid varchar2(50) not null,
	title varchar2(200) not null,
	content varchar2(1000),
	count number default 0,
	regdate DATE default sysdate,
	newflag number default 1,							
	category varchar2(50),
	cno number	
);

COMMENT ON TABLE board IS 'board';

COMMENT ON COLUMN board.bno IS '게시물번호';

COMMENT ON COLUMN board.mid IS '회원아이디';

COMMENT ON COLUMN board.title IS '제목';

COMMENT ON COLUMN board.content IS '내용';

COMMENT ON COLUMN board.regdate IS '등록일자';

COMMENT ON COLUMN board.count IS '조회수';

CREATE UNIQUE INDEX PK_board
	ON board (
		bno ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bno
		);
		
drop sequence tbl_board_seq;
create sequence tbl_board_seq
	start with 1
	increment by 1
	nocycle
	nocache;

/* reply */
drop table reply;
create table reply(
	rno number constraint tbl_reply_pk primary key,
	bno number, 
	replyer varchar2(50) not null,
	reply_content varchar2(500) not null,
	reply_regdate date default sysdate
);

drop sequence tbl_reply_seq;
create sequence tbl_reply_seq
	start with 1
	increment by 1
	nocycle
	nocache;

COMMENT ON TABLE reply IS 'reply';

COMMENT ON COLUMN reply.rno IS '댓글번호';

COMMENT ON COLUMN reply.content IS '내용';

COMMENT ON COLUMN reply.regdate IS '등록일자';

COMMENT ON COLUMN reply.bno IS '게시물번호';

CREATE UNIQUE INDEX PK_reply
	ON reply (
		rno ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			rno
		);

/* reserve */
CREATE TABLE reserve (
	rno number,
	mid VARCHAR2(50) NOT NULL, /* 회원아이디 */
	cno number NOT NULL, /* 클래스 아이디 */
	dno number NOT NULL, /* 자녀 아이디 */
	regdate DATE /* 확정일 */
);

/* reserve sequence */
drop sequence reserve_seq;
create sequence reserve_seq
start with 1
increment by 1
nocycle
nocache;



COMMENT ON TABLE reserve IS 'reserve';

COMMENT ON COLUMN reserve.rno IS '예약고유번호';

COMMENT ON COLUMN reserve.mid IS '회원아이디';

COMMENT ON COLUMN reserve.cno IS '클래스 아이디';

COMMENT ON COLUMN reserve.dno IS '자녀 아이디';

COMMENT ON COLUMN reserve.regdate IS '확정일';

CREATE UNIQUE INDEX PK_reserve
	ON reserve (
		rno ASC
	);

ALTER TABLE reserve
	ADD
		CONSTRAINT PK_reserve
		PRIMARY KEY (
		 rno
		);

ALTER TABLE class
	ADD
		CONSTRAINT FK_business_TO_class
		FOREIGN KEY (
			cno
		)
		REFERENCES business (
			cno
		);

ALTER TABLE location
	ADD
		CONSTRAINT FK_business_TO_location
		FOREIGN KEY (
			bid
		)
		REFERENCES business (
			bid
		);

ALTER TABLE childinfo
	ADD
		CONSTRAINT FK_member_TO_childinfo
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE reserve
	ADD
		CONSTRAINT FK_childinfo_TO_reserve
		FOREIGN KEY (
			dno
		)
		REFERENCES childinfo (
			dno
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			bno
		)
		REFERENCES board (
			bno
		);

ALTER TABLE reserve
	ADD
		CONSTRAINT FK_member_TO_reserve
		FOREIGN KEY (
			mid
		)
		REFERENCES member (
			mid
		);

ALTER TABLE reserve
	ADD
		CONSTRAINT FK_class_TO_reserve
		FOREIGN KEY (
			ctype,
			cname,
			cdate2
		)
		REFERENCES class (
			ctype,
			cname,
			cdate
		);
		
create table admin(
	profit number default 0,
	pregdate DATE default sysdate NOT NULL
);

drop table message;
create table message(
   message_id number primary key,
   message_sender varchar2(45) not null,
   message_receiver varchar2(45) not null,
   message_content varchar2(2000) not null,
   message_sendTime date default sysdate,
   message_readTime date,
   from_id varchar2(45) not null,
   to_id varchar2(45) not nulld
);

/* messagesequence */
drop sequence message_seq;
create sequence message_seq
start with 1
increment by 1
nocycle
nocache;

drop table play;
drop sequence play_seq;
CREATE TABLE play (
  pno number(3) primary key,
  ptype varchar2(30) NOT NULL,
  pact varchar2(30) NOT NULL
);

drop sequence play_seq;
create sequence play_seq
start with 1
increment by 1
nocycle
nocache;

drop table faq;
create table faq(
	fno       number primary key,
	fcategory varchar2(500) not null,
	ftitle    varchar2(500) not null,
	fanswer   varchar2(500) not null
);

drop sequence faq_seq;
create sequence faq_seq
		start with 1
		increment by 1
		nocycle
		nocache;


drop table ds_zip;
CREATE TABLE ds_zip (
  ds_id number(3) primary key,
  ds_gugun varchar2(30) NOT NULL,
  ds_dong varchar2(75) NOT NULL
);

drop sequence ds_zip_seq;
create sequence ds_zip_seq
start with 1
increment by 1
nocycle
nocache;





		
		