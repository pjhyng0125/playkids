















drop table board;
create table board(
	bno number constraint tbl_board_pk primary key,
	category varchar2(50) not null,
	mid varchar2(50) not null,
	title varchar2(200) not null,
	content varchar2(1000),
	count number default 0,
	regdate DATE default sysdate
);


drop sequence tbl_board_seq;
create sequence tbl_board_seq
	start with 1
	increment by 1
	nocycle
	nocache;