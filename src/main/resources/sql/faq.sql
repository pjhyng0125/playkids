
create table faq(
	fno       number primary key,
	fcategory varchar2(500) not null,
	ftitle    varchar2(500) not null,
	fanswer   varchar2(500) not null
);

create sequence faq_seq
		start with 1
		increment by 1
		nocycle
		nocache;

drop table faq;
drop sequence faq_seq;

select * from faq;

insert into faq values(faq_seq.nextval,'로그인','로그인확인1','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인2','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인3','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인4','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인5','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인6','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인7','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인8','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인9','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인10','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인11','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인12','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인13','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인14','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인15','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인16','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인17','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인18','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인19','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인20','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인21','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인22','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인23','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인24','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인25','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인26','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인27','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인28','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인29','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인30','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인31','답글');
insert into faq values(faq_seq.nextval,'로그인','로그인확인32','답글');
