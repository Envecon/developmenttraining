-----------------------------------------------------------------------------
--
--  Logical unit: MdmRequestHeader
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
   Client_SYS.Add_To_Attr('REQUEST_NO', MDM_REQUEST_NO_SEQ.NEXTVAL, attr_);
   Client_SYS.Add_To_Attr('REQUESTED_BY', fnd_session_api.Get_Fnd_User, attr_);
   Client_SYS.Add_To_Attr('REQUESTED_DATE', SYSDATE, attr_);
  -- Client_SYS.Add_To_Attr('STATE', 'New', attr_);
  
END Prepare_Insert___;

@Override
PROCEDURE Finite_State_Machine___ (
   rec_   IN OUT mdm_request_header_tab%ROWTYPE,
   event_ IN     VARCHAR2,
   attr_  IN OUT VARCHAR2 )
IS
   state_ mdm_request_header_tab.rowstate%TYPE;  
BEGIN
 
   --Add pre-processing code here
   super(rec_, event_, attr_);
   --Add post-processing code here
     state_ := rec_.rowstate;
   IF(rec_.rowstate IS NULL) THEN
   Add_Mdm_History_Entry___(rec_.template_id, rec_.revision, 'New',rec_.request_no);
   ELSE
   Add_Mdm_History_Entry___(rec_.template_id, rec_.revision, state_,rec_.request_no);
END IF;
END Finite_State_Machine___;




PROCEDURE Cc_Approval_Process__ (
      new_access_person_ OUT VARCHAR2,
      new_access_group_  OUT VARCHAR2,
      lu_name_           IN VARCHAR2,
      newrec_     IN OUT NOCOPY mdm_request_header_tab%ROWTYPE) 
      
IS
    info_             VARCHAR2(2000);
      attr_             VARCHAR2(30000);
      objversion_       VARCHAR2(260);
      objid_            VARCHAR2(50);
      step_no_max_      NUMBER;
      doc_class_        VARCHAR2(12);
      doc_no_           VARCHAR2(120);
      doc_sheet_        VARCHAR2(20);
      doc_rev_          VARCHAR2(6);
      objstate_         VARCHAR2(50);
      new_person_id_    VARCHAR2(30000);
      new_group_id_     VARCHAR2(30000);
      conn_desc_        APPROVAL_ROUTING_TAB.CONNECTION_DESCRIPTION%TYPE; -- Bug Id 110267, Changed to have the same type as the correcponding table column.
      sub_con_no_       VARCHAR2(60);
      valuation_no_     VARCHAR2(60);
      key_ref_          VARCHAR2(250);
      profile_id_       VARCHAR2(250);
      
   
      CURSOR object_copy IS
         SELECT line_no, step_no, person_id, description, group_id,security_checkpoint_req
         FROM   approval_template_tab
         WHERE  profile_id = profile_id_;
   BEGIN 
   key_ref_ := 'REQUEST_NO='||newrec_.REQUEST_NO||'^REVISION='||newrec_.REVISION||'^TEMPLATE_ID='||newrec_.TEMPLATE_ID||'^';
   profile_id_ := mdm_basic_data_header_api.Get_Profile_Id(newrec_.TEMPLATE_ID,newrec_.REVISION);
      Approval_Profile_Api.Exist(profile_id_);
   
      SELECT NVL(MAX(step_no), 0) INTO step_no_max_ FROM APPROVAL_ROUTING
         WHERE lu_name = lu_name_
         AND   key_ref = key_ref_;
   
      Object_Connection_SYS.Get_Connection_Description(conn_desc_,lu_name_,key_ref_);
      conn_desc_ := SUBSTR(conn_desc_, 1, 2000);     
      FOR object_ IN object_copy LOOP
         Approval_Routing_API.New__ (info_, objid_, objversion_, attr_, 'PREPARE');
     
         Client_SYS.Add_To_Attr( 'LU_NAME', lu_name_, attr_ );
         Client_SYS.Add_To_Attr( 'KEY_REF', key_ref_, attr_ );
         Client_SYS.Add_To_Attr( 'CONNECTION_DESCRIPTION', conn_desc_, attr_);
         Client_SYS.Add_To_Attr( 'LINE_NO', object_.line_no, attr_ );
         Client_SYS.Add_To_Attr( 'STEP_NO', (object_.step_no + step_no_max_), attr_ );
         Client_SYS.Add_To_Attr( 'DESCRIPTION', object_.description, attr_ );
         Client_SYS.Add_To_Attr( 'PERSON_ID', object_.person_id, attr_ );
         Client_SYS.Add_To_Attr( 'GROUP_ID', object_.group_id, attr_ );
         IF object_.security_checkpoint_req IS NOT NULL THEN
            Client_SYS.Set_Item_Value('SECURITY_CHECKPOINT_REQ', object_.security_checkpoint_req,  attr_);
         END IF;   
         Approval_Routing_API.New__ (info_, objid_, objversion_, attr_, 'DO');
      END LOOP;
   
      IF (new_person_id_ = ', ') THEN
         new_person_id_ := '';
      ELSIF ( new_group_id_ = ', ') THEN
         new_group_id_ := '' ;
      END IF;
   
      new_access_person_ := Ltrim(new_person_id_, ',');
      new_access_group_  := Ltrim(new_group_id_, ',');
   
      IF (lu_name_ = 'DocIssue') THEN
         DOC_ISSUE_API.Update_Profile_Id__(doc_class_, doc_no_, doc_sheet_, doc_rev_, profile_id_, 'TRUE');
      END IF;
   END Cc_Approval_Process__;
   
   @Override
   PROCEDURE Insert___ (
      objid_      OUT    VARCHAR2,
      objversion_ OUT    VARCHAR2,
      newrec_     IN OUT mdm_request_header_tab%ROWTYPE,
      attr_       IN OUT VARCHAR2 )
   IS
      new_access_person_  VARCHAR2(2000);
      new_access_group_   VARCHAR2(2000);
      v_app_prof_         NUMBER ;
    

   BEGIN  
      SELECT  count(profile_id) INTO v_app_prof_ from mdm_basic_data_header
where template_id = newrec_.TEMPLATE_ID
and revision = newrec_.REVISION;
      IF v_app_prof_ > 0 THEN
         newrec_.APPROVAL_REQUIRED := 'TRUE';
         Cc_Approval_Process__(new_access_person_,
      new_access_group_,
      lu_name_,
      newrec_);
      END IF;
    
      --Add pre-processing code here
      super(objid_, objversion_, newrec_, attr_);
      --Add post-processing code here
 Command_Sys.Mail('IFSAPP','akhilendra.singh@logstarerp.com',
'**Do not reply to sender. This is system generated mail **' ||chr(9)||chr(9)||
'Dear All' ||chr(9)||chr(9)||
'MDM Request No: '||newrec_.REQUEST_NO|| ' is Created By ' || Fnd_Session_Api.Get_Fnd_User||chr(9)||chr(9)||
'-----Message End----',
'error',
null,
Pers_comms_Work_API.Get_Work_Email('10', '1002'),
'MDM Request No: '||newrec_.REQUEST_NO ||' Created',
null,null,null,null); 
   END Insert___;
   
   @Override
   PROCEDURE Partially_Approve__ (
      info_       OUT    VARCHAR2,
      objid_      IN     VARCHAR2,
      objversion_ IN OUT VARCHAR2,
      attr_       IN OUT VARCHAR2,
      action_     IN     VARCHAR2 )
   IS
      cursor c1
is
select v.request_no from mdm_request_header v
where v.objid = objid_;
request_no_     varchar2(200);
   BEGIN
      --Add pre-processing code here
      super(info_, objid_, objversion_, attr_, action_);
      --Add post-processing code here
      OPEN c1;
      FETCH c1 INTO request_no_;
      CLOSE c1;
 Command_Sys.Mail('IFSAPP','akhilendra.singh@logstarerp.com',
'**Do not reply to sender. This is system generated mail **' ||chr(9)||chr(9)||
'Dear All' ||chr(9)||chr(9)||
'MDM Request No: '||request_no_|| 'status changed to "Partially Approved" by ' || Fnd_Session_Api.Get_Fnd_User||chr(9)||chr(9)||
'-----Message End----',
'error',
null,
Pers_comms_Work_API.Get_Work_Email('10', '1002'),
'MDM Request No'||request_no_ ||'Status Changed ',
null,null,null,null);
   END Partially_Approve__;
  
      
  /* @Override
   PROCEDURE Approve__ (
      info_       OUT    VARCHAR2,
      objid_      IN     VARCHAR2,
      objversion_ IN OUT VARCHAR2,
      attr_       IN OUT VARCHAR2,
      action_     IN     VARCHAR2 )
   IS
       cursor c1
is
select v.request_no from mdm_request_header v
where v.objid = objid_;
request_no_     varchar2(200);
   BEGIN
      --Add pre-processing code here
      super(info_, objid_, objversion_, attr_, action_);
      --Add post-processing code here
      OPEN c1;
      FETCH c1 INTO request_no_;
      CLOSE c1;
 Command_Sys.Mail('IFSAPP','akhilendra.singh@logstarerp.com',
'**Do not reply to sender. This is system generated mail **' ||chr(9)||chr(9)||
'Dear All' ||chr(9)||chr(9)||
'MDM Request No: '||request_no_|| 'status changed to "Approved" by ' || Fnd_Session_Api.Get_Fnd_User||chr(9)||chr(9)||
'-----Message End----',
'error',
null,
Pers_comms_Work_API.Get_Work_Email('10', '1002'),
'MDM Request No'||request_no_||'Status Changed',
null,null,null,null);
   END Approve__;*/
   
     @Override
   PROCEDURE Release__ (
      info_       OUT    VARCHAR2,
      objid_      IN     VARCHAR2,
      objversion_ IN OUT VARCHAR2,
      attr_       IN OUT VARCHAR2,
      action_     IN     VARCHAR2 )
   IS
       cursor c1
is
select v.request_no from mdm_request_header v
where v.objid = objid_;
request_no_     varchar2(200);
   BEGIN
      --Add pre-processing code here
      super(info_, objid_, objversion_, attr_, action_);
      --Add post-processing code here
      OPEN c1;
      FETCH c1 INTO request_no_;
      CLOSE c1;
 Command_Sys.Mail('IFSAPP','akhilendra.singh@logstarerp.com',
'**Do not reply to sender. This is system generated mail **' ||chr(9)||chr(9)||
'Dear All' ||chr(9)||chr(9)||
'MDM Request No: '||request_no_|| 'status changed to "Released" by ' || Fnd_Session_Api.Get_Fnd_User||chr(9)||chr(9)||
'-----Message End----',
'error',
null,
Pers_comms_Work_API.Get_Work_Email('10', '1002'),
'MDM Request No'||request_no_||'Status Changed',
null,null,null,null);
   END Release__;
   
   @Override
   PROCEDURE Partial_Transfer__ (
      info_       OUT    VARCHAR2,
      objid_      IN     VARCHAR2,
      objversion_ IN OUT VARCHAR2,
      attr_       IN OUT VARCHAR2,
      action_     IN     VARCHAR2 )
   IS
        cursor c1
is
select v.request_no from mdm_request_header v
where v.objid = objid_;
request_no_     varchar2(200);
   BEGIN
      --Add pre-processing code here
      super(info_, objid_, objversion_, attr_, action_);
      --Add post-processing code here
      OPEN c1;
      FETCH c1 INTO request_no_;
      CLOSE c1;
 Command_Sys.Mail('IFSAPP','akhilendra.singh@logstarerp.com',
'**Do not reply to sender. This is system generated mail **' ||chr(9)||chr(9)||
'Dear All' ||chr(9)||chr(9)||
'MDM Request No: '||request_no_|| 'status changed to "Partially Transfered" by ' || Fnd_Session_Api.Get_Fnd_User||chr(9)||chr(9)||
'-----Message End----',
'error',
null,
Pers_comms_Work_API.Get_Work_Email('10', '1002'),
'MDM Request No'||request_no_||'Status Changed',
null,null,null,null);
   END Partial_Transfer__;
    @Override
   PROCEDURE Transfer__ (
      info_       OUT    VARCHAR2,
      objid_      IN     VARCHAR2,
      objversion_ IN OUT VARCHAR2,
      attr_       IN OUT VARCHAR2,
      action_     IN     VARCHAR2 )
   IS
   cursor c1
is
select v.request_no from mdm_request_header v
where v.objid = objid_;
request_no_     varchar2(200);
   BEGIN
      --Add pre-processing code here
      super(info_, objid_, objversion_, attr_, action_);
      --Add post-processing code here
       OPEN c1;
      FETCH c1 INTO request_no_;
      CLOSE c1;
 Command_Sys.Mail('IFSAPP','akhilendra.singh@logstarerp.com',
'**Do not reply to sender. This is system generated mail **' ||chr(9)||chr(9)||
'Dear All' ||chr(9)||chr(9)||
'MDM Request No: '||request_no_|| 'status changed to "Transfered" by ' || Fnd_Session_Api.Get_Fnd_User||chr(9)||chr(9)||
'-----Message End----',
'error',
null,
Pers_comms_Work_API.Get_Work_Email('10', '1002'),
'MDM Request No'||request_no_||'Status Changed',
null,null,null,null);
   END Transfer__;
   
   
   PROCEDURE Add_Mdm_History_Entry___(
   template_id_       IN mdm_request_history_tab.template_id%TYPE,
   revision_    IN mdm_request_history_tab.template_id%TYPE,
   history_status_   IN mdm_request_history_tab.history_status%TYPE,
   request_no_ IN mdm_request_history_tab.request_no%TYPE)
  
IS
  mdm_history_attr_    VARCHAR2(4000);
BEGIN 
   Client_SYS.Add_To_Attr( 'TEMPLATE_ID', template_id_, mdm_history_attr_ );
   Client_SYS.Add_To_Attr( 'REVISION', revision_, mdm_history_attr_ );
   Client_SYS.Add_To_Attr( 'HISTORY_STATUS',history_status_, mdm_history_attr_ );
  Client_SYS.Add_To_Attr( 'REQUEST_NO',request_no_, mdm_history_attr_ );

   Mdm_Request_History_API.Add_Mdm_Req_History_Entry(mdm_history_attr_);
   
END Add_Mdm_History_Entry___;

   
 
   
   
   
   
   
   
   
   
-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------

