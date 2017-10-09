-----------------------------------------------------------------------------
--
--  Logical unit: MdmBasicDataHeader
--  Component:    MDMGT
--
--  IFS Developer Studio Template Version 3.0
--
--  Date    Sign    History
--  ------  ------  ---------------------------------------------------------
-----------------------------------------------------------------------------

layer Core;

-------------------- PUBLIC DECLARATIONS ------------------------------------


-------------------- PRIVATE DECLARATIONS -----------------------------------


-------------------- LU SPECIFIC IMPLEMENTATION METHODS ---------------------

PROCEDURE Approval_Process__ (lu_name_ IN VARCHAR2,
                              attr_   IN VARCHAR2)
IS

         ptr_          NUMBER;
         name_         VARCHAR2(30);
         value_        VARCHAR2(32000);
         template_id_  varchar2(200);
         revision_     varchar2(200);
         profile_id_   VARCHAR2(200);
         mesg_         VARCHAR2(32000);
         new_access_person_  VARCHAR2(2000);
         new_access_group_   VARCHAR2(2000);
   BEGIN
     ptr_ := null;
   WHILE (Client_SYS.Get_Next_From_Attr(attr_, ptr_, name_, value_)) LOOP
            CASE name_
            WHEN ('TEMPLATE_ID') THEN
               template_id_ := value_;
            WHEN ('REVISION') THEN
               revision_ := Client_SYS.Attr_Value_To_Number(value_);         
            WHEN ('PROFILE_ID') THEN
               profile_id_ := value_;
            ELSE
               Client_SYS.Add_To_Attr(name_, value_, mesg_);
            END CASE;
         END LOOP;  
               
     APPROVAL_ROUTING_API.COPY_APP_PROFILE (new_access_person_,
                                                   new_access_group_ ,
                                                   lu_name_          ,
                                                   'TEMPLATE_ID='||template_id_||'^REVISION='||revision_||'^',
                                                   profile_id_ );
     trace_sys.Message('new_access_person_' || new_access_person_);
     trace_sys.Message('new_access_group_' || new_access_group_);
     trace_sys.Message('lu_name_' || lu_name_);
     trace_sys.Message('profile_id_' || profile_id_);
   
END Approval_Process__;

@Override
PROCEDURE Prepare_Insert___ (
   attr_ IN OUT VARCHAR2 )
IS
BEGIN  
   SUPER(attr_);
   Client_SYS.Add_To_Attr('REVISION', 1, attr_);
   Client_SYS.Add_To_Attr('STATUS', 'New', attr_);
   Client_SYS.Add_To_Attr('CREATED_BY', fnd_session_api.Get_Fnd_User, attr_);
   Client_SYS.Add_To_Attr('CREATED_DATE', SYSDATE, attr_);   
END Prepare_Insert___;


@Override
PROCEDURE Modify__ (
   info_       OUT    VARCHAR2,
   objid_      IN     VARCHAR2,
   objversion_ IN OUT VARCHAR2,
   attr_       IN OUT VARCHAR2,
   action_     IN     VARCHAR2 )
IS
    status__     VARCHAR2(25);
   CURSOR c1 IS
   select status from MDM_BASIC_DATA_HEADER v
 where v.objid = objid_
 and v.objversion = objversion_;
BEGIN
   OPEN c1 ;
    FETCH c1 INTO status__ ;
    CLOSE c1;
    IF status__ = 'Active' THEN
   Error_SYS.Record_General(lu_name_,'   :  You can''t Update any Data. Because of Status is '||status__);
    ELSE       
   --Add pre-processing code here
   super(info_, objid_, objversion_, attr_, action_);
   --Add post-processing code here
    END IF;
END Modify__;



-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------

