-----------------------------------------------------------------------------
--
--  Logical unit: MdmSourceMap
--  Component:    MDMGT
--
--  Template:     3.0
--  Built by:     IFS Developer Studio 10.82.731.20170505
--
--  NOTE! Do not edit!! This file is completely generated and will be
--        overwritten next time the corresponding model is saved.
-----------------------------------------------------------------------------

layer Base;

-------------------- PUBLIC DECLARATIONS ------------------------------------

--TYPE Primary_Key_Rec IS RECORD
--  (template_id                    MDM_SOURCE_MAP_TAB.template_id%TYPE,
--   revision                       MDM_SOURCE_MAP_TAB.revision%TYPE,
--   column_name                    MDM_SOURCE_MAP_TAB.column_name%TYPE);

TYPE Public_Rec IS RECORD
  (template_id                    MDM_SOURCE_MAP_TAB.template_id%TYPE,
   revision                       MDM_SOURCE_MAP_TAB.revision%TYPE,
   column_name                    MDM_SOURCE_MAP_TAB.column_name%TYPE,
   "rowid"                        rowid,
   rowversion                     MDM_SOURCE_MAP_TAB.rowversion%TYPE,
   rowkey                         MDM_SOURCE_MAP_TAB.rowkey%TYPE,
   description                    MDM_SOURCE_MAP_TAB.description%TYPE,
   data_type                      MDM_SOURCE_MAP_TAB.data_type%TYPE,
   length                         MDM_SOURCE_MAP_TAB.length%TYPE,
   default_value                  MDM_SOURCE_MAP_TAB.default_value%TYPE,
   flags                          MDM_SOURCE_MAP_TAB.flags%TYPE,
   note_text                      MDM_SOURCE_MAP_TAB.note_text%TYPE,
   db_client_values               MDM_SOURCE_MAP_TAB.db_client_values%TYPE,
   mandatory                      MDM_SOURCE_MAP_TAB.mandatory%TYPE);

-------------------- PRIVATE DECLARATIONS -----------------------------------

TYPE Indicator_Rec IS RECORD
  (template_id                    BOOLEAN := FALSE,
   revision                       BOOLEAN := FALSE,
   column_name                    BOOLEAN := FALSE,
   description                    BOOLEAN := FALSE,
   data_type                      BOOLEAN := FALSE,
   length                         BOOLEAN := FALSE,
   default_value                  BOOLEAN := FALSE,
   flags                          BOOLEAN := FALSE,
   note_text                      BOOLEAN := FALSE,
   db_client_values               BOOLEAN := FALSE,
   mandatory                      BOOLEAN := FALSE);

-------------------- BASE METHODS -------------------------------------------

-- Raise_Too_Many_Rows___
--    Raises error for: More then one row found for a single key.
PROCEDURE Raise_Too_Many_Rows___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2,
   methodname_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Too_Many_Rows(Mdm_Source_Map_API.lu_name_, NULL, methodname_);
END Raise_Too_Many_Rows___;


-- Raise_Record_Not_Exist___
--    Raises error for: No data found for given key.
PROCEDURE Raise_Record_Not_Exist___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Record_Not_Exist(Mdm_Source_Map_API.lu_name_);
END Raise_Record_Not_Exist___;


-- Raise_Record_Exist___
--    Raises error for: Data with given key value already exist.
PROCEDURE Raise_Record_Exist___ (
   rec_ mdm_source_map_tab%ROWTYPE )
IS
BEGIN
   Error_SYS.Record_Exist(Mdm_Source_Map_API.lu_name_);
END Raise_Record_Exist___;


-- Raise_Item_Format___
--    Raises error for: Data value format is incorrect.
PROCEDURE Raise_Item_Format___ (
   name_ IN VARCHAR2,
   value_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Item_Format(Mdm_Source_Map_API.lu_name_, name_, value_);
END Raise_Item_Format___;

-- Raise_Record_Modified___
--    Raises error for: The database row is newer then the current.
PROCEDURE Raise_Record_Modified___ (
   rec_ mdm_source_map_tab%ROWTYPE )
IS
BEGIN
   Error_SYS.Record_Modified(Mdm_Source_Map_API.lu_name_);
END Raise_Record_Modified___;


-- Raise_Record_Locked___
--    Raises error for: The database row is already locked.
PROCEDURE Raise_Record_Locked___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Record_Locked(Mdm_Source_Map_API.lu_name_);
END Raise_Record_Locked___;


-- Raise_Record_Removed___
--    Raises error for: The database row is no longer present.
PROCEDURE Raise_Record_Removed___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Record_Removed(Mdm_Source_Map_API.lu_name_);
END Raise_Record_Removed___;


-- Lock_By_Id___
--    Locks a database row based on the objid and objversion.
FUNCTION Lock_By_Id___ (
   objid_      IN VARCHAR2,
   objversion_ IN VARCHAR2 ) RETURN mdm_source_map_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_source_map_tab%ROWTYPE;
   dummy_      NUMBER;
BEGIN
   SELECT *
      INTO  rec_
      FROM  mdm_source_map_tab
      WHERE rowid = objid_
      AND    to_char(rowversion,'YYYYMMDDHH24MISS') = objversion_
      FOR UPDATE NOWAIT;
   RETURN rec_;
EXCEPTION
   WHEN row_locked THEN
      Error_SYS.Record_Locked(lu_name_);
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(NULL, NULL, NULL, 'Lock_By_Id___');
   WHEN no_data_found THEN
      BEGIN
         SELECT 1
            INTO  dummy_
            FROM  mdm_source_map_tab
            WHERE rowid = objid_;
         Raise_Record_Modified___(rec_);
      EXCEPTION
         WHEN no_data_found THEN
            Error_SYS.Record_Removed(lu_name_);
         WHEN too_many_rows THEN
            Raise_Too_Many_Rows___(NULL, NULL, NULL, 'Lock_By_Id___');
      END;
END Lock_By_Id___;


-- Lock_By_Keys___
--    Locks a database row based on the primary key values.
--    Waits until record released if locked by another session.
FUNCTION Lock_By_Keys___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2) RETURN mdm_source_map_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_source_map_tab%ROWTYPE;
BEGIN
   BEGIN
      SELECT *
         INTO  rec_
         FROM  mdm_source_map_tab
         WHERE template_id = template_id_
         AND   revision = revision_
         AND   column_name = column_name_
         FOR UPDATE;
      RETURN rec_;
   EXCEPTION
      WHEN no_data_found THEN
         Raise_Record_Removed___(template_id_, revision_, column_name_);
      WHEN too_many_rows THEN
         Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Lock_By_Keys___');
   END;
END Lock_By_Keys___;


-- Lock_By_Keys_Nowait___
--    Locks a database row based on the primary key values.
--    Raises exception if row already locked.
FUNCTION Lock_By_Keys_Nowait___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2) RETURN mdm_source_map_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_source_map_tab%ROWTYPE;
   dummy_      NUMBER;
BEGIN
   BEGIN
      SELECT *
         INTO  rec_
         FROM  mdm_source_map_tab
         WHERE template_id = template_id_
         AND   revision = revision_
         AND   column_name = column_name_
         FOR UPDATE NOWAIT;
      RETURN rec_;
   EXCEPTION
      WHEN row_locked THEN
         Error_SYS.Record_Locked(lu_name_);
      WHEN too_many_rows THEN
         Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Lock_By_Keys___');
      WHEN no_data_found THEN
         BEGIN
            SELECT 1
               INTO  dummy_
               FROM  mdm_source_map_tab
               WHERE template_id = template_id_
               AND   revision = revision_
               AND   column_name = column_name_;
            Raise_Record_Modified___(rec_);
         EXCEPTION
            WHEN no_data_found THEN
               Raise_Record_Removed___(template_id_, revision_, column_name_);
            WHEN too_many_rows THEN
               Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Lock_By_Keys___');
         END;
   END;
END Lock_By_Keys_Nowait___;


-- Get_Object_By_Id___
--    Fetched a database row based on given the objid.
FUNCTION Get_Object_By_Id___ (
   objid_ IN VARCHAR2 ) RETURN mdm_source_map_tab%ROWTYPE
IS
   lu_rec_ mdm_source_map_tab%ROWTYPE;
BEGIN
   SELECT *
      INTO  lu_rec_
      FROM  mdm_source_map_tab
      WHERE rowid = objid_;
   RETURN lu_rec_;
EXCEPTION
   WHEN no_data_found THEN
      Error_SYS.Record_Removed(lu_name_);
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(NULL, NULL, NULL, 'Get_Object_By_Id___');
END Get_Object_By_Id___;


-- Get_Object_By_Keys___
--    Fetched a database row based on given the primary key values.
@UncheckedAccess
FUNCTION Get_Object_By_Keys___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN mdm_source_map_tab%ROWTYPE
IS
   lu_rec_ mdm_source_map_tab%ROWTYPE;
BEGIN
   SELECT *
      INTO  lu_rec_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN lu_rec_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN lu_rec_;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Object_By_Keys___');
END Get_Object_By_Keys___;


-- Check_Exist___
--    Checks if a database row is already stored based on the primary key values.
@UncheckedAccess
FUNCTION Check_Exist___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN BOOLEAN
IS
   dummy_ NUMBER;
BEGIN
   SELECT 1
      INTO  dummy_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN TRUE;
EXCEPTION
   WHEN no_data_found THEN
      RETURN FALSE;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Check_Exist___');
END Check_Exist___;


-- Get_Version_By_Id___
--    Fetched the objversion for a database row based on the objid.
PROCEDURE Get_Version_By_Id___ (
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2 )
IS
BEGIN
   SELECT to_char(rowversion,'YYYYMMDDHH24MISS')
      INTO  objversion_
      FROM  mdm_source_map_tab
      WHERE rowid = objid_;
EXCEPTION
   WHEN no_data_found THEN
      objversion_ := NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(NULL, NULL, NULL, 'Get_Version_By_Id___');
END Get_Version_By_Id___;


-- Get_Version_By_Keys___
--    Fetched the objversion for a database row based on the primary key.
PROCEDURE Get_Id_Version_By_Keys___ (
   objid_      IN OUT VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 )
IS
BEGIN
   SELECT rowid, to_char(rowversion,'YYYYMMDDHH24MISS')
      INTO  objid_, objversion_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
EXCEPTION
   WHEN no_data_found THEN
      objid_      := NULL;
      objversion_ := NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Id_Version_By_Keys___');
END Get_Id_Version_By_Keys___;


-- Get_Key_By_Rowkey
--   Returns a table record with only keys (other attributes are NULL) based on a rowkey.
@UncheckedAccess
FUNCTION Get_Key_By_Rowkey (
   rowkey_ IN VARCHAR2 ) RETURN mdm_source_map_tab%ROWTYPE
IS
   rec_ mdm_source_map_tab%ROWTYPE;
BEGIN
   SELECT template_id, revision, column_name
      INTO  rec_.template_id, rec_.revision, rec_.column_name
      FROM  mdm_source_map_tab
      WHERE rowkey = rowkey_;
   RETURN rec_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN rec_;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(rec_.template_id, rec_.revision, rec_.column_name, 'Get_Key_By_Rowkey');
END Get_Key_By_Rowkey;


-- Unpack___
--   Reads an attribute string and unpacks its contents into a record.
PROCEDURE Unpack___ (
   newrec_   IN OUT mdm_source_map_tab%ROWTYPE,
   indrec_   IN OUT Indicator_Rec,
   attr_     IN OUT VARCHAR2 )
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
      WHEN ('COLUMN_NAME') THEN
         newrec_.column_name := value_;
         indrec_.column_name := TRUE;
      WHEN ('DESCRIPTION') THEN
         newrec_.description := value_;
         indrec_.description := TRUE;
      WHEN ('DATA_TYPE') THEN
         newrec_.data_type := value_;
         indrec_.data_type := TRUE;
      WHEN ('LENGTH') THEN
         newrec_.length := Client_SYS.Attr_Value_To_Number(value_);
         indrec_.length := TRUE;
      WHEN ('DEFAULT_VALUE') THEN
         newrec_.default_value := value_;
         indrec_.default_value := TRUE;
      WHEN ('FLAGS') THEN
         newrec_.flags := value_;
         indrec_.flags := TRUE;
      WHEN ('NOTE_TEXT') THEN
         newrec_.note_text := value_;
         indrec_.note_text := TRUE;
      WHEN ('DB_CLIENT_VALUES') THEN
         newrec_.db_client_values := value_;
         indrec_.db_client_values := TRUE;
      WHEN ('MANDATORY') THEN
         IF (value_ IS NULL OR value_ = 'TRUE' OR value_ = 'FALSE') THEN
            newrec_.mandatory := value_;
         ELSE
            RAISE value_error;
         END IF;
         indrec_.mandatory := TRUE;
      ELSE
         Client_SYS.Add_To_Attr(name_, value_, msg_);
      END CASE;
   END LOOP;
   attr_ := msg_;
EXCEPTION
   WHEN value_error THEN
      Raise_Item_Format___(name_, value_);
END Unpack___;


-- Pack___
--   Reads a record and packs its contents into an attribute string.
--   This is intended to be the reverse of Unpack___
FUNCTION Pack___ (
   rec_ IN mdm_source_map_tab%ROWTYPE ) RETURN VARCHAR2
IS
   attr_ VARCHAR2(32000);
BEGIN
   Client_SYS.Clear_Attr(attr_);
   IF (rec_.template_id IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('TEMPLATE_ID', rec_.template_id, attr_);
   END IF;
   IF (rec_.revision IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('REVISION', rec_.revision, attr_);
   END IF;
   IF (rec_.column_name IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('COLUMN_NAME', rec_.column_name, attr_);
   END IF;
   IF (rec_.description IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   END IF;
   IF (rec_.data_type IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('DATA_TYPE', rec_.data_type, attr_);
   END IF;
   IF (rec_.length IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('LENGTH', rec_.length, attr_);
   END IF;
   IF (rec_.default_value IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('DEFAULT_VALUE', rec_.default_value, attr_);
   END IF;
   IF (rec_.flags IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('FLAGS', rec_.flags, attr_);
   END IF;
   IF (rec_.note_text IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('NOTE_TEXT', rec_.note_text, attr_);
   END IF;
   IF (rec_.db_client_values IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('DB_CLIENT_VALUES', rec_.db_client_values, attr_);
   END IF;
   IF (rec_.mandatory IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('MANDATORY', rec_.mandatory, attr_);
   END IF;
   RETURN attr_;
END Pack___;


FUNCTION Pack___ (
   rec_ IN mdm_source_map_tab%ROWTYPE,
   indrec_ IN Indicator_Rec ) RETURN VARCHAR2
IS
   attr_ VARCHAR2(32000);
BEGIN
   Client_SYS.Clear_Attr(attr_);
   IF (indrec_.template_id) THEN
      Client_SYS.Add_To_Attr('TEMPLATE_ID', rec_.template_id, attr_);
   END IF;
   IF (indrec_.revision) THEN
      Client_SYS.Add_To_Attr('REVISION', rec_.revision, attr_);
   END IF;
   IF (indrec_.column_name) THEN
      Client_SYS.Add_To_Attr('COLUMN_NAME', rec_.column_name, attr_);
   END IF;
   IF (indrec_.description) THEN
      Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   END IF;
   IF (indrec_.data_type) THEN
      Client_SYS.Add_To_Attr('DATA_TYPE', rec_.data_type, attr_);
   END IF;
   IF (indrec_.length) THEN
      Client_SYS.Add_To_Attr('LENGTH', rec_.length, attr_);
   END IF;
   IF (indrec_.default_value) THEN
      Client_SYS.Add_To_Attr('DEFAULT_VALUE', rec_.default_value, attr_);
   END IF;
   IF (indrec_.flags) THEN
      Client_SYS.Add_To_Attr('FLAGS', rec_.flags, attr_);
   END IF;
   IF (indrec_.note_text) THEN
      Client_SYS.Add_To_Attr('NOTE_TEXT', rec_.note_text, attr_);
   END IF;
   IF (indrec_.db_client_values) THEN
      Client_SYS.Add_To_Attr('DB_CLIENT_VALUES', rec_.db_client_values, attr_);
   END IF;
   IF (indrec_.mandatory) THEN
      Client_SYS.Add_To_Attr('MANDATORY', rec_.mandatory, attr_);
   END IF;
   RETURN attr_;
END Pack___;



-- Pack_Table___
--   Reads a record and packs its contents into an attribute string.
--   Similar to Pack___ but just uses table column names and DB values
FUNCTION Pack_Table___ (
   rec_ IN mdm_source_map_tab%ROWTYPE ) RETURN VARCHAR2
IS
   attr_ VARCHAR2(32000);
BEGIN
   Client_SYS.Clear_Attr(attr_);
   Client_SYS.Add_To_Attr('TEMPLATE_ID', rec_.template_id, attr_);
   Client_SYS.Add_To_Attr('REVISION', rec_.revision, attr_);
   Client_SYS.Add_To_Attr('COLUMN_NAME', rec_.column_name, attr_);
   Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   Client_SYS.Add_To_Attr('DATA_TYPE', rec_.data_type, attr_);
   Client_SYS.Add_To_Attr('LENGTH', rec_.length, attr_);
   Client_SYS.Add_To_Attr('DEFAULT_VALUE', rec_.default_value, attr_);
   Client_SYS.Add_To_Attr('FLAGS', rec_.flags, attr_);
   Client_SYS.Add_To_Attr('NOTE_TEXT', rec_.note_text, attr_);
   Client_SYS.Add_To_Attr('DB_CLIENT_VALUES', rec_.db_client_values, attr_);
   Client_SYS.Add_To_Attr('MANDATORY', rec_.mandatory, attr_);
   Client_SYS.Add_To_Attr('ROWKEY', rec_.rowkey, attr_);
   RETURN attr_;
END Pack_Table___;


-- Reset_Indicator_Rec___
--   Resets all elements of given Indicator_Rec to FALSE.
PROCEDURE Reset_Indicator_Rec___ (
   indrec_ IN OUT Indicator_Rec )
IS
   empty_indrec_ Indicator_Rec;
BEGIN
   indrec_ := empty_indrec_;
END Reset_Indicator_Rec___;


-- Get_Indicator_Rec___
--   Returns an Indicator_Rec that reflects the content of a table record.
FUNCTION Get_Indicator_Rec___ (
   rec_ IN mdm_source_map_tab%ROWTYPE ) RETURN Indicator_Rec
IS
   indrec_ Indicator_Rec;
BEGIN
   indrec_.template_id := rec_.template_id IS NOT NULL;
   indrec_.revision := rec_.revision IS NOT NULL;
   indrec_.column_name := rec_.column_name IS NOT NULL;
   indrec_.description := rec_.description IS NOT NULL;
   indrec_.data_type := rec_.data_type IS NOT NULL;
   indrec_.length := rec_.length IS NOT NULL;
   indrec_.default_value := rec_.default_value IS NOT NULL;
   indrec_.flags := rec_.flags IS NOT NULL;
   indrec_.note_text := rec_.note_text IS NOT NULL;
   indrec_.db_client_values := rec_.db_client_values IS NOT NULL;
   indrec_.mandatory := rec_.mandatory IS NOT NULL;
   RETURN indrec_;
END Get_Indicator_Rec___;


-- Get_Indicator_Rec___
--   Returns an Indicator_Rec that reflects the difference between two table records.
FUNCTION Get_Indicator_Rec___ (
   oldrec_ IN mdm_source_map_tab%ROWTYPE,
   newrec_ IN mdm_source_map_tab%ROWTYPE ) RETURN Indicator_Rec
IS
   indrec_ Indicator_Rec;
BEGIN
   indrec_.template_id := Validate_SYS.Is_Changed(oldrec_.template_id, newrec_.template_id);
   indrec_.revision := Validate_SYS.Is_Changed(oldrec_.revision, newrec_.revision);
   indrec_.column_name := Validate_SYS.Is_Changed(oldrec_.column_name, newrec_.column_name);
   indrec_.description := Validate_SYS.Is_Changed(oldrec_.description, newrec_.description);
   indrec_.data_type := Validate_SYS.Is_Changed(oldrec_.data_type, newrec_.data_type);
   indrec_.length := Validate_SYS.Is_Changed(oldrec_.length, newrec_.length);
   indrec_.default_value := Validate_SYS.Is_Changed(oldrec_.default_value, newrec_.default_value);
   indrec_.flags := Validate_SYS.Is_Changed(oldrec_.flags, newrec_.flags);
   indrec_.note_text := Validate_SYS.Is_Changed(oldrec_.note_text, newrec_.note_text);
   indrec_.db_client_values := Validate_SYS.Is_Changed(oldrec_.db_client_values, newrec_.db_client_values);
   indrec_.mandatory := Validate_SYS.Is_Changed(oldrec_.mandatory, newrec_.mandatory);
   RETURN indrec_;
END Get_Indicator_Rec___;


-- Check_Common___
--   Perform validations on a record, that should be done for both insert and delete.
PROCEDURE Check_Common___ (
   oldrec_ IN     mdm_source_map_tab%ROWTYPE,
   newrec_ IN OUT mdm_source_map_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
BEGIN
   IF (newrec_.template_id IS NOT NULL AND newrec_.revision IS NOT NULL)
   AND (indrec_.template_id OR indrec_.revision)
   AND (Validate_SYS.Is_Changed(oldrec_.template_id, newrec_.template_id)
     OR Validate_SYS.Is_Changed(oldrec_.revision, newrec_.revision)) THEN
      Mdm_Basic_Data_Header_API.Exist(newrec_.template_id, newrec_.revision);
   END IF;
   Error_SYS.Check_Not_Null(lu_name_, 'TEMPLATE_ID', newrec_.template_id);
   Error_SYS.Check_Not_Null(lu_name_, 'REVISION', newrec_.revision);
   Error_SYS.Check_Not_Null(lu_name_, 'COLUMN_NAME', newrec_.column_name);
   Error_SYS.Check_Not_Null(lu_name_, 'DATA_TYPE', newrec_.data_type);
   Error_SYS.Check_Not_Null(lu_name_, 'LENGTH', newrec_.length);
END Check_Common___;


-- Prepare_Insert___
--   Set client default values into an attribute string.
PROCEDURE Prepare_Insert___ (
   attr_ IN OUT VARCHAR2 )
IS
BEGIN
   Client_SYS.Clear_Attr(attr_);
END Prepare_Insert___;


-- Check_Insert___
--   Perform validations on a new record before it is insert.
PROCEDURE Check_Insert___ (
   newrec_ IN OUT mdm_source_map_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
   oldrec_ mdm_source_map_tab%ROWTYPE;
BEGIN
   Validate_SYS.Item_Insert(lu_name_, 'MANDATORY', indrec_.mandatory);
   Check_Common___(oldrec_, newrec_, indrec_, attr_);
END Check_Insert___;


-- Insert___
--   Insert a record to the database.
PROCEDURE Insert___ (
   objid_      OUT    VARCHAR2,
   objversion_ OUT    VARCHAR2,
   newrec_     IN OUT mdm_source_map_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2 )
IS
BEGIN
   newrec_.rowversion := sysdate;
   newrec_.rowkey := sys_guid();
   Client_SYS.Add_To_Attr('OBJKEY', newrec_.rowkey, attr_);
   INSERT
      INTO mdm_source_map_tab
      VALUES newrec_
      RETURNING rowid INTO objid_;
   objversion_ := to_char(newrec_.rowversion,'YYYYMMDDHH24MISS');
EXCEPTION
   WHEN dup_val_on_index THEN
      DECLARE
         constraint_ VARCHAR2(4000) := Utility_SYS.Between_Str(Utility_SYS.Between_Str(sqlerrm, '(', ')'), '.', ')', 'FALSE');
      BEGIN
         IF (constraint_ = 'MDM_SOURCE_MAP_RK') THEN
            Error_SYS.Rowkey_Exist(lu_name_, newrec_.rowkey);
         ELSE
            Raise_Record_Exist___(newrec_);
         END IF;
      END;
END Insert___;


-- Prepare_New___
--    Set default values for a table record.
PROCEDURE Prepare_New___ (
   newrec_ IN OUT mdm_source_map_tab%ROWTYPE )
IS
   attr_    VARCHAR2(32000);
   indrec_  Indicator_Rec;
BEGIN
   Prepare_Insert___(attr_);
   Unpack___(newrec_, indrec_, attr_);
END Prepare_New___;


-- New___
--    Checks and creates a new record.
PROCEDURE New___ (
   newrec_ IN OUT mdm_source_map_tab%ROWTYPE )
IS
   objid_         VARCHAR2(20);
   objversion_    VARCHAR2(100);
   attr_          VARCHAR2(32000);
   indrec_        Indicator_Rec;
   emptyrec_      mdm_source_map_tab%ROWTYPE;
BEGIN
   indrec_ := Get_Indicator_Rec___(emptyrec_, newrec_);
   Check_Insert___(newrec_, indrec_, attr_);
   Insert___(objid_, objversion_, newrec_, attr_);
END New___;


-- Check_Update___
--   Perform validations on a new record before it is updated.
PROCEDURE Check_Update___ (
   oldrec_ IN     mdm_source_map_tab%ROWTYPE,
   newrec_ IN OUT mdm_source_map_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
BEGIN
   Validate_SYS.Item_Update(lu_name_, 'TEMPLATE_ID', indrec_.template_id);
   Validate_SYS.Item_Update(lu_name_, 'REVISION', indrec_.revision);
   Validate_SYS.Item_Update(lu_name_, 'COLUMN_NAME', indrec_.column_name);
   Validate_SYS.Item_Update(lu_name_, 'FLAGS', indrec_.flags);
   Validate_SYS.Item_Update(lu_name_, 'DB_CLIENT_VALUES', indrec_.db_client_values);
   Check_Common___(oldrec_, newrec_, indrec_, attr_);
END Check_Update___;


-- Update___
--   Update a record in database with new data.
PROCEDURE Update___ (
   objid_      IN     VARCHAR2,
   oldrec_     IN     mdm_source_map_tab%ROWTYPE,
   newrec_     IN OUT mdm_source_map_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   by_keys_    IN     BOOLEAN DEFAULT FALSE )
IS
BEGIN
   newrec_.rowversion := sysdate;
   IF by_keys_ THEN
      UPDATE mdm_source_map_tab
         SET ROW = newrec_
         WHERE template_id = newrec_.template_id
         AND   revision = newrec_.revision
         AND   column_name = newrec_.column_name;
   ELSE
      UPDATE mdm_source_map_tab
         SET ROW = newrec_
         WHERE rowid = objid_;
   END IF;
   objversion_ := to_char(newrec_.rowversion,'YYYYMMDDHH24MISS');
EXCEPTION
   WHEN dup_val_on_index THEN
      DECLARE
         constraint_ VARCHAR2(4000) := Utility_SYS.Between_Str(Utility_SYS.Between_Str(sqlerrm, '(', ')'), '.', ')', 'FALSE');
      BEGIN
         IF (constraint_ = 'MDM_SOURCE_MAP_RK') THEN
            Error_SYS.Rowkey_Exist(Mdm_Source_Map_API.lu_name_, newrec_.rowkey);
         ELSE
            Raise_Record_Exist___(newrec_);
         END IF;
      END;
END Update___;


-- Modify___
--    Modifies an existing instance of the logical unit.
PROCEDURE Modify___ (
   newrec_         IN OUT mdm_source_map_tab%ROWTYPE,
   lock_mode_wait_ IN     BOOLEAN DEFAULT TRUE )
IS
   objid_      VARCHAR2(20);
   objversion_ VARCHAR2(100);
   attr_       VARCHAR2(32000);
   indrec_     Indicator_rec;
   oldrec_     mdm_source_map_tab%ROWTYPE;
BEGIN
   IF (lock_mode_wait_) THEN
      oldrec_ := Lock_By_Keys___(newrec_.template_id, newrec_.revision, newrec_.column_name);
   ELSE
      oldrec_ := Lock_By_Keys_Nowait___(newrec_.template_id, newrec_.revision, newrec_.column_name);
   END IF;
   indrec_ := Get_Indicator_Rec___(oldrec_, newrec_);
   Check_Update___(oldrec_, newrec_, indrec_, attr_);
   Update___(objid_, oldrec_, newrec_, attr_, objversion_, TRUE);
END Modify___;


-- Check_Delete___
--   Perform validations on a new record before it is deleted.
PROCEDURE Check_Delete___ (
   remrec_ IN mdm_source_map_tab%ROWTYPE )
IS
   key_ VARCHAR2(2000);
BEGIN
   key_ := remrec_.template_id||'^'||remrec_.revision||'^'||remrec_.column_name||'^';
   Reference_SYS.Check_Restricted_Delete(lu_name_, key_);
END Check_Delete___;


-- Delete___
--   Delete a record from the database.
PROCEDURE Delete___ (
   objid_  IN VARCHAR2,
   remrec_ IN mdm_source_map_tab%ROWTYPE )
IS
   key_ VARCHAR2(2000);
BEGIN
   key_ := remrec_.template_id||'^'||remrec_.revision||'^'||remrec_.column_name||'^';
   Reference_SYS.Do_Cascade_Delete(lu_name_, key_);
   IF (objid_ IS NOT NULL) THEN
      DELETE
         FROM  mdm_source_map_tab
         WHERE rowid = objid_;
   ELSE
      DELETE
         FROM  mdm_source_map_tab
         WHERE template_id = remrec_.template_id
         AND   revision = remrec_.revision
         AND   column_name = remrec_.column_name;
   END IF;
END Delete___;


-- Delete___
--   Delete a record from the database.
@Deprecated
PROCEDURE Delete___ (
   remrec_ IN mdm_source_map_tab%ROWTYPE )
IS
BEGIN
   Delete___(NULL, remrec_);
END Delete___;


-- Remove___
--    Removes an existing instance of the logical unit.
PROCEDURE Remove___ (
   remrec_         IN OUT mdm_source_map_tab%ROWTYPE,
   lock_mode_wait_ IN     BOOLEAN DEFAULT TRUE )
IS
   oldrec_     mdm_source_map_tab%ROWTYPE;
BEGIN
   IF (lock_mode_wait_) THEN
      oldrec_ := Lock_By_Keys___(remrec_.template_id, remrec_.revision, remrec_.column_name);
   ELSE
      oldrec_ := Lock_By_Keys_Nowait___(remrec_.template_id, remrec_.revision, remrec_.column_name);
   END IF;
   Check_Delete___(oldrec_);
   Delete___(NULL, oldrec_);
END Remove___;


-- Lock__
--    Client-support to lock a specific instance of the logical unit.
@UncheckedAccess
PROCEDURE Lock__ (
   info_       OUT VARCHAR2,
   objid_      IN  VARCHAR2,
   objversion_ IN  VARCHAR2 )
IS
   dummy_ mdm_source_map_tab%ROWTYPE;
BEGIN
   dummy_ := Lock_By_Id___(objid_, objversion_);
   info_ := Client_SYS.Get_All_Info;
END Lock__;


-- New__
--    Client-support interface to create LU instances.
--       action_ = 'PREPARE'
--          Default values and handle of information to client.
--          The default values are set in procedure Prepare_Insert___.
--       action_ = 'CHECK'
--          Check all attributes before creating new object and handle of
--          information to client. The attribute list is unpacked, checked
--          and prepared (defaults) in procedures Unpack___ and Check_Insert___.
--       action_ = 'DO'
--          Creation of new instances of the logical unit and handle of
--          information to client. The attribute list is unpacked, checked
--          and prepared (defaults) in procedures Unpack___ and Check_Insert___
--          before calling procedure Insert___.
PROCEDURE New__ (
   info_       OUT    VARCHAR2,
   objid_      OUT    VARCHAR2,
   objversion_ OUT    VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   newrec_   mdm_source_map_tab%ROWTYPE;
   indrec_   Indicator_Rec;
BEGIN
   IF (action_ = 'PREPARE') THEN
      Prepare_Insert___(attr_);
   ELSIF (action_ = 'CHECK') THEN
      Unpack___(newrec_, indrec_, attr_);
      Check_Insert___(newrec_, indrec_, attr_);
   ELSIF (action_ = 'DO') THEN
      Unpack___(newrec_, indrec_, attr_);
      Check_Insert___(newrec_, indrec_, attr_);
      Insert___(objid_, objversion_, newrec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END New__;


-- Modify__
--    Client-support interface to modify attributes for LU instances.
--       action_ = 'CHECK'
--          Check all attributes before modifying an existing object and
--          handle of information to client. The attribute list is unpacked,
--          checked and prepared(defaults) in procedures Unpack___ and Check_Update___.
--       action_ = 'DO'
--          Modification of an existing instance of the logical unit. The
--          procedure unpacks the attributes, checks all values before
--          procedure Update___ is called.
PROCEDURE Modify__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   oldrec_   mdm_source_map_tab%ROWTYPE;
   newrec_   mdm_source_map_tab%ROWTYPE;
   indrec_   Indicator_Rec;
BEGIN
   IF (action_ = 'CHECK') THEN
      oldrec_ := Get_Object_By_Id___(objid_);
      newrec_ := oldrec_;
      Unpack___(newrec_, indrec_, attr_);
      Check_Update___(oldrec_, newrec_, indrec_, attr_);
   ELSIF (action_ = 'DO') THEN
      oldrec_ := Lock_By_Id___(objid_, objversion_);
      newrec_ := oldrec_;
      Unpack___(newrec_, indrec_, attr_);
      Check_Update___(oldrec_, newrec_, indrec_, attr_);
      Update___(objid_, oldrec_, newrec_, attr_, objversion_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Modify__;


-- Remove__
--    Client-support interface to remove LU instances.
--       action_ = 'CHECK'
--          Check whether a specific LU-instance may be removed or not.
--          The procedure fetches the complete record by calling procedure
--          Get_Object_By_Id___. Then the check is made by calling procedure
--          Check_Delete___.
--       action_ = 'DO'
--          Remove an existing instance of the logical unit. The procedure
--          fetches the complete LU-record, checks for a delete and then
--          deletes the record by calling procedure Delete___.
PROCEDURE Remove__ (
   info_       OUT VARCHAR2,
   objid_      IN  VARCHAR2,
   objversion_ IN  VARCHAR2,
   action_     IN  VARCHAR2 )
IS
   remrec_ mdm_source_map_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      remrec_ := Get_Object_By_Id___(objid_);
      Check_Delete___(remrec_);
   ELSIF (action_ = 'DO') THEN
      remrec_ := Lock_By_Id___(objid_, objversion_);
      Check_Delete___(remrec_);
      Delete___(objid_, remrec_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Remove__;


-- Exist
--   Checks if given pointer (e.g. primary key) to an instance of this
--   logical unit exists. If not an exception will be raised.
@UncheckedAccess
PROCEDURE Exist (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 )
IS
BEGIN
   IF (NOT Check_Exist___(template_id_, revision_, column_name_)) THEN
      Raise_Record_Not_Exist___(template_id_, revision_, column_name_);
   END IF;
END Exist;


-- Exists
--   Same check as Exist, but returns a BOOLEAN value instead of exception.
@UncheckedAccess
FUNCTION Exists (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN BOOLEAN
IS
BEGIN
   RETURN Check_Exist___(template_id_, revision_, column_name_);
END Exists;


-- Get_Description
--   Fetches the Description attribute for a record.
@UncheckedAccess
FUNCTION Get_Description (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.description%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT description
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Description');
END Get_Description;


-- Get_Data_Type
--   Fetches the DataType attribute for a record.
@UncheckedAccess
FUNCTION Get_Data_Type (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.data_type%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT data_type
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Data_Type');
END Get_Data_Type;


-- Get_Length
--   Fetches the Length attribute for a record.
@UncheckedAccess
FUNCTION Get_Length (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN NUMBER
IS
   temp_ mdm_source_map_tab.length%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT length
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Length');
END Get_Length;


-- Get_Default_Value
--   Fetches the DefaultValue attribute for a record.
@UncheckedAccess
FUNCTION Get_Default_Value (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.default_value%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT default_value
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Default_Value');
END Get_Default_Value;


-- Get_Flags
--   Fetches the Flags attribute for a record.
@UncheckedAccess
FUNCTION Get_Flags (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.flags%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT flags
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Flags');
END Get_Flags;


-- Get_Note_Text
--   Fetches the NoteText attribute for a record.
@UncheckedAccess
FUNCTION Get_Note_Text (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.note_text%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT note_text
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Note_Text');
END Get_Note_Text;


-- Get_Db_Client_Values
--   Fetches the DbClientValues attribute for a record.
@UncheckedAccess
FUNCTION Get_Db_Client_Values (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.db_client_values%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT db_client_values
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Db_Client_Values');
END Get_Db_Client_Values;


-- Get_Mandatory
--   Fetches the Mandatory attribute for a record.
@UncheckedAccess
FUNCTION Get_Mandatory (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_source_map_tab.mandatory%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT mandatory
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Mandatory');
END Get_Mandatory;


-- Get
--   Fetches a record containing the public attributes.
@UncheckedAccess
FUNCTION Get (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN Public_Rec
IS
   temp_ Public_Rec;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT template_id, revision, column_name,
          rowid, rowversion, rowkey,
          description, 
          data_type, 
          length, 
          default_value, 
          flags, 
          note_text, 
          db_client_values, 
          mandatory
      INTO  temp_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get');
END Get;


-- Get_Objkey
--   Fetches the objkey attribute for a record.
@UncheckedAccess
FUNCTION Get_Objkey (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   column_name_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   rowkey_ mdm_source_map_tab.rowkey%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR column_name_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT rowkey
      INTO  rowkey_
      FROM  mdm_source_map_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   column_name = column_name_;
   RETURN rowkey_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, column_name_, 'Get_Objkey');
END Get_Objkey;

-------------------- FOUNDATION1 METHODS ------------------------------------


-- Init
--   Framework method that initializes this package.
@UncheckedAccess
PROCEDURE Init
IS
BEGIN
   NULL;
END Init;

