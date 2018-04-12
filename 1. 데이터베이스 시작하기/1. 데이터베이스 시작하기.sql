---------------------------------
-- 1. ���̺� �����̽� (* DBA ����� ������ �α���) ��: SYSTEM OR SYS
---------------------------------
-- ���̺� �����̽� ����
CREATE TABLESPACE       TS_USER01
   DATAFILE 'C:\ORACLE\DATA\TS_USER_01.dbf' SIZE 1024M
   AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
   SEGMENT SPACE MANAGEMENT AUTO;
   
-- ���̺� �����̽� ����
DROP TABLESPACE       TS_USER01
   INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
---------------------------------
-- 2. �����
---------------------------------   
-- ����� ����
CREATE USER HAITEAM
                  IDENTIFIED BY        HAITEAM
                  DEFAULT TABLESPACE   TS_USER01
                  TEMPORARY TABLESPACE TEMP;

-- ����� ����
ALTER USER HAITEAM
   IDENTIFIED BY HAITEAM2;
   -- ACCOUNT LOCK/UNLOCK

---------------------------------
-- 3. ����� ����
---------------------------------  
-- ����� ���� ���� (����/���ҽ� �� ���̺� ����)
GRANT CONNECT, RESOURCE, DBA TO HAITEAM;

-- ����� ���� ȸ�� (����/���ҽ� �� ���̺� ����)
REVOKE DBA FROM HAITEAM;

---------------------------------
-- 4. ���� ���̺� ���� (* ������ ����� ������ �α���)
---------------------------------  
-- ����� ������ ���� ��
-- ���� ���̺� ����
CREATE TABLE KOPO_PRODUCT_VOLUME
(
  REGIONID          VARCHAR2(20),
  PRODUCTGROUP      VARCHAR2(20),
  YEARWEEK          VARCHAR2(6),
  VOLUME            NUMBER
);

-- ���̺� ��� ��ȸ
SELECT * FROM TABS;

