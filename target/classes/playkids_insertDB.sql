insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����1','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����2','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����3','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����4','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����5','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����6','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����7','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����8','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����9','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����10','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����11','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����12','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����13','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����14','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����15','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����16','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����17','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����18','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����19','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����20','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����21','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����22','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����23','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����24','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����25','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����26','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����27','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����28','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����29','��������','�ı�');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����30','��������','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����31','��������','��õ');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����32','��������','���');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����','�������׿���','����');
insert into board (bno, mid, title, content,category)
values (tbl_board_seq.nextval,'abcd1234','����','�������׿���2','����');


insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������1','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������2','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������3','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������4','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������5','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������6','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������7','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������8','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������9','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������10','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������11','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������12','abcd1234');
insert into reply (rno, bno, reply_content, replyer)
values (tbl_reply_seq.nextval,'1','�������13','abcd1234');

select * from reply

update board set regdate= sysdate-1 where bno in (30,29);

