--------------------
-- ������ ���Ἲ ����
--------------------
create table kopo_product_volume(
regionid varchar2(20),
productgroup varchar2(20),
yearweek varchar2(8),
volume number not null,
constraint pk_kopo_product_volume primary key(regionid,productgroup, yearweek));

insert into kopo_product_volume
values('regionid','productgroup',null,'volume');

 -------------------
 -- ��ü ���Ἲ ����
 -------------------
insert into kopo_product_volume
values ('A01','ST0002','201503',20);

insert into kopo_product_volume
values ('A01','ST0002','201504',20);

--- kopo_product_volume.csv import 

insert into kopo_product_volume
values ('A01','ST0002','201503',20);

UPDATE KOPO_PRODUCT_VOLUME
SET YEARWEEK = '201503'
WHERE 1=1
AND YEARWEEK = '201504'
AND PRODUCTGROUP = 'ST0002';

 
 -------------------
 -- ����Ű ���Ἲ ����
 -------------------
 -- �θ����̺� ����
 CREATE TABLE KOPO_EVENT_INFO_FOREIGN(
     EVENTID VARCHAR2(20),
     EVENTPERIOD VARCHAR2(20),
     PROMOTION_RATIO NUMBER,
 constraint pk_kopo_event_info_foreign primary key(EVENTID));

-- �ڽ����̺� ����
 CREATE TABLE KOPO_PRODUCT_VOLUME_FOREIGN(
     REGIONID VARCHAR2(20),
     PRODUCTGROUP VARCHAR2(20),
     YEARWEEK VARCHAR2(8),
     VOLUME NUMBER NOT NULL,
     EVENTID VARCHAR2(20),
 constraint pk_kopo_product_volume_foreign primary key(REGIONID, PRODUCTGROUP, YEARWEEK),
 constraint fk_kopo_product_volume_foreign foreign key(eventid) references KOPO_EVENT_INFO_FOREIGN(EVENTID) );
 
 -- ������ import (�θ����̺� ����)
 -- �ڽ����̺� import �ÿ��� constraint disable�� ����
 alter table kopo_product_volume_foreign enable constraint fk_kopo_product_volume_foreign;
 
 -- ���� ���Ἲ ����
 -- 1. �θ����̺� event ���� ���µ� �ڽ� ���̺� ���� �õ���
 insert into kopo_product_volume_foreign
 values ('A01','ST00002','201501',50,'EVTEST');
 
 -- 2. �ڽĿ� ������ �ִµ� �θ����̺��� ������� �õ���
DELETE FROM KOPO_EVENT_INFO_FOREIGN
WHERE EVENTID = 'EV00001';

-- 2�� ���̽��� ���ؼ� �ٸ� option ��밡��
-- Ű ������ ����
ALTER TABLE KOPO_PRODUCT_VOLUME_FOREIGN
    DROP CONSTRAINT fk_kopo_product_volume_foreign;

-- Ű ������ ���� ����
-- �ɼ� ���� �� DEFAUT = RESTRICT
-- ON DELETE SET NULL : �θ����̺��� ���� ���� �� �ڽ����̺� �� NULL ó��
-- ON DELETE CASCADE  : �θ����̺��� ���� ���� �� �ڽ����̺� �ش� �� ��ü�� ������
ALTER TABLE KOPO_PRODUCT_VOLUME_FOREIGN
    ADD CONSTRAINT  fk_kopo_product_volume_foreign  FOREIGN KEY(EVENTID)     
    REFERENCES KOPO_EVENT_INFO_FOREIGN (EVENTID) on delete cascade;




