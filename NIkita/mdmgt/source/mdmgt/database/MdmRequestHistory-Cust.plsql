-----------------------------------------------------------------------------
--
--  Logical unit: MdmRequestHistory
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
PROCEDURE Insert___ (
   objid_      OUT    VARCHAR2,
   objversion_ OUT    VARCHAR2,
   newrec_     IN OUT MDM_REQUEST_HISTORY_TAB%ROWTYPE,
   attr_       IN OUT VARCHAR2 )
IS
BEGIN
   newrec_.seq_no := Generate_Seq_No___(newrec_.template_id , newrec_.revision);
   newrec_.mod_by := Fnd_Session_API.Get_Fnd_User();   
   newrec_.mod_date := Get_Date___(newrec_.template_id , newrec_.revision);
super(objid_, objversion_, newrec_, attr_);
EXCEPTION
   WHEN dup_val_on_index THEN
      Error_SYS.Record_Exist(lu_name_);
END Insert___;


@Override
PROCEDURE Update___ (
   objid_      IN     VARCHAR2,
   oldrec_     IN     MDM_REQUEST_HISTORY_TAB%ROWTYPE,
   newrec_     IN OUT MDM_REQUEST_HISTORY_TAB%ROWTYPE,
   attr_       IN OUT VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   by_keys_    IN     BOOLEAN DEFAULT FALSE )
IS
BEGIN
   newrec_.mod_date := Get_Date___(newrec_.template_id , newrec_.revision);
   newrec_.mod_by := Fnd_Session_API.Get_Fnd_User(); 
   super(objid_, oldrec_, newrec_, attr_, objversion_, by_keys_);
EXCEPTION
   WHEN dup_val_on_index THEN
      Error_SYS.Record_Exist(lu_name_);
END Update___;


-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------

FUNCTION Get_Date___(
      template_id_     mdm_request_history_tab.template_id%TYPE,
      revision_  mdm_request_history_tab.revision%TYPE)  RETURN DATE
IS 
   temp_date_ DATE;
   CURSOR get_temp_date IS
   SELECT Requested_Date
   FROM Mdm_Request_Header_tab
   WHERE  template_id = template_id_  AND revision = revision_;
   BEGIN
   OPEN get_temp_date;
   FETCH get_temp_date INTO temp_date_;
   CLOSE get_temp_date;   
   RETURN temp_date_;
END Get_Date___; 


FUNCTION Generate_Seq_No___(
      template_id_     mdm_request_history_tab.template_id%TYPE,
      revision_  mdm_request_history_tab.revision%TYPE )  RETURN NUMBER
IS 
   temp_    NUMBER;
   CURSOR get_seqno IS
      SELECT NVL(max(SEQ_NO),0)
      FROM mdm_request_history_tab
      WHERE  template_id = template_id_  AND revision = revision_;  
BEGIN
   OPEN get_seqno;
   FETCH get_seqno INTO temp_;
   CLOSE get_seqno;   
   RETURN temp_+1;
END Generate_Seq_No___; 



   
-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------


PROCEDURE Add_Mdm_Req_history_Entry (
   attr_ IN OUT VARCHAR2 )
IS
   info_          VARCHAR2(2000);
   objid_         VARCHAR2(20);
   objversion_    VARCHAR2(2000);
BEGIN
   New__ (info_, objid_, objversion_, attr_, 'DO');
END Add_Mdm_Req_history_Entry;


PROCEDURE Remove_Mdm_Req_history_Record (
   template_id_     mdm_request_history_tab.template_id%TYPE,
      revision_  mdm_request_history_tab.revision%TYPE)
IS 
BEGIN
   DELETE 
      FROM mdm_request_history_tab
      WHERE template_id = template_id_ AND 
      revision = revision_  ;
END Remove_Mdm_Req_history_Record;  