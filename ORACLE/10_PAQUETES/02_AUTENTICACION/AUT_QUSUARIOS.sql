prompt
prompt PACKAGE: AUT_QUSUARIOS
prompt

CREATE OR REPLACE PACKAGE "&USUARIOBD".AUT_QUSUARIOS IS
    
    -----------
    -- Creacion
    -----------
    PROCEDURE crearPersona (p_prcs         IN VARCHAR2, 
                            p_tpersona     IN TYPE_TT_AU_TPERSN,
                            p_cod_rpta    OUT VARCHAR2,
                            p_cod_persona OUT NUMBER,
                            p_errores     OUT TYPE_TT_GE_ERRO,
                            p_mensajes    OUT TYPE_TT_GE_MNSJE); 
    --
    PROCEDURE crearUsuario (p_prcs         IN VARCHAR2, 
                            p_tusuario     IN TYPE_TT_AU_USUARIO,
                            p_cod_persona  IN NUMBER,
                            p_cod_rpta    OUT VARCHAR2,
                            p_errores     OUT TYPE_TT_GE_ERRO,
                            p_mensajes    OUT TYPE_TT_GE_MNSJE);
    
    --
    PROCEDURE crearRol(p_prcs         IN VARCHAR2,
                      p_aut_trol      IN TYPE_TT_AU_ROL,
                      p_cod_rta      OUT VARCHAR2,
                      p_errores      OUT TYPE_TT_GE_ERRO,
                      p_mensajes  IN OUT TYPE_TT_GE_MNSJE);
    ------------
    --  Consulta
    ------------
    PROCEDURE getPersonaPorUsuario(p_prcs       IN  VARCHAR2, 
                                   p_usuario    IN  VARCHAR2,
                                   p_cod_rpta  OUT VARCHAR2,
                                   p_tpersona  OUT TYPE_TT_AU_TPERSN,
                                   p_errores   OUT TYPE_TT_GE_ERRO,
                                   p_mensajes  OUT TYPE_TT_GE_MNSJE) ;
    --
    PROCEDURE getPersonaPorDocumento(p_prcs       IN  VARCHAR2, 
                                     p_tipodoc    IN  VARCHAR2,
                                     p_documento  IN  VARCHAR2,
                                     p_cod_rpta  OUT VARCHAR2,
                                     p_tpersona  OUT TYPE_TT_AU_TPERSN,
                                     p_errores   OUT TYPE_TT_GE_ERRO,
                                     p_mensajes  OUT TYPE_TT_GE_MNSJE); 
    --
    PROCEDURE obtenerUsuario (p_prcs       IN VARCHAR2, 
                              p_usuario    IN VARCHAR2,
                              p_usua_clave IN VARCHAR2,
                              p_tusuario  OUT TYPE_TT_AU_USUARIO,
                              p_cod_rpta  OUT VARCHAR2,
                              p_errores   OUT TYPE_TT_GE_ERRO,
                              p_mensajes  OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE getServiciosPorRol (p_prcs            IN VARCHAR2,
                                  p_aut_tservicio  OUT TYPE_TT_GE_SRVCIO,
                                  p_rol_rol         IN VARCHAR2,
                                  p_cod_rpta       OUT VARCHAR2,
                                  p_errores        OUT TYPE_TT_GE_ERRO,
                                  p_mensajes       OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE getRol(p_prcs       IN  VARCHAR2,
                     p_aut_trol  OUT TYPE_TT_AU_ROL,
                     p_rol_rol    IN VARCHAR2,
                     p_cod_rta   OUT VARCHAR2,
                     p_errores   OUT TYPE_TT_GE_ERRO,
                     p_mensajes   IN OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE obtenerRolesPorUsuario(p_prcs            IN VARCHAR2,
                                     p_usuario         IN VARCHAR2,
                                     p_rol             OUT TYPE_TT_AU_ROL,
                                     p_cod_rpta        OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE obtenerUsuarioSimple (p_prcs       IN  VARCHAR2, 
                              p_usuario    IN  VARCHAR2,
                              p_tusuario  OUT TYPE_TT_AU_USUARIO,
                              p_cod_rpta  OUT VARCHAR2,
                              p_errores   OUT TYPE_TT_GE_ERRO,
                              p_mensajes  OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE getAllUsuarios (p_prcs       IN  VARCHAR2, 
                              p_tusuario  OUT TYPE_TT_AU_USUARIO,
                              p_cod_rpta  OUT VARCHAR2,
                              p_errores   OUT TYPE_TT_GE_ERRO,
                              p_mensajes  OUT TYPE_TT_GE_MNSJE);
    ---------------
    -- Modificacion
    ---------------
    PROCEDURE asignarRoles (p_prcs      IN  VARCHAR2, 
                            p_tusuario  IN  TYPE_TT_AU_USUARIO,
                            p_troles    IN  TYPE_TT_AU_ROL,
                            p_cod_rpta  out VARCHAR2,
                            p_errores   OUT TYPE_TT_GE_ERRO,
                            p_mensajes  OUT TYPE_TT_GE_MNSJE);
    --    
    PROCEDURE asignarRolPorUsuario(p_prcs            IN VARCHAR2,
                                   p_usuario         IN VARCHAR2,
                                   p_rol             IN VARCHAR2,
                                   p_cod_rta         OUT VARCHAR2,
                                   p_errores         OUT TYPE_TT_GE_ERRO,
                                   p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE asignarServicioRol(p_prcs       IN VARCHAR2,
                                 p_rol_rol    IN VARCHAR2,
                                 p_servicio   IN NUMBER,
                                 p_cod_rta   OUT VARCHAR2,
                                 p_errores   OUT TYPE_TT_GE_ERRO,
                                 p_mensajes  OUT TYPE_TT_GE_MNSJE);
    PROCEDURE actualizarPersona(p_prcs      IN VARCHAR2,
                                p_persona   IN TYPE_TT_AU_TPERSN,
                                p_cod_rta   OUT VARCHAR2,
                                p_errores   OUT TYPE_TT_GE_ERRO,
                                p_mensajes  OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE actualizarUsuario(p_prcs            IN VARCHAR2,
                                p_usuario         IN TYPE_TT_AU_USUARIO,
                                p_cod_rpta        OUT VARCHAR2,
                                p_errores         OUT TYPE_TT_GE_ERRO,
                                p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE cambiarEstadoUsuario (p_prcs            IN VARCHAR2,
                                    p_usuario         IN VARCHAR2,
                                    p_estado          IN VARCHAR2,
                                    p_cod_rta         OUT VARCHAR2,
                                    p_errores         OUT TYPE_TT_GE_ERRO,
                                    p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --------------
    -- Eliminacion
    --------------
    PROCEDURE eliminarRolesPorUsuario(p_prcs            IN VARCHAR2,
                                    p_usuario         IN VARCHAR2,
                                    p_cod_rta         OUT VARCHAR2,
                                    p_errores         OUT TYPE_TT_GE_ERRO,
                                    p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE eliminarRol(p_prcs       IN VARCHAR2,
                           p_rol_rol    IN VARCHAR2,
                           p_cod_rta   OUT VARCHAR2,
                           p_errores   OUT TYPE_TT_GE_ERRO,
                           p_mensajes  OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE eliminarServicioRol(p_prcs      IN VARCHAR2,
                                 p_rol_rol    IN VARCHAR2,
                                 p_servicio   IN NUMBER,
                                 p_cod_rta   OUT VARCHAR2,
                                 p_errores   OUT TYPE_TT_GE_ERRO,
                                 p_mensajes  OUT TYPE_TT_GE_MNSJE);
    --
    
    --
end AUT_QUSUARIOS;
/


prompt
prompt PACKAGE BODY: AUT_QUSUARIOS
prompt

CREATE OR REPLACE PACKAGE BODY "&USUARIOBD".AUT_QUSUARIOS IS

    -- **********************************************************************************
    -- actualizarUsuario 
    -- **********************************************************************************
    PROCEDURE actualizarUsuario(p_prcs            IN VARCHAR2,
                                p_usuario         IN TYPE_TT_AU_USUARIO,
                                p_cod_rpta        OUT VARCHAR2,
                                p_errores         OUT TYPE_TT_GE_ERRO,
                                p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
        --                         
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        v_crta_http_gral VARCHAR2(5) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN 1..p_usuario.count LOOP
            UPDATE AUT_TUSUARIO SET
                 USUARIO_MEDIO_TOK = NVL(p_usuario(i).USUARIO_MEDIO_TOK,USUARIO_MEDIO_TOK),
                 USUARIO_TIPO_AUT = NVL(p_usuario(i).USUARIO_TIPO_AUT,USUARIO_TIPO_AUT),
                 USUARIO_CAMBIO_CLAVE = NVL(p_usuario(i).USUARIO_CAMBIO_CLAVE,'N'),
                 USUARIO_AVATAR = NVL(p_usuario(i).USUARIO_AVATAR,USUARIO_AVATAR)
             WHERE 
                 USUARIO_USUARIO = p_usuario(i).USUARIO_USUARIO;
                 
        END LOOP;
        --
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        tt_ge_erro.EXTEND;
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- obtenerUsuarioSimple 
    -- **********************************************************************************
    PROCEDURE obtenerUsuarioSimple(p_prcs       IN  VARCHAR2, 
                                  p_usuario    IN  VARCHAR2,
                                  p_tusuario  OUT TYPE_TT_AU_USUARIO,
                                  p_cod_rpta  OUT VARCHAR2,
                                  p_errores   OUT TYPE_TT_GE_ERRO,
                                  p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        CURSOR c_usuario IS
        SELECT USUARIO_USUARIO,
               USUARIO_PERSN, 
               USUARIO_CLAVE, 
               PERSN_EMAIL AS USUARIO_MAIL,
               PERSN_CELULAR AS USUARIO_CELULAR,
               USUARIO_MEDIO_TOK,
               USUARIO_TIPO_AUT,
               USUARIO_USRCRE,
               USUARIO_FECCRE,  
               USUARIO_ESTADO,
               USUARIO_CAMBIO_CLAVE,
               USUARIO_AVATAR,
               decode(USUARIO_ESTADO,'INA','Inactivo','ACT','Activo','PPA','Pendiente','PRE','Precargado','Sin valor') as USUARIO_ESTADO_DESC
          FROM AUT_TUSUARIO, AUT_TPERSN
         WHERE USUARIO_USUARIO = p_usuario
           AND USUARIO_PERSN = PERSN_PERSN;
           
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_ge_usua TYPE_TO_AU_USUARIO;
        tt_ge_usua TYPE_TT_AU_USUARIO := TYPE_TT_AU_USUARIO();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN c_usuario LOOP
            --
            to_ge_usua :=  TYPE_TO_AU_USUARIO(i.USUARIO_USUARIO,
                                             i.USUARIO_PERSN, 
                                             NULL, --i.USUARIO_CLAVE, 
                                             i.USUARIO_MAIL,   
                                             i.USUARIO_CELULAR,
                                             i.USUARIO_MEDIO_TOK,
                                             i.USUARIO_TIPO_AUT,
                                             NULL,
                                             NULL,
                                             i.USUARIO_USRCRE,
                                             i.USUARIO_FECCRE,  
                                             i.USUARIO_ESTADO,
                                             i.USUARIO_CAMBIO_CLAVE,
                                             i.USUARIO_AVATAR,
                                             i.USUARIO_ESTADO_DESC);
            --
            tt_ge_usua.extend;
            tt_ge_usua(tt_ge_usua.count) := to_ge_usua;
            --
        END LOOP;
        p_tusuario := tt_ge_usua;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- getAllUsuarios 
    -- **********************************************************************************
    PROCEDURE getAllUsuarios(p_prcs       IN  VARCHAR2, 
                             p_tusuario  OUT TYPE_TT_AU_USUARIO,
                             p_cod_rpta  OUT VARCHAR2,
                             p_errores   OUT TYPE_TT_GE_ERRO,
                             p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        CURSOR c_usuario IS
        SELECT USUARIO_USUARIO,
               USUARIO_PERSN, 
               PERSN_EMAIL AS USUARIO_MAIL,
               PERSN_CELULAR AS USUARIO_CELULAR,
               USUARIO_MEDIO_TOK,
               USUARIO_TIPO_AUT,
               USUARIO_USRCRE,
               USUARIO_FECCRE,  
               USUARIO_ESTADO,
               USUARIO_CAMBIO_CLAVE,
               USUARIO_AVATAR,
               decode(USUARIO_ESTADO,'INA','Inactivo','ACT','Activo','PPA','Pendiente','PRE','Precargado','Sin valor') as USUARIO_ESTADO_DESC
          FROM AUT_TUSUARIO, AUT_TPERSN
           where USUARIO_PERSN = PERSN_PERSN;
           
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_ge_usua TYPE_TO_AU_USUARIO;
        tt_ge_usua TYPE_TT_AU_USUARIO := TYPE_TT_AU_USUARIO();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN c_usuario LOOP
            --
            to_ge_usua :=  TYPE_TO_AU_USUARIO(i.USUARIO_USUARIO,
                                             i.USUARIO_PERSN, 
                                             NULL, --i.USUARIO_CLAVE, 
                                             i.USUARIO_MAIL,   
                                             i.USUARIO_CELULAR,
                                             i.USUARIO_MEDIO_TOK,
                                             i.USUARIO_TIPO_AUT,
                                             NULL,
                                             NULL,
                                             i.USUARIO_USRCRE,
                                             i.USUARIO_FECCRE,  
                                             i.USUARIO_ESTADO,
                                             i.USUARIO_CAMBIO_CLAVE,
                                             i.USUARIO_AVATAR,
                                             i.USUARIO_ESTADO_DESC);
            --
            tt_ge_usua.extend;
            tt_ge_usua(tt_ge_usua.count) := to_ge_usua;
            --
        END LOOP;
        p_tusuario := tt_ge_usua;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- crearRol 
    -- **********************************************************************************
    PROCEDURE crearRol(p_prcs            IN  VARCHAR2,
                       p_aut_trol         IN TYPE_TT_AU_ROL,
                       p_cod_rta         OUT  VARCHAR2,
                       p_errores         OUT  TYPE_TT_GE_ERRO,
                       p_mensajes     IN OUT  TYPE_TT_GE_MNSJE) IS
                      
        to_ge_erro    TYPE_TO_GE_ERRO;
        tt_ge_erro    TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_gral   ge_tcrta.crta_crta%type := 'OK';
        v_cod_mensaje ge_tcrta.crta_crta%type;
        v_error VARCHAR2(10) := 'ERROR';
        v_ok    VARCHAR2(2)  := 'OK';
    BEGIN
     FOR i IN 1..p_aut_trol.count LOOP
        INSERT INTO AUT_TROL(
                              ROL_ROL,
                              ROL_DESCRI,
                              ROL_IS_SISTEMA)
                          VALUES(
                              p_aut_trol(i).ROL_ROL,
                              p_aut_trol(i).ROL_DESCRI,
                              'N');
     END LOOP;

        p_cod_rta := nvl(v_crta_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,p_mensajes);
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        v_cod_mensaje := 'ERR_WHEN_OTHERS';
        API_GE_QUTILS.generarTypeMensajeRpta(v_cod_mensaje,p_prcs,p_mensajes);
    END;
    --
    -- **********************************************************************************
    -- eliminarRolesPorUsuario 
    -- **********************************************************************************
    PROCEDURE eliminarRolesPorUsuario(p_prcs       IN VARCHAR2,
                                    p_usuario      IN VARCHAR2,
                                    p_cod_rta     OUT VARCHAR2,
                                    p_errores     OUT TYPE_TT_GE_ERRO,
                                    p_mensajes    OUT TYPE_TT_GE_MNSJE)IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN 
        --
        DELETE FROM AUT_TUROL
        WHERE UROL_USUARIO = p_usuario;
        --
         p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- asignarRolPorUsuario 
    -- **********************************************************************************
    PROCEDURE asignarRolPorUsuario(p_prcs            IN VARCHAR2,
                                   p_usuario         IN VARCHAR2,
                                   p_rol             IN VARCHAR2,
                                   p_cod_rta         OUT VARCHAR2,
                                   p_errores         OUT TYPE_TT_GE_ERRO,
                                   p_mensajes        OUT TYPE_TT_GE_MNSJE)IS
        --
        CURSOR c_existeRolPorUsuario IS
        SELECT 'S'
          FROM aut_turol
         WHERE urol_usuario = p_usuario 
           AND urol_rol = p_rol;
        --
        v_existeRolPorusuario varchar2(2);
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --                                   
    BEGIN
        --
        OPEN  c_existeRolPorUsuario;
        FETCH c_existeRolPorUsuario into v_existeRolPorusuario;
        CLOSE c_existeRolPorUsuario;
        IF(nvl(v_existeRolPorusuario,'X') = 'X')THEN
            --
            INSERT INTO AUT_TUROL (UROL_USUARIO,UROL_ROL) 
            VALUES (p_usuario,p_rol);
            --
        ELSE
            --
            p_cod_rta := 'ERROR';
            to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
            tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
            API_GE_QUTILS.generarTypeMensajeRpta('ERR_ROL_USUA_DUPL',p_prcs,v_mensaje);
            p_mensajes := v_mensaje;
            RETURN;
            --
        END IF;
        --
        p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    
    --
    -- **********************************************************************************
    -- asignarRoles 
    -- **********************************************************************************
    PROCEDURE asignarRoles (p_prcs      IN  VARCHAR2, 
                            p_tusuario  IN  TYPE_TT_AU_USUARIO,
                            p_troles    IN  TYPE_TT_AU_ROL,
                            p_cod_rpta  out VARCHAR2,
                            p_errores   OUT TYPE_TT_GE_ERRO,
                            p_mensajes  OUT TYPE_TT_GE_MNSJE) IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN 1..p_tusuario.count LOOP
            --
            FOR j IN 1..p_troles.count LOOP
                INSERT INTO AUT_TUROL (UROL_USUARIO,UROL_ROL) 
                values (p_tusuario(i).USUARIO_USUARIO,p_troles(j).ROL_ROL);
            END LOOP;
            --
        END LOOP;
        --
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- crearUsuario 
    -- **********************************************************************************
    PROCEDURE crearUsuario (p_prcs         IN  VARCHAR2, 
                            p_tusuario     IN  TYPE_TT_AU_USUARIO,
                            p_cod_persona  IN  NUMBER,
                            p_cod_rpta    OUT VARCHAR2,
                            p_errores     OUT TYPE_TT_GE_ERRO,
                            p_mensajes    OUT TYPE_TT_GE_MNSJE) IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN 1..p_tusuario.count LOOP
            --
            INSERT INTO AUT_TUSUARIO (USUARIO_USUARIO, 
                                      USUARIO_PERSN,
                                      USUARIO_CLAVE,
                                      USUARIO_MEDIO_TOK,
                                      USUARIO_TIPO_AUT,
                                      USUARIO_USRCRE,
                                      USUARIO_FECCRE,
                                      USUARIO_ESTADO,
                                      USUARIO_CAMBIO_CLAVE,
                                      USUARIO_AVATAR) 
                              VALUES (p_tusuario(i).USUARIO_USUARIO, 
                                      p_cod_persona,
                                      p_tusuario(i).USUARIO_CLAVE,
                                      p_tusuario(i).USUARIO_MEDIO_TOK,
                                      p_tusuario(i).USUARIO_TIPO_AUT,
                                      p_tusuario(i).USUARIO_USRCRE,
                                      sysdate,
                                      nvl(p_tusuario(i).USUARIO_ESTADO,'PRE'),
                                      p_tusuario(i).USUARIO_CAMBIO_CLAVE,
                                      'usuario-default.png');
            --
        END LOOP;
        --
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- crearPersona 
    -- **********************************************************************************
    PROCEDURE crearPersona (p_prcs         IN  VARCHAR2, 
                            p_tpersona     IN TYPE_TT_AU_TPERSN,
                            p_cod_rpta    OUT VARCHAR2,
                            p_cod_persona OUT NUMBER,
                            p_errores     OUT TYPE_TT_GE_ERRO,
                            p_mensajes    OUT TYPE_TT_GE_MNSJE) IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        --
        CURSOR c_nextValueSpern IS
        SELECT nextvalue('AUT_SPERSN') 
          FROM dual;
        --
        v_next_value number;
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        OPEN c_nextValueSpern;
        FETCH c_nextValueSpern INTO v_next_value;
        CLOSE c_nextValueSpern;
        --
         FOR i IN 1..p_tpersona.count LOOP
            --
            INSERT INTO AUT_TPERSN  (PERSN_PERSN,  
                                     PERSN_TPIDENT,    
                                     PERSN_NUMIDENT,   
                                     PERSN_PNOMBRE,  
                                     PERSN_SNOMBRE, 
                                     PERSN_PAPELLIDO,
                                     PERSN_SAPELLIDO,
                                     PERSN_CELULAR,
                                     PERSN_FIJO,
                                     PERSN_EMAIL,
                                     PERSN_DIRECCION,
                                     PERSN_CIUD,
                                     PERSN_USRCRE,
                                     PERSN_FECACT,
                                     PERSN_FECCRE,
                                     PERSN_ORIGEN,
                                     PERSN_ESTADO  ) 
                            VALUES ( v_next_value,
                                     p_tpersona(i).PERSN_TPIDENT, 
                                     p_tpersona(i).PERSN_NUMIDENT,
                                     p_tpersona(i).PERSN_PNOMBRE,
                                     p_tpersona(i).PERSN_SNOMBRE,
                                     p_tpersona(i).PERSN_PAPELLIDO,
                                     p_tpersona(i).PERSN_SAPELLIDO ,
                                     p_tpersona(i).PERSN_CELULAR ,
                                     p_tpersona(i).PERSN_FIJO ,
                                     p_tpersona(i).PERSN_EMAIL ,
                                     p_tpersona(i).PERSN_DIRECCION ,
                                     p_tpersona(i).PERSN_CIUD ,
                                     p_tpersona(i).PERSN_USRCRE ,
                                     NULL ,
                                     SYSDATE ,
                                     p_tpersona(i).PERSN_ORIGEN ,
                                     NVL(p_tpersona(i).PERSN_ESTADO,'PRE'));
            --
        END LOOP;
        --
        p_cod_persona := v_next_value;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta :=  'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- getPersonaPorUsuario 
    -- **********************************************************************************
    PROCEDURE getPersonaPorUsuario(p_prcs      IN  VARCHAR2, 
                                   p_usuario   IN  VARCHAR2,
                                   p_cod_rpta  out VARCHAR2,
                                   p_tpersona  OUT TYPE_TT_AU_TPERSN,
                                   p_errores   OUT TYPE_TT_GE_ERRO,
                                   p_mensajes  OUT TYPE_TT_GE_MNSJE) IS
        --                         
        CURSOR c_personaPorUsuario IS
        SELECT p.PERSN_PERSN    AS PERSN_PERSN,
               p.PERSN_TPIDENT    AS PERSN_TPIDENT,
               p.PERSN_NUMIDENT   AS PERSN_NUMIDENT,
               p.PERSN_PNOMBRE    AS PERSN_PNOMBRE,
               p.PERSN_SNOMBRE    AS PERSN_SNOMBRE, 
               p.PERSN_PAPELLIDO  AS PERSN_PAPELLIDO,
               p.PERSN_SAPELLIDO  AS PERSN_SAPELLIDO,
               p.PERSN_CELULAR    AS PERSN_CELULAR,
               p.PERSN_FIJO       AS PERSN_FIJO,
               p.PERSN_EMAIL      AS PERSN_EMAIL,
               p.PERSN_DIRECCION  AS PERSN_DIRECCION,
               PAIS_PAIS            AS PERSN_PAIS,
               DEPTO_DEPTO          AS PERSN_DEPTO,
               p.PERSN_CIUD     AS PERSN_CIUD,
               p.PERSN_USRCRE     AS PERSN_USRCRE,
               p.PERSN_FECACT     AS PERSN_FECACT,
               p.PERSN_FECCRE     AS PERSN_FECCRE,
               p.PERSN_ORIGEN     AS PERSN_ORIGEN,
               p.PERSN_ESTADO     AS PERSN_ESTADO,
               PAIS_NOMBRE        AS PERSN_PAIS_DESC,
               DEPTO_NOMBRE       AS PERSN_DEPTO_DESC,
               CIUD_NOMBRE      AS PERSN_CIUD_DESC
          FROM AUT_TPERSN p, AUT_TUSUARIO, GE_TPAIS, GE_TDEPTO, GE_TCIUD
         WHERE PERSN_PERSN = USUARIO_PERSN
           AND p.PERSN_CIUD = GE_TCIUD.CIUD_CIUD (+)
           AND GE_TCIUD.CIUD_DEPTO = GE_TDEPTO.DEPTO_DEPTO (+)
           AND GE_TDEPTO.DEPTO_PAIS = GE_TPAIS.PAIS_PAIS (+)
           AND USUARIO_USUARIO = p_usuario;
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_aut_persona TYPE_TO_AU_TPERSN;
        tt_aut_persona TYPE_TT_AU_TPERSN := TYPE_TT_AU_TPERSN();
        --
        v_crta_http_gral VARCHAR2(5) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN  c_personaPorUsuario LOOP
            --
            to_aut_persona :=  TYPE_TO_AU_TPERSN(i.PERSN_PERSN,  
                                                 i.PERSN_TPIDENT, 
                                                 i.PERSN_NUMIDENT,
                                                 i.PERSN_PNOMBRE, 
                                                 i.PERSN_SNOMBRE, 
                                                 i.PERSN_PAPELLIDO,
                                                 i.PERSN_SAPELLIDO,
                                                 i.PERSN_CELULAR,
                                                 i.PERSN_FIJO,
                                                 i.PERSN_EMAIL,
                                                 i.PERSN_DIRECCION,
                                                 i.PERSN_PAIS,
                                                 i.PERSN_DEPTO,
                                                 i.PERSN_CIUD,
                                                 i.PERSN_USRCRE,  
                                                 i.PERSN_FECACT,  
                                                 i.PERSN_FECCRE,  
                                                 i.PERSN_ORIGEN,  
                                                 i.PERSN_ESTADO,
                                                 i.PERSN_PAIS_DESC,
                                                 i.PERSN_DEPTO_DESC,
                                                 i.PERSN_CIUD_DESC);  
                        
            tt_aut_persona :=  TYPE_TT_AU_TPERSN(to_aut_persona);
            --
        END LOOP;
        --
        p_tpersona := tt_aut_persona;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        tt_ge_erro.EXTEND;
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- getPersonaPorDocumento 
    -- **********************************************************************************
    PROCEDURE getPersonaPorDocumento(p_prcs      IN  VARCHAR2, 
                                     p_tipodoc   IN  VARCHAR2,
                                     p_documento IN  VARCHAR2,
                                     p_cod_rpta  out VARCHAR2,
                                     p_tpersona  OUT TYPE_TT_AU_TPERSN,
                                     p_errores   OUT TYPE_TT_GE_ERRO,
                                     p_mensajes  OUT TYPE_TT_GE_MNSJE) IS
        --                         
        CURSOR c_persona IS
        SELECT PERSN_PERSN,    
               PERSN_TPIDENT,    
               PERSN_NUMIDENT,   
               PERSN_PNOMBRE,  
               PERSN_SNOMBRE, 
               PERSN_PAPELLIDO,
               PERSN_SAPELLIDO,
               PERSN_CELULAR,
               PERSN_FIJO,
               PERSN_EMAIL,
               PERSN_DIRECCION,
               PAIS_PAIS AS PERSN_PAIS,
               DEPTO_DEPTO AS PERSN_DEPTO,
               PERSN_CIUD,
               PERSN_USRCRE,
               PERSN_FECACT,
               PERSN_FECCRE,
               PERSN_ORIGEN,
               PERSN_ESTADO,
               PAIS_NOMBRE AS PERSN_PAIS_DESC,
               DEPTO_NOMBRE AS PERSN_DEPTO_DESC,
               CIUD_NOMBRE AS PERSN_CIUD_DESC
          FROM AUT_TPERSN p, GE_TPAIS, GE_TDEPTO, GE_TCIUD
         WHERE p.PERSN_CIUD = GE_TCIUD.CIUD_CIUD (+)
           AND GE_TCIUD.CIUD_DEPTO = GE_TDEPTO.DEPTO_DEPTO (+)
           AND GE_TDEPTO.DEPTO_PAIS = GE_TPAIS.PAIS_PAIS (+)
           AND PERSN_TPIDENT = nvl(p_tipodoc,PERSN_TPIDENT)
           AND PERSN_NUMIDENT  = nvl(p_documento,PERSN_NUMIDENT);
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_aut_persona TYPE_TO_AU_TPERSN;
        tt_aut_persona TYPE_TT_AU_TPERSN := TYPE_TT_AU_TPERSN();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN  c_persona LOOP
          --
          to_aut_persona :=  TYPE_TO_AU_TPERSN(i.PERSN_PERSN,    
                                               i.PERSN_TPIDENT,    
                                               i.PERSN_NUMIDENT,   
                                               i.PERSN_PNOMBRE,  
                                               i.PERSN_SNOMBRE, 
                                               i.PERSN_PAPELLIDO,
                                               i.PERSN_SAPELLIDO,
                                               i.PERSN_CELULAR,
                                               i.PERSN_FIJO,
                                               i.PERSN_EMAIL,
                                               i.PERSN_DIRECCION,
                                               i.PERSN_PAIS,
                                               i.PERSN_DEPTO,
                                               i.PERSN_CIUD,
                                               i.PERSN_USRCRE,
                                               i.PERSN_FECACT,
                                               i.PERSN_FECCRE,
                                               i.PERSN_ORIGEN,
                                               i.PERSN_ESTADO,
                                               i.PERSN_PAIS_DESC,
                                               i.PERSN_DEPTO_DESC,
                                               i.PERSN_CIUD_DESC);
                                               
          tt_aut_persona :=  TYPE_TT_AU_TPERSN(to_aut_persona);
          --
        END LOOP;
        --
        p_tpersona := tt_aut_persona;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');
        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        tt_ge_erro.EXTEND;
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    
    -- **********************************************************************************
    -- obtenerUsuario 
    -- **********************************************************************************
    PROCEDURE obtenerUsuario (p_prcs       IN  VARCHAR2, 
                              p_usuario    IN  VARCHAR2,
                              p_usua_clave IN  VARCHAR2,
                              p_tusuario  OUT TYPE_TT_AU_USUARIO,
                              p_cod_rpta  OUT VARCHAR2,
                              p_errores   OUT TYPE_TT_GE_ERRO,
                              p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        CURSOR c_usuario IS
        SELECT USUARIO_USUARIO,
               USUARIO_PERSN, 
               PERSN_EMAIL AS USUARIO_MAIL,
               PERSN_CELULAR AS USUARIO_CELULAR,
               USUARIO_MEDIO_TOK,
               USUARIO_TIPO_AUT,
               USUARIO_USRCRE,
               USUARIO_FECCRE,  
               USUARIO_ESTADO,
               USUARIO_CAMBIO_CLAVE,
               USUARIO_AVATAR,
               decode(USUARIO_ESTADO,'INA','Inactivo','ACT','Activo','PPA','Pendiente','PRE','Precargado','Sin valor') as USUARIO_ESTADO_DESC
          FROM AUT_TUSUARIO, AUT_TPERSN
         WHERE USUARIO_USUARIO = NVL(p_usuario,USUARIO_USUARIO)
           AND USUARIO_CLAVE = NVL(p_usua_clave,USUARIO_CLAVE)
           AND USUARIO_ESTADO = 'ACT'
           AND USUARIO_PERSN = PERSN_PERSN;
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_ge_usua TYPE_TO_AU_USUARIO;
        tt_ge_usua TYPE_TT_AU_USUARIO := TYPE_TT_AU_USUARIO();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
        FOR i IN c_usuario LOOP
            --
            to_ge_usua :=  TYPE_TO_AU_USUARIO(i.USUARIO_USUARIO,
                                             i.USUARIO_PERSN, 
                                             NULL, 
                                             i.USUARIO_MAIL,   
                                             i.USUARIO_CELULAR,
                                             i.USUARIO_MEDIO_TOK,
                                             i.USUARIO_TIPO_AUT,
                                             NULL,
                                             NULL,
                                             i.USUARIO_USRCRE,
                                             i.USUARIO_FECCRE,  
                                             i.USUARIO_ESTADO,
                                             i.USUARIO_CAMBIO_CLAVE,
                                             i.USUARIO_AVATAR,
                                             i.USUARIO_ESTADO_DESC);
            --
            tt_ge_usua.extend;
            tt_ge_usua(tt_ge_usua.count) := to_ge_usua;
            --
        END LOOP;
        p_tusuario := tt_ge_usua;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');        
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    
    
    
    
    -- **********************************************************************************
    -- eliminarRol 
    -- **********************************************************************************
    PROCEDURE eliminarRol(p_prcs       IN VARCHAR2,
                           p_rol_rol    IN VARCHAR2,
                           p_cod_rta   OUT VARCHAR2,
                           p_errores   OUT TYPE_TT_GE_ERRO,
                           p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN 
        --
        DELETE FROM AUT_TROL 
              WHERE ROL_ROL = p_rol_rol;
        --
        p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- getServiciosPorRol 
    -- **********************************************************************************
    PROCEDURE getServiciosPorRol (p_prcs            IN VARCHAR2,
                                  p_aut_tservicio  OUT TYPE_TT_GE_SRVCIO,
                                  p_rol_rol         IN VARCHAR2,
                                  p_cod_rpta       OUT VARCHAR2,
                                  p_errores        OUT TYPE_TT_GE_ERRO,
                                  p_mensajes       OUT TYPE_TT_GE_MNSJE) IS
        --
        CURSOR c_servicioRol IS
        SELECT SERVICIO_SERVICIO,
               SERVICIO_MODULO,
               SERVICIO_DESCRI,
               SERVICIO_NOMB
          FROM AUT_TSERVC, AUT_TSROL
         WHERE SERVICIO_SERVICIO = SROL_SERVICIO
           AND SROL_ROL = p_rol_rol
           ORDER BY SERVICIO_MODULO;
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_ge_servicio TYPE_TO_GE_SRVCIO;
        tt_ge_servicio TYPE_TT_GE_SRVCIO := TYPE_TT_GE_SRVCIO();
        --
        v_crta_http_gral VARCHAR2(5) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN
        --
         FOR i IN c_servicioRol LOOP
            --
            to_ge_servicio :=  TYPE_TO_GE_SRVCIO(i.SERVICIO_SERVICIO,
                                                i.SERVICIO_MODULO, 
                                                i.SERVICIO_DESCRI, 
                                                i.SERVICIO_NOMB,
                                                null,
                                                null,
                                                null,
                                                null,
                                                null,
                                                null,
                                                null);
            --
            tt_ge_servicio.extend;
            tt_ge_servicio(tt_ge_servicio.count) := to_ge_servicio;
            --
        END LOOP;
        --
        p_aut_tservicio := tt_ge_servicio;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
     EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        --
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- getRol 
    -- **********************************************************************************
    PROCEDURE getRol(p_prcs       IN  VARCHAR2,
                     p_aut_trol  OUT TYPE_TT_AU_ROL,
                     p_rol_rol    IN VARCHAR2,
                     p_cod_rta   OUT VARCHAR2,
                     p_errores   OUT TYPE_TT_GE_ERRO,
                     p_mensajes   IN OUT TYPE_TT_GE_MNSJE)IS

       CURSOR C_CONSULTA IS
       SELECT 
              ROL_ROL,
              ROL_DESCRI,
              ROL_IS_SISTEMA
       FROM AUT_TROL
       WHERE 
             ROL_ROL = p_rol_rol;

       to_sgc_to_aut_trol TYPE_TO_AU_ROL;
       tt_sgc_tt_aut_trol TYPE_TT_AU_ROL := TYPE_TT_AU_ROL();
       to_ge_erro TYPE_TO_GE_ERRO;
       tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
       v_crta_gral ge_tcrta.crta_crta%type := 'OK';
       v_cod_mensaje ge_tcrta.crta_crta%type;
    BEGIN
       FOR i IN C_CONSULTA LOOP
           to_sgc_to_aut_trol := TYPE_TO_AU_ROL(
                           i.ROL_ROL,
                           i.ROL_DESCRI,
                           i.ROL_IS_SISTEMA);
       tt_sgc_tt_aut_trol.extend;
       tt_sgc_tt_aut_trol(tt_sgc_tt_aut_trol.count):= to_sgc_to_aut_trol;
       END LOOP;
       p_aut_trol:= tt_sgc_tt_aut_trol;
       p_cod_rta := v_crta_gral;
       to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
       tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
       p_errores := tt_ge_erro;
       API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,p_mensajes);
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,SQLCODE,SQLERRM);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        v_cod_mensaje := 'ERR_WHEN_OTHERS';
        API_GE_QUTILS.generarTypeMensajeRpta(v_cod_mensaje,p_prcs,p_mensajes);
    END;
    --
    -- **********************************************************************************
    -- obtenerRolesPorUsuario 
    -- **********************************************************************************
    PROCEDURE obtenerRolesPorUsuario(p_prcs            IN VARCHAR2,
                                     p_usuario         IN VARCHAR2,
                                     p_rol             OUT TYPE_TT_AU_ROL,
                                     p_cod_rpta        OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE)IS
       --
       CURSOR c_rolesPorUsuario IS
       SELECT DISTINCT r.* 
         FROM AUT_TUROL ur, AUT_TROL r
        WHERE ur.UROL_USUARIO = p_usuario
          AND ROL_ROL = UROL_ROL;
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        --
        to_ge_rol TYPE_TO_AU_ROL;
        tt_ge_rol TYPE_TT_AU_ROL := TYPE_TT_AU_ROL();
        --
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
       --
    BEGIN
        --
        FOR i IN c_rolesPorUsuario LOOP
            --
            to_ge_rol :=  TYPE_TO_AU_ROL(i.rol_rol, i.rol_descri, i.rol_is_sistema);
            --
            tt_ge_rol.extend;
            tt_ge_rol(tt_ge_rol.count) := to_ge_rol;
            --
        END LOOP;
        --
        p_rol := tt_ge_rol;
        p_cod_rpta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rpta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rpta,p_cod_rpta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    --
    -- **********************************************************************************
    -- asignarServicioRol 
    -- **********************************************************************************
    PROCEDURE asignarServicioRol(p_prcs       IN VARCHAR2,
                                 p_rol_rol    IN VARCHAR2,
                                 p_servicio   IN NUMBER,
                                 p_cod_rta   OUT VARCHAR2,
                                 p_errores   OUT TYPE_TT_GE_ERRO,
                                 p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
        CURSOR C_EXISTE_SERV_PAG_PPAL IS
        SELECT 'S'
          FROM AUT_TSROL
         WHERE SROL_ROL = p_rol_rol
           AND SROL_SERVICIO = 1;
        v_existe VARCHAR2(1);
        --
        CURSOR C_EXISTE_SERV_PAG_BVENIDA IS
        SELECT 'S'
          FROM AUT_TSROL
         WHERE SROL_ROL = p_rol_rol
           AND SROL_SERVICIO = 50;
        --
        CURSOR C_EXISTE_SERVICIOS_REST IS
        SELECT 'S'
          FROM AUT_TSROL
         WHERE SROL_ROL = p_rol_rol
           AND SROL_SERVICIO = 99;
        --
    BEGIN 
        --
        INSERT INTO AUT_TSROL (SROL_SERVICIO, SROL_ROL, SROL_VISIBLE) 
                       VALUES (p_servicio, p_rol_rol, 'S');
        --
        OPEN C_EXISTE_SERV_PAG_PPAL;
        FETCH C_EXISTE_SERV_PAG_PPAL INTO v_existe;
        CLOSE C_EXISTE_SERV_PAG_PPAL;
        --
        IF(v_existe IS NULL)THEN
            INSERT INTO AUT_TSROL (SROL_SERVICIO, SROL_ROL, SROL_VISIBLE) 
                           VALUES (1, p_rol_rol, 'S');
        END IF;
        --
        OPEN C_EXISTE_SERV_PAG_BVENIDA;
        FETCH C_EXISTE_SERV_PAG_BVENIDA INTO v_existe;
        CLOSE C_EXISTE_SERV_PAG_BVENIDA;
        --
        IF(v_existe IS NULL)THEN
            INSERT INTO AUT_TSROL (SROL_SERVICIO, SROL_ROL, SROL_VISIBLE) 
                           VALUES (50, p_rol_rol, 'S');
        END IF;
        --
        OPEN C_EXISTE_SERVICIOS_REST;
        FETCH C_EXISTE_SERVICIOS_REST INTO v_existe;
        CLOSE C_EXISTE_SERVICIOS_REST;
        --
        IF(v_existe IS NULL)THEN
            --
            INSERT INTO AUT_TSROL (SROL_SERVICIO, SROL_ROL, SROL_VISIBLE) 
                           VALUES (99, p_rol_rol, 'S');
            --
        END IF;
        --
        p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- eliminarServicioRol 
    -- **********************************************************************************
    PROCEDURE eliminarServicioRol(p_prcs      IN VARCHAR2,
                                 p_rol_rol    IN VARCHAR2,
                                 p_servicio   IN NUMBER,
                                 p_cod_rta   OUT VARCHAR2,
                                 p_errores   OUT TYPE_TT_GE_ERRO,
                                 p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN 
        --
        DELETE FROM AUT_TSROL 
              WHERE SROL_SERVICIO = p_servicio
                AND SROL_ROL = p_rol_rol;
        --
        p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- actualizarPersona 
    -- **********************************************************************************
    PROCEDURE actualizarPersona(p_prcs      IN VARCHAR2,
                                p_persona   IN TYPE_TT_AU_TPERSN,
                                p_cod_rta   OUT VARCHAR2,
                                p_errores   OUT TYPE_TT_GE_ERRO,
                                p_mensajes  OUT TYPE_TT_GE_MNSJE)IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN 
        --
        FOR i IN 1..p_persona.count LOOP
            UPDATE AUT_TPERSN SET
                 PERSN_PNOMBRE = NVL(p_persona(i).PERSN_PNOMBRE,PERSN_PNOMBRE),
                 PERSN_SNOMBRE = p_persona(i).PERSN_SNOMBRE,
                 PERSN_PAPELLIDO = NVL(p_persona(i).PERSN_PAPELLIDO,PERSN_PAPELLIDO),
                 PERSN_SAPELLIDO = p_persona(i).PERSN_SAPELLIDO,
                 PERSN_CELULAR = NVL(p_persona(i).PERSN_CELULAR,PERSN_CELULAR),
                 PERSN_FIJO = p_persona(i).PERSN_FIJO,
                 PERSN_EMAIL = NVL(p_persona(i).PERSN_EMAIL,PERSN_EMAIL),
                 PERSN_DIRECCION = p_persona(i).PERSN_DIRECCION,
                 PERSN_CIUD = NVL(p_persona(i).PERSN_CIUD,PERSN_CIUD),
                 PERSN_FECACT = sysdate
            WHERE 
                 PERSN_PERSN = p_persona(i).PERSN_PERSN;
                 
        END LOOP;
        --
        p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    --
    -- **********************************************************************************
    -- cambiarPassword 
    -- **********************************************************************************
    PROCEDURE cambiarEstadoUsuario (p_prcs            IN VARCHAR2,
                                    p_usuario         IN VARCHAR2,
                                    p_estado          IN VARCHAR2,
                                    p_cod_rta         OUT VARCHAR2,
                                    p_errores         OUT TYPE_TT_GE_ERRO,
                                    p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
        --
        to_ge_erro TYPE_TO_GE_ERRO;
        tt_ge_erro TYPE_TT_GE_ERRO := TYPE_TT_GE_ERRO();
        v_crta_http_gral VARCHAR2(3) := 'OK';
        v_mensaje TYPE_TT_GE_MNSJE  := TYPE_TT_GE_MNSJE();
        --
    BEGIN 
        --
        UPDATE AUT_TUSUARIO SET
               USUARIO_ESTADO = p_estado
         WHERE USUARIO_USUARIO = p_usuario;
                 
        --
        p_cod_rta := nvl(v_crta_http_gral, 'OK');
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('COD_EXITOSO',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    EXCEPTION WHEN OTHERS THEN
        --
        p_cod_rta := 'ERROR';
        to_ge_erro := TYPE_TO_GE_ERRO (sysdate, p_prcs,p_cod_rta,p_cod_rta);
        tt_ge_erro := TYPE_TT_GE_ERRO(to_ge_erro);
        p_errores := tt_ge_erro;
        API_GE_QUTILS.generarTypeMensajeRpta('ERR_WHEN_OTHERS',p_prcs,v_mensaje);
        p_mensajes := v_mensaje;
        --
    END;
    
    --
END AUT_QUSUARIOS;
/


