prompt
prompt PACKAGE: US_QUSUARIOS
prompt
CREATE OR REPLACE PACKAGE HR.US_QUSUARIOS IS
    --
    -- ===========================================================
    -- US_QUSUARIOS
    -- -----------------------------------------------------------
    -- Re�ne funciones y procedimientos relacionados con la
    -- gestion de Usuarios. Paquete especializado de negocio
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versi�n        GAP                Solicitud        Fecha        Realiz�            Descripci�n
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 1000                                             03/03/2018      ownk           Se crean API de servicios para el modulo de Gestion Usuario Pacrim
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================


    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================

  PROCEDURE obtenerAntiguedad
  (
      p_id_usuario              IN   EMPLOYEES.EMPLOYEE_ID%type,
      p_antiguedad_anos         OUT  NUMBER,
      p_antiguedad_meses        OUT  NUMBER,
      p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
  );
    -- ------------------------------------------------------------

END US_QUSUARIOS;
/


prompt
prompt PACKAGE BODY:US_QUSUARIOS
prompt

create or replace PACKAGE BODY    US_QUSUARIOS IS


    --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE consultarRolUsuariousuario
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
    PROCEDURE obtenerAntiguedad
    (
        p_id_usuario              IN   EMPLOYEES.EMPLOYEE_ID%type,
    		p_antiguedad_anos         OUT  NUMBER,
            p_antiguedad_meses        OUT  NUMBER,
    		p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
    )IS

      cursor c_usuario is
			SELECT
                TO_NUMBER(to_char(HIRE_DATE,'yyyy')) AS anos,
                TO_NUMBER(to_char(HIRE_DATE,'mm')) AS mes
			FROM
				HR.EMPLOYEES em
          WHERE
            em.EMPLOYEE_ID = p_id_usuario;

      cursor c_fecha is
      SELECT
         TO_NUMBER(to_char(sysdate,'yyyy')) AS anos,
         TO_NUMBER(to_char(sysdate,'mm')) AS mes
      FROM
            HR.EMPLOYEES em
      WHERE
            em.EMPLOYEE_ID = p_id_usuario;

       r_usuario_hire c_usuario%rowtype;
       r_fecha c_fecha%rowtype;

    BEGIN


        open c_usuario;
        fetch c_usuario into r_usuario_hire;
        close c_usuario;

        open c_fecha;
        fetch c_fecha into r_fecha;
        close c_fecha;

        if(r_usuario_hire.anos is not null) then

            p_antiguedad_anos  := r_fecha.anos - r_usuario_hire.anos;
            p_antiguedad_meses := r_usuario_hire.mes - r_fecha.mes;

            p_cod_rta  := 'OK';

        else
            p_antiguedad_anos := null;
            p_antiguedad_meses := null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN

         DBMS_OUTPUT.PUT_LINE(sqlerrm);

    END obtenerAntiguedad;


END US_QUSUARIOS;
/
