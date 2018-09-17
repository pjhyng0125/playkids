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

insert into play values(play_seq.nextval,'야외놀이','축구');
insert into play values(play_seq.nextval,'야외놀이','농구');
insert into play values(play_seq.nextval,'야외놀이','요가');
insert into play values(play_seq.nextval,'야외놀이','클라이밍');

insert into play values(play_seq.nextval,'실내놀이','켈리그라피');
insert into play values(play_seq.nextval,'실내놀이','연극놀이');
insert into play values(play_seq.nextval,'실내놀이','창의력 문제풀이');
insert into play values(play_seq.nextval,'실내놀이','추리게임');
