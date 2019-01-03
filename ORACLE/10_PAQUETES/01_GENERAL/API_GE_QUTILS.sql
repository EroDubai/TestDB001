prompt
prompt PACKAGE: API_GE_QUTILS
prompt

CREATE OR REPLACE PACKAGE "&USUARIOBD".API_GE_QUTILS IS
    -- ===========================================================
    -- API_GE_QUTILS: Re�ne funciones y procedimientos utiles
    -- para la integracion con SAF.
    -- ===========================================================
    --
    -- #VERSION:0000001001
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Version     GAP           Solicitud     Fecha      Realizo       Descripcion
    -- ----------- ------------- ------------- ---------- ------------- --------------------------------------------------------------------------------
    -- 1000                                    03/08/2017 ADA          Se crean estructura general
    -- ----------- ------------- ------------- ---------- ------------- --------------------------------------------------------------------------------
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================

    PROCEDURE registrar_error
    (
        p_errores        in out TYPE_TT_GE_ERRO,
        p_prcs           in ge_tcrta.crta_prcs%type,
        p_crta           in ge_tcrta.crta_crta%type,
        p_detalle        in varchar2 default null
        
    );
    
    PROCEDURE obtener_errores_log
    (
        -- (in) Campos de negocio
        p_lgtr              number,
        
        -- (out) Campos de negocio
        p_errores           out TYPE_TT_GE_ERRO
    );
    --
    PROCEDURE getNextValue(p_nombre_secuencia IN VARCHAR2,      
                           p_valor            OUT NUMBER);
    --
    FUNCTION getMensajePorCodigo(p_codigo IN GE_TCRTA.CRTA_CRTA%TYPE,
                                 p_prcs   IN GE_TCRTA.CRTA_PRCS%TYPE) RETURN VARCHAR2;
    --
    /*
    Procedimiento que genera type de mensaje de respuesta
    */
    PROCEDURE generarTypeMensajeRpta (p_codigo          IN GE_TCRTA.CRTA_CRTA%TYPE,
                                      p_prcs            IN GE_TCRTA.CRTA_PRCS%TYPE,
                                      p_type_mensaje    IN OUT TYPE_TT_GE_MNSJE,
                                      p_textoAdicional  IN VARCHAR2 DEFAULT  ' ');
    --
    PROCEDURE generarTypeErrorRpta (p_codigo          IN GE_TCRTA.CRTA_CRTA%TYPE,
                                    p_prcs            IN GE_TCRTA.CRTA_PRCS%TYPE,
                                    p_type_mensaje    OUT TYPE_TT_GE_ERRO);
    --
    PROCEDURE crearLogTransaccion(p_proceso VARCHAR2,
                                  p_valor   clob);
    --
    FUNCTION obtenerDescripcionProceso(p_proceso varchar2) return VARCHAR2;
    --
    PROCEDURE obtenerFechaConFormato(p_fecha_in  IN VARCHAR2,
                                     p_fecha_out OUT VARCHAR2);
    --
END API_GE_QUTILS;
/

prompt
prompt PACKAGE BODY: API_GE_QUTILS
prompt

CREATE OR REPLACE PACKAGE BODY "&USUARIOBD".API_GE_QUTILS IS

    --
    -- #VERSION:0000001001
    --

    -- ===========================================================
    -- PROCEDURE PRIVADO registrar_error
    -- -----------------------------------------------------------
    -- Procedimiento que permite registrar un nuevo errores 
    -- encontrados en el proceso 
    -- ===========================================================
    PROCEDURE registrar_error
    (
        p_errores        in out TYPE_TT_GE_ERRO,
        p_prcs           in ge_tcrta.crta_prcs%type,
        p_crta           in ge_tcrta.crta_crta%type,
        p_detalle        in varchar2 default null
    )
    is
        v_object_error                TYPE_TO_GE_ERRO ;
        
    
    begin
            
        v_object_error         :=   TYPE_TO_GE_ERRO(sysdate, p_prcs, p_crta, p_detalle);
        p_errores.extend;
        p_errores(p_errores.count) := v_object_error;
    
    end registrar_error;
    
    -- ===========================================================
    -- PROCEDURE obtener_errores 
    -- -----------------------------------------------------------
    -- Procedimiento privado que permite consultgar los errores
    -- asociados a un proceso
    -- ===========================================================
    
    PROCEDURE obtener_errores_log
    (
        -- (in) Campos de negocio
        p_lgtr              number,
        
        -- (out) Campos de negocio
        p_errores           out TYPE_TT_GE_ERRO
    )
    IS
     errores_object TYPE_TO_GE_ERRO;
    BEGIN
        
       /* open p_errores for
                select   crta_crta, crta_http_code, substr(crta_descri || ' ' || dlgtr_observ, 1, 4000)
                    from GE_TDLGTR, ge_tcrta
                    where dlgtr_lgtr = p_lgtr 
                    and dlgtr_prcs = crta_prcs
                    and dlgtr_crta = crta_crta; */
                    
        NULL;
    EXCEPTION
        WHEN OTHERS THEN
            null;
            

    END obtener_errores_log;
    --
     PROCEDURE getNextValue(p_nombre_secuencia IN VARCHAR2,      
                           p_valor            OUT NUMBER)IS
        --
        CURSOR c_next_value (pc_nombre_secuencia VARCHAR2) IS
        SELECT nextvalue(pc_nombre_secuencia) 
          FROM dual;
        --
    BEGIN
        --
           OPEN c_next_value(p_nombre_secuencia);
           FETCH c_next_value INTO p_valor;
           CLOSE c_next_value;
        --
    END;
    --
    FUNCTION getMensajePorCodigo(p_codigo IN GE_TCRTA.CRTA_CRTA%TYPE,
                                 p_prcs   IN GE_TCRTA.CRTA_PRCS%TYPE)  RETURN VARCHAR2 IS
        --
        CURSOR c_mensaje_rpta IS
        SELECT CRTA_DESCRI
          FROM GE_TCRTA
         WHERE CRTA_CRTA = p_codigo
           AND CRTA_PRCS = p_prcs;
        --
        v_mensaje_rpta GE_TCRTA.CRTA_DESCRI%type;
        --
    BEGIN
        --
        OPEN c_mensaje_rpta;
        FETCH c_mensaje_rpta INTO v_mensaje_rpta;
        CLOSE c_mensaje_rpta;
        RETURN v_mensaje_rpta;
        --
    END;
    --
    PROCEDURE generarTypeMensajeRpta (p_codigo          IN GE_TCRTA.CRTA_CRTA%TYPE,
                                      p_prcs            IN GE_TCRTA.CRTA_PRCS%TYPE,
                                      p_type_mensaje    IN OUT TYPE_TT_GE_MNSJE,
                                      p_textoAdicional  IN VARCHAR2 DEFAULT ' ') IS
        --
        mensajeObject TYPE_TO_GE_MNSJE;
        --mensajeTabe   TYPE_TT_GE_MNSJE := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        mensajeObject := TYPE_TO_GE_MNSJE(SYSDATE, null,p_codigo,getMensajePorCodigo(p_codigo,p_prcs)||' '||p_textoAdicional);
        --mensajeTabe := TYPE_TT_GE_MNSJE(mensajeObject);
        p_type_mensaje.extend;
        p_type_mensaje(p_type_mensaje.count) := mensajeObject;
        --p_type_mensaje := mensajeTabe;
        --
    END;
    --
    PROCEDURE generarTypeErrorRpta (p_codigo          IN GE_TCRTA.CRTA_CRTA%TYPE,
                                    p_prcs            IN GE_TCRTA.CRTA_PRCS%TYPE,
                                    p_type_mensaje    OUT TYPE_TT_GE_ERRO) IS
        --
        errorObject TYPE_TO_GE_ERRO;
        errorTable TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
    BEGIN
        --
        errorObject := TYPE_TO_GE_ERRO(SYSDATE, p_prcs, p_codigo, p_codigo);
        p_type_mensaje.extend;
        p_type_mensaje(p_type_mensaje.count) := errorObject;
        --
    END;
    --
    PROCEDURE crearLogTransaccion(p_proceso VARCHAR2,
                                  p_valor   CLOB)IS
        --
        PRAGMA AUTONOMOUS_TRANSACTION;
        --
    BEGIN
        INSERT INTO GE_TLOGT (LOGT_LOGT,
                              LOGT_PROCESO,
                              LOGT_VALOR,
                              LOGT_FECHA)
                       VALUES(GE_SLOGT.nextval,
                              p_proceso,
                              p_valor,
                              sysdate);
        COMMIT;
    END;
    --
    FUNCTION obtenerDescripcionProceso(p_proceso varchar2) return VARCHAR2 IS
        --
        CURSOR C_DESCRIPCION IS
        SELECT PRCS_DESCRI
          FROM GE_TPRCS
         WHERE PRCS_PRCS = p_proceso;
        --
        V_DESCRIPCION GE_TPRCS.PRCS_DESCRI%TYPE;
        --
    BEGIN
        --
        OPEN C_DESCRIPCION;
        FETCH C_DESCRIPCION INTO V_DESCRIPCION;
        CLOSE C_DESCRIPCION;
        RETURN NVL(V_DESCRIPCION,' ');
        --
    END;
    --
    PROCEDURE obtenerFechaConFormato(p_fecha_in  IN VARCHAR2,
                                     p_fecha_out OUT VARCHAR2)IS
        v_fecha VARCHAR2(20);
    BEGIN
        --
        select to_char(to_date(p_fecha_in,'dd/mm/yy'),'dd/mm/yyyy')
           INTO v_fecha
          from dual;
        --
        p_fecha_out := v_fecha;
        --
    END;
    --
END API_GE_QUTILS;
/