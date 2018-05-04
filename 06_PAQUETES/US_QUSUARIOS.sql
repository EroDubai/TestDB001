prompt
prompt PACKAGE: US_QUSUARIOS
prompt
create or replace PACKAGE    US_QUSUARIOS IS
    --
    -- ===========================================================
    -- US_QUSUARIOS
    -- -----------------------------------------------------------
    -- Reï¿½ne funciones y procedimientos relacionados con la
    -- gestion de Usuarios. Paquete especializado de negocio
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versiï¿½n        GAP                Solicitud        Fecha        Realizï¿½            Descripciï¿½n
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
	  p_antiguedad_dias         OUT  NUMBER,
      p_cod_rta          	  	OUT  NE_TCRTA.CRTA_CRTA%type
  );
  PROCEDURE obtenerListadoSalarios
  (
      p_salarios_empleados        IN   NUMBER,
	  p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
  );
  PROCEDURE mayoresAnos
  (
      p_edad		        	  IN   NUMBER,
	  p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
  );
  PROCEDURE indexNombre
  (
      p_index		        	  IN   VARCHAR2,
	  p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
  );
  PROCEDURE insertarEmpleado
  (
	  p_FIRST_NAME               IN   EMPLOYEES.FIRST_NAME%type,
	  p_LAST_NAME                IN   EMPLOYEES.LAST_NAME%type,
	  p_HIRE_DATE                IN   EMPLOYEES.HIRE_DATE%type,
	  p_FECHA_NACIMIENTO         IN   EMPLOYEES.FECHA_NACIMIENTO%type,
	  p_SALARY                   IN   EMPLOYEES.SALARY%type
	  
  );
    -- ------------------------------------------------------------

END US_QUSUARIOS;
/


prompt
prompt PACKAGE BODY:US_QAUSUARIO
prompt

create or replace PACKAGE BODY    US_QUSUARIOS IS

	PROCEDURE insertarEmpleado
	  (
		   p_FIRST_NAME               IN   EMPLOYEES.FIRST_NAME%type,
		   p_LAST_NAME                IN   EMPLOYEES.LAST_NAME%type,
		   p_HIRE_DATE                IN   EMPLOYEES.HIRE_DATE%type,
		   p_FECHA_NACIMIENTO         IN   EMPLOYEES.FECHA_NACIMIENTO%type,
		   p_SALARY                   IN   EMPLOYEES.SALARY%type
	  )IS
        v_contador number;
        BEGIN

		v_contador := ID_ECONTADOR.NextVal;

		INSERT INTO EMPLOYEES(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,FECHA_NACIMIENTO,SALARY)
			   VALUES(v_contador,p_FIRST_NAME,p_LAST_NAME,p_HIRE_DATE,p_FECHA_NACIMIENTO,p_SALARY);

		EXCEPTION
			WHEN OTHERS THEN

			 DBMS_OUTPUT.PUT_LINE(sqlerrm);

		END insertarEmpleado;


	PROCEDURE indexNombre
	  (
		  p_index		        	  IN   VARCHAR2,
		  p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
	  )IS
		cursor c_empleados is
			SELECT 
				FIRST_NAME
			FROM 
				HR.EMPLOYEES em 
			WHERE 
				em.FIRST_NAME LIKE '%'|| to_char(p_index) ;

		r_empleados c_empleados%rowtype;

        BEGIN

		for r_empleados in c_empleados loop
                DBMS_OUTPUT.PUT_LINE('Nombre : '|| r_empleados.FIRST_NAME);
        end loop;


		EXCEPTION
			WHEN OTHERS THEN

			 DBMS_OUTPUT.PUT_LINE(sqlerrm);

		END indexNombre;

	PROCEDURE mayoresAnos
	  (
		  p_edad		        	  IN   NUMBER,
		  p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
	  )IS

	 cursor c_empleado is
		SELECT
            FIRST_NAME,
			TO_NUMBER(to_char(FECHA_NACIMIENTO,'yyyy')) AS anos,
			TO_NUMBER(to_char(FECHA_NACIMIENTO,'mm')) AS mes,
			TO_NUMBER(to_char(FECHA_NACIMIENTO,'dd')) AS dias
		FROM
			HR.EMPLOYEES;

      cursor c_fecha is
      SELECT
         TO_NUMBER(to_char(sysdate,'yyyy')) AS anos,
         TO_NUMBER(to_char(sysdate,'mm')) AS mes,
		 TO_NUMBER(to_char(sysdate,'dd')) AS dias
      FROM
            HR.EMPLOYEES;

       r_empleado     c_empleado%rowtype;
       r_fecha 		  c_fecha%rowtype;
	   v_dias_ope	  FLOAT;
	   v_anos	 	  NUMBER;
	   v_meses 		  NUMBER;
	   v_dias 		  NUMBER;


        BEGIN

		open c_fecha;
        fetch c_fecha into r_fecha;
        close c_fecha;


		FOR  r_empleado in c_empleado LOOP

			if(r_empleado.anos is not null) then

				v_anos  := r_fecha.anos - r_empleado.anos;
				v_meses := r_fecha.mes  - r_empleado.mes;
				v_dias  := r_fecha.dias - r_empleado.dias;

				v_anos  := v_anos*365;
				v_meses := v_meses*30;

				v_dias_ope := v_dias + v_meses + v_anos;

				v_dias_ope := v_dias_ope/365;
				v_anos  := TRUNC(v_dias_ope);

                if(v_anos > p_edad) then
				DBMS_OUTPUT.PUT_LINE('Nombre : '||r_empleado.FIRST_NAME || '    Anos : '  ||v_anos);

                end if;
			end if;
            p_cod_rta  := 'OK';
		END LOOP;

		EXCEPTION
			WHEN OTHERS THEN

			 DBMS_OUTPUT.PUT_LINE(sqlerrm);

		END mayoresAnos;

     PROCEDURE obtenerAntiguedad
    (
        p_id_usuario              	  IN   EMPLOYEES.EMPLOYEE_ID%type,
    		p_antiguedad_anos         OUT  NUMBER,
            p_antiguedad_meses        OUT  NUMBER,
			p_antiguedad_dias         OUT  NUMBER,
    		p_cod_rta          	  	  OUT  NE_TCRTA.CRTA_CRTA%type
    )IS

      cursor c_usuario is
			SELECT
                TO_NUMBER(to_char(HIRE_DATE,'yyyy')) AS anos,
                TO_NUMBER(to_char(HIRE_DATE,'mm')) AS mes,
				TO_NUMBER(to_char(HIRE_DATE,'dd')) AS dias
			FROM
				HR.EMPLOYEES em
          WHERE
				em.EMPLOYEE_ID = p_id_usuario;

      cursor c_fecha is
      SELECT
         TO_NUMBER(to_char(sysdate,'yyyy')) AS anos,
         TO_NUMBER(to_char(sysdate,'mm')) AS mes,
		 TO_NUMBER(to_char(sysdate,'dd')) AS dias
      FROM
            HR.EMPLOYEES em
      WHERE
            em.EMPLOYEE_ID = p_id_usuario;

       r_usuario_hire c_usuario%rowtype;
       r_fecha 		  c_fecha%rowtype;
	   v_dias_ope	  FLOAT;
	   v_anos	 	  NUMBER;
	   v_meses 		  NUMBER;
	   v_dias 		  NUMBER;

    BEGIN


        open c_usuario;
        fetch c_usuario into r_usuario_hire;
        close c_usuario;

        open c_fecha;
        fetch c_fecha into r_fecha;
        close c_fecha;

        if(r_usuario_hire.anos is not null) then

            v_anos  := r_fecha.anos - r_usuario_hire.anos;
            v_meses := r_fecha.mes  - r_usuario_hire.mes;
			v_dias  := r_fecha.dias - r_usuario_hire.dias;

			v_anos  := v_anos*365;
			v_meses := v_meses*30;

			v_dias_ope := v_dias + v_meses + v_anos;
			
			DBMS_OUTPUT.PUT_LINE('Total Dias : '||v_dias_ope);

			v_dias_ope := v_dias_ope/365;
			p_antiguedad_anos  := TRUNC(v_dias_ope);

			v_dias_ope := (v_dias_ope - p_antiguedad_anos)*12;
			p_antiguedad_meses := TRUNC(v_dias_ope);

			v_dias_ope := (v_dias_ope - p_antiguedad_meses)*30;
			p_antiguedad_dias  := (TRUNC(v_dias_ope)+2);
			
            DBMS_OUTPUT.PUT_LINE('Anos : '||p_antiguedad_anos);
            DBMS_OUTPUT.PUT_LINE('Meses : '||p_antiguedad_meses);
            DBMS_OUTPUT.PUT_LINE('Dias : '||p_antiguedad_dias);
            p_cod_rta  := 'OK';

        else
            p_antiguedad_anos := null;
            p_antiguedad_meses := null;
			p_antiguedad_dias := null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN

         DBMS_OUTPUT.PUT_LINE(sqlerrm);

    END obtenerAntiguedad;

	PROCEDURE obtenerListadoSalarios
	  (
		  p_salarios_empleados        IN   NUMBER,
		  p_cod_rta          	  	OUT  NE_TCRTA.CRTA_CRTA%type
	  )IS
		cursor c_empleados is
			SELECT 
				*
			FROM 
				HR.EMPLOYEES em 
			WHERE 
				em.SALARY > (700000*p_salarios_empleados);

		r_empleados c_empleados%rowtype;

        BEGIN

            for r_empleados in c_empleados loop
				if(r_empleados.SALARY is not null) then
					DBMS_OUTPUT.PUT_LINE('Nombre : '|| r_empleados.FIRST_NAME || '	Salario : '|| r_empleados.SALARY);
					p_cod_rta  := 'OK';
				else
					p_cod_rta  := 'FALLO';
				end if;
            end loop;



		EXCEPTION
			WHEN OTHERS THEN

			 DBMS_OUTPUT.PUT_LINE(sqlerrm);

		END obtenerListadoSalarios;

END US_QUSUARIOS;
/

