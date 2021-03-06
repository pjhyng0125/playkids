















drop table board;
create table board(
	bno number constraint tbl_board_pk primary key,
	mid varchar2(50) not null,
	title varchar2(200) not null,
	content varchar2(1000),
	count number default 0,
	regdate DATE default sysdate,
	newflag number default 1,							
	category varchar2(50)	
);

alter table board 
add constraint fk_member_to_board
	foreign key(mid)
	references member(mid);


drop sequence tbl_board_seq;
create sequence tbl_board_seq
	start with 1
	increment by 1
	nocycle
	nocache;
	
	
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

alter table reply 
add constraint fk_member_to_reply
	foreign key(bno)
	references board(bno);
	
	
	
	
	
	
	
	
--------------------------------------- 필요 없는 부분 ------------------	
	select bno, mid, title, content, regdate,count,
     case
     when (sysdate-regdate<1)  then 1
     else 0
     end newflag,(select count(*) from reply where reply.bno = board.bno) reply_cnt
     from board
     order by bno desc;
	
	