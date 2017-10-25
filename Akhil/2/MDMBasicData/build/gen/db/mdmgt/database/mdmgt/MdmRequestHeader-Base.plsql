-----------------------------------------------------------------------------
--
--  Logical unit: MdmRequestHeader
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
--  (template_id                    MDM_REQUEST_HEADER_TAB.template_id%TYPE,
--   revision                       MDM_REQUEST_HEADER_TAB.revision%TYPE,
--   request_no                     MDM_REQUEST_HEADER_TAB.request_no%TYPE);

TYPE Public_Rec IS RECORD
  (template_id                    MDM_REQUEST_HEADER_TAB.template_id%TYPE,
   revision                       MDM_REQUEST_HEADER_TAB.revision%TYPE,
   request_no                     MDM_REQUEST_HEADER_TAB.request_no%TYPE,
   "rowid"                        rowid,
   rowversion                     MDM_REQUEST_HEADER_TAB.rowversion%TYPE,
   rowkey                         MDM_REQUEST_HEADER_TAB.rowkey%TYPE,
   rowstate                       MDM_REQUEST_HEADER_TAB.rowstate%TYPE,
   description                    MDM_REQUEST_HEADER_TAB.description%TYPE,
   requested_by                   MDM_REQUEST_HEADER_TAB.requested_by%TYPE,
   requested_date                 MDM_REQUEST_HEADER_TAB.requested_date%TYPE,
   approval_required              MDM_REQUEST_HEADER_TAB.approval_required%TYPE,
   approval_rejected              MDM_REQUEST_HEADER_TAB.approval_rejected%TYPE);

-------------------- PRIVATE DECLARATIONS -----------------------------------

TYPE Indicator_Rec IS RECORD
  (template_id                    BOOLEAN := FALSE,
   revision                       BOOLEAN := FALSE,
   request_no                     BOOLEAN := FALSE,
   description                    BOOLEAN := FALSE,
   requested_by                   BOOLEAN := FALSE,
   requested_date                 BOOLEAN := FALSE,
   approval_required              BOOLEAN := FALSE,
   approval_rejected              BOOLEAN := FALSE);

-------------------- BASE METHODS -------------------------------------------

-- Raise_Too_Many_Rows___
--    Raises error for: More then one row found for a single key.
PROCEDURE Raise_Too_Many_Rows___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER,
   methodname_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Too_Many_Rows(Mdm_Request_Header_API.lu_name_, NULL, methodname_);
END Raise_Too_Many_Rows___;


-- Raise_Record_Not_Exist___
--    Raises error for: No data found for given key.
PROCEDURE Raise_Record_Not_Exist___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER )
IS
BEGIN
   Error_SYS.Record_Not_Exist(Mdm_Request_Header_API.lu_name_);
END Raise_Record_Not_Exist___;


-- Raise_Record_Exist___
--    Raises error for: Data with given key value already exist.
PROCEDURE Raise_Record_Exist___ (
   rec_ mdm_request_header_tab%ROWTYPE )
IS
BEGIN
   Error_SYS.Record_Exist(Mdm_Request_Header_API.lu_name_);
END Raise_Record_Exist___;


-- Raise_Item_Format___
--    Raises error for: Data value format is incorrect.
PROCEDURE Raise_Item_Format___ (
   name_ IN VARCHAR2,
   value_ IN VARCHAR2 )
IS
BEGIN
   Error_SYS.Item_Format(Mdm_Request_Header_API.lu_name_, name_, value_);
END Raise_Item_Format___;

-- Raise_Record_Modified___
--    Raises error for: The database row is newer then the current.
PROCEDURE Raise_Record_Modified___ (
   rec_ mdm_request_header_tab%ROWTYPE )
IS
BEGIN
   Error_SYS.Record_Modified(Mdm_Request_Header_API.lu_name_);
END Raise_Record_Modified___;


-- Raise_Record_Locked___
--    Raises error for: The database row is already locked.
PROCEDURE Raise_Record_Locked___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER )
IS
BEGIN
   Error_SYS.Record_Locked(Mdm_Request_Header_API.lu_name_);
END Raise_Record_Locked___;


-- Raise_Record_Removed___
--    Raises error for: The database row is no longer present.
PROCEDURE Raise_Record_Removed___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER )
IS
BEGIN
   Error_SYS.Record_Removed(Mdm_Request_Header_API.lu_name_);
END Raise_Record_Removed___;


-- Lock_By_Id___
--    Locks a database row based on the objid and objversion.
FUNCTION Lock_By_Id___ (
   objid_      IN VARCHAR2,
   objversion_ IN VARCHAR2 ) RETURN mdm_request_header_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_request_header_tab%ROWTYPE;
   dummy_      NUMBER;
BEGIN
   SELECT *
      INTO  rec_
      FROM  mdm_request_header_tab
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
            FROM  mdm_request_header_tab
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
   request_no_ IN NUMBER) RETURN mdm_request_header_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_request_header_tab%ROWTYPE;
BEGIN
   BEGIN
      SELECT *
         INTO  rec_
         FROM  mdm_request_header_tab
         WHERE template_id = template_id_
         AND   revision = revision_
         AND   request_no = request_no_
         FOR UPDATE;
      RETURN rec_;
   EXCEPTION
      WHEN no_data_found THEN
         Raise_Record_Removed___(template_id_, revision_, request_no_);
      WHEN too_many_rows THEN
         Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Lock_By_Keys___');
   END;
END Lock_By_Keys___;


-- Lock_By_Keys_Nowait___
--    Locks a database row based on the primary key values.
--    Raises exception if row already locked.
FUNCTION Lock_By_Keys_Nowait___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER) RETURN mdm_request_header_tab%ROWTYPE
IS
   row_locked  EXCEPTION;
   PRAGMA      EXCEPTION_INIT(row_locked, -0054);
   rec_        mdm_request_header_tab%ROWTYPE;
   dummy_      NUMBER;
BEGIN
   BEGIN
      SELECT *
         INTO  rec_
         FROM  mdm_request_header_tab
         WHERE template_id = template_id_
         AND   revision = revision_
         AND   request_no = request_no_
         FOR UPDATE NOWAIT;
      RETURN rec_;
   EXCEPTION
      WHEN row_locked THEN
         Error_SYS.Record_Locked(lu_name_);
      WHEN too_many_rows THEN
         Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Lock_By_Keys___');
      WHEN no_data_found THEN
         BEGIN
            SELECT 1
               INTO  dummy_
               FROM  mdm_request_header_tab
               WHERE template_id = template_id_
               AND   revision = revision_
               AND   request_no = request_no_;
            Raise_Record_Modified___(rec_);
         EXCEPTION
            WHEN no_data_found THEN
               Raise_Record_Removed___(template_id_, revision_, request_no_);
            WHEN too_many_rows THEN
               Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Lock_By_Keys___');
         END;
   END;
END Lock_By_Keys_Nowait___;


-- Get_Object_By_Id___
--    Fetched a database row based on given the objid.
FUNCTION Get_Object_By_Id___ (
   objid_ IN VARCHAR2 ) RETURN mdm_request_header_tab%ROWTYPE
IS
   lu_rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   SELECT *
      INTO  lu_rec_
      FROM  mdm_request_header_tab
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
   request_no_ IN NUMBER ) RETURN mdm_request_header_tab%ROWTYPE
IS
   lu_rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   SELECT *
      INTO  lu_rec_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN lu_rec_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN lu_rec_;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Object_By_Keys___');
END Get_Object_By_Keys___;


-- Check_Exist___
--    Checks if a database row is already stored based on the primary key values.
@UncheckedAccess
FUNCTION Check_Exist___ (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN BOOLEAN
IS
   dummy_ NUMBER;
BEGIN
   SELECT 1
      INTO  dummy_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN TRUE;
EXCEPTION
   WHEN no_data_found THEN
      RETURN FALSE;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Check_Exist___');
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
      FROM  mdm_request_header_tab
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
   request_no_ IN NUMBER )
IS
BEGIN
   SELECT rowid, to_char(rowversion,'YYYYMMDDHH24MISS')
      INTO  objid_, objversion_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
EXCEPTION
   WHEN no_data_found THEN
      objid_      := NULL;
      objversion_ := NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Id_Version_By_Keys___');
END Get_Id_Version_By_Keys___;


-- Get_Key_By_Rowkey
--   Returns a table record with only keys (other attributes are NULL) based on a rowkey.
@UncheckedAccess
FUNCTION Get_Key_By_Rowkey (
   rowkey_ IN VARCHAR2 ) RETURN mdm_request_header_tab%ROWTYPE
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   SELECT template_id, revision, request_no
      INTO  rec_.template_id, rec_.revision, rec_.request_no
      FROM  mdm_request_header_tab
      WHERE rowkey = rowkey_;
   RETURN rec_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN rec_;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(rec_.template_id, rec_.revision, rec_.request_no, 'Get_Key_By_Rowkey');
END Get_Key_By_Rowkey;


-- Unpack___
--   Reads an attribute string and unpacks its contents into a record.
PROCEDURE Unpack___ (
   newrec_   IN OUT mdm_request_header_tab%ROWTYPE,
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
      WHEN ('REQUEST_NO') THEN
         newrec_.request_no := Client_SYS.Attr_Value_To_Number(value_);
         indrec_.request_no := TRUE;
      WHEN ('DESCRIPTION') THEN
         newrec_.description := value_;
         indrec_.description := TRUE;
      WHEN ('REQUESTED_BY') THEN
         newrec_.requested_by := value_;
         indrec_.requested_by := TRUE;
      WHEN ('REQUESTED_DATE') THEN
         newrec_.requested_date := Client_SYS.Attr_Value_To_Date(value_);
         indrec_.requested_date := TRUE;
      WHEN ('APPROVAL_REQUIRED') THEN
         IF (value_ IS NULL OR value_ = 'TRUE' OR value_ = 'FALSE') THEN
            newrec_.approval_required := value_;
         ELSE
            RAISE value_error;
         END IF;
         indrec_.approval_required := TRUE;
      WHEN ('APPROVAL_REJECTED') THEN
         IF (value_ IS NULL OR value_ = 'TRUE' OR value_ = 'FALSE') THEN
            newrec_.approval_rejected := value_;
         ELSE
            RAISE value_error;
         END IF;
         indrec_.approval_rejected := TRUE;
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
   rec_ IN mdm_request_header_tab%ROWTYPE ) RETURN VARCHAR2
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
   IF (rec_.request_no IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('REQUEST_NO', rec_.request_no, attr_);
   END IF;
   IF (rec_.description IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   END IF;
   IF (rec_.requested_by IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('REQUESTED_BY', rec_.requested_by, attr_);
   END IF;
   IF (rec_.requested_date IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('REQUESTED_DATE', rec_.requested_date, attr_);
   END IF;
   IF (rec_.approval_required IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('APPROVAL_REQUIRED', rec_.approval_required, attr_);
   END IF;
   IF (rec_.approval_rejected IS NOT NULL) THEN
      Client_SYS.Add_To_Attr('APPROVAL_REJECTED', rec_.approval_rejected, attr_);
   END IF;
   RETURN attr_;
END Pack___;


FUNCTION Pack___ (
   rec_ IN mdm_request_header_tab%ROWTYPE,
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
   IF (indrec_.request_no) THEN
      Client_SYS.Add_To_Attr('REQUEST_NO', rec_.request_no, attr_);
   END IF;
   IF (indrec_.description) THEN
      Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   END IF;
   IF (indrec_.requested_by) THEN
      Client_SYS.Add_To_Attr('REQUESTED_BY', rec_.requested_by, attr_);
   END IF;
   IF (indrec_.requested_date) THEN
      Client_SYS.Add_To_Attr('REQUESTED_DATE', rec_.requested_date, attr_);
   END IF;
   IF (indrec_.approval_required) THEN
      Client_SYS.Add_To_Attr('APPROVAL_REQUIRED', rec_.approval_required, attr_);
   END IF;
   IF (indrec_.approval_rejected) THEN
      Client_SYS.Add_To_Attr('APPROVAL_REJECTED', rec_.approval_rejected, attr_);
   END IF;
   RETURN attr_;
END Pack___;



-- Pack_Table___
--   Reads a record and packs its contents into an attribute string.
--   Similar to Pack___ but just uses table column names and DB values
FUNCTION Pack_Table___ (
   rec_ IN mdm_request_header_tab%ROWTYPE ) RETURN VARCHAR2
IS
   attr_ VARCHAR2(32000);
BEGIN
   Client_SYS.Clear_Attr(attr_);
   Client_SYS.Add_To_Attr('TEMPLATE_ID', rec_.template_id, attr_);
   Client_SYS.Add_To_Attr('REVISION', rec_.revision, attr_);
   Client_SYS.Add_To_Attr('REQUEST_NO', rec_.request_no, attr_);
   Client_SYS.Add_To_Attr('DESCRIPTION', rec_.description, attr_);
   Client_SYS.Add_To_Attr('REQUESTED_BY', rec_.requested_by, attr_);
   Client_SYS.Add_To_Attr('REQUESTED_DATE', rec_.requested_date, attr_);
   Client_SYS.Add_To_Attr('APPROVAL_REQUIRED', rec_.approval_required, attr_);
   Client_SYS.Add_To_Attr('APPROVAL_REJECTED', rec_.approval_rejected, attr_);
   Client_SYS.Add_To_Attr('ROWKEY', rec_.rowkey, attr_);
   Client_SYS.Add_To_Attr('ROWSTATE', rec_.rowstate, attr_);
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
   rec_ IN mdm_request_header_tab%ROWTYPE ) RETURN Indicator_Rec
IS
   indrec_ Indicator_Rec;
BEGIN
   indrec_.template_id := rec_.template_id IS NOT NULL;
   indrec_.revision := rec_.revision IS NOT NULL;
   indrec_.request_no := rec_.request_no IS NOT NULL;
   indrec_.description := rec_.description IS NOT NULL;
   indrec_.requested_by := rec_.requested_by IS NOT NULL;
   indrec_.requested_date := rec_.requested_date IS NOT NULL;
   indrec_.approval_required := rec_.approval_required IS NOT NULL;
   indrec_.approval_rejected := rec_.approval_rejected IS NOT NULL;
   RETURN indrec_;
END Get_Indicator_Rec___;


-- Get_Indicator_Rec___
--   Returns an Indicator_Rec that reflects the difference between two table records.
FUNCTION Get_Indicator_Rec___ (
   oldrec_ IN mdm_request_header_tab%ROWTYPE,
   newrec_ IN mdm_request_header_tab%ROWTYPE ) RETURN Indicator_Rec
IS
   indrec_ Indicator_Rec;
BEGIN
   indrec_.template_id := Validate_SYS.Is_Changed(oldrec_.template_id, newrec_.template_id);
   indrec_.revision := Validate_SYS.Is_Changed(oldrec_.revision, newrec_.revision);
   indrec_.request_no := Validate_SYS.Is_Changed(oldrec_.request_no, newrec_.request_no);
   indrec_.description := Validate_SYS.Is_Changed(oldrec_.description, newrec_.description);
   indrec_.requested_by := Validate_SYS.Is_Changed(oldrec_.requested_by, newrec_.requested_by);
   indrec_.requested_date := Validate_SYS.Is_Changed(oldrec_.requested_date, newrec_.requested_date);
   indrec_.approval_required := Validate_SYS.Is_Changed(oldrec_.approval_required, newrec_.approval_required);
   indrec_.approval_rejected := Validate_SYS.Is_Changed(oldrec_.approval_rejected, newrec_.approval_rejected);
   RETURN indrec_;
END Get_Indicator_Rec___;


-- Check_Common___
--   Perform validations on a record, that should be done for both insert and delete.
PROCEDURE Check_Common___ (
   oldrec_ IN     mdm_request_header_tab%ROWTYPE,
   newrec_ IN OUT mdm_request_header_tab%ROWTYPE,
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
   Error_SYS.Check_Not_Null(lu_name_, 'REQUEST_NO', newrec_.request_no);
   Error_SYS.Check_Not_Null(lu_name_, 'DESCRIPTION', newrec_.description);
   Error_SYS.Check_Not_Null(lu_name_, 'REQUESTED_BY', newrec_.requested_by);
   Error_SYS.Check_Not_Null(lu_name_, 'REQUESTED_DATE', newrec_.requested_date);
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
   newrec_ IN OUT mdm_request_header_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
   oldrec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   Check_Common___(oldrec_, newrec_, indrec_, attr_);
END Check_Insert___;


-- Insert___
--   Insert a record to the database.
PROCEDURE Insert___ (
   objid_      OUT    VARCHAR2,
   objversion_ OUT    VARCHAR2,
   newrec_     IN OUT mdm_request_header_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2 )
IS
BEGIN
   newrec_.rowversion := sysdate;
   newrec_.rowkey := sys_guid();
   Client_SYS.Add_To_Attr('OBJKEY', newrec_.rowkey, attr_);
   newrec_.rowstate := '<UNDEFINED>';
   INSERT
      INTO mdm_request_header_tab
      VALUES newrec_
      RETURNING rowid INTO objid_;
   newrec_.rowstate := NULL;
   Finite_State_Init___(newrec_, attr_);
   objversion_ := to_char(newrec_.rowversion,'YYYYMMDDHH24MISS');
EXCEPTION
   WHEN dup_val_on_index THEN
      DECLARE
         constraint_ VARCHAR2(4000) := Utility_SYS.Between_Str(Utility_SYS.Between_Str(sqlerrm, '(', ')'), '.', ')', 'FALSE');
      BEGIN
         IF (constraint_ = 'MDM_REQUEST_HEADER_RK') THEN
            Error_SYS.Rowkey_Exist(lu_name_, newrec_.rowkey);
         ELSE
            Raise_Record_Exist___(newrec_);
         END IF;
      END;
END Insert___;


-- Prepare_New___
--    Set default values for a table record.
PROCEDURE Prepare_New___ (
   newrec_ IN OUT mdm_request_header_tab%ROWTYPE )
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
   newrec_ IN OUT mdm_request_header_tab%ROWTYPE )
IS
   objid_         VARCHAR2(20);
   objversion_    VARCHAR2(100);
   attr_          VARCHAR2(32000);
   indrec_        Indicator_Rec;
   emptyrec_      mdm_request_header_tab%ROWTYPE;
BEGIN
   indrec_ := Get_Indicator_Rec___(emptyrec_, newrec_);
   Check_Insert___(newrec_, indrec_, attr_);
   Insert___(objid_, objversion_, newrec_, attr_);
END New___;


-- Check_Update___
--   Perform validations on a new record before it is updated.
PROCEDURE Check_Update___ (
   oldrec_ IN     mdm_request_header_tab%ROWTYPE,
   newrec_ IN OUT mdm_request_header_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
BEGIN
   Validate_SYS.Item_Update(lu_name_, 'TEMPLATE_ID', indrec_.template_id);
   Validate_SYS.Item_Update(lu_name_, 'REVISION', indrec_.revision);
   Validate_SYS.Item_Update(lu_name_, 'REQUEST_NO', indrec_.request_no);
   Validate_SYS.Item_Update(lu_name_, 'REQUESTED_BY', indrec_.requested_by);
   Validate_SYS.Item_Update(lu_name_, 'REQUESTED_DATE', indrec_.requested_date);
   Check_Common___(oldrec_, newrec_, indrec_, attr_);
END Check_Update___;


-- Update___
--   Update a record in database with new data.
PROCEDURE Update___ (
   objid_      IN     VARCHAR2,
   oldrec_     IN     mdm_request_header_tab%ROWTYPE,
   newrec_     IN OUT mdm_request_header_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   by_keys_    IN     BOOLEAN DEFAULT FALSE )
IS
BEGIN
   newrec_.rowversion := sysdate;
   IF by_keys_ THEN
      UPDATE mdm_request_header_tab
         SET ROW = newrec_
         WHERE template_id = newrec_.template_id
         AND   revision = newrec_.revision
         AND   request_no = newrec_.request_no;
   ELSE
      UPDATE mdm_request_header_tab
         SET ROW = newrec_
         WHERE rowid = objid_;
   END IF;
   objversion_ := to_char(newrec_.rowversion,'YYYYMMDDHH24MISS');
EXCEPTION
   WHEN dup_val_on_index THEN
      DECLARE
         constraint_ VARCHAR2(4000) := Utility_SYS.Between_Str(Utility_SYS.Between_Str(sqlerrm, '(', ')'), '.', ')', 'FALSE');
      BEGIN
         IF (constraint_ = 'MDM_REQUEST_HEADER_RK') THEN
            Error_SYS.Rowkey_Exist(Mdm_Request_Header_API.lu_name_, newrec_.rowkey);
         ELSE
            Raise_Record_Exist___(newrec_);
         END IF;
      END;
END Update___;


-- Modify___
--    Modifies an existing instance of the logical unit.
PROCEDURE Modify___ (
   newrec_         IN OUT mdm_request_header_tab%ROWTYPE,
   lock_mode_wait_ IN     BOOLEAN DEFAULT TRUE )
IS
   objid_      VARCHAR2(20);
   objversion_ VARCHAR2(100);
   attr_       VARCHAR2(32000);
   indrec_     Indicator_rec;
   oldrec_     mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (lock_mode_wait_) THEN
      oldrec_ := Lock_By_Keys___(newrec_.template_id, newrec_.revision, newrec_.request_no);
   ELSE
      oldrec_ := Lock_By_Keys_Nowait___(newrec_.template_id, newrec_.revision, newrec_.request_no);
   END IF;
   indrec_ := Get_Indicator_Rec___(oldrec_, newrec_);
   Check_Update___(oldrec_, newrec_, indrec_, attr_);
   Update___(objid_, oldrec_, newrec_, attr_, objversion_, TRUE);
END Modify___;


-- Check_Delete___
--   Perform validations on a new record before it is deleted.
PROCEDURE Check_Delete___ (
   remrec_ IN mdm_request_header_tab%ROWTYPE )
IS
   key_ VARCHAR2(2000);
BEGIN
   key_ := remrec_.template_id||'^'||remrec_.revision||'^'||remrec_.request_no||'^';
   Reference_SYS.Check_Restricted_Delete(lu_name_, key_);
END Check_Delete___;


-- Delete___
--   Delete a record from the database.
PROCEDURE Delete___ (
   objid_  IN VARCHAR2,
   remrec_ IN mdm_request_header_tab%ROWTYPE )
IS
   key_ VARCHAR2(2000);
BEGIN
   key_ := remrec_.template_id||'^'||remrec_.revision||'^'||remrec_.request_no||'^';
   Reference_SYS.Do_Cascade_Delete(lu_name_, key_);
   IF (objid_ IS NOT NULL) THEN
      DELETE
         FROM  mdm_request_header_tab
         WHERE rowid = objid_;
   ELSE
      DELETE
         FROM  mdm_request_header_tab
         WHERE template_id = remrec_.template_id
         AND   revision = remrec_.revision
         AND   request_no = remrec_.request_no;
   END IF;
END Delete___;


-- Delete___
--   Delete a record from the database.
@Deprecated
PROCEDURE Delete___ (
   remrec_ IN mdm_request_header_tab%ROWTYPE )
IS
BEGIN
   Delete___(NULL, remrec_);
END Delete___;


-- Remove___
--    Removes an existing instance of the logical unit.
PROCEDURE Remove___ (
   remrec_         IN OUT mdm_request_header_tab%ROWTYPE,
   lock_mode_wait_ IN     BOOLEAN DEFAULT TRUE )
IS
   oldrec_     mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (lock_mode_wait_) THEN
      oldrec_ := Lock_By_Keys___(remrec_.template_id, remrec_.revision, remrec_.request_no);
   ELSE
      oldrec_ := Lock_By_Keys_Nowait___(remrec_.template_id, remrec_.revision, remrec_.request_no);
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
   dummy_ mdm_request_header_tab%ROWTYPE;
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
   newrec_   mdm_request_header_tab%ROWTYPE;
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
   oldrec_   mdm_request_header_tab%ROWTYPE;
   newrec_   mdm_request_header_tab%ROWTYPE;
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
   remrec_ mdm_request_header_tab%ROWTYPE;
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
   request_no_ IN NUMBER )
IS
BEGIN
   IF (NOT Check_Exist___(template_id_, revision_, request_no_)) THEN
      Raise_Record_Not_Exist___(template_id_, revision_, request_no_);
   END IF;
END Exist;


-- Exists
--   Same check as Exist, but returns a BOOLEAN value instead of exception.
@UncheckedAccess
FUNCTION Exists (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN BOOLEAN
IS
BEGIN
   RETURN Check_Exist___(template_id_, revision_, request_no_);
END Exists;


-- Get_Description
--   Fetches the Description attribute for a record.
@UncheckedAccess
FUNCTION Get_Description (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN VARCHAR2
IS
   temp_ mdm_request_header_tab.description%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT description
      INTO  temp_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Description');
END Get_Description;


-- Get_Requested_By
--   Fetches the RequestedBy attribute for a record.
@UncheckedAccess
FUNCTION Get_Requested_By (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN VARCHAR2
IS
   temp_ mdm_request_header_tab.requested_by%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT requested_by
      INTO  temp_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Requested_By');
END Get_Requested_By;


-- Get_Requested_Date
--   Fetches the RequestedDate attribute for a record.
@UncheckedAccess
FUNCTION Get_Requested_Date (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN DATE
IS
   temp_ mdm_request_header_tab.requested_date%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT requested_date
      INTO  temp_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Requested_Date');
END Get_Requested_Date;


-- Get_Approval_Required
--   Fetches the ApprovalRequired attribute for a record.
@UncheckedAccess
FUNCTION Get_Approval_Required (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN VARCHAR2
IS
   temp_ mdm_request_header_tab.approval_required%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT approval_required
      INTO  temp_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Approval_Required');
END Get_Approval_Required;


-- Get_Approval_Rejected
--   Fetches the ApprovalRejected attribute for a record.
@UncheckedAccess
FUNCTION Get_Approval_Rejected (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN VARCHAR2
IS
   temp_ mdm_request_header_tab.approval_rejected%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT approval_rejected
      INTO  temp_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Approval_Rejected');
END Get_Approval_Rejected;


-- Get
--   Fetches a record containing the public attributes.
@UncheckedAccess
FUNCTION Get (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN Public_Rec
IS
   temp_ Public_Rec;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT template_id, revision, request_no,
          rowid, rowversion, rowkey, rowstate,
          description, 
          requested_by, 
          requested_date, 
          approval_required, 
          approval_rejected
      INTO  temp_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN temp_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get');
END Get;


-- Get_Objkey
--   Fetches the objkey attribute for a record.
@UncheckedAccess
FUNCTION Get_Objkey (
   template_id_ IN VARCHAR2,
   revision_ IN NUMBER,
   request_no_ IN NUMBER ) RETURN VARCHAR2
IS
   rowkey_ mdm_request_header_tab.rowkey%TYPE;
BEGIN
   IF (template_id_ IS NULL OR revision_ IS NULL OR request_no_ IS NULL) THEN
      RETURN NULL;
   END IF;
   SELECT rowkey
      INTO  rowkey_
      FROM  mdm_request_header_tab
      WHERE template_id = template_id_
      AND   revision = revision_
      AND   request_no = request_no_;
   RETURN rowkey_;
EXCEPTION
   WHEN no_data_found THEN
      RETURN NULL;
   WHEN too_many_rows THEN
      Raise_Too_Many_Rows___(template_id_, revision_, request_no_, 'Get_Objkey');
END Get_Objkey;

-------------------- FINITE STATE MACHINE -----------------------------------

-- Get_Db_Values___
--   Returns the the list of DB (stored in database) values.
FUNCTION Get_Db_Values___ RETURN VARCHAR2 DETERMINISTIC
IS
BEGIN
   RETURN('New^Partially Approved^Cancelled^Released^PartiallyTransfered^Transfered^Completed^');
END Get_Db_Values___;


-- Get_Client_Values___
--   Returns the the list of client (in PROG language) values.
FUNCTION Get_Client_Values___ RETURN VARCHAR2 DETERMINISTIC
IS
BEGIN
   RETURN('New^Partially Approved^Cancelled^Released^PartiallyTransfered^Transfered^Completed^');
END Get_Client_Values___;


-- Finite_State_Set___
--    Updates the state column in the database for given record.
PROCEDURE Finite_State_Set___ (
   rec_   IN OUT mdm_request_header_tab%ROWTYPE,
   state_ IN     VARCHAR2 )
IS
BEGIN
   rec_.rowversion := sysdate;
   UPDATE mdm_request_header_tab
      SET rowstate = state_,
          rowversion = rec_.rowversion
      WHERE template_id = rec_.template_id
      AND   revision = rec_.revision
      AND   request_no = rec_.request_no;
   rec_.rowstate := state_;
END Finite_State_Set___;


-- Finite_State_Machine___
--    Execute the state machine logic given a specific event.
PROCEDURE Finite_State_Machine___ (
   rec_   IN OUT mdm_request_header_tab%ROWTYPE,
   event_ IN     VARCHAR2,
   attr_  IN OUT VARCHAR2 )
IS
   state_ mdm_request_header_tab.rowstate%TYPE;
BEGIN
   state_ := rec_.rowstate;
   IF (state_ IS NULL) THEN
      IF (event_ IS NULL) THEN
         Finite_State_Set___(rec_, 'New');
      ELSE
         Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
      END IF;
   ELSIF (state_ = 'Cancelled') THEN
      Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
   ELSIF (state_ = 'Completed') THEN
      Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
   ELSIF (state_ = 'New') THEN
      IF (event_ = 'NewToRelease') THEN
         Finite_State_Set___(rec_, 'Released');
      ELSIF (event_ = 'PartiallyApprove') THEN
         Finite_State_Set___(rec_, 'Partially Approved');
      ELSE
         Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
      END IF;
   ELSIF (state_ = 'Partially Approved') THEN
      IF (event_ = 'Cancel') THEN
         Finite_State_Set___(rec_, 'Cancelled');
      ELSIF (event_ = 'Release') THEN
         Finite_State_Set___(rec_, 'Released');
      ELSE
         Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
      END IF;
   ELSIF (state_ = 'PartiallyTransfered') THEN
      IF (event_ = 'PartTransComplete') THEN
         Finite_State_Set___(rec_, 'Completed');
      ELSIF (event_ = 'Transfer') THEN
         Finite_State_Set___(rec_, 'Transfered');
      ELSE
         Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
      END IF;
   ELSIF (state_ = 'Released') THEN
      IF (event_ = 'PartialTransfer') THEN
         Finite_State_Set___(rec_, 'PartiallyTransfered');
      ELSIF (event_ = 'RelToCancel') THEN
         Finite_State_Set___(rec_, 'Cancelled');
      ELSE
         Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
      END IF;
   ELSIF (state_ = 'Transfered') THEN
      IF (event_ = 'Complete') THEN
         Finite_State_Set___(rec_, 'Completed');
      ELSE
         Error_SYS.State_Event_Not_Handled(lu_name_, event_, Finite_State_Decode__(state_));
      END IF;
   ELSE
      Error_SYS.State_Not_Exist(lu_name_, Finite_State_Decode__(state_));
   END IF;
END Finite_State_Machine___;


-- Finite_State_Add_To_Attr___
--    Add current state and lists of allowed events to an attribute string.
PROCEDURE Finite_State_Add_To_Attr___ (
   rec_  IN     mdm_request_header_tab%ROWTYPE,
   attr_ IN OUT VARCHAR2 )
IS
   state_ mdm_request_header_tab.rowstate%TYPE;
BEGIN
   state_ := rec_.rowstate;
   Client_SYS.Add_To_Attr('__OBJSTATE', state_, attr_);
   Client_SYS.Add_To_Attr('__OBJEVENTS', Finite_State_Events__(state_), attr_);
   Client_SYS.Add_To_Attr('STATE', Finite_State_Decode__(state_), attr_);
END Finite_State_Add_To_Attr___;


-- Finite_State_Init___
--    Runs the initial start event for the state machine.
PROCEDURE Finite_State_Init___ (
   rec_  IN OUT mdm_request_header_tab%ROWTYPE,
   attr_ IN OUT VARCHAR2 )
IS
BEGIN
   Finite_State_Machine___(rec_, NULL, attr_);
   Finite_State_Add_To_Attr___(rec_, attr_);
END Finite_State_Init___;


-- Finite_State_Init_
--    Runs the initial start event for a basedOn child entity.
@ServerOnlyAccess
PROCEDURE Finite_State_Init_ (
   rec_  IN OUT mdm_request_header_tab%ROWTYPE,
   attr_ IN OUT VARCHAR2 )
IS
BEGIN
   Finite_State_Init___(rec_, attr_);
END Finite_State_Init_;


-- Finite_State_Decode__
--   Returns the client equivalent for any database representation of
--   a state name = objstate.
@UncheckedAccess
FUNCTION Finite_State_Decode__ (
   db_state_ IN VARCHAR2 ) RETURN VARCHAR2
IS
BEGIN
   RETURN(Domain_SYS.Decode_(Domain_SYS.Get_Translated_Values(lu_name_), Get_Db_Values___, db_state_));
END Finite_State_Decode__;


-- Finite_State_Encode__
--   Returns the database equivalent for any client representation of
--   a state name = state.
@UncheckedAccess
FUNCTION Finite_State_Encode__ (
   client_state_ IN VARCHAR2 ) RETURN VARCHAR2
IS
BEGIN
   RETURN(Domain_SYS.Encode_(Domain_SYS.Get_Translated_Values(lu_name_), Get_Db_Values___, client_state_));
END Finite_State_Encode__;


-- Enumerate_States__
--   Returns a list of all possible finite states in client terminology.
@UncheckedAccess
PROCEDURE Enumerate_States__ (
   client_values_ OUT VARCHAR2 )
IS
BEGIN
   client_values_ := Domain_SYS.Enumerate_(Domain_SYS.Get_Translated_Values(lu_name_));
END Enumerate_States__;


-- Enumerate_States_Db__
--   Returns a list of all possible finite states in database terminology.
@UncheckedAccess
PROCEDURE Enumerate_States_Db__ (
   db_values_ OUT VARCHAR2 )
IS
BEGIN
   db_values_ := Domain_SYS.Enumerate_(Get_Db_Values___);
END Enumerate_States_Db__;


-- Finite_State_Events__
--   Returns a list of allowed events for a given state
--   NOTE! Regardless of conditions if not otherwize encoded
@UncheckedAccess
FUNCTION Finite_State_Events__ (
   db_state_ IN VARCHAR2 ) RETURN VARCHAR2
IS
BEGIN
   IF (db_state_ IS NULL) THEN
      RETURN NULL;
   ELSIF (db_state_ = 'Cancelled') THEN
      RETURN NULL;
   ELSIF (db_state_ = 'Completed') THEN
      RETURN NULL;
   ELSIF (db_state_ = 'New') THEN
      RETURN 'PartiallyApprove^NewToRelease^';
   ELSIF (db_state_ = 'Partially Approved') THEN
      RETURN 'Cancel^Release^';
   ELSIF (db_state_ = 'PartiallyTransfered') THEN
      RETURN 'Transfer^PartTransComplete^';
   ELSIF (db_state_ = 'Released') THEN
      RETURN 'PartialTransfer^RelToCancel^';
   ELSIF (db_state_ = 'Transfered') THEN
      RETURN 'Complete^';
   ELSE
      RETURN NULL;
   END IF;
END Finite_State_Events__;


-- Enumerate_Events__
--   Returns a list of all possible events.
@UncheckedAccess
PROCEDURE Enumerate_Events__ (
   db_events_ OUT VARCHAR2 )
IS
BEGIN
   db_events_ := 'Cancel^Complete^NewToRelease^PartTransComplete^PartialTransfer^PartiallyApprove^RelToCancel^Release^Transfer^';
END Enumerate_Events__;


-- Cancel__
--   Executes the Cancel event logic as defined in the state machine.
PROCEDURE Cancel__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'Cancel', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Cancel__;


-- Complete__
--   Executes the Complete event logic as defined in the state machine.
PROCEDURE Complete__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'Complete', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Complete__;


-- New_To_Release__
--   Executes the NewToRelease event logic as defined in the state machine.
PROCEDURE New_To_Release__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'NewToRelease', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END New_To_Release__;


-- Part_Trans_Complete__
--   Executes the PartTransComplete event logic as defined in the state machine.
PROCEDURE Part_Trans_Complete__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'PartTransComplete', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Part_Trans_Complete__;


-- Partial_Transfer__
--   Executes the PartialTransfer event logic as defined in the state machine.
PROCEDURE Partial_Transfer__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'PartialTransfer', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Partial_Transfer__;


-- Partially_Approve__
--   Executes the PartiallyApprove event logic as defined in the state machine.
PROCEDURE Partially_Approve__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'PartiallyApprove', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Partially_Approve__;


-- Rel_To_Cancel__
--   Executes the RelToCancel event logic as defined in the state machine.
PROCEDURE Rel_To_Cancel__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'RelToCancel', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Rel_To_Cancel__;


-- Release__
--   Executes the Release event logic as defined in the state machine.
PROCEDURE Release__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'Release', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Release__;


-- Transfer__
--   Executes the Transfer event logic as defined in the state machine.
PROCEDURE Transfer__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
   rec_ mdm_request_header_tab%ROWTYPE;
BEGIN
   IF (action_ = 'CHECK') THEN
      NULL;
   ELSIF (action_ = 'DO') THEN
      rec_ := Lock_By_Id___(objid_, objversion_);
      Finite_State_Machine___(rec_, 'Transfer', attr_);
      objversion_ := to_char(rec_.rowversion,'YYYYMMDDHH24MISS');
      Finite_State_Add_To_Attr___(rec_, attr_);
   END IF;
   info_ := Client_SYS.Get_All_Info;
END Transfer__;

-------------------- FOUNDATION1 METHODS ------------------------------------


-- Language_Refreshed
--   Framework method that updates translations to a new language.
@UncheckedAccess
PROCEDURE Language_Refreshed
IS
BEGIN
   Domain_SYS.Language_Refreshed(lu_name_, Get_Client_Values___, Get_Db_Values___, 'STATE');
END Language_Refreshed;


-- Init
--   Framework method that initializes this package.
@UncheckedAccess
PROCEDURE Init
IS
BEGIN
   Domain_SYS.Load_State(lu_name_, Get_Client_Values___, Get_Db_Values___);
END Init;

