
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

insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��1','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��2','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��3','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��4','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��5','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��6','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��7','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��8','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��9','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��10','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��11','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��12','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��13','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��14','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��15','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��16','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��17','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��18','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��19','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��20','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��21','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��22','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��23','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��24','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��25','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��26','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��27','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��28','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��29','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��30','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��31','���');
insert into faq values(faq_seq.nextval,'�α���','�α���Ȯ��32','���');
