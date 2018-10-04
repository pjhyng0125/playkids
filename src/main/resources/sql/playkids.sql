/* business */
drop table business;
CREATE TABLE business (
	bid VARCHAR2(50) NOT NULL, /* ������̵� */
	bpw VARCHAR2(50), /* �н����� */
	bname VARCHAR2(30), /* ����� */
	bintro VARCHAR2(500), /* ��ü�Ұ� */
	bphone VARCHAR2(20), /* ����ó */
	baddress VARCHAR2(100), /* �ּ� */
	bregdate DATE, /* ������ */
	baccount VARCHAR2(20) /* ���¹�ȣ */
);

COMMENT ON TABLE business IS 'business';

COMMENT ON COLUMN business.bid IS '������̵�';

COMMENT ON COLUMN business.bpw IS '�н�����';

COMMENT ON COLUMN business.bname IS '�����';

COMMENT ON COLUMN business.bintro IS '��ü�Ұ�';

COMMENT ON COLUMN business.bphone IS '����ó';

COMMENT ON COLUMN business.baddress IS '�ּ�';

COMMENT ON COLUMN business.bregdate IS '������';

COMMENT ON COLUMN business.baccount IS '���¹�ȣ';

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
	bid VARCHAR2(50), /* ������̵� */
	ctype VARCHAR2(30) NOT NULL, /* Ŭ����Ÿ�� */
	cname VARCHAR2(30) NOT NULL, /* Ŭ������ */
	cpic VARCHAR2(30), /* Ŭ�������� */
	cage VARCHAR2(10) NOT NULL, /* ���峪�� */
	cintro VARCHAR2(500) NOT NULL, /* Ŭ�����Ұ� */
	cdate DATE NOT NULL, /* Ŭ����������¥ */
	prepare VARCHAR2(300) NOT NULL, /* �غ� */
	notice VARCHAR2(500) NOT NULL, /* ���ǻ��� */
	price NUMBER NOT NULL, /* �ݾ� */
	cteachername VARCHAR2(20) NOT NULL, /* ����� */
	cteacherpic VARCHAR2(30), /* ������� */
	cteacher VARCHAR2(500) NOT NULL, /* ����Ұ� */
	cregdate DATE default sysdate NOT NULL,	/*Ŭ���������*/
	park VARCHAR2(3) ,
	protect VARCHAR2(3),
	together VARCHAR2(3),
	autho CHAR(1) default '0' /* ���� */
);

COMMENT ON TABLE class IS 'class';

COMMENT ON COLUMN class.ctype IS 'Ŭ����Ÿ��';

COMMENT ON COLUMN class.cname IS 'Ŭ������';

COMMENT ON COLUMN class.cdate IS 'Ŭ���������';

COMMENT ON COLUMN class.cpic IS 'Ŭ��������';

COMMENT ON COLUMN class.bid IS '������̵�';

COMMENT ON COLUMN class.cage IS '���峪��';

COMMENT ON COLUMN class.cintro IS 'Ŭ�����Ұ�';

COMMENT ON COLUMN class.cteacher IS '����Ұ�';

COMMENT ON COLUMN class.cteacherpic IS '�������';

COMMENT ON COLUMN class.prepare IS '�غ�';

COMMENT ON COLUMN class.notice IS '���ǻ���';

COMMENT ON COLUMN class.price IS '�ݾ�';

COMMENT ON COLUMN class.autho IS '����';

CREATE UNIQUE INDEX PK_class
	ON class (cno ASC);
	
ALTER TABLE class
	ADD
		CONSTRAINT PK_class
		PRIMARY KEY (cno);

/* location */
CREATE TABLE location (
	bid VARCHAR2(50) NOT NULL, /* ������̵� */
	si VARCHAR2(20), /* ���̸� */
	gu VARCHAR2(20) /* ���̸� */
);

COMMENT ON TABLE location IS 'location';

COMMENT ON COLUMN location.bid IS '������̵�';

COMMENT ON COLUMN location.si IS '���̸�';

COMMENT ON COLUMN location.gu IS '���̸�';

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
	mid VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	mpw VARCHAR2(50), /* �н����� */
	mname VARCHAR2(30), /* �̸� */
	maddress VARCHAR2(50), /* �ּ� */
	mphone VARCHAR2(20), /* ����ó */
	mbirth Date, /* ������� */
	minterest VARCHAR2(30), /* ���ɺо� */
	mregdate DATE default sysdate NOT NULL,
	mcash NUMBER default 0
);

select * from MEMBER;

COMMENT ON TABLE member IS 'member';

COMMENT ON COLUMN member.mid IS 'ȸ�����̵�';

COMMENT ON COLUMN member.mpw IS '�н�����';

COMMENT ON COLUMN member.mname IS '�̸�';

COMMENT ON COLUMN member.maddress IS '�ּ�';

COMMENT ON COLUMN member.mphone IS '����ó';

COMMENT ON COLUMN member.mbirth IS '�������';

COMMENT ON COLUMN member.minterest IS '���ɺо�';

COMMENT ON COLUMN member.mregdate IS '������';

COMMENT ON COLUMN member.mcash IS 'ĳ��';

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

/* childinfo */
CREATE TABLE childinfo (
	no NUMBER NOT NULL, /* ��ȣ */
	mid VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	dname VARCHAR2(50), /* �ڳ��̸� */
	dgender VARCHAR2(5), /* �ڳ༺�� */
	dbirth CHAR(6) /* �ڳ������� */
);

COMMENT ON TABLE childinfo IS 'childinfo';

COMMENT ON COLUMN childinfo.no IS '��ȣ';

COMMENT ON COLUMN childinfo.mid IS 'ȸ�����̵�';

COMMENT ON COLUMN childinfo.dname IS '�ڳ��̸�';

COMMENT ON COLUMN childinfo.dgender IS '�ڳ༺��';

COMMENT ON COLUMN childinfo.dbirth IS '�ڳ�������';

CREATE UNIQUE INDEX PK_childinfo
	ON childinfo (
		no ASC
	);

ALTER TABLE childinfo
	ADD
		CONSTRAINT PK_childinfo
		PRIMARY KEY (
			no
		);

/* agegrade */
CREATE TABLE agegrade (
	grade VARCHAR2(10), /* ���̵�� */
	min NUMBER, /* �ּҳ��� */
	max NUMBER /* �ִ볪�� */
);

COMMENT ON TABLE agegrade IS 'agegrade';

COMMENT ON COLUMN agegrade.grade IS '���̵��';

COMMENT ON COLUMN agegrade.min IS '�ּҳ���';

COMMENT ON COLUMN agegrade.max IS '�ִ볪��';

/* board */
CREATE TABLE board (
	bno NUMBER NOT NULL, /* �Խù���ȣ */
	mid VARCHAR2(50), /* ȸ�����̵� */
	title VARCHAR2(200), /* ���� */
	content VARCHAR2(1000), /* ���� */
	regdate DATE, /* ������� */
	count NUMBER /* ��ȸ�� */
);

COMMENT ON TABLE board IS 'board';

COMMENT ON COLUMN board.bno IS '�Խù���ȣ';

COMMENT ON COLUMN board.mid IS 'ȸ�����̵�';

COMMENT ON COLUMN board.title IS '����';

COMMENT ON COLUMN board.content IS '����';

COMMENT ON COLUMN board.regdate IS '�������';

COMMENT ON COLUMN board.count IS '��ȸ��';

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

/* reply */
CREATE TABLE reply (
	rno NUMBER NOT NULL, /* ��۹�ȣ */
	content VARCHAR2(500), /* ���� */
	regdate DATE, /* ������� */
	bno NUMBER /* �Խù���ȣ */
);

COMMENT ON TABLE reply IS 'reply';

COMMENT ON COLUMN reply.rno IS '��۹�ȣ';

COMMENT ON COLUMN reply.content IS '����';

COMMENT ON COLUMN reply.regdate IS '�������';

COMMENT ON COLUMN reply.bno IS '�Խù���ȣ';

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
	mid VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	cno number NOT NULL,
	regdate DATE /* Ȯ���� */
);

COMMENT ON TABLE reserve IS 'reserve';

COMMENT ON COLUMN reserve.mid IS 'ȸ�����̵�';

COMMENT ON COLUMN reserve.bid IS '������̵�';

COMMENT ON COLUMN reserve.cdate IS 'Ŭ���������';

COMMENT ON COLUMN reserve.cname IS 'Ŭ������';

COMMENT ON COLUMN reserve.rdate IS 'Ȯ����';

COMMENT ON COLUMN reserve.price IS '�ݾ�';

COMMENT ON COLUMN reserve.ctype IS 'Ŭ����Ÿ��';

COMMENT ON COLUMN reserve.cdate2 IS 'Ŭ���������2';

CREATE UNIQUE INDEX PK_reserve
	ON reserve (
		mid ASC,
		cno ASC
	);

ALTER TABLE reserve
	ADD
		CONSTRAINT PK_reserve
		PRIMARY KEY (
		mid ASC,
		cno ASC
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
	profit number default 0
);

		
		