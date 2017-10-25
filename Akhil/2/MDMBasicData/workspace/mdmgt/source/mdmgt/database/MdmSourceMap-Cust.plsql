-----------------------------------------------------------------------------
--
--  Logical unit: MdmSourceMap
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

PROCEDURE C_Trace_Long_Msg (
      msg_ IN VARCHAR2 )
   IS
      cnt_ NUMBER;
      ptr_ NUMBER;
   BEGIN
      -- Display long statements, 250 char per line
      IF ( ltrim(msg_) IS NOT NULL ) THEN
         cnt_ := ceil(length(msg_)/250);
         ptr_ := 1;
         FOR i IN 1..cnt_ LOOP
            Trace_SYS.Message(substr(msg_,ptr_,250));
            ptr_ := ptr_ + 250;
         END LOOP;
      END IF;
   END C_Trace_Long_Msg;
   
PROCEDURE C_Enum_Db_Client_Values (
      info_             IN OUT NOCOPY VARCHAR2,
      db_client_values_ IN OUT NOCOPY VARCHAR2,
      db_values_        IN OUT NOCOPY VARCHAR2,
      client_values_    IN OUT NOCOPY VARCHAR2,
      prefixed_column_  IN     VARCHAR2,
      in_lu_db_name_    IN     VARCHAR2 DEFAULT NULL,
      in_reference_     IN     VARCHAR2 DEFAULT NULL )
   IS
      type varchar_tabtype IS
      TABLE OF VARCHAR2(2000)
      INDEX BY BINARY_INTEGER;
      type enumerate_record IS RECORD(
      client_val varchar_tabtype,
      db_val     varchar_tabtype);
      --
      enum_rec_ enumerate_record;
      --
      column_name_  VARCHAR2(200);
      view_name_    VARCHAR2(200);
      iid_lu_       VARCHAR2(2000);
      ref_          VARCHAR2(2000);
      lookup_ref_   VARCHAR2(2000);
      comments_     VARCHAR2(2000);
      db_value_     VARCHAR2(200);
      client_value_ VARCHAR2(200);
      count_        NUMBER := 0;
      stmt_client_  VARCHAR2(2000);
      stmt_db_      VARCHAR2(2000);
      client_cur_   INTEGER;
      db_cur_       INTEGER;
      dummy_        NUMBER;
      db_hdr_       VARCHAR2(20);
      client_hdr_   VARCHAR2(20);
      msg_sep_      VARCHAR2(2) := chr(13)||chr(10);
      no_iid_       EXCEPTION;
      CURSOR get_columns IS
	   SELECT b.comments
         FROM user_col_comments B, USER_TAB_COLUMNS a
         WHERE a.TABLE_NAME = view_name_
         AND a.column_name = column_name_
         AND a.TABLE_NAME  = b.table_name
         AND a.column_name = b.column_name;         
      --
   BEGIN
      --
      view_name_ := substr(prefixed_column_, 1, instr(prefixed_column_, '.')-1);
      column_name_ := substr(prefixed_column_, instr(prefixed_column_, '.')+1);
      --
      db_hdr_ := Language_SYS.Translate_Constant( lu_name_, ' DBVAL : DB-values', Fnd_Session_API.Get_Language);
      client_hdr_ := Language_SYS.Translate_Constant( lu_name_, ' CLIENTVAL : Client-values', Fnd_Session_API.Get_Language);
      --
      trace_sys.message('View name '||view_name_);
      trace_sys.message('Column name '||column_name_);
      IF ( in_lu_db_name_ IS NULL ) THEN
         -- Lookup references for view comments
         OPEN  get_columns;
         FETCH get_columns INTO comments_;
         CLOSE get_columns;
         ref_ := Dictionary_SYS.Comment_Value_('REF', comments_);
         
         IF ref_ IS NULL THEN
            ref_ := Dictionary_SYS.Comment_Value_('ENUMERATION', comments_);
         END IF;
            
         IF ( ref_ IS NOT NULL ) THEN
            -- Remove parentheses and slashes ( f.ex. '/CASCADE')
            -- to extract LU-name only
            IF ( instr(ref_, '(') != 0 ) THEN
               lookup_ref_ := substr(ref_, 1, instr(ref_, '(')-1);
            ELSE
               lookup_ref_ := ref_;
            END IF;
            IF ( instr(lookup_ref_, '/') != 0 ) THEN
               lookup_ref_ := substr(lookup_ref_, 1, instr(lookup_ref_, '/')-1);
            END IF;
            BEGIN
               iid_lu_ := dictionary_SYS.clientnametodbname_(lookup_ref_);
            EXCEPTION
               WHEN OTHERS THEN
                  iid_lu_ := NULL;
            END;
         END IF;
         trace_sys.message('Found reference '||lookup_ref_);
         trace_sys.message('Found LU Db name '||iid_lu_);
      ELSE
         -- Lu-name and reference are already known
         -- (Call from IntfaceMethodList)
         iid_lu_ := in_lu_db_name_;
         lookup_ref_ := in_reference_;
         trace_sys.message('Input reference '||lookup_ref_);
         trace_sys.message('Input LU Db name '||iid_lu_);
      END IF;
      -- Check if this is an LU with DB/Client
      IF ( iid_lu_ IS NOT NULL ) THEN
         iid_lu_ := iid_lu_ || '_API';
         trace_sys.message('LU Db name '||iid_lu_);
         stmt_client_  := 'BEGIN :client_value := ' || iid_lu_ || '.Get_Client_Value(:count); End;';
         stmt_db_  := 'BEGIN :db_value := ' || iid_lu_ || '.Get_Db_Value(:count); End;';
         client_cur_ := DBMS_SQL.Open_Cursor;
         db_cur_ := DBMS_SQL.Open_Cursor;
         -- Safe due to appending values are not directly exposed to user inputs
         --@ApproveDynamicStatement(2009-11-24,nabalk)
         DBMS_SQL.Parse(client_cur_, stmt_client_, DBMS_SQL.native);
         -- Safe due to appending values are not directly exposed to user inputs
         --@ApproveDynamicStatement(2009-11-24,nabalk)
         DBMS_SQL.Parse(db_cur_, stmt_db_, DBMS_SQL.native);
         LOOP
            DBMS_SQL.bind_variable(client_cur_, 'count', count_, 2000);
            DBMS_SQL.bind_variable(client_cur_, 'client_value', client_value_, 2000);
            BEGIN
               dummy_ := DBMS_SQL.Execute(client_cur_);
            EXCEPTION
               WHEN OTHERS THEN
                  RAISE no_iid_;
            END;
            --
            DBMS_SQL.variable_value(client_cur_, 'client_value', client_value_);
            --
            DBMS_SQL.bind_variable(db_cur_, 'count', count_, 2000);
            DBMS_SQL.bind_variable(db_cur_, 'db_value', db_value_, 2000);
            dummy_ := DBMS_SQL.Execute(db_cur_);
            DBMS_SQL.variable_value(db_cur_, 'db_value', db_value_);
            -- Keep track of maxlength
            --
            EXIT WHEN db_value_ IS NULL;
            enum_rec_.db_val(count_) := db_value_;
            enum_rec_.client_val(count_) := client_value_;
            count_ := count_ + 1;
            db_value_ := NULL;
            client_value_ := NULL;
         END LOOP;
         count_ := count_ - 1;
         db_client_values_ := lookup_ref_ || msg_sep_ || msg_sep_ ;
         db_client_values_ := db_client_values_ || db_hdr_|| ' <==> ' ||client_hdr_|| ' :' || msg_sep_|| msg_sep_;
         --
         db_values_ := lookup_ref_ || msg_sep_ || msg_sep_ || db_hdr_||' :' || msg_sep_|| msg_sep_;
         client_values_ := lookup_ref_ || msg_sep_ || msg_sep_ ||client_hdr_||' :' || msg_sep_|| msg_sep_;
         FOR i IN 0..count_ LOOP
            db_client_values_ := db_client_values_ || enum_rec_.db_val(i)|| ' <==> ' ||enum_rec_.client_val(i) || msg_sep_;
            db_values_ := db_values_ || enum_rec_.db_val(i) || msg_sep_;
            client_values_ := client_values_ || enum_rec_.client_val(i) || msg_sep_;
         END LOOP;
         info_ := Language_SYS.Translate_Constant( lu_name_, ' VALFOUND : DB/Client values found', Fnd_Session_API.Get_Language);
         DBMS_SQL.Close_Cursor(client_cur_);
         DBMS_SQL.Close_Cursor(db_cur_);
      END IF;
      trace_sys.message(info_);
   EXCEPTION
      WHEN no_iid_ THEN
         IF ( DBMS_SQL.Is_Open(client_cur_) ) THEN
            DBMS_SQL.Close_Cursor(client_cur_);
         END IF;
         IF ( DBMS_SQL.Is_Open(db_cur_) ) THEN
            DBMS_SQL.Close_Cursor(db_cur_);
         END IF;
         info_ := Language_SYS.Translate_Constant( lu_name_, ' NOVAL : No DB/Client values for :P1', Fnd_Session_API.Get_Language, iid_lu_);
         trace_sys.message(info_);
      WHEN OTHERS THEN
         IF ( DBMS_SQL.Is_Open(client_cur_) ) THEN
            DBMS_SQL.Close_Cursor(client_cur_);
         END IF;
         IF ( DBMS_SQL.Is_Open(db_cur_) ) THEN
            DBMS_SQL.Close_Cursor(db_cur_);
         END IF;
         trace_sys.message(SQLERRM);
         info_ := SQLERRM;
   
      END C_Enum_Db_Client_Values;
      
      
FUNCTION C_Get_Column_Desc(
   view_name_   IN VARCHAR2,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
      description_ VARCHAR2(100);
      prompt_desc_ VARCHAR2(100);
      --
      CURSOR get_column_prompt IS
      SELECT Dictionary_SYS.Comment_Value_('PROMPT',comments)
      FROM user_col_comments
      WHERE table_name = view_name_
      AND column_name = column_name_;
   BEGIN
      description_ :=  nvl(Language_SYS.Translate_Item_Prompt_(view_name_||'.'||column_name_,column_name_,1),column_name_);
      -- Get prompt on comments if no translation available
      IF ( description_ = column_name_ ) THEN
         OPEN  get_column_prompt;
         FETCH get_column_prompt INTO prompt_desc_;
            IF ( prompt_desc_ IS NOT NULL ) THEN
               description_ := prompt_desc_;
            END IF;
         CLOSE get_column_prompt;
      END IF;
      RETURN description_;
   EXCEPTION
      WHEN OTHERS THEN
         RETURN column_name_;
   END C_Get_Column_Desc;


-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------
