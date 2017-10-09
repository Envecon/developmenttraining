-----------------------------------------------------------------------------
--
--  Logical unit: MdmBasicData
--  Component:    MDMEXT
--
--  Template:     3.0
--  Built by:     IFS Developer Studio 9.802.3691.20170420
--
--  NOTE! Do not edit!! This file is completely generated and will be
--        overwritten next time the corresponding model is saved.
-----------------------------------------------------------------------------

layer Base;

-------------------- PUBLIC DECLARATIONS ------------------------------------

--TYPE Primary_Key_Rec IS RECORD
--  (template_id                    MDM_BASIC_DATA_TAB.template_id%TYPE);

TYPE Public_Rec IS RECORD
  (template_id                    MDM_BASIC_DATA_TAB.template_id%TYPE,
   "rowid"                        rowid,
   rowversion                     MDM_BASIC_DATA_TAB.rowversion%TYPE,
   rowkey                         MDM_BASIC_DATA_TAB.rowkey%TYPE,
   revision                       MDM_BASIC_DATA_TAB.revision%TYPE,
   description                    MDM_BASIC_DATA_TAB.description%TYPE,
   status                         MDM_BASIC_DATA_TAB.status%TYPE,
   created_by                     MDM_BASIC_DATA_TAB.created_by%TYPE,
   created_date                   MDM_BASIC_DATA_TAB.created_date%TYPE,
   profile_id                     MDM_BASIC_DATA_TAB.profile_id%TYPE,
   notes                          MDM_BASIC_DATA_TAB.notes%TYPE);

-------------------- PRIVATE DECLARATIONS -----------------------------------

TYPE Indicator_Rec IS RECORD
  (template_id                    BOOLEAN := FALSE,
   revision                       BOOLEAN := FALSE,
   description                    BOOLEAN := FALSE,
   status                         BOOLEAN := FALSE,
   created_by                     BOOLEAN := FALSE,
   created_date                   BOOLEAN := FALSE,
   profile_id                     BOOLEAN := FALSE,
   notes                          BOOLEAN := FALSE);

-------------------- BASE METHODS -------------------------------------------

-- Raise_Too_Many_Rows___
--    Raises error for: More then one row found for a single key.
PROCEDURE Raise_Too_Many_Rows___ (
   template_id_ IN VARCHAR2,
   methodname_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Too_Many_Rows(Mdm_Basic_Data_API.lu_name_, NULL, methodname_);
END Raise_Too_Many_Rows___;


-- Raise_Record_Not_Exist___
--    Raises error for: No data found for given key.
PROCEDURE Raise_Record_Not_Exist___ (
   template_id_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Record_Not_Exist(Mdm_Basic_Data_API.lu_name_);
END Raise_Record_Not_Exist___;


-- Raise_Record_Exist___
--    Raises error for: Data with given key value already exist.
PROCEDURE Raise_Record_Exist___ (
   rec_ mdm_basic_data_tab%ROWTYPE )
IS
BEGIN
   Error_SYS.Record_Exist(Mdm_Basic_Data_API.lu_name_);
END Raise_Record_Exist___;


-- Raise_Item_Format___
--    Raises error for: Data value format is incorrect.
PROCEDURE Raise_Item_Format___ (
   name_ IN VARCHAR2,
   value_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Item_Format(Mdm_Basic_Data_API.lu_name_, name_, value_);
END Raise_Item_Format___;

-- Raise_Record_Modified___
--    Raises error for: The database row is newer then the current.
PROCEDURE Raise_Record_Modified___ (
   rec_ mdm_basic_data_tab%ROWTYPE )
IS
BEGIN
   Error_SYS.Record_Modified(Mdm_Basic_Data_API.lu_name_);
END Raise_Record_Modified___;


-- Raise_Record_Locked___
--    Raises error for: The database row is already locked.
PROCEDURE Raise_Record_Locked___ (
   template_id_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Record_Locked(Mdm_Basic_Data_API.lu_name_);
END Raise_Record_Locked___;


-- Raise_Record_Removed___
--    Raises error for: The database row is no longer present.
PROCEDURE Raise_Record_Removed___ (
   template_id_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Record_Removed(Mdm_Basic_Data_API.lu_name_);
END Raise_Record_Removed___;


-- Lock_By_Id___
--    Locks a database row based on the objid and objversion.
FUNCTION Lock_By_Id___ (
   objid_      IN VARCHAR2,
   objversion_ IN VARCHAR2 ) RETURN mdm_basic_data_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_basic_data_tab%ROWTYPE;
   dummy_      NUMBER;
BEGIN
   SELECT *
      INTO  rec_
      FROM  mdm_basic_data_tab
      WHERE rowid = objid_
      AND    to_char(rowversion,'YYYYMMDDHH24MISS') = objversion_
      FOR UPDATE NOWAIT;
   RETURN rec_;
EXCEPTION
   WHEN row_locked THEN
      Error_SYS.Record_Locked(lu_name_);
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(NULL, 'Lock_By_Id___');
   WHEN no_data_found THEN
      BEGIN
         SELECT 1
            INTO  dummy_
            FROM  mdm_basic_data_tab
            WHERE rowid = objid_;
         Raise_Record_Modified___(rec_);
      EXCEPTION
         WHEN no_data_found THEN
            Error_SYS.Record_Removed(lu_name_);
         WHEN too_many_rows THEN
            Raise_Too_Many_Rows___(NULL, 'Lock_By_Id___');
      END;
END Lock_By_Id___;


-- Lock_By_Keys___
--    Locks a database row based on the primary key values.
--    Waits until record released if locked by another session.
FUNCTION Lock_By_Keys___ (
   template_id_ IN VARCHAR2) RETURN mdm_basic_data_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_basic_data_tab%ROWTYPE;
BEGIN
   BEGIN
      SELECT *
         INTO  rec_
         FROM  mdm_basic_data_tab
         WHERE template_id = template_id_
         FOR UPDATE;
      RETURN rec_;
   EXCEPTION
      WHEN no_data_found THEN
         Raise_Record_Removed___(template_id_);
      WHEN too_many_rows THEN
         Raise_Too_Many_Rows___(template_id_, 'Lock_By_Keys___');
   END;
END Lock_By_Keys___;


-- Lock_By_Keys_Nowait___
--    Locks a database row based on the primary key values.
--    Raises exception if row already locked.
FUNCTION Lock_By_Keys_Nowait___ (
   template_id_ IN VARCHAR2) RETURN mdm_basic_data_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_basic_data_tab%ROWTYPE;
   dummy_      NUMBER;
BEGIN
   BEGIN
      SELECT *
         INTO  rec_
         FROM  mdm_basic_data_tab
         WHERE template_id = template_id_
         FOR UPDATE NOWAIT;
      RETURN rec_;
   EXCEPTION
      WHEN row_locked THEN
         Error_SYS.Record_Locked(lu_name_);
      WHEN too_many_rows THEN
         Raise_Too_Many_Rows___(template_id_, 'Lock_By_Keys___');
      WHEN no_data_found THEN
         BEGIN
            SELECT 1
               INTO  dummy_
               FROM  mdm_basic_data_tab
               WHERE template_id = template_id_;
            Raise_Record_Modified___(rec_);
         EXCEPTION
            WHEN no_data_found THEN
               Raise_Record_Removed___(template_id_);
            WHEN too_many_rows THEN
               Raise_Too_Many_Rows___(template_id_, 'Lock_By_Keys___');
         END;
   END;
END Lock_By_Keys_Nowait___;


-- Get_Object_By_Id___
--    Fetched a database row based on given the objid.
FUNCTION Get_Object_By_Id___ (
   objid_ IN VARCHAR2 ) RETURN mdm_basic_data_tab%ROWTYPE
IS
   lu_rec_ mdm_basic_data_tab%ROWTYPE;
BEGIN
   SELECT *
      INTO  lu_rec_
      FROM  mdm_basic_data_tab
      WHERE rowid = objid_;
   RETURN lu_rec_;
EXCEPTION
   WHEN no_data_found THEN
      Error_SYS.Record_Removed(lu_name_);
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(NULL, 'Get_Object_By_Id___');
END Get_Object_By_Id___;


-- Get_Object_By_Keys___
--    Fetched a database row based on given the primary key values.
@UncheckedAccess
FUNCTION Get_Object_By_Keys___ (
   template_id_ IN VARCHAR2 ) RETURN mdm_basic_data_tab%ROWTYPE
IS
   lu_rec_ mdm_basic_data_tab%ROWTYPE;
BEGIN
   SELECT *
      INTO  lu_rec_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN lu_rec_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN lu_rec_;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Object_By_Keys___');
END Get_Object_By_Keys___;


-- Check_Exist___
--    Checks if a database row is already stored based on the primary key values.
@UncheckedAccess
FUNCTION Check_Exist___ (
   template_id_ IN VARCHAR2 ) RETURN BOOLEAN
IS
   dummy_ NUMBER;
BEGIN
   SELECT 1
      INTO  dummy_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN TRUE;
EXCEPTION
   WHEN no_data_found THEN
      RETURN FALSE;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Check_Exist___');
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
      FROM  mdm_basic_data_tab
      WHERE rowid = objid_;
EXCEPTION
   WHEN no_data_found THEN
      objversion_ := NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(NULL, 'Get_Version_By_Id___');
END Get_Version_By_Id___;


-- Get_Version_By_Keys___
--    Fetched the objversion for a database row based on the primary key.
PROCEDURE Get_Id_Version_By_Keys___ (
   objid_      IN OUT VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   template_id_ IN VARCHAR2 )
IS
BEGIN
   SELECT rowid, to_char(rowversion,'YYYYMMDDHH24MISS')
      INTO  objid_, objversion_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
EXCEPTION
   WHEN no_data_found THEN
      objid_      := NULL;
      objversion_ := NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Id_Version_By_Keys___');
END Get_Id_Version_By_Keys___;


-- Get_Key_By_Rowkey
--   Returns a table record with only keys (other attributes are NULL) based on a rowkey.
@UncheckedAccess
FUNCTION Get_Key_By_Rowkey (
   rowkey_ IN VARCHAR2 ) RETURN mdm_basic_data_tab%ROWTYPE
IS
   rec_ mdm_basic_data_tab%ROWTYPE;
BEGIN
   SELECT template_id
      INTO  rec_.template_id
      FROM  mdm_basic_data_tab
      WHERE rowkey = rowkey_;
   RETURN rec_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN rec_;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(rec_.template_id, 'Get_Key_By_Rowkey');
END Get_Key_By_Rowkey;


-- Unpack___
--   Reads an attribute string and unpacks its contents into a record.
PROCEDURE Unpack___ (
   newrec_   IN OUT mdm_basic_data_tab%ROWTYPE,
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
      WHEN ('DESCRIPTION') THEN
         newrec_.description := value_;
         indrec_.description := TRUE;
      WHEN ('STATUS') THEN
         newrec_.status := value_;
         indrec_.status := TRUE;
      WHEN ('CREATED_BY') THEN
         newrec_.created_by := value_;
         indrec_.created_by := TRUE;
      WHEN ('CREATED_DATE') THEN
         newrec_.created_date := Client_SYS.Attr_Value_To_Date(value_);
         indrec_.created_date := TRUE;
      WHEN ('PROFILE_ID') THEN
         newrec_.profile_id := value_;
         indrec_.profile_id := TRUE;
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
   rec_ IN mdm_basic_data_tab%ROWTYPE ) RETURN VARCHAR2
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
   IF (rec_.description IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   END IF;
   IF (rec_.status IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('STATUS', rec_.status, attr_);
   END IF;
   IF (rec_.created_by IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('CREATED_BY', rec_.created_by, attr_);
   END IF;
   IF (rec_.created_date IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('CREATED_DATE', rec_.created_date, attr_);
   END IF;
   IF (rec_.profile_id IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('PROFILE_ID', rec_.profile_id, attr_);
   END IF;
   RETURN attr_;
END Pack___;


FUNCTION Pack___ (
   rec_ IN mdm_basic_data_tab%ROWTYPE,
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
   IF (indrec_.description) THEN
      Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   END IF;
   IF (indrec_.status) THEN
      Client_SYS.Add_To_Attr('STATUS', rec_.status, attr_);
   END IF;
   IF (indrec_.created_by) THEN
      Client_SYS.Add_To_Attr('CREATED_BY', rec_.created_by, attr_);
   END IF;
   IF (indrec_.created_date) THEN
      Client_SYS.Add_To_Attr('CREATED_DATE', rec_.created_date, attr_);
   END IF;
   IF (indrec_.profile_id) THEN
      Client_SYS.Add_To_Attr('PROFILE_ID', rec_.profile_id, attr_);
   END IF;
   RETURN attr_;
END Pack___;



-- Pack_Table___
--   Reads a record and packs its contents into an attribute string.
--   Similar to Pack___ but just uses table column names and DB values
FUNCTION Pack_Table___ (
   rec_ IN mdm_basic_data_tab%ROWTYPE ) RETURN VARCHAR2
IS
   attr_ VARCHAR2(32000);
BEGIN
   Client_SYS.Clear_Attr(attr_);
   Client_SYS.Add_To_Attr('TEMPLATE_ID', rec_.template_id, attr_);
   Client_SYS.Add_To_Attr('REVISION', rec_.revision, attr_);
   Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   Client_SYS.Add_To_Attr('STATUS', rec_.status, attr_);
   Client_SYS.Add_To_Attr('CREATED_BY', rec_.created_by, attr_);
   Client_SYS.Add_To_Attr('CREATED_DATE', rec_.created_date, attr_);
   Client_SYS.Add_To_Attr('PROFILE_ID', rec_.profile_id, attr_);
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
   rec_ IN mdm_basic_data_tab%ROWTYPE ) RETURN Indicator_Rec
IS
   indrec_ Indicator_Rec;
BEGIN
   indrec_.template_id := rec_.template_id IS NOT NULL;
   indrec_.revision := rec_.revision IS NOT NULL;
   indrec_.description := rec_.description IS NOT NULL;
   indrec_.status := rec_.status IS NOT NULL;
   indrec_.created_by := rec_.created_by IS NOT NULL;
   indrec_.created_date := rec_.created_date IS NOT NULL;
   indrec_.profile_id := rec_.profile_id IS NOT NULL;
   RETURN indrec_;
END Get_Indicator_Rec___;


-- Get_Indicator_Rec___
--   Returns an Indicator_Rec that reflects the difference between two table records.
FUNCTION Get_Indicator_Rec___ (
   oldrec_ IN mdm_basic_data_tab%ROWTYPE,
   newrec_ IN mdm_basic_data_tab%ROWTYPE ) RETURN Indicator_Rec
IS
   indrec_ Indicator_Rec;
BEGIN
   indrec_.template_id := Validate_SYS.Is_Changed(oldrec_.template_id, newrec_.template_id);
   indrec_.revision := Validate_SYS.Is_Changed(oldrec_.revision, newrec_.revision);
   indrec_.description := Validate_SYS.Is_Changed(oldrec_.description, newrec_.description);
   indrec_.status := Validate_SYS.Is_Changed(oldrec_.status, newrec_.status);
   indrec_.created_by := Validate_SYS.Is_Changed(oldrec_.created_by, newrec_.created_by);
   indrec_.created_date := Validate_SYS.Is_Changed(oldrec_.created_date, newrec_.created_date);
   indrec_.profile_id := Validate_SYS.Is_Changed(oldrec_.profile_id, newrec_.profile_id);
   RETURN indrec_;
END Get_Indicator_Rec___;


-- Check_Common___
--   Perform validations on a record, that should be done for both insert and delete.
PROCEDURE Check_Common___ (
   oldrec_ IN     mdm_basic_data_tab%ROWTYPE,
   newrec_ IN OUT mdm_basic_data_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
BEGIN
   Error_SYS.Check_Not_Null(lu_name_, 'TEMPLATE_ID', newrec_.template_id);
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
   newrec_ IN OUT mdm_basic_data_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
   oldrec_ mdm_basic_data_tab%ROWTYPE;
BEGIN
   Check_Common___(oldrec_, newrec_, indrec_, attr_);
END Check_Insert___;


-- Insert___
--   Insert a record to the database.
PROCEDURE Insert___ (
   objid_      OUT    VARCHAR2,
   objversion_ OUT    VARCHAR2,
   newrec_     IN OUT mdm_basic_data_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2 )
IS
BEGIN
   newrec_.rowversion := sysdate;
   newrec_.rowkey := sys_guid();
   Client_SYS.Add_To_Attr('OBJKEY', newrec_.rowkey, attr_);
   INSERT
      INTO mdm_basic_data_tab
      VALUES newrec_
      RETURNING rowid INTO objid_;
   objversion_ := to_char(newrec_.rowversion,'YYYYMMDDHH24MISS');
EXCEPTION
   WHEN dup_val_on_index THEN
      DECLARE
         constraint_ VARCHAR2(4000) := Utility_SYS.Between_Str(Utility_SYS.Between_Str(sqlerrm, '(', ')'), '.', ')', 'FALSE');
      BEGIN
         IF (constraint_ = 'MDM_BASIC_DATA_RK') THEN
            Error_SYS.Rowkey_Exist(lu_name_, newrec_.rowkey);
         ELSE
            Raise_Record_Exist___(newrec_);
         END IF;
      END;
END Insert___;


-- Prepare_New___
--    Set default values for a table record.
PROCEDURE Prepare_New___ (
   newrec_ IN OUT mdm_basic_data_tab%ROWTYPE )
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
   newrec_ IN OUT mdm_basic_data_tab%ROWTYPE )
IS
   objid_         VARCHAR2(20);
   objversion_    VARCHAR2(100);
   attr_          VARCHAR2(32000);
   indrec_        Indicator_Rec;
   emptyrec_      mdm_basic_data_tab%ROWTYPE;
BEGIN
   indrec_ := Get_Indicator_Rec___(emptyrec_, newrec_);
   Check_Insert___(newrec_, indrec_, attr_);
   Insert___(objid_, objversion_, newrec_, attr_);
END New___;


-- Check_Update___
--   Perform validations on a new record before it is updated.
PROCEDURE Check_Update___ (
   oldrec_ IN     mdm_basic_data_tab%ROWTYPE,
   newrec_ IN OUT mdm_basic_data_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
BEGIN
   Validate_SYS.Item_Update(lu_name_, 'TEMPLATE_ID', indrec_.template_id);
   Validate_SYS.Item_Update(lu_name_, 'REVISION', indrec_.revision);
   Validate_SYS.Item_Update(lu_name_, 'STATUS', indrec_.status);
   Validate_SYS.Item_Update(lu_name_, 'CREATED_BY', indrec_.created_by);
   Validate_SYS.Item_Update(lu_name_, 'CREATED_DATE', indrec_.created_date);
   Check_Common___(oldrec_, newrec_, indrec_, attr_);
END Check_Update___;


-- Update___
--   Update a record in database with new data.
PROCEDURE Update___ (
   objid_      IN     VARCHAR2,
   oldrec_     IN     mdm_basic_data_tab%ROWTYPE,
   newrec_     IN OUT mdm_basic_data_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   by_keys_    IN     BOOLEAN DEFAULT FALSE )
IS
BEGIN
   newrec_.rowversion := sysdate;
   IF by_keys_ THEN
      UPDATE mdm_basic_data_tab
         SET ROW = newrec_
         WHERE template_id = newrec_.template_id;
   ELSE
      UPDATE mdm_basic_data_tab
         SET ROW = newrec_
         WHERE rowid = objid_;
   END IF;
   objversion_ := to_char(newrec_.rowversion,'YYYYMMDDHH24MISS');
EXCEPTION
   WHEN dup_val_on_index THEN
      DECLARE
         constraint_ VARCHAR2(4000) := Utility_SYS.Between_Str(Utility_SYS.Between_Str(sqlerrm, '(', ')'), '.', ')', 'FALSE');
      BEGIN
         IF (constraint_ = 'MDM_BASIC_DATA_RK') THEN
            Error_SYS.Rowkey_Exist(Mdm_Basic_Data_API.lu_name_, newrec_.rowkey);
         ELSE
            Raise_Record_Exist___(newrec_);
         END IF;
      END;
END Update___;


-- Modify___
--    Modifies an existing instance of the logical unit.
PROCEDURE Modify___ (
   newrec_         IN OUT mdm_basic_data_tab%ROWTYPE,
   lock_mode_wait_ IN     BOOLEAN DEFAULT TRUE )
IS
   objid_      VARCHAR2(20);
   objversion_ VARCHAR2(100);
   attr_       VARCHAR2(32000);
   indrec_     Indicator_rec;
   oldrec_     mdm_basic_data_tab%ROWTYPE;
BEGIN
   IF (lock_mode_wait_) THEN
      oldrec_ := Lock_By_Keys___(newrec_.template_id);
   ELSE
      oldrec_ := Lock_By_Keys_Nowait___(newrec_.template_id);
   END IF;
   indrec_ := Get_Indicator_Rec___(oldrec_, newrec_);
   Check_Update___(oldrec_, newrec_, indrec_, attr_);
   Update___(objid_, oldrec_, newrec_, attr_, objversion_, TRUE);
END Modify___;


-- Check_Delete___
--   Perform validations on a new record before it is deleted.
PROCEDURE Check_Delete___ (
   remrec_ IN mdm_basic_data_tab%ROWTYPE )
IS
   key_ VARCHAR2(2000);
BEGIN
   key_ := remrec_.template_id||'^';
   Reference_SYS.Check_Restricted_Delete(lu_name_, key_);
END Check_Delete___;


-- Delete___
--   Delete a record from the database.
PROCEDURE Delete___ (
   objid_  IN VARCHAR2,
   remrec_ IN mdm_basic_data_tab%ROWTYPE )
IS
   key_ VARCHAR2(2000);
BEGIN
   key_ := remrec_.template_id||'^';
   Reference_SYS.Do_Cascade_Delete(lu_name_, key_);
   IF (objid_ IS NOT NULL) THEN
      DELETE
         FROM  mdm_basic_data_tab
         WHERE rowid = objid_;
   ELSE
      DELETE
         FROM  mdm_basic_data_tab
         WHERE template_id = remrec_.template_id;
   END IF;
END Delete___;


-- Delete___
--   Delete a record from the database.
@Deprecated
PROCEDURE Delete___ (
   remrec_ IN mdm_basic_data_tab%ROWTYPE )
IS
BEGIN
   Delete___(NULL, remrec_);
END Delete___;


-- Remove___
--    Removes an existing instance of the logical unit.
PROCEDURE Remove___ (
   remrec_         IN OUT mdm_basic_data_tab%ROWTYPE,
   lock_mode_wait_ IN     BOOLEAN DEFAULT TRUE )
IS
   oldrec_     mdm_basic_data_tab%ROWTYPE;
BEGIN
   IF (lock_mode_wait_) THEN
      oldrec_ := Lock_By_Keys___(remrec_.template_id);
   ELSE
      oldrec_ := Lock_By_Keys_Nowait___(remrec_.template_id);
   END IF;
   Check_Delete___(oldrec_);
   Delete___(NULL, oldrec_);
END Remove___;


-- Write_Notes__
--    Write CLOB column Notes to database.
PROCEDURE Write_Notes__ (
   objversion_ IN OUT VARCHAR2,
   rowid_      IN     ROWID,
   lob_loc_    IN     CLOB )
IS
   rec_ mdm_basic_data_tab%ROWTYPE;
BEGIN
   rec_ := Lock_By_Id___(rowid_, objversion_);
   UPDATE mdm_basic_data_tab
   SET notes = lob_loc_,
       rowversion = sysdate
   WHERE rowid = rowid_
   RETURNING rowversion INTO rec_.rowversion;
   objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
END Write_Notes__;


-- Lock__
--    Client-support to lock a specific instance of the logical unit.
@UncheckedAccess
PROCEDURE Lock__ (
   info_       OUT VARCHAR2,
   objid_      IN  VARCHAR2,
   objversion_ IN  VARCHAR2 )
IS
   dummy_ mdm_basic_data_tab%ROWTYPE;
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
   newrec_   mdm_basic_data_tab%ROWTYPE;
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
   oldrec_   mdm_basic_data_tab%ROWTYPE;
   newrec_   mdm_basic_data_tab%ROWTYPE;
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
   remrec_ mdm_basic_data_tab%ROWTYPE;
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
   template_id_ IN VARCHAR2 )
IS
BEGIN
   IF (NOT Check_Exist___(template_id_)) THEN
      Raise_Record_Not_Exist___(template_id_);
   END IF;
END Exist;


-- Exists
--   Same check as Exist, but returns a BOOLEAN value instead of exception.
@UncheckedAccess
FUNCTION Exists (
   template_id_ IN VARCHAR2 ) RETURN BOOLEAN
IS
BEGIN
   RETURN Check_Exist___(template_id_);
END Exists;


-- Get_Revision
--   Fetches the Revision attribute for a record.
@UncheckedAccess
FUNCTION Get_Revision (
   template_id_ IN VARCHAR2 ) RETURN NUMBER
IS
   temp_ mdm_basic_data_tab.revision%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT revision
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Revision');
END Get_Revision;


-- Get_Description
--   Fetches the Description attribute for a record.
@UncheckedAccess
FUNCTION Get_Description (
   template_id_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_basic_data_tab.description%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT description
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Description');
END Get_Description;


-- Get_Status
--   Fetches the Status attribute for a record.
@UncheckedAccess
FUNCTION Get_Status (
   template_id_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_basic_data_tab.status%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT status
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Status');
END Get_Status;


-- Get_Created_By
--   Fetches the CreatedBy attribute for a record.
@UncheckedAccess
FUNCTION Get_Created_By (
   template_id_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_basic_data_tab.created_by%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT ifsapp.fnd_session_api.Get_Fnd_User
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Created_By');
END Get_Created_By;


-- Get_Created_Date
--   Fetches the CreatedDate attribute for a record.
@UncheckedAccess
FUNCTION Get_Created_Date (
   template_id_ IN VARCHAR2 ) RETURN DATE
IS
   temp_ mdm_basic_data_tab.created_date%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT sysdate
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Created_Date');
END Get_Created_Date;


-- Get_Profile_Id
--   Fetches the ProfileId attribute for a record.
@UncheckedAccess
FUNCTION Get_Profile_Id (
   template_id_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   temp_ mdm_basic_data_tab.profile_id%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT profile_id
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Profile_Id');
END Get_Profile_Id;


-- Get_Notes
--   Fetches the Notes attribute for a record.
@UncheckedAccess
FUNCTION Get_Notes (
   template_id_ IN VARCHAR2 ) RETURN CLOB
IS
   temp_ mdm_basic_data_tab.notes%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT notes
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Notes');
END Get_Notes;


-- Get
--   Fetches a record containing the public attributes.
@UncheckedAccess
FUNCTION Get (
   template_id_ IN VARCHAR2 ) RETURN Public_Rec
IS
   temp_ Public_Rec;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT template_id,
          rowid, rowversion, rowkey,
          revision, 
          description, 
          status, 
          ifsapp.fnd_session_api.Get_Fnd_User, 
          sysdate, 
          profile_id, 
          notes
      INTO  temp_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get');
END Get;


-- Get_Objkey
--   Fetches the objkey attribute for a record.
@UncheckedAccess
FUNCTION Get_Objkey (
   template_id_ IN VARCHAR2 ) RETURN VARCHAR2
IS
   rowkey_ mdm_basic_data_tab.rowkey%TYPE;
BEGIN
   IF (template_id_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT rowkey
      INTO  rowkey_
      FROM  mdm_basic_data_tab
      WHERE template_id = template_id_;
   RETURN rowkey_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, 'Get_Objkey');
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

