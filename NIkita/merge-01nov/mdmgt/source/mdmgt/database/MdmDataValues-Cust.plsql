-----------------------------------------------------------------------------
--
--  Logical unit: MdmDataValues
--  Component:    MDMGT
--
--  IFS Developer Studio Template Version 3.0
--
--  Date    Sign    History
--  ------  ------  ---------------------------------------------------------
-----------------------------------------------------------------------------

layer Cust;

-------------------- PUBLIC DECLARATIONS ------------------------------------


-------------------- PRIVATE DECLARATIONS -----------------------------------


-------------------- LU SPECIFIC IMPLEMENTATION METHODS ---------------------

@Override
PROCEDURE Prepare_Insert___ (
   attr_ IN OUT VARCHAR2 )
IS
BEGIN
   
   super(attr_);
   Client_SYS.Add_To_Attr('TRANSFERRED_BY', fnd_session_api.Get_Fnd_User, attr_);
   Client_SYS.Add_To_Attr('TRANSFERRED_DATE', SYSDATE, attr_);
END Prepare_Insert___;

PROCEDURE Mdm_Get_Column_Names (
   msg_              OUT VARCHAR2,
   template_id_ IN  VARCHAR2,
   revision_   IN  VARCHAR2  )
IS
      detail_msg_     VARCHAR2(30000);
      line_msg_       VARCHAR2(1000);
      i_              PLS_INTEGER := 1;
      CURSOR get_attr IS
        select  S.TEMPLATE_ID,S.REVISION,S.DESCRIPTION,S.DATA_TYPE,S.Column_Name,
DECODE(S.DATA_TYPE,'VARCHAR2','S','NUMBER','N','DATE','D')||ROW_NUMBER() OVER (PARTITION BY S.DATA_TYPE order  BY S.TEMPLATE_ID,S.REVISION,S.COLUMN_NAME,S.DATA_TYPE ) destination_column
 from mdm_source_map_tab s,mdm_basic_data_header_tab a 
where a.template_id=s.template_id
AND a.revision=s.revision
AND S.template_id = template_id_
AND S.revision=revision_
AND (s.default_value is not null
OR s.Mandatory ='TRUE');
   BEGIN
      msg_          := Message_SYS.Construct( 'COLUMNNAMES' );
      detail_msg_   := Message_SYS.Construct( 'DETAILS' );
      FOR rec_ IN get_attr LOOP
         Trace_SYS.Message ('rec_.description : '||rec_.description);
         line_msg_ := NULL;
         line_msg_ := Message_SYS.Construct('LINE' );
         Message_SYS.Add_Attribute( line_msg_, 'NAME', rec_.destination_column);
         Message_SYS.Add_Attribute( line_msg_, 'TRANS', rec_.description);
         Message_SYS.Add_Attribute( detail_msg_, to_char(i_) , line_msg_ );
         i_ := i_ + 1;
      END LOOP;
      Message_SYS.Add_Attribute( msg_, to_char(i_) , detail_msg_ );   
END Mdm_Get_Column_Names;

-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------

