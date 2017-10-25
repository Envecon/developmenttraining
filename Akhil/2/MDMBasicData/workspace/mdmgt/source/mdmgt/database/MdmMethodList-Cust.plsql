-----------------------------------------------------------------------------
--
--  Logical unit: MdmMethodList
--  Component:    MDMGT
--
--  IFS Developer Studio Template Version 3.0
--
--  Date    Sign    History
--  ------  ------  ---------------------------------------------------------
-----------------------------------------------------------------------------

layer Cust;

-------------------- PUBLIC DECLARATIONS ------------------------------------


TYPE number_tabtype IS
   TABLE OF NUMBER
   INDEX BY BINARY_INTEGER;

TYPE attr_tabtype IS
   TABLE OF VARCHAR2(32000)
   INDEX BY BINARY_INTEGER;

TYPE varchar_tabtype IS
   TABLE OF VARCHAR2(2000)
   INDEX BY BINARY_INTEGER;

TYPE integer_tabtype IS
   TABLE OF INTEGER
   INDEX BY BINARY_INTEGER;

TYPE date_tabtype IS
   TABLE OF DATE
   INDEX BY BINARY_INTEGER;

TYPE boolean_tabtype IS
   TABLE OF BOOLEAN
   INDEX BY BINARY_INTEGER;

TYPE dynamic_record IS RECORD(
   method           varchar_tabtype,
   execute_seq      number_tabtype,
   error_count      number_tabtype,
   incomplete_count number_tabtype,
   commit_count     number_tabtype,
   last_row         number_tabtype,
   view_name        varchar_tabtype,
   orig_view_name   varchar_tabtype,
   attr             attr_tabtype,
   arg_attr         attr_tabtype,
   return_attr      attr_tabtype,
   column_name      varchar_tabtype,
   column_value     varchar_tabtype,
   on_new_master    varchar_tabtype,
   on_first_row     varchar_tabtype,
   method_mode      varchar_tabtype,
   reference        varchar_tabtype,
   repl_key         varchar_tabtype,
   upd_cur          integer_tabtype,
   h_cur            integer_tabtype);

TYPE reference_record IS RECORD(
   column_name_       varchar_tabtype,
   data_type_         varchar_tabtype,
   description_       varchar_tabtype,
   prepare_value_     varchar_tabtype,
   length_            number_tabtype,
   decimal_length_    number_tabtype,
   attr_seq_          number_tabtype,
   flags_             varchar_tabtype,
   source_column_     varchar_tabtype,
   reference_         varchar_tabtype,
   db_client_values_  varchar_tabtype,
   db_values_         varchar_tabtype,
   client_values_     varchar_tabtype,
   lov_view_          varchar_tabtype,
   lu_                varchar_tabtype);

msg_sep_          CONSTANT VARCHAR2(2) := chr(13)||chr(10);

replace_fieldsep_ CONSTANT VARCHAR2(2) := '<^';

replace_recsep_   CONSTANT VARCHAR2(2) := '^>';
-------------------- PRIVATE DECLARATIONS -----------------------------------


-------------------- LU SPECIFIC IMPLEMENTATION METHODS ---------------------


@Override
PROCEDURE Prepare_Insert___ (
   attr_ IN OUT VARCHAR2 )
IS
BEGIN  
   SUPER(attr_);
   Client_SYS.Add_To_Attr('ON_NEW', 'FALSE', attr_);
   Client_SYS.Add_To_Attr('ON_MODIFY', 'FALSE', attr_);
END Prepare_Insert___;

@Overtake Base
PROCEDURE Unpack___ (
   newrec_ IN OUT mdm_method_list_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
   ptr_   NUMBER;
   name_  VARCHAR2(30);
   value_ VARCHAR2(32000);
   msg_   VARCHAR2(32000);
BEGIN
   Reset_Indicator_Rec___(indrec_);
   Client_SYS.Clear_Attr(msg_);
   ptr_ := NULL;
   WHILE (Client_SYS.Get_Next_From_Attr(attr_, ptr_, name_, value_)) LOOP
      CASE name_
         WHEN ('TEMPLATE_ID') THEN
            newrec_.template_id := value_;
            indrec_.template_id := TRUE;
         WHEN ('REVISION') THEN
            newrec_.revision := Client_SYS.Attr_Value_To_Number(value_);
            indrec_.revision := TRUE;
         WHEN ('EXECUTE_SEQ') THEN
            newrec_.execute_seq := Client_SYS.Attr_Value_To_Number(value_);
            indrec_.execute_seq := TRUE;
         WHEN ('VIEW_NAME') THEN
            newrec_.view_name := value_;
            indrec_.view_name := TRUE;
         WHEN ('METHOD_NAME') THEN
           newrec_.method_name := value_;
           indrec_.method_name := TRUE;
         WHEN ('ON_NEW') THEN
            IF (value_ IS NULL OR value_ = 'TRUE' OR value_ = 'FALSE') THEN
               newrec_.on_new := value_;
            ELSE
               RAISE value_error;
            END IF;
            indrec_.on_new := TRUE;
         WHEN ('ON_MODIFY') THEN
            IF (value_ IS NULL OR value_ = 'TRUE' OR value_ = 'FALSE') THEN
               newrec_.on_modify := value_;
            ELSE
               RAISE value_error;
            END IF;
            indrec_.on_modify := TRUE;
         ELSE
            Client_SYS.Add_To_Attr(name_, value_, msg_);
         END CASE;
   END LOOP;
    newrec_.method_name := Find_Method_Name(newrec_.view_name,newrec_.method_name);
   attr_ := msg_;
EXCEPTION
   WHEN value_error THEN
      Raise_Item_Format___(name_, value_);
END Unpack___;


 
 @Override
PROCEDURE Check_Common___ (
   oldrec_ IN     mdm_method_list_tab%ROWTYPE,
   newrec_ IN OUT mdm_method_list_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
   temp_count_view_ NUMBER;
   CURSOR get_count_view IS
   SELECT 1
   FROM INTFACE_VIEWS
   WHERE VIEW_NAME = newrec_.view_name;
BEGIN
   OPEN get_count_view;
   FETCH get_count_view INTO temp_count_view_;
   CLOSE get_count_view;
   
   IF(temp_count_view_ = 1) THEN
   super(oldrec_, newrec_, indrec_, attr_);
   ELSE
         Error_SYS.Record_General(lu_name_,': View Does Not Exist.');
END IF;
   --Add post-processing code here
END Check_Common___;






PROCEDURE C_Get_Arguments___ (
   count_       IN OUT NOCOPY NUMBER,
   ref_rec_     IN OUT NOCOPY reference_record,
   attr_seq_    IN OUT NOCOPY NUMBER,
   method_name_ IN     VARCHAR2 )
IS
      h_default_       VARCHAR2(20); 
      dummy_           DBMS_DESCRIBE.NUMBER_TABLE; 
      overload_        DBMS_DESCRIBE.NUMBER_TABLE; 
      position_        DBMS_DESCRIBE.NUMBER_TABLE; 
      argument_name_   DBMS_DESCRIBE.VARCHAR2_TABLE; 
      data_n_type_     DBMS_DESCRIBE.NUMBER_TABLE; 
      def_value_       DBMS_DESCRIBE.NUMBER_TABLE; 
      in_out_          DBMS_DESCRIBE.NUMBER_TABLE;
      --
      data_type_       VARCHAR2(10);
      direction_       VARCHAR2(10);
      length_          NUMBER;
      arg_name_        VARCHAR2(100);
      --
      illegal_method_     EXCEPTION;
      illegal_arg_type_   EXCEPTION;
   BEGIN 
      DBMS_DESCRIBE.DESCRIBE_PROCEDURE(UPPER(method_name_),
         null, null, overload_, position_, dummy_, 
         argument_name_, data_n_type_, def_value_, in_out_, dummy_, dummy_, dummy_, dummy_, dummy_); 
      FOR i IN 1..argument_name_.count LOOP 
         h_default_ := NULL;  
         length_ := 22;
         arg_name_ := argument_name_(i);
         IF ( overload_(i) < 2) THEN -- IF overloaded, only display first alternative
            IF (def_value_(i) = 1) THEN 
               h_default_ := 'DEFAULT'; 
            END IF; 
            IF ( data_n_type_(i) = 1 ) THEN 
               data_type_ := 'VARCHAR2';
               length_    := 32000;
            ELSIF ( data_n_type_(i) = 2 ) THEN 
               data_type_ := 'NUMBER';
            ELSIF ( data_n_type_(i) = 12 ) THEN 
               data_type_ := 'DATE';
            ELSIF ( data_n_type_(i) = 0 ) THEN 
               RETURN;
            ELSE 
               RAISE illegal_arg_type_;
            END IF; 
   --         IF ( position(i) = 0 ) THEN 
   --           RAISE illegal_method_;
   --         END IF;
            IF ( in_out_(i) = 0 ) THEN
               direction_ := 'IN';
            ELSIF ( in_out_(i) = 1 ) THEN
               direction_ := 'OUT';
            ELSIF ( in_out_(i) = 2 ) THEN
               direction_ := 'IN OUT';
            END IF;
            IF ( argument_name_(i) IS NULL AND direction_ = 'OUT' ) THEN
               -- This is a function
               arg_name_ := 'FUNCTION_RESULT';
            END IF;
            count_ := count_ + 1;
            attr_seq_ := nvl(attr_seq_,0) + 10;
            ref_rec_.column_name_(count_)      := arg_name_;
            ref_rec_.data_type_(count_)        := data_type_;
            ref_rec_.description_(count_)      := direction_||' '||h_default_;
            ref_rec_.attr_seq_(count_)         := attr_seq_;
            ref_rec_.prepare_value_(count_)    := 'NULLVALUE';
            ref_rec_.flags_(count_)            := 'ARG';
            ref_rec_.reference_(count_)        := NULL;
            ref_rec_.lu_(count_)               := NULL;
            ref_rec_.lov_view_(count_)         := NULL;
            ref_rec_.length_(count_)           := length_;
            ref_rec_.decimal_length_(count_)   := 0;
            ref_rec_.source_column_(count_)    := NULL;
            ref_rec_.db_client_values_(count_) := NULL;
            ref_rec_.db_values_(count_)        := NULL;
            ref_rec_.client_values_(count_)    := NULL;
         END IF; 
      END LOOP; 
   EXCEPTION
      WHEN illegal_method_ THEN
         Error_SYS.Record_General(lu_name_, 'ILLMETHFUNC: Method :P1 is a function. Only procedures allowed', method_name_);
      WHEN illegal_arg_type_ THEN
         Error_SYS.Record_General(lu_name_, 'ILLARGTYPE: Argument :P1 has illegal type. Only datatype DATE VARCHAR2 NUMBER allowed', arg_name_ );
END C_Get_Arguments___;
   
PROCEDURE C_Make_Source_Map (
   attr_          IN OUT NOCOPY VARCHAR2,
   reference_     IN OUT NOCOPY VARCHAR2,
   view_name_     IN OUT NOCOPY VARCHAR2,
  template_id_  IN     VARCHAR2,
  revision_       IN         NUMBER,
   in_method_     IN     VARCHAR2,
   execute_seq_   IN     NUMBER )
   IS
      source_owner_  VARCHAR2(100) := 'IFSAPP';
      prepare_attr_  VARCHAR2(2000);
      prepare_value_ VARCHAR2(2000);
      fixed_value_   VARCHAR2(2000);
      info_          VARCHAR2(2000);
      objid_         VARCHAR2(2000);
      objversion_    VARCHAR2(2000);
      prep_action_   VARCHAR2(10) := 'PREPARE';
      action_db_     VARCHAR2(10);
      --
      mode_          VARCHAR2(20);
      stmt_          VARCHAR2(2000);
      h_cur_         INTEGER;
      dummy_         NUMBER;
      flags_         VARCHAR2(10);
      ref_           VARCHAR2(2000);
      lookup_ref_    VARCHAR2(2000);
      lu_prompt_     VARCHAR2(2000);
      lov_view_      VARCHAR2(2000);
      ref_prompt_    VARCHAR2(2000);
      orig_view_     MDM_METHOD_LIST.view_name%TYPE := view_name_;
      method_name_   MDM_METHOD_LIST.method_name%TYPE := in_method_;
      source_name_   MDM_METHOD_LIST.view_name%TYPE;
      description_   VARCHAR2(100);
      alias_name_    VARCHAR2(100);
      count_         NUMBER := 0;
      length_        NUMBER;
      attr_seq_      NUMBER;
      max_attr_seq_  NUMBER;
      max_pos_       NUMBER;
      column_name_   MDM_SOURCE_MAP.column_name%TYPE;
      add_objid_     BOOLEAN;
      create_det_    BOOLEAN;
      rule_string_   VARCHAR2(2000);
      default_value_ VARCHAR2(2000);
      note_text_     VARCHAR2(2000);
      source_column_ VARCHAR2(2000);
      --
      prefix_option_      VARCHAR2(20) := '1';
      date_format_        VARCHAR2(30) := Client_SYS.Date_Format_;
      --
      not_inside_loop_    EXCEPTION;
      not_outside_loop_   EXCEPTION;
      no_view_allowed_    EXCEPTION;
      no_package_         EXCEPTION;
      -- Db/Client variables
      iid_lu_             VARCHAR2(2000);
      prefixed_column_    VARCHAR2(2000);
      db_client_values_   VARCHAR2(2000);
      db_values_          VARCHAR2(2000);
      client_values_      VARCHAR2(2000);
      on_new_             VARCHAR2(5);
      on_modify_          VARCHAR2(5);
      err_msg_            VARCHAR2(250);
      --
      is_replication_     BOOLEAN := FALSE;
      old_column_name_    MDM_SOURCE_MAP.column_name%TYPE;
      old_flags_          VARCHAR2(10);
      --
      column_list_        VARCHAR2(32000);
      pos_                NUMBER;
      pos2_               NUMBER;
      objid_source_       VARCHAR2(10);
      test_               NUMBER := 0;
      --
      ref_rec_            reference_record;
      --
      procedure_name_     VARCHAR2(100);
      --
      CURSOR get_source_columns IS
         SELECT c.column_name source_column
         FROM all_tab_columns c
         WHERE c.table_name = source_name_
         AND c.owner = source_owner_
         ORDER BY column_id;
      --
      CURSOR get_columns IS
    SELECT a.column_name column_name, a.data_type data_type,
                to_number(decode(a.data_type, 'NUMBER', nvl(a.data_precision, 20), a.data_length)) length,
                to_number(nvl(a.data_scale, 0)) data_scale, to_number(a.column_id * 10) attr_seq, b.comments,
                '' description
         FROM all_col_comments B, USER_TAB_COLUMNS a
         WHERE a.TABLE_NAME = view_name_
         AND a.TABLE_NAME  = b.table_name
         AND a.column_name = b.column_name
         AND b.owner = nvl('',b.owner)
         AND b.comments IS NOT NULL
         AND a.column_name <> 'TEXT_ID$'         
         AND ((nvl(substr(Dictionary_SYS.Comment_Value_('FLAGS', b.comments), 1, 4),'A---') != 'A---')
              or ( a.column_name like '%_DB' and substr(a.TABLE_NAME,1,7) != 'INTFACE')
              or ( a.column_name like '%_DB') )
         ORDER BY 5;
         
      CURSOR get_max_values IS
         SELECT nvl(max(1), 0) pos, nvl(max(1), 0) attr_seq
         FROM DUAL;
   
      CURSOR check_package IS
         SELECT 1 FROM user_objects
         WHERE object_name = upper(method_name_)
         AND object_type = 'PACKAGE';
      --
   BEGIN
      Trace_Sys.Message('1');
dbms_output.put_line('1');
      action_db_ := '2';
      create_det_ := TRUE;
      add_objid_  := FALSE;
      is_replication_ := TRUE;
      reference_ := NULL;
      Client_SYS.Clear_Attr(attr_);
      alias_name_ := NULL;
      IF ( instr(ltrim(rtrim(source_name_)),' ') != 0 ) THEN
         alias_name_ := ltrim(rtrim(substr(source_name_,instr(source_name_,' ')+1,length(source_name_))))||'.';
         source_name_ := substr(source_name_,1,instr(source_name_,' ')-1);
      END IF;
       Trace_Sys.Message('2');
dbms_output.put_line('2');
      IF ( instr(source_name_, '.') != 0 ) THEN
         -- Source_name is prefixed with owner; separate owner and source
         source_owner_ := substr(source_name_, 1, instr(source_name_, '.')-1);
         source_name_    :=  substr(source_name_, instr(source_name_, '.')+1);
      ELSIF ( (source_name_ IS NOT NULL ) AND ( source_owner_ IS NULL ) ) THEN
         source_owner_ := Fnd_Session_API.Get_App_Owner;
      END IF;
      Trace_Sys.Message('3');
   dbms_output.put_line('3');
      IF ( instr(upper(method_name_), '.') != 0 ) THEN
         mode_ := 'OTHER';
      ELSIF ( instr(upper(method_name_), '.') = 0 ) THEN
         IF ( action_db_ IN ('1','3' ) ) THEN
            RAISE not_inside_loop_;
         END IF;
           Trace_Sys.Message('4');
   dbms_output.put_line('4');
         mode_ := 'INSERT';
         stmt_ := 'Begin ' || method_name_ || '.New__(:info,:objid,:objversion,:attr,:action); End;';
         h_cur_ := DBMS_SQL.Open_Cursor;
         -- Get prepare attr
         BEGIN
            OPEN check_package;
            FETCH check_package INTO test_;
            IF check_package%NOTFOUND THEN
               CLOSE check_package;
               RAISE no_package_;
            ELSE
               CLOSE check_package;
            END IF;
              Trace_Sys.Message('5');
   dbms_output.put_line('5');
            --@ApproveDynamicStatement(2009-11-27,nabalk)
            DBMS_SQL.Parse(h_cur_, stmt_, DBMS_SQL.native);
            DBMS_SQL.bind_variable(h_cur_, 'info', info_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'objid', objid_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'objversion', objversion_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'attr', prepare_attr_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'action', prep_action_, 2000);
            dummy_ := DBMS_SQL.Execute(h_cur_);
            DBMS_SQL.variable_value(h_cur_, 'attr', prepare_attr_);
            DBMS_SQL.Close_Cursor(h_cur_);
              Trace_Sys.Message('6');
   dbms_output.put_line('6');
         EXCEPTION
            WHEN no_package_ THEN
               DBMS_SQL.Close_Cursor(h_cur_);
               Trace_SYS.Message('NO PKG ERROR : Package '||method_name_||' not found');
            WHEN OTHERS THEN
               DBMS_SQL.Close_Cursor(h_cur_);
               Trace_SYS.Message('PREPARE ERROR :'|| SQLERRM);
         END;
      ELSIF ( instr(upper(method_name_), 'NEW__') != 0 ) THEN
         IF ( action_db_ IN ('1','3' ) ) THEN
            RAISE not_inside_loop_;
         END IF;
           Trace_Sys.Message('7');
   dbms_output.put_line('7');
         mode_ := 'INSERT';
         stmt_ := 'Begin ' || method_name_ || '.New__(:info,:objid,:objversion,:attr,:action); End;';
         h_cur_ := DBMS_SQL.Open_Cursor;
         -- Get prepare attr
         BEGIN
            --@ApproveDynamicStatement(2011-05-19,jhmase)
            DBMS_SQL.Parse(h_cur_, stmt_, DBMS_SQL.native);
            DBMS_SQL.bind_variable(h_cur_, 'info', info_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'objid', objid_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'objversion', objversion_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'attr', prepare_attr_, 2000);
            DBMS_SQL.bind_variable(h_cur_, 'action', prep_action_, 2000);
            dummy_ := DBMS_SQL.Execute(h_cur_);
            DBMS_SQL.variable_value(h_cur_, 'attr', prepare_attr_);
            DBMS_SQL.Close_Cursor(h_cur_);
              Trace_Sys.Message('8');
   dbms_output.put_line('8');
         EXCEPTION
            WHEN OTHERS THEN
               DBMS_SQL.Close_Cursor(h_cur_);
               Trace_SYS.Message('PREPARE ERROR :'|| SQLERRM);
         END;
      ELSIF ( instr(upper(method_name_), 'MODIFY__') != 0 ) THEN
         IF ( action_db_ IN ('1','3' ) ) THEN
            RAISE not_inside_loop_;
         END IF;
           Trace_Sys.Message('9');
   dbms_output.put_line('9');
         mode_ := 'INSERT';  
      END IF;
      IF ( ( mode_ = 'OTHER' AND action_db_ IN ('1','3' )) AND view_name_ IS NOT NULL  ) THEN
         RAISE no_view_allowed_;
      END IF;
      --
        Trace_Sys.Message('10');
   dbms_output.put_line('10');
      -- Save maxvalues. To be used in INSERT below
      OPEN  get_max_values;
      FETCH get_max_values INTO max_pos_, max_attr_seq_;
      CLOSE get_max_values;
      --
      Trace_SYS.Field('Make attr and ref MODE ',mode_);
      -- Find columns from source
      column_list_ := ';';
      FOR srec_ IN get_source_columns LOOP
         Trace_Sys.Message('11');
   dbms_output.put_line('11');
         column_list_ := column_list_||srec_.source_column||';';
      END LOOP;
        Trace_Sys.Message('12');
   dbms_output.put_line('12');
      FOR rec_ IN get_columns LOOP
          Trace_Sys.Message('13');
   dbms_output.put_line('13');
         -- Check if there is a match on source column
         pos_ := instr(column_list_,';'||rec_.column_name||';');
         IF (pos_ != 0 ) THEN
            pos2_ :=  Instr(column_list_, ';', pos_+1,1);
            source_column_ := substr(column_list_,pos_+1,pos2_-pos_-1);
         ELSE
            source_column_ := NULL;
         END IF;
          Trace_Sys.Message('14');
   dbms_output.put_line('14');
         -- Clear LOOP variables
         count_            := count_ + 1;
         ref_              := NULL;
         lookup_ref_       := NULL;
         iid_lu_           := NULL;
         db_client_values_ := NULL;
         db_values_        := NULL;
         client_values_    := NULL;
         lu_prompt_        := NULL;
         lov_view_         := NULL;
         flags_            := NULL;
         --
         -- Get flags and format them, make attr_string
         flags_ := substr(Dictionary_SYS.Comment_Value_('FLAGS', rec_.comments), 1, 4);
         IF ( substr(flags_, 1, 1) IN ('P', 'K') ) THEN
            flags_ := substr(flags_, 1, 1);
         ELSE
            flags_ := replace(substr(flags_, 2, 3), '-', '');
         END IF;
          Trace_Sys.Message('15');
   dbms_output.put_line('15');
         IF ( mode_ = 'INSERT' ) THEN
            -- Get LU name for reference
            ref_ := Dictionary_SYS.Comment_Value_('REF', rec_.comments);
            
            IF ref_ IS NULL THEN
               ref_ := Dictionary_SYS.Comment_Value_('ENUMERATION', rec_.comments);
            END IF;
             Trace_Sys.Message('16');
   dbms_output.put_line('16');
            IF ( ref_ IS NOT NULL ) THEN
               -- Remove parentheses and slashes ( f.ex. '/CASCADE')
               -- to extract LU-name only
               IF ( instr(ref_, '(') != 0 ) THEN
                  lookup_ref_ := substr(ref_, 1, instr(ref_, '(')-1);
               ELSE
                  lookup_ref_ := ref_;
               END IF;
                Trace_Sys.Message('17');
   dbms_output.put_line('17');
               IF ( instr(lookup_ref_, '/') != 0 ) THEN
                  lookup_ref_ := substr(lookup_ref_, 1, instr(lookup_ref_, '/')-1);
               END IF;
               lov_view_ := dictionary_SYS.Get_Base_View(lookup_ref_);
               IF ( lov_view_ IS NOT NULL ) THEN
                  lu_prompt_ := nvl(Language_SYS.Translate_Lu_Prompt_(lookup_ref_), lookup_ref_);
               END IF;
            END IF;
             Trace_Sys.Message('18');
   dbms_output.put_line('18');
            -- Get this items value from PREPARE
            prepare_value_ := Client_SYS.Get_Item_Value(rec_.column_name, prepare_attr_);
            --
            -- Check if this is an IID LU
            BEGIN
               iid_lu_ := dictionary_SYS.clientnametodbname_(lookup_ref_);
            EXCEPTION
               WHEN OTHERS THEN
                  iid_lu_ := NULL;
            END;
             Trace_Sys.Message('19');
   dbms_output.put_line('19');
            IF ( iid_lu_ IS NOT NULL ) THEN
               -- Get Db/Client-values for this LU
               prefixed_column_ := view_name_||'.'||rec_.column_name;
               MDM_SOURCE_MAP_API.C_Enum_Db_Client_Values(
                  info_,
                  db_client_values_,
                  db_values_,
                  client_values_,
                  prefixed_column_,
                  iid_lu_,
                  lookup_ref_);
                   Trace_Sys.Message('20');
   dbms_output.put_line('20');
            ELSIF ( rec_.column_name like '%_DB' ) THEN
               -- Get Db/Client-values also for DB-columns
               prefixed_column_ := view_name_||'.'||substr(rec_.column_name,1,length(rec_.column_name)-3);
               MDM_SOURCE_MAP_API.C_Enum_Db_Client_Values(
                  info_,
                  db_client_values_,
                  db_values_,
                  client_values_,
                  prefixed_column_);
               IF ( rec_.column_name = old_column_name_||'_DB' ) THEN
                  -- Inherit flags from Client-column
                  flags_ := old_flags_;
               ELSE
                  flags_:= '-';
               END IF;
                Trace_Sys.Message('21');
   dbms_output.put_line('21');
            END IF;
         END IF;
         ref_rec_.column_name_(count_)      := rec_.column_name;
         ref_rec_.data_type_(count_)        := rec_.data_type;
         ref_rec_.description_(count_)      := MDM_SOURCE_MAP_API.C_Get_Column_Desc(view_name_, rec_.column_name);
         attr_seq_                          := rec_.attr_seq;
         ref_rec_.prepare_value_(count_)    := nvl(prepare_value_, 'NULLVALUE');
         ref_rec_.flags_(count_)            := flags_;
         ref_rec_.reference_(count_)        := lookup_ref_;
         ref_rec_.lu_(count_)               := lu_prompt_;
         ref_rec_.lov_view_(count_)         := lov_view_;
         ref_rec_.length_(count_)           := rec_.length;
         ref_rec_.decimal_length_(count_)   := rec_.data_scale;
         ref_rec_.source_column_(count_)    := source_column_;
         ref_rec_.db_client_values_(count_) := db_client_values_;
         ref_rec_.db_values_(count_)        := db_values_;
         ref_rec_.client_values_(count_)    := client_values_;
         ref_rec_.attr_seq_(count_)         := attr_seq_;
         --
         old_column_name_ := rec_.column_name;
         old_flags_ := flags_;
      END LOOP;
      --
      IF ( mode_ = 'OTHER' ) THEN
       C_Get_Arguments___( count_, ref_rec_, attr_seq_, in_method_ );
        Trace_Sys.Message('22');
   dbms_output.put_line('22');
      END IF;
      --
      -- Concatenate view name with execution sequence to make unique prefix
      IF ( prefix_option_ = '2' and mode_ != 'OTHER' ) THEN
         view_name_ := view_name_||to_char(execute_seq_);
          Trace_Sys.Message('23');
   dbms_output.put_line('23');
      END IF;
      --
      -- Clear table Intface_Method_List_Attrib_Tab just in case
     /* DELETE
      FROM Intface_Method_List_Attrib_Tab
      WHERE intface_name = template_id_
      AND   execute_seq =  execute_seq_;*/
      --
      FOR i IN 1..count_ LOOP
          Trace_Sys.Message('24');
   dbms_output.put_line('24');
         IF ( create_det_ ) THEN
            Trace_Sys.Message('2222222222');
   dbms_output.put_line('222222');
            length_ := ref_rec_.length_(i);
            IF ( ref_rec_.data_type_(i) = 'DATE' ) THEN
               length_ := length(date_format_) ;
            END IF;
             Trace_Sys.Message('25');
   dbms_output.put_line('25');
            IF ( ref_rec_.flags_(i) IN ( 'P', 'K')  ) THEN
               column_name_ := ref_rec_.column_name_(i);
            ELSIF ( ref_rec_.flags_(i) = 'ARG') THEN
               column_name_ := 'METHOD'||to_char(execute_seq_)|| '.' || ref_rec_.column_name_(i);
            ELSIF ( prefix_option_ = '3' ) THEN
               column_name_ := ref_rec_.column_name_(i);
            ELSE
               column_name_ := view_name_ || '.' || ref_rec_.column_name_(i);
            END IF;
             Trace_Sys.Message('26');
   dbms_output.put_line('26');
            Trace_SYS.Message('COLUMN_NAME :' || column_name_);
            IF (ref_rec_.prepare_value_(i) = 'NULLVALUE' ) THEN
               default_value_ := NULL;
               note_text_ := NULL;
            ELSIF ( ref_rec_.data_type_(i) = 'DATE' ) THEN
               IF ( trunc(to_date(ref_rec_.prepare_value_(i),date_format_)) = trunc(sysdate)  ) THEN
                  default_value_ := 'sysdate';
                  note_text_ := Language_SYS.Translate_Constant(lu_name_, ' DATEVAL : Default value sysdate from PREPARE  ', Fnd_Session_API.Get_Language );
               ELSE
                  note_text_ := Language_SYS.Translate_Constant(lu_name_, ' PREPVAL : Default value :P1 from PREPARE  ', Fnd_Session_API.Get_Language, '''' || ref_rec_.prepare_value_(i) || '''' );
                  default_value_ := 'to_date('||'''' || ref_rec_.prepare_value_(i) || ''''||','||''''||date_format_||''''||')';
               END IF;
                Trace_Sys.Message('27');
   dbms_output.put_line('27');
            ELSE
               default_value_ := '''' || ref_rec_.prepare_value_(i) || '''';
               note_text_ := Language_SYS.Translate_Constant(lu_name_, ' PREPVAL : Default value :P1 from PREPARE  ', Fnd_Session_API.Get_Language, '''' || default_value_ || '''' );
            END IF;
            --
            IF ( ref_rec_.source_column_(i) IS NOT NULL ) THEN
               source_column_ := alias_name_||ref_rec_.source_column_(i);
            ELSE
               source_column_ := NULL;
            END IF;
            IF ( ref_rec_.flags_(i) = 'ARG' AND ref_rec_.description_(i) like 'OUT%' ) THEN
               -- Do not insert rows for OUT-variables in source-mapping
               NULL;
            ELSE
                Trace_Sys.Message('28');
   dbms_output.put_line('28');
               BEGIN
                   Trace_Sys.Message('29');
   dbms_output.put_line('29');
                  INSERT INTO MDM_SOURCE_MAP_Tab(template_id ,Revision,Column_Name,Data_Type,Length,
                  description ,Flags,Default_Value,Note_Text,Db_Client_Values,Rowversion)
                  VALUES(template_id_,Revision_, column_name_ , ref_rec_.data_type_(i),  length_,
                      ref_rec_.description_(i), ref_rec_.flags_(i), 
                     default_value_, note_text_,
                     decode(instr(column_name_,'_DB'),
                        '0',ref_rec_.client_values_(i),
                             ref_rec_.db_client_values_(i)),sysdate);
                  IF procedure_name_ = 'EXCEL_MIGRATION' THEN
                     Basic_Data_Translation_API.Insert_Basic_Data_Translation('FNDMIG', 'IntfaceDetail',
                                                                  template_id_||'^'||column_name_||'^'||'DESCRIPTION',
                                                                  NULL, ref_rec_.description_(i));
                     Basic_Data_Translation_API.Insert_Basic_Data_Translation('FNDMIG', 'IntfaceDetail',
                                                                  template_id_||'^'||column_name_||'^'||'NOTE_TEXT',
                                                                  NULL, note_text_);
                  END IF;
               EXCEPTION
                  WHEN OTHERS THEN
                  MDM_SOURCE_MAP_API.C_Trace_Long_Msg('NOINSERT :' || SQLERRM);
               END;
            END IF;
         END IF;
         --
         IF ( add_objid_ ) THEN
            BEGIN
               -- Check if OBJID exists
               MDM_SOURCE_MAP_API.Exist(template_id_,revision_, 'OBJID');
               -- Do nothing if column exists
            EXCEPTION
               WHEN OTHERS THEN
                  BEGIN
                     IF ( is_replication_ ) THEN
                        objid_source_ := 'OBJID';
                     ELSE
                        objid_source_ := 'ROWID';
                     END IF;
                      Trace_Sys.Message('30');
   dbms_output.put_line('30');
                     -- Insert one row for OBJID. POS and ATTR_SEQ is set to
                     -- 99999 to make OBJID appear at bottom of list.
                     INSERT INTO MDM_SOURCE_MAP_Tab(TEMPLATE_ID,REVISION,COLUMN_NAME,Data_Type,
                     Length,Description,Rowversion)                   
                     VALUES(template_id_,revision_ ,'OBJID' , 'VARCHAR2',  20,
                       'Objid' ,  sysdate);
                  EXCEPTION
                     WHEN OTHERS THEN
                       MDM_SOURCE_MAP_API.C_Trace_Long_Msg('NOINSERT :' || SQLERRM);
                  END;
            END;
         END IF;
         --
         fixed_value_ := NULL;
         IF ( ref_rec_.flags_(i) = 'ARG' ) THEN
            -- Set default on-line for f.ex. Intface_Header_API.Start_Job
            IF ( ref_rec_.column_name_(i) = 'EXEC_PLAN_' ) THEN
               fixed_value_ := 'ONLINE';
            END IF;
             Trace_Sys.Message('31');
   dbms_output.put_line('31');
            description_ := ref_rec_.data_type_(i)||' '||ref_rec_.description_(i);
         ELSE
            description_ := ref_rec_.description_(i);
         END IF;
   
         on_new_ := 'FALSE';
         on_modify_ := 'FALSE';
         IF ( mode_ != 'OTHER' ) THEN
            -- Check OnNew/OnModify according to job-type and flags
            IF ref_rec_.flags_(i) IN ('P','K') OR ref_rec_.flags_(i) like '%I%' THEN
               on_new_ := 'TRUE';
            END IF;
            IF ref_rec_.flags_(i) IN ('P','K') THEN
               on_modify_ := 'FALSE';
            ELSIF ref_rec_.flags_(i) like '%U%' THEN
               on_modify_ := 'TRUE';
            ELSIF ref_rec_.column_name_(i) like '%DB' THEN
               on_new_ := 'TRUE';
               on_modify_ := 'TRUE';
            END IF;
            IF ( instr(upper(method_name_), 'MODIFY__') != 0 ) THEN
               on_new_ := 'FALSE';
            ELSIF ( instr(upper(method_name_), 'NEW__') != 0 ) THEN
               on_modify_ := 'FALSE';
            END IF;
             Trace_Sys.Message('32');
   dbms_output.put_line('32');
            -- Do not use DB-columns for replication_jobs
            IF ( is_replication_ AND ref_rec_.flags_(i) = '-' ) THEN
               on_modify_ := 'FALSE';
               on_new_ := 'FALSE';
            END IF;
         ELSIF (ref_rec_.flags_(i) IN ('P','K')) THEN
            ref_rec_.flags_(i) := 'IU';
         END IF;
          Trace_Sys.Message('33');
   dbms_output.put_line('33');
         db_client_values_ := ref_rec_.db_client_values_(i);
         IF ( ref_rec_.column_name_(i) LIKE '%DB' ) THEN
            ref_prompt_ := NULL;
            db_client_values_ := NULL;
         ELSIF ( ref_rec_.lu_(i) IS NOT NULL ) THEN
            ref_prompt_ := ref_rec_.reference_(i)||' - '||ref_rec_.lu_(i);
         ELSE
            ref_prompt_ := ref_rec_.reference_(i);
        END IF;
       /*   INSERT INTO Intface_Method_List_Attrib_Tab (
            INTFACE_NAME,EXECUTE_SEQ,COLUMN_SEQUENCE, COLUMN_NAME,
            FLAGS,ON_NEW,ON_MODIFY,FIXED_VALUE,
            LU_REFERENCE,
            IID_VALUES, DESCRIPTION, ROWVERSION)
         VALUES (template_id_,execute_seq_,ref_rec_.attr_seq_(i),ref_rec_.column_name_(i),
            ref_rec_.flags_(i), on_new_, on_modify_, fixed_value_,
            ref_prompt_,
            db_client_values_, description_, SYSDATE);*/
      END LOOP;
      --
      attr_ := NULL;      -- Do not return this value
      reference_ := NULL; -- Do not return this value
   EXCEPTION
      WHEN not_inside_loop_ THEN
         Error_SYS.Record_General(lu_name_, 'NOTINLOOP: Procedure :P1  must be started inside loop', method_name_);
      WHEN not_outside_loop_ THEN
         Error_SYS.Record_General(lu_name_, 'NOTOUTLOOP: Procedure :P1  cannot be started inside loop', method_name_);
      WHEN no_view_allowed_ THEN
         Error_SYS.Record_General(lu_name_, 'NOVIEW: Specify view_name only inside loop');
      WHEN OTHERS THEN
         err_msg_ := substr(SQLERRM,1,250);
         Trace_SYS.Field('OTHERS ',err_msg_);
         err_msg_ :=REGEXP_REPLACE(err_msg_,'ORA-[[:digit:]]{5}: ','');
         Error_SYS.Record_General(lu_name_, 'MAKEOTHER: Error making attribute and references - :P1  ', err_msg_);
   END C_Make_Source_Map;
@Override
   PROCEDURE Insert___ (
      objid_      OUT    VARCHAR2,
      objversion_ OUT    VARCHAR2,
      newrec_     IN OUT mdm_method_list_tab%ROWTYPE,
      attr_       IN OUT VARCHAR2 )
   IS
      reference_      varchar2(20);
   BEGIN
      --Add pre-processing code here
      super(objid_, objversion_, newrec_, attr_);
      --Add post-processing code here
      C_Make_Source_Map(attr_ ,reference_,newrec_.view_name,newrec_.Template_Id,
                     newrec_.Revision,newrec_.Method_Name,
                     newrec_.Execute_Seq);
   END Insert___;
   
   
FUNCTION Find_Method_Name (
   view_name_ IN VARCHAR2,
   method_name_ IN VARCHAR2) RETURN VARCHAR2
IS
   package_name_ VARCHAR2(100);
BEGIN
   IF(method_name_ IS NULL) THEN 
   package_name_ := view_name_||'_API';
   ELSE 
      package_name_ := method_name_;
   END IF;
   IF Database_SYS.Method_Exist(package_name_, 'NEW__') THEN
      RETURN package_name_;
   ELSE   
      RETURN NULL;
   END IF;
END Find_Method_Name;



-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------

