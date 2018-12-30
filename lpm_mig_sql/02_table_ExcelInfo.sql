drop table EXCELINFO;

-- Create table
create table EXCELINFO
(
  action     VARCHAR2(200) not null,
  tablename  VARCHAR2(200) not null,
  sheetname  VARCHAR2(200) not null,
  titlename  VARCHAR2(200) not null,
  sortno     VARCHAR2(10) not null,
  isinuse    VARCHAR2(10) not null,
  checkmode  VARCHAR2(10),
  actionname VARCHAR2(200)
);
