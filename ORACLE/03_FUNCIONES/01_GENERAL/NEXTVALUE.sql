create or replace FUNCTION "&USUARIOBD"."NEXTVALUE" (sequencename in varchar) return number is
  result number;
begin
  EXECUTE IMMEDIATE ('select ' || sequencename || '.nextval from dual') into result;
  return(result);
  
end NEXTVALUE;
/