
-- �����ͺ��̽� ��ũ ����
-- �������� oracle db�� �����ϱ� ���� ������
-- 1��. tnsname Ȱ��
CREATE DATABASE LINK ASUS_LINK
CONNECT TO kopo
IDENTIFIED BY kopo
Using 'tns������'

-- 2��. ����ȣ���� Ȱ��
CREATE DATABASE LINK ASUS_LINK
CONNECT TO kopo
IDENTIFIED BY kopo
Using '(
DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.18)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE)
    )
  )')

-- ������ �����ͺ��̽� ��ũ Ȯ�ι��
SELECT * FROM ALL_DB_LINKS

-- �����ͺ��̽� ��ũ �������
DROP DATABASE LINK ASUS_LINK;
