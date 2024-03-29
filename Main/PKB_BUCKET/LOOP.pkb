spool C:\Users\itiwari\Desktop\Project\LOOP.txt
create or replace package body pipe_row_test as

function fun return t_tab pipelined
as
    vRow t_tab_row;
begin
    for rec in ( select Id from tbl )
    loop
        vrow.Id := rec.Id;
        pipe row (vrow);
    end loop;
         
end;


function prodfunc(n number) return mytabletype pipelined is
begin
    <<pipes>>
    for i in 1 .. 5 loop
    	pipe row (myobjectformat(n,sysdate+i,'row '||i));
    end loop pipes;
    return;
end;

end;
spool off;
