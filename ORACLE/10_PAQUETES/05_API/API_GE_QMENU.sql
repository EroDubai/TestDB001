prompt
prompt PACKAGE: API_GE_QMENU
prompt
CREATE OR REPLACE PACKAGE "&USUARIOBD".API_GE_QMENU IS
    -- ===========================================================
    -- API_GE_QMENU: Re�ne funciones y procedimientos relacionados
    -- con parametros de menu.
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versi�n        GAP                Solicitud        Fecha        Realiz�            Descripci�n
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 1000                                             01/08/2017      ada           Se crean API de servicios para el modulo de autentiacion para la entidad Persona
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    --
    /*
    Procedimiento que se encarga de retornar objeto persona por usuario.
    */
    PROCEDURE obtenerMenuPorUsuario (p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                     p_usuario         IN  VARCHAR2,
                                     p_tservicio       OUT TYPE_TT_GE_SRVCIO,
                                     p_cod_rta         OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE serviciosTpListadoPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                           p_usuario         IN  VARCHAR2,
                                           p_tservicio       OUT TYPE_TT_GE_SRVCIO,
                                           p_cod_rta         OUT VARCHAR2,
                                           p_errores         OUT TYPE_TT_GE_ERRO,
                                           p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE serviciosUsuarioPorUrl(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                     p_usuario         IN  VARCHAR2,
                                     p_url             IN  VARCHAR2,
                                     p_tservicio       OUT TYPE_TT_GE_SRVCIO,
                                     p_cod_rta         OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE modulosPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                p_usuario         IN  VARCHAR2,
                                p_tmodulo         OUT TYPE_TT_GE_MODULO,
                                p_cod_rta         OUT VARCHAR2,
                                p_errores         OUT TYPE_TT_GE_ERRO,
                                p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE titulosMenuPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                    p_usuario         IN  VARCHAR2,
                                    p_tmenu           OUT TYPE_TT_GE_MENU,
                                    p_cod_rta         OUT VARCHAR2,
                                    p_errores         OUT TYPE_TT_GE_ERRO,
                                    p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
    PROCEDURE paginaInicioPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                     p_usuario         IN  VARCHAR2,
                                     p_surl_url        OUT VARCHAR2,
                                     p_cod_rta         OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE);
    --
end API_GE_QMENU;                            
/
prompt
prompt PACKAGE BODY:API_GE_QMENU
prompt

CREATE OR REPLACE PACKAGE BODY "&USUARIOBD".API_GE_QMENU IS
    --
    PROCEDURE obtenerMenuPorUsuario (p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                      p_usuario         IN  VARCHAR2,
                                      p_tservicio       OUT TYPE_TT_GE_SRVCIO,
                                      p_cod_rta         OUT VARCHAR2,
                                      p_errores         OUT TYPE_TT_GE_ERRO,
                                      p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
        --
        v_crta_crta_gral         ge_tcrta.crta_crta%type;       --Codigo interno de respuesta
        v_crta_prcs_gral         ge_tcrta.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
        v_crta_http_gral         ge_tcrta.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
        v_crta_descri_gral       ge_tcrta.crta_descri%type;     --Descripcion general del codigo de respuesta
        v_lgtr                   ge_tlgtr.lgtr_lgtr%type;       --Log de trasnsacciones
        v_lgtr_id_entidad        ge_tlgtr.lgtr_id_entidad%type; --Id Entidad para el log de transacciones
        e_lgtr_exception         exception;                     --Excepcion exclusiva para el log de operaciones
        v_cod_rspta_lgtr_v            ge_tcrta.crta_crta%type;
        --
    BEGIN
        --
        v_crta_prcs_gral := 'API_GE_QMENU.obtenerMenuPorUsuario';
        --
         DECLARE
            
            v_cod_rpta_descri_lgtr_v      ge_tcrta.crta_descri%type;
         BEGIN
                GE_QLGTR.validar_ctrl_operacion
                    (p_ctrl_operacion,
                     v_crta_prcs_gral,
                     v_cod_rspta_lgtr_v,
                     v_cod_rpta_descri_lgtr_v,
                     p_errores);
                --
                if(v_cod_rspta_lgtr_v <> 'OK') then
                    v_crta_crta_gral := 'ERROR_LGTR';
                    return;
                    raise e_lgtr_exception; 
                end if;
         END;
        --
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
            --
            GE_QLGTR.iniciar_log(p_ctrl_operacion => p_ctrl_operacion,
                                 p_prcs => v_crta_prcs_gral,
                                 p_cod_rpta => v_cod_rspta_lgtr,
                                 p_cod_rpta_descri => v_cod_rpta_descri_lgtr,
                                 p_lgtr => v_lgtr); 
            --
        END;            
        --
        GE_QMENU.obtenerMenuPorUsuario(v_crta_prcs_gral,p_usuario,p_tservicio,p_cod_rta,p_errores,p_mensajes);
        --
        -- =============================================
        -- Luego de realizar todos los pasos se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        
        BEGIN
        
            IF(p_cod_rta = 'OK')THEN
                v_crta_crta_gral := 'COD_EXITOSO';
            ELSE
                v_crta_crta_gral := 'ERR_WHEN_OTHERS';
            END IF;
        
            GE_QLGTR.finalizar_log
            (
                p_lgtr => v_lgtr,
                p_crta => v_crta_crta_gral,
                p_id_entidad => nvl(v_lgtr_id_entidad, '-'),
                p_error => v_crta_descri_gral,
                p_cod_rpta => v_cod_rspta_lgtr,
                p_cod_rpta_descri => v_cod_rpta_descri_lgtr
            );
        
        END;
        --
    EXCEPTION 
            --
             WHEN e_lgtr_exception THEN
                --
                 v_crta_crta_gral := 'ERROR_LGTR';
                
                DECLARE
                    v_cod_rspta_crta            ge_tcder.cder_cder%type;
                    v_cod_rpta_descri_crta      ge_tcder.cder_descri%type;
                
                BEGIN
                    GE_QCRTA.consultar_crta 
                    (
                        v_crta_prcs_gral, 
                        v_crta_crta_gral, 
                        v_crta_http_gral, 
                        v_crta_descri_gral, 
                        v_cod_rspta_crta, 
                        v_cod_rpta_descri_crta
                    );
                
                END;
                p_cod_rta :=  'ERROR';
                --
            --
    END;
    --
    PROCEDURE serviciosTpListadoPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                                    p_usuario         IN  VARCHAR2,
                                                    p_tservicio       OUT TYPE_TT_GE_SRVCIO,
                                                    p_cod_rta         OUT VARCHAR2,
                                                    p_errores         OUT TYPE_TT_GE_ERRO,
                                                    p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
        --
        v_crta_crta_gral         ge_tcrta.crta_crta%type;       --Codigo interno de respuesta
        v_crta_prcs_gral         ge_tcrta.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
        v_crta_http_gral         ge_tcrta.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
        v_crta_descri_gral       ge_tcrta.crta_descri%type;     --Descripcion general del codigo de respuesta
        v_lgtr                   ge_tlgtr.lgtr_lgtr%type;       --Log de trasnsacciones
        v_lgtr_id_entidad        ge_tlgtr.lgtr_id_entidad%type; --Id Entidad para el log de transacciones
        e_lgtr_exception         exception;                     --Excepcion exclusiva para el log de operaciones
        --
    BEGIN
        --
        v_crta_prcs_gral := 'API_GE_QMENU.serviciosTpListadoPorUsuario';
        --
         DECLARE
            v_cod_rspta_lgtr_v            ge_tcrta.crta_crta%type;
            v_cod_rpta_descri_lgtr_v      ge_tcrta.crta_descri%type;
         BEGIN
                GE_QLGTR.validar_ctrl_operacion
                    (p_ctrl_operacion,
                     v_crta_prcs_gral,
                     v_cod_rspta_lgtr_v,
                     v_cod_rpta_descri_lgtr_v,
                     p_errores);
                --
                if(v_cod_rspta_lgtr_v <> 'OK') then
                    v_crta_crta_gral := 'ERROR_LGTR';
                    raise e_lgtr_exception; 
                end if;
         END;
        --
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
            --
            GE_QLGTR.iniciar_log(p_ctrl_operacion => p_ctrl_operacion,
                                 p_prcs => v_crta_prcs_gral,
                                 p_cod_rpta => v_cod_rspta_lgtr,
                                 p_cod_rpta_descri => v_cod_rpta_descri_lgtr,
                                 p_lgtr => v_lgtr); 
            --
        END;            
        --
        GE_QMENU.serviciosTpListadoPorUsuario(v_crta_prcs_gral,p_usuario,p_tservicio,p_cod_rta,p_errores,p_mensajes);
        --
        -- =============================================
        -- Luego de realizar todos los pasos se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        
        BEGIN
        
            IF(p_cod_rta = 'OK')THEN
                v_crta_crta_gral := 'COD_EXITOSO';
            ELSE
                v_crta_crta_gral := 'ERR_WHEN_OTHERS';
            END IF;
        
            GE_QLGTR.finalizar_log
            (
                p_lgtr => v_lgtr,
                p_crta => v_crta_crta_gral,
                p_id_entidad => nvl(v_lgtr_id_entidad, '-'),
                p_error => v_crta_descri_gral,
                p_cod_rpta => v_cod_rspta_lgtr,
                p_cod_rpta_descri => v_cod_rpta_descri_lgtr
            );
        
        END;
        --
    EXCEPTION 
        --
         WHEN e_lgtr_exception THEN
                --
                 v_crta_crta_gral := 'ERROR_LGTR';
                
                DECLARE
                    v_cod_rspta_crta            ge_tcder.cder_cder%type;
                    v_cod_rpta_descri_crta      ge_tcder.cder_descri%type;
                
                BEGIN
                    GE_QCRTA.consultar_crta 
                    (
                        v_crta_prcs_gral, 
                        v_crta_crta_gral, 
                        v_crta_http_gral, 
                        v_crta_descri_gral, 
                        v_cod_rspta_crta, 
                        v_cod_rpta_descri_crta
                    );
                
                END;
                p_cod_rta := 'ERROR';
                --
        --
    END;
    --
    PROCEDURE serviciosUsuarioPorUrl(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                     p_usuario         IN  VARCHAR2,
                                     p_url             IN  VARCHAR2,
                                     p_tservicio       OUT TYPE_TT_GE_SRVCIO,
                                     p_cod_rta         OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
        --
        v_crta_crta_gral         ge_tcrta.crta_crta%type;       --Codigo interno de respuesta
        v_crta_prcs_gral         ge_tcrta.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
        v_crta_http_gral         ge_tcrta.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
        v_crta_descri_gral       ge_tcrta.crta_descri%type;     --Descripcion general del codigo de respuesta
        v_lgtr                   ge_tlgtr.lgtr_lgtr%type;       --Log de trasnsacciones
        v_lgtr_id_entidad        ge_tlgtr.lgtr_id_entidad%type; --Id Entidad para el log de transacciones
        e_lgtr_exception         exception;                     --Excepcion exclusiva para el log de operaciones
        --
    BEGIN
        v_crta_prcs_gral := 'API_GE_QMENU.serviciosUsuarioPorUrl';
        --
         DECLARE
            v_cod_rspta_lgtr_v            ge_tcrta.crta_crta%type;
            v_cod_rpta_descri_lgtr_v      ge_tcrta.crta_descri%type;
         BEGIN
                GE_QLGTR.validar_ctrl_operacion
                    (p_ctrl_operacion,
                     v_crta_prcs_gral,
                     v_cod_rspta_lgtr_v,
                     v_cod_rpta_descri_lgtr_v,
                     p_errores);
                --
                if(v_cod_rspta_lgtr_v <> 'OK') then
                    v_crta_crta_gral := 'ERROR_LGTR';
                    raise e_lgtr_exception; 
                end if;
         END;
        --
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
            --
            GE_QLGTR.iniciar_log(p_ctrl_operacion => p_ctrl_operacion,
                                 p_prcs => v_crta_prcs_gral,
                                 p_cod_rpta => v_cod_rspta_lgtr,
                                 p_cod_rpta_descri => v_cod_rpta_descri_lgtr,
                                 p_lgtr => v_lgtr); 
            --
        END;            
        --
        GE_QMENU.serviciosUsuarioPorUrl(v_crta_prcs_gral,p_usuario,p_url,p_tservicio,p_cod_rta,p_errores,p_mensajes);
        --
        -- =============================================
        -- Luego de realizar todos los pasos se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        
        BEGIN
        
            IF(p_cod_rta = 'OK')THEN
                v_crta_crta_gral := 'COD_EXITOSO';
            ELSE
                v_crta_crta_gral := 'ERR_WHEN_OTHERS';
            END IF;
        
            GE_QLGTR.finalizar_log
            (
                p_lgtr => v_lgtr,
                p_crta => v_crta_crta_gral,
                p_id_entidad => nvl(v_lgtr_id_entidad, '-'),
                p_error => v_crta_descri_gral,
                p_cod_rpta => v_cod_rspta_lgtr,
                p_cod_rpta_descri => v_cod_rpta_descri_lgtr
            );
        
        END;
        --
    EXCEPTION 
        --
         WHEN e_lgtr_exception THEN
                --
                 v_crta_crta_gral := 'ERROR_LGTR';
                
                DECLARE
                    v_cod_rspta_crta            ge_tcder.cder_cder%type;
                    v_cod_rpta_descri_crta      ge_tcder.cder_descri%type;
                
                BEGIN
                    GE_QCRTA.consultar_crta 
                    (
                        v_crta_prcs_gral, 
                        v_crta_crta_gral, 
                        v_crta_http_gral, 
                        v_crta_descri_gral, 
                        v_cod_rspta_crta, 
                        v_cod_rpta_descri_crta
                    );
                
                END;
                p_cod_rta := 'ERROR';
                --
    END;
    --
    PROCEDURE modulosPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                p_usuario         IN  VARCHAR2,
                                p_tmodulo         OUT TYPE_TT_GE_MODULO,
                                p_cod_rta         OUT VARCHAR2,
                                p_errores         OUT TYPE_TT_GE_ERRO,
                                p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
    --
    v_crta_crta_gral         ge_tcrta.crta_crta%type;       --Codigo interno de respuesta
    v_crta_prcs_gral         ge_tcrta.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
    v_crta_http_gral         ge_tcrta.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
    v_crta_descri_gral       ge_tcrta.crta_descri%type;     --Descripcion general del codigo de respuesta
    v_lgtr                   ge_tlgtr.lgtr_lgtr%type;       --Log de trasnsacciones
    v_lgtr_id_entidad        ge_tlgtr.lgtr_id_entidad%type; --Id Entidad para el log de transacciones
    e_lgtr_exception         exception;                     --Excepcion exclusiva para el log de operaciones  
    
    --
    BEGIN
        --
         v_crta_prcs_gral := 'API_GE_QMENU.modulosPorUsuario';
        --
         DECLARE
            v_cod_rspta_lgtr_v            ge_tcrta.crta_crta%type;
            v_cod_rpta_descri_lgtr_v      ge_tcrta.crta_descri%type;
         BEGIN
                GE_QLGTR.validar_ctrl_operacion
                    (p_ctrl_operacion,
                     v_crta_prcs_gral,
                     v_cod_rspta_lgtr_v,
                     v_cod_rpta_descri_lgtr_v,
                     p_errores);
                --
                if(v_cod_rspta_lgtr_v <> 'OK') then
                    v_crta_crta_gral := 'ERROR_LGTR';
                    raise e_lgtr_exception; 
                end if;
         END;
        --
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
            --
            GE_QLGTR.iniciar_log(p_ctrl_operacion => p_ctrl_operacion,
                                 p_prcs => v_crta_prcs_gral,
                                 p_cod_rpta => v_cod_rspta_lgtr,
                                 p_cod_rpta_descri => v_cod_rpta_descri_lgtr,
                                 p_lgtr => v_lgtr); 
            --
        END;            
        --
        GE_QMENU.modulosPorUsuario(v_crta_prcs_gral,p_usuario,p_tmodulo,p_cod_rta,p_errores,p_mensajes);
        --
        -- =============================================
        -- Luego de realizar todos los pasos se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
        
            IF(p_cod_rta = 'OK')THEN
                v_crta_crta_gral := 'COD_EXITOSO';
            ELSE
                v_crta_crta_gral := 'ERR_WHEN_OTHERS';
            END IF;
        
            GE_QLGTR.finalizar_log
            (
                p_lgtr => v_lgtr,
                p_crta => v_crta_crta_gral,
                p_id_entidad => nvl(v_lgtr_id_entidad, '-'),
                p_error => v_crta_descri_gral,
                p_cod_rpta => v_cod_rspta_lgtr,
                p_cod_rpta_descri => v_cod_rpta_descri_lgtr
            );
        
        END;
        --
    EXCEPTION 
        --
         WHEN e_lgtr_exception THEN
                --
                 v_crta_crta_gral := 'ERROR_LGTR';
                
                DECLARE
                    v_cod_rspta_crta            ge_tcder.cder_cder%type;
                    v_cod_rpta_descri_crta      ge_tcder.cder_descri%type;
                
                BEGIN
                    GE_QCRTA.consultar_crta 
                    (
                        v_crta_prcs_gral, 
                        v_crta_crta_gral, 
                        v_crta_http_gral, 
                        v_crta_descri_gral, 
                        v_cod_rspta_crta, 
                        v_cod_rpta_descri_crta
                    );
                
                END;
                p_cod_rta := 'ERROR';
                --
        --
    END;
    --
    PROCEDURE titulosMenuPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                    p_usuario         IN  VARCHAR2,
                                    p_tmenu           OUT TYPE_TT_GE_MENU,
                                    p_cod_rta         OUT VARCHAR2,
                                    p_errores         OUT TYPE_TT_GE_ERRO,
                                    p_mensajes        OUT TYPE_TT_GE_MNSJE) IS
        --
        v_crta_crta_gral         ge_tcrta.crta_crta%type;       --Codigo interno de respuesta
        v_crta_prcs_gral         ge_tcrta.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
        v_crta_http_gral         ge_tcrta.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
        v_crta_descri_gral       ge_tcrta.crta_descri%type;     --Descripcion general del codigo de respuesta
        v_lgtr                   ge_tlgtr.lgtr_lgtr%type;       --Log de trasnsacciones
        v_lgtr_id_entidad        ge_tlgtr.lgtr_id_entidad%type; --Id Entidad para el log de transacciones
        e_lgtr_exception         exception;                     --Excepcion exclusiva para el log de operaciones  
        --
    BEGIN
        --
        --
         v_crta_prcs_gral := 'API_GE_QMENU.titulosMenuPorUsuario';
        --
         DECLARE
            v_cod_rspta_lgtr_v            ge_tcrta.crta_crta%type;
            v_cod_rpta_descri_lgtr_v      ge_tcrta.crta_descri%type;
         BEGIN
                GE_QLGTR.validar_ctrl_operacion
                    (p_ctrl_operacion,
                     v_crta_prcs_gral,
                     v_cod_rspta_lgtr_v,
                     v_cod_rpta_descri_lgtr_v,
                     p_errores);
                --
                if(v_cod_rspta_lgtr_v <> 'OK') then
                    v_crta_crta_gral := 'ERROR_LGTR';
                    raise e_lgtr_exception; 
                end if;
         END;
        --
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
            --
            GE_QLGTR.iniciar_log(p_ctrl_operacion => p_ctrl_operacion,
                                 p_prcs => v_crta_prcs_gral,
                                 p_cod_rpta => v_cod_rspta_lgtr,
                                 p_cod_rpta_descri => v_cod_rpta_descri_lgtr,
                                 p_lgtr => v_lgtr); 
            --
        END;            
        --
        GE_QMENU.titulosMenuPorUsuario(v_crta_prcs_gral,p_usuario,p_tmenu,p_cod_rta,p_errores,p_mensajes);
        --
        -- =============================================
        -- Luego de realizar todos los pasos se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
        
            IF(v_crta_crta_gral = 'OK')THEN
                v_crta_descri_gral := null;
            END IF;
        
            GE_QLGTR.finalizar_log
            (
                p_lgtr => v_lgtr,
                p_crta => v_crta_crta_gral,
                p_id_entidad => nvl(v_lgtr_id_entidad, '-'),
                p_error => v_crta_descri_gral,
                p_cod_rpta => v_cod_rspta_lgtr,
                p_cod_rpta_descri => v_cod_rpta_descri_lgtr
            );
        
        END;
        --
    EXCEPTION 
        --
         WHEN e_lgtr_exception THEN
                --
                 v_crta_crta_gral := 'ERROR_LGTR';
                
                DECLARE
                    v_cod_rspta_crta            ge_tcder.cder_cder%type;
                    v_cod_rpta_descri_crta      ge_tcder.cder_descri%type;
                
                BEGIN
                    GE_QCRTA.consultar_crta 
                    (
                        v_crta_prcs_gral, 
                        v_crta_crta_gral, 
                        v_crta_http_gral, 
                        v_crta_descri_gral, 
                        v_cod_rspta_crta, 
                        v_cod_rpta_descri_crta
                    );
                
                END;
                p_cod_rta := 'ERROR';
                --
        --
        --
    END;
    --
    PROCEDURE paginaInicioPorUsuario(p_ctrl_operacion  TYPE_TT_GE_LGTR,
                                     p_usuario         IN  VARCHAR2,
                                     p_surl_url        OUT VARCHAR2,
                                     p_cod_rta         OUT VARCHAR2,
                                     p_errores         OUT TYPE_TT_GE_ERRO,
                                     p_mensajes        OUT TYPE_TT_GE_MNSJE)IS
        --
        v_crta_crta_gral         ge_tcrta.crta_crta%type;       --Codigo interno de respuesta
        v_crta_prcs_gral         ge_tcrta.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
        v_crta_http_gral         ge_tcrta.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
        v_crta_descri_gral       ge_tcrta.crta_descri%type;     --Descripcion general del codigo de respuesta
        v_lgtr                   ge_tlgtr.lgtr_lgtr%type;       --Log de trasnsacciones
        v_lgtr_id_entidad        ge_tlgtr.lgtr_id_entidad%type; --Id Entidad para el log de transacciones
        e_lgtr_exception         exception;                     --Excepcion exclusiva para el log de operaciones
        --
    BEGIN
        --
        v_crta_prcs_gral := 'API_GE_QMENU.paginaInicioPorUsuario';
        --
         DECLARE
            v_cod_rspta_lgtr_v            ge_tcrta.crta_crta%type;
            v_cod_rpta_descri_lgtr_v      ge_tcrta.crta_descri%type;
         BEGIN
                GE_QLGTR.validar_ctrl_operacion
                    (p_ctrl_operacion,
                     v_crta_prcs_gral,
                     v_cod_rspta_lgtr_v,
                     v_cod_rpta_descri_lgtr_v,
                     p_errores);
                --
                if(v_cod_rspta_lgtr_v <> 'OK') then
                    v_crta_crta_gral := 'ERROR_LGTR';
                    raise e_lgtr_exception; 
                end if;
         END;
        --
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        BEGIN
            --
            GE_QLGTR.iniciar_log(p_ctrl_operacion => p_ctrl_operacion,
                                 p_prcs => v_crta_prcs_gral,
                                 p_cod_rpta => v_cod_rspta_lgtr,
                                 p_cod_rpta_descri => v_cod_rpta_descri_lgtr,
                                 p_lgtr => v_lgtr); 
            --
        END;            
        --
        GE_QMENU.paginaInicioPorUsuario(v_crta_prcs_gral,p_usuario,p_surl_url,p_cod_rta,p_errores,p_mensajes);
        --
        -- =============================================
        -- Luego de realizar todos los pasos se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr         ge_tcder.cder_cder%type;       
            v_cod_rpta_descri_lgtr   ge_tcder.cder_descri%type;
        
        BEGIN
        
            IF(v_crta_crta_gral = 'OK')THEN
                v_crta_descri_gral := null;
            END IF;
        
            GE_QLGTR.finalizar_log
            (
                p_lgtr => v_lgtr,
                p_crta => v_crta_crta_gral,
                p_id_entidad => nvl(v_lgtr_id_entidad, '-'),
                p_error => v_crta_descri_gral,
                p_cod_rpta => v_cod_rspta_lgtr,
                p_cod_rpta_descri => v_cod_rpta_descri_lgtr
            );
        
        END;
        --
    EXCEPTION 
            --
             WHEN e_lgtr_exception THEN
                --
                 v_crta_crta_gral := 'ERROR_LGTR';
                
                DECLARE
                    v_cod_rspta_crta            ge_tcder.cder_cder%type;
                    v_cod_rpta_descri_crta      ge_tcder.cder_descri%type;
                
                BEGIN
                    GE_QCRTA.consultar_crta 
                    (
                        v_crta_prcs_gral, 
                        v_crta_crta_gral, 
                        v_crta_http_gral, 
                        v_crta_descri_gral, 
                        v_cod_rspta_crta, 
                        v_cod_rpta_descri_crta
                    );
                
                END;
                p_cod_rta :=  'ERROR';
                --
            --
        --
    END;
    --
END API_GE_QMENU;
/