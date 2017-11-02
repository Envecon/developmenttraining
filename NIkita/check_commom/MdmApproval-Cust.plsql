-----------------------------------------------------------------------------
--
--  Logical unit: MdmApproval
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
   newrec_     IN OUT mdm_approval_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2 )
IS
BEGIN
   newrec_.key_ref := 'REQUEST_NO^'||newrec_.REQUEST_NO||'TEMPLATE_ID^'||newrec_.TEMPLATE_ID||'REVISION^'||newrec_.REVISION||'^STEP_NO'||newrec_.STEP_NO||'^';
   --Add pre-processing code here
   super(objid_, objversion_, newrec_, attr_);
   --Add post-processing code here
END Insert___;

@Override
PROCEDURE Prepare_Insert___ (
   attr_ IN OUT VARCHAR2 )
IS
BEGIN
   --Add pre-processing code here
   super(attr_);
   --Add post-processing code here
   Client_SYS.Add_To_Attr('LU_NAME', lu_name_, attr_);
END Prepare_Insert___;


@Override
PROCEDURE Check_Common___ (
   oldrec_ IN     mdm_approval_tab%ROWTYPE,
   newrec_ IN OUT mdm_approval_tab%ROWTYPE,
   indrec_ IN OUT Indicator_Rec,
   attr_   IN OUT VARCHAR2 )
IS
   status_ VARCHAR2(15);
   CURSOR get_status is
  SELECT state 
   FROM Mdm_Request_Header
   WHERE template_id = oldrec_.template_id
   AND Request_no = oldrec_.Request_no
   AND Revision = oldrec_.Revision ;
   
BEGIN
   OPEN get_status;
   FETCH get_status INTO status_;
   CLOSE get_status;
   
   IF status_ IN ('Completed','Cancelled') THEN
      Error_SYS.Record_General(lu_name_,'When State is '||status_||' You Cant Modify Data.');
       
   --Add post-processing code here
  
   END IF;
    super(oldrec_, newrec_, indrec_, attr_);
    
END Check_Common___;




PROCEDURE CcEvent_Action__ (template_id_ IN VARCHAR2, revision_ IN VARCHAR2, request_no_ IN VARCHAR2, event_ IN VARCHAR2,key_ref_ IN VARCHAR2,step_no_ IN VARCHAR2, forwarded_to_ IN VARCHAR2)
   IS 
  v_tot_count_     NUMBER;
  v_tot_app_count_ NUMBER;
  info1_           VARCHAR2(2000);
  info_            VARCHAR2(2000);
  objid1_          varchar2(50);
  objversion1_     varchar2(50);
  objid_           varchar2(50);
  objversion_      varchar2(50);
  action_          varchar2(10) := 'DO';
  action1_         varchar2(10) := 'DO';
  attr_            varchar2(32000);
  --template_id_     varchar2(200) := 'TEST1';
  --revision_        varchar2(10) := '1';
  --lu_name_         varchar2(50) := 'MdmApproval';
 -- request_no_      varchar2(50) := '14';
 -- event_           varchar2(50) := 'Forwarreded';
  --key_ref_         varchar2(100);
 -- step_no_         varchar2(20) := '30';
 -- forwarded_to_    varchar2(20) := 'IFSAPP';
  rec_             mdm_request_header_tab%rowtype;
  n_count_         number;

  cursor cGetreq_no(key_ref_ varchar2) is
    select v.objid, v.objversion
      from mdm_request_header V
     WHERE request_no = request_no_
       and revision = revision_
       and template_id = template_id_;
  cursor cGetTotCount(key_ref_ varchar2) is
    select count(*)
      from MDM_APPROVAL_TAB V
     WHERE V.lu_name = lu_name_
       and v.key_ref = key_ref_;

  cursor cGetTotAppCount(key_ref_ varchar2) is
    select count(*) + 1
      from MDM_APPROVAL_TAB V
     WHERE V.lu_name = lu_name_
       and v.key_ref = key_ref_
       and v.approval_status = 'Approved'
       and v.step_no < step_no_;
  v_state_ varchar2(50);
  cursor cGetTotRejCount(key_ref_ varchar2, LINE_NO_ VARCHAR2) is
    select count(V.approval_status)
      from MDM_APPROVAL_TAB V
     WHERE V.lu_name = lu_name_
       and v.approval_status like 'Reject%'
       AND V.STEP_NO != LINE_NO_
       and v.key_ref = key_ref_;
  cursor cGetTotApprCount(key_ref_ varchar2, LINE_NO_ VARCHAR2) is
    select count(V.approval_status)
      from MDM_APPROVAL_TAB V
     WHERE V.lu_name = lu_name_
       and v.approval_status like 'Appr%'
       AND V.STEP_NO != LINE_NO_
       and v.key_ref = key_ref_;
  v_appr_count_ number;
  v_rej_count_  NUMBER;
  cursor cGetCurrOper(key_ref_ varchar2, LINE_NO_ VARCHAR2) is
    select count(V.approval_status)
      from MDM_APPROVAL_TAB V
     WHERE V.lu_name = lu_name_
       and V.STEP_NO != LINE_NO_
       and v.key_ref = key_ref_;

begin
  dbms_output.put_line('1');

  --key_ref_ := 'REQUEST_NO^14TEMPLATE_ID^TEST1REVISION^1^';
  SELECT objid, objversion
    INTO objid_, objversion_
    FROM mdm_approval
   WHERE template_id = template_id_
     AND revision = revision_
     AND request_no = request_no_
     AND key_ref = key_ref_
     AND lu_name = lu_name_
     AND step_no = step_no_;
  SELECT objid, objversion
    INTO objid1_, objversion1_
    FROM mdm_request_header
   WHERE template_id = template_id_
     AND revision = revision_
     AND request_no = request_no_;
  if event_ IN ('Approved') then
    dbms_output.put_line('2');
    open cGetreq_no(key_ref_);
    fetch cGetreq_no
      into objid1_, objversion1_;
    close cGetreq_no;
    open cGetTotCount(key_ref_);
    fetch cGetTotCount
      into v_tot_count_;
    close cGetTotCount;
    open cGetTotAppCount(key_ref_);
    fetch cGetTotAppCount
      into v_tot_app_count_;
    close cGetTotAppCount;
  
    if v_tot_app_count_ = 0 then
      null;
    elsif v_tot_count_ = 0 then
      null;
    elsif v_tot_app_count_ = 0 and v_tot_count_ = 0 then
      null;
    elsif (v_tot_app_count_ / v_tot_count_) = 0 OR (v_tot_app_count_ / v_tot_count_) = 1 THEN 
      dbms_output.put_line('3');
      dbms_output.put_line('********Partially Approved  ' ||v_tot_app_count_ / v_tot_count_);
      v_state_ := NULL;
      select c.state
        into v_state_
        from mdm_request_header c
       where c.objid = objid1_
         and c.objversion = objversion1_;
      if v_state_ != 'Released' then
        dbms_output.put_line('4');
        open cGetTotRejCount(key_ref_, step_no_);
        fetch cGetTotRejCount
          into v_rej_count_;
        close cGetTotRejCount;
        DBMS_OUTPUT.PUT_LINE('v_rej_count_  --> ' || v_rej_count_);
        if v_rej_count_ = 0 then
          info1_       := NULL;
          objid1_      := NULL;
          objversion1_ := NULL;
          open cGetreq_no(key_ref_);
          fetch cGetreq_no
            into objid1_, objversion1_;
          close cGetreq_no;
          CLIENT_SYS.Clear_Attr(attr_);
          CLIENT_SYS.Add_To_Attr('APPROVAL_REJECTED', '', attr_);
          MDM_REQUEST_HEADER_API.MODIFY__(info1_,
                                          objid1_,
                                          objversion1_,
                                          attr_,
                                          action_);
        end if;
      
        dbms_output.put_line('5');
        mdm_request_header_api.Release__(info1_,
                                         objid1_,
                                         objversion1_,
                                         attr_,
                                         action_);
      END IF;
    else
      TRACE_SYS.Message('********Partially Approved');
      dbms_output.put_line('6');
      v_state_ := NULL;
      select c.state
        into v_state_
        from mdm_request_header c
       where c.objid = objid1_
         and c.objversion = objversion1_;
      open cGetTotRejCount(key_ref_, step_no_);
      fetch cGetTotRejCount
        into v_rej_count_;
      close cGetTotRejCount;
      if v_rej_count_ = 0 then
        CLIENT_SYS.Clear_Attr(attr_);
        CLIENT_SYS.Add_To_Attr('APPROVAL_REJECTED', '', attr_);
        MDM_REQUEST_HEADER_API.MODIFY__(info1_,
                                        objid1_,
                                        objversion1_,
                                        attr_,
                                        action_);
      end if;
      if v_state_ != 'Partially Approved' then
        dbms_output.put_line('7');
        mdm_request_header_api.Partially_Approve__(info1_,
                                                   objid1_,
                                                   objversion1_,
                                                   attr_,
                                                   action_);
        CLIENT_SYS.Clear_Attr(attr_);
        CLIENT_SYS.Add_To_Attr('APPROVAL_REJECTED', '', attr_);
        MDM_REQUEST_HEADER_API.MODIFY__(info1_,
                                        objid1_,
                                        objversion1_,
                                        attr_,
                                        action_);
      end if;
    end if;
    dbms_output.put_line('8');
    Client_Sys.Clear_Attr(attr_);
    Client_Sys.Add_To_Attr('PERSON_ID',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('APPROVER',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('APPROVER_NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('APPROVAL_DATE', SYSDATE, attr_);
    Client_Sys.Add_To_Attr('APPROVAL_STATUS', 'Approved', attr_);
    Client_Sys.Add_To_Attr('REVOKED_ID', '', attr_);
    Client_Sys.Add_To_Attr('REVOKED_NAME', '', attr_);
    Client_Sys.Add_To_Attr('REVOKED_DATE', '', attr_);
    mdm_approval_api.MODIFY__(info_, objid_, objversion_, attr_, action_);
  ELSIF event_ IN ('Rejected') THEN
    dbms_output.put_line('9');
    OPEN cGetTotApprCount(key_ref_, step_no_);
    FETCH cGetTotApprCount
      INTO v_appr_count_;
    CLOSE cGetTotApprCount;
    DBMS_OUTPUT.put_line(' v_appr_count_ --> ' || v_appr_count_);
    IF v_appr_count_ = 0 THEN
      dbms_output.put_line('10');
      UPDATE mdm_request_header_tab
         SET rowstate = 'New', APPROVAL_REJECTED = 'TRUE'
       WHERE template_id = template_id_
         AND revision = revision_
         AND request_no = request_no_;
    ELSE
    
      UPDATE mdm_request_header_tab
         SET rowstate = 'Partially Approved', APPROVAL_REJECTED = 'TRUE'
       WHERE template_id = template_id_
         AND revision = revision_
         AND request_no = request_no_;
    
    END IF;
    Client_Sys.Clear_Attr(attr_);
    Client_Sys.Add_To_Attr('PERSON_ID',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('APPROVAL_STATUS', 'Rejected', attr_);
    mdm_approval_api.MODIFY__(info_, objid_, objversion_, attr_, action_);
    dbms_output.put_line('11');
  ELSIF event_ IN ('Revoked') THEN
    Client_Sys.Clear_Attr(attr_);
    Client_Sys.Add_To_Attr('PERSON_ID',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('REVOKED_ID',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('REVOKED_NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('REVOKED_DATE', SYSDATE, attr_);
    Client_Sys.Add_To_Attr('APPROVER',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('APPROVER_NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('APPROVAL_DATE', SYSDATE, attr_);
    Client_Sys.Add_To_Attr('APPROVAL_STATUS', 'Revoked', attr_);
    mdm_approval_api.MODIFY__(info_, objid_, objversion_, attr_, action_);
    OPEN cGetCurrOper(key_ref_, step_no_);
    FETCH cGetCurrOper
      into n_count_;
    CLOSE cGetCurrOper;
    v_tot_count_ := 0;
    open cGetTotCount(key_ref_);
    fetch cGetTotCount
      into v_tot_count_;
    close cGetTotCount;
    dbms_output.put_line('12');
    IF n_count_ = 0 THEN
      UPDATE mdm_request_header_tab
         SET rowstate = 'New'
       WHERE template_id = template_id_
         AND revision = revision_
         AND request_no = request_no_;
    elsif (v_tot_count_ - n_count_) = 1 then
      dbms_output.put_line('dfsgdsfg');
      UPDATE mdm_request_header_tab
         SET rowstate = 'Partially Approved'
       WHERE template_id = template_id_
         AND revision = revision_
         AND request_no = request_no_;
    
      dbms_output.put_line('13');
    END IF;
  ELSIF event_ = 'Forwarreded' THEN
    if Person_Info_Api.Get_Id_For_User(forwarded_to_) is null then
      Error_Sys.Record_General(lu_name_,
                               'NOTEXIST: Person Info Doesn''t exists. Please check Person info in Person Information..!');
    end if;
    Client_Sys.Clear_Attr(attr_);
    Client_Sys.Add_To_Attr('PERSON_ID',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('NAME',
                           Person_Info_Api.Get_Name(Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User)),
                           attr_);
    Client_Sys.Add_To_Attr('FORWARDED_BY',
                           Person_Info_Api.Get_Id_For_User(Fnd_Session_API.Get_Fnd_User),
                           attr_);
    Client_Sys.Add_To_Attr('FORWARDED_TO', forwarded_to_, attr_);
    Client_Sys.Add_To_Attr('FORWARDED_DATE', SYSDATE, attr_);
    Client_Sys.Add_To_Attr('APPROVAL_STATUS', 'Forwarred', attr_);
    dbms_output.put_line('14');
    mdm_approval_api.MODIFY__(info_, objid_, objversion_, attr_, action_);
  end if;
END CcEvent_Action__;



-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------

