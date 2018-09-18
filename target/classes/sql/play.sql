select * from play;
-- play.sql
drop table play;
drop sequence play_seq;
CREATE TABLE play (
  pno number(3) primary key,
  ptype varchar2(30) NOT NULL,
  pact varchar2(30) NOT NULL
);

create sequence play_seq
start with 1
increment by 1
nocycle
nocache;

insert into play values(play_seq.nextval,'�߿ܳ���','�౸');
insert into play values(play_seq.nextval,'�߿ܳ���','��');
insert into play values(play_seq.nextval,'�߿ܳ���','�䰡');
insert into play values(play_seq.nextval,'�߿ܳ���','Ŭ���̹�');

insert into play values(play_seq.nextval,'�ǳ�����','�̸��׶���');
insert into play values(play_seq.nextval,'�ǳ�����','���س���');
insert into play values(play_seq.nextval,'�ǳ�����','â�Ƿ� ����Ǯ��');
insert into play values(play_seq.nextval,'�ǳ�����','�߸�����');
