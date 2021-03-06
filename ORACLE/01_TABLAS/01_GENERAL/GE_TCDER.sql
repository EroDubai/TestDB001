PROMPT 
PROMPT CREANDO TABLA GE_TCDER
PROMPT

CREATE TABLE GE_TCDER
(    
    "CDER_CDER" VARCHAR2(20)           CONSTRAINT NN_GE_TCDER_TDOC NOT NULL, 
    "CDER_DESCRI" VARCHAR2(1000 BYTE)    CONSTRAINT NN_GE_TCDER_DOC NOT NULL
) 
STORAGE( INITIAL 10K  NEXT 10K  PCTINCREASE 5 )
/

COMMENT ON COLUMN "&USUARIOBD"."GE_TCDER"."CDER_CDER" IS 'IDENTIFICADOR DEL CODIGO DE ERROR';

COMMENT ON COLUMN "&USUARIOBD"."GE_TCDER"."CDER_DESCRI" IS 'DESCRIPCION DEL CODIGO DE ERROR';

COMMENT ON TABLE "&USUARIOBD"."GE_TCDER"  IS 'TABLA QUE ALMACENA LOS DIFERENTES CODIGOS DE ERROR DEL SISTEMA';

PROMPT LLAVE PRIMARIA

ALTER TABLE "&USUARIOBD"."GE_TCDER"
  ADD  CONSTRAINT "PK_GE_TCDER"
       PRIMARY KEY ("CDER_CDER") 
       USING INDEX 
       TABLESPACE &TS_INDICES;
