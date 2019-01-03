-- INSTRUCCIONES
-- REEMPLAZAR EL TEXTO _ADA_DB_ CON EL NOMBRE DEL PROYECTO

SET DEFINE '&';
SET DEFINE ON;
@@VARIABLES.sql

PROMPT ********************  NOTA IMPORTANTE!!!!  ***********************
PROMPT *                                                                *
PROMPT *  POR FAVOR ENVIAR LOS LOGS DE EJECUCION DE ESTE SCRIPT (.LST)  *
PROMPT *  PARA EFECTOS DE VERIFICACION DEL CAMBIO                       *
PROMPT *                                                                *
PROMPT *                                                                *
PROMPT *                     ADA Inc                                *
PROMPT *                                                                *
PROMPT *                                                                *
PROMPT ******************************************************************
SET SERVEROUTPUT ON SIZE 10000
SET LINESIZE 500
SET VERIFY ON


SPOOL SALIDA__ADA_DB_.LST;    


-- SCRIPTS
prompt CORRIENDO SCRIPTS
prompt ==================================================================
prompt @INSTALL_OBJECTS.sql
@@INSTALL_OBJECTS.sql


SPOOL OFF

SET FEEDBACK ON
SET PAGES 200

PROMPT Si la ejecuci�n del script no presenta ning�n problema por favor haga 
PROMPT COMMIT, de lo contrario haga ROLLBACK y comuniquese con ADA Inc
PROMPT


PROMPT ********************  NOTA IMPORTANTE!!!!  ***********************
PROMPT *                                                                *
PROMPT *  POR FAVOR ENVIAR EL LOG DE EJECUCION DE ESTE SCRIPT (*.LST)   *
PROMPT *  PARA EFECTOS DE VERIFICACION DEL CAMBIO                       *
PROMPT *  AL CORREO proyectos@ADA.CO                                   *
PROMPT *                                                                *
PROMPT *                        ADA S.A.S                              *
PROMPT *                                                                *
PROMPT ******************************************************************