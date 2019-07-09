    
spool "C:/Users/itiwari/Desktop/Project/Table1.txt"
CREATE TABLE PACK1 ( id INT PRIMARY KEY, name VARCHAR(20) );
INSERT INTO PACK1 VALUES ( 1, 'Alpha' );
INSERT INTO PACK1 VALUES ( 2, 'Beta' );
INSERT INTO PACK1 VALUES ( 3, 'Gamma' );
spool off;
