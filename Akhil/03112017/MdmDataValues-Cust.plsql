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
   Client_SYS.Add_To_Attr('ID', 1, attr_);
END Prepare_Insert___;

@Override
PROCEDURE Insert___ (
   objid_      OUT    VARCHAR2,
   objversion_ OUT    VARCHAR2,
   newrec_     IN OUT mdm_data_values_tab%ROWTYPE,
   attr_       IN OUT VARCHAR2 )
IS
BEGIN
   newrec_.id := Generate_Id_(newrec_.template_id , newrec_.revision);
   --Add pre-processing code here
   super(objid_, objversion_, newrec_, attr_);
   --Add post-processing code here
END Insert___;

  FUNCTION Generate_Id_(
      template_id_     VARCHAR2,
      revision_  NUMBER)  RETURN NUMBER
IS 
   temp_    NUMBER;
   CURSOR get_id IS
       SELECT NVL(max(id),0)
      FROM mdm_data_values_tab
      WHERE  template_id = template_id_  AND revision = revision_;  
BEGIN
   OPEN get_id;
   FETCH get_id INTO temp_;
   CLOSE get_id;   
   RETURN temp_+1;
END Generate_Id_; 

PROCEDURE Mdm_Get_Column_Names (
   msg_              OUT VARCHAR2,
   template_id_ IN  VARCHAR2,
   revision_   IN  VARCHAR2  )
IS
      detail_msg_     VARCHAR2(30000);
      line_msg_       VARCHAR2(1000);
      i_              PLS_INTEGER := 1;
      CURSOR get_attr IS
    /*   select  S.TEMPLATE_ID,S.REVISION,S.DESCRIPTION,S.DATA_TYPE,S.Column_Name,
DECODE(S.DATA_TYPE,'VARCHAR2','S','NUMBER','N','DATE','D')||ROW_NUMBER() OVER (PARTITION BY S.DATA_TYPE order  BY S.TEMPLATE_ID,S.REVISION,S.COLUMN_NAME,S.DATA_TYPE ) destination_column
--(DECODE(S.DATA_TYPE,'VARCHAR2','S','NUMBER','N','DATE','D')||rownum ) destination_column
 from mdm_source_map_tab s,mdm_basic_data_header_tab a 
--from MDM_GENERAL s,mdm_basic_data_header_tab a 
where a.template_id=s.template_id
AND a.revision=s.revision
AND S.template_id = template_id_
AND S.revision=revision_
AND (s.default_value is not null
OR s.Mandatory ='TRUE');*/
--(+)BHBEIN (START)
select aa.* from (
select  S.TEMPLATE_ID,S.REVISION,S.DESCRIPTION,S.DATA_TYPE,S.Column_Name,
DECODE(S.DATA_TYPE,'VARCHAR2','S','NUMBER','N','DATE','D')||ROW_NUMBER() OVER (PARTITION BY S.DATA_TYPE order  BY S.TEMPLATE_ID,S.REVISION,S.COLUMN_NAME,S.DATA_TYPE ) destination_column
from mdm_source_map_tab s,mdm_basic_data_header_tab a 
where a.template_id=s.template_id
AND a.revision=s.revision
AND S.template_id = template_id_
AND S.revision = revision_
AND (s.default_value is not null
OR s.Mandatory ='TRUE'))aa, user_tab_columns s
where s.table_name = regexp_substr(aa.Column_Name,'[^.]+',1,1)
and s.COLUMN_NAME = regexp_substr(aa.Column_Name,'[^.]+',1,2)
order by s.COLUMN_ID;
--(+)BHBEIN (END)
   BEGIN
      msg_     := NULL;
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
   
   
   PROCEDURE CreateMasterData_(request_no_ IN varchar2)
   IS
--request_no_  number := 1;
rec_     VARCHAR2(32000);
action_      varchar2(20) := 'DO';
cursor get_no_records
is
SELECT COUNT(*) FROM MDM_DATA_VALUES V
WHERE V.request_no = request_no_
;
cursor get_Columns
is
/* select regexp_substr(v.column_name,'[^.]+',1,2) column_name,
v.data_type,
decode(v.data_type,'VARCHAR2','S','NUMBER','N','DATE','D')||
--ROW_NUMBER() OVER (PARTITION BY V.request_no,V.template_id,V.revision,V.data_type ORDER BY V.data_type) 
ROW_NUMBER() OVER (PARTITION BY V.data_type ORDER BY v.TEMPLATE_ID,v.REVISION,v.COLUMN_NAME,v.DATA_TYPE) DESG_COLUMN
from mdm_general v
where V.request_no =  request_no_;*/
select regexp_substr(v.column_name,'[^.]+',1,2) column_name,
v.data_type,
decode(v.data_type,'VARCHAR2','S','NUMBER','N','DATE','D')||
ROW_NUMBER() OVER (PARTITION BY V.data_type ORDER BY v.TEMPLATE_ID,v.REVISION,v.COLUMN_NAME,v.DATA_TYPE) DESG_COLUMN
from mdm_general v,user_tab_columns s
where s.table_name = regexp_substr(v.column_name,'[^.]+',1,1)
and s.COLUMN_NAME = regexp_substr(v.column_name,'[^.]+',1,2)
and V.request_no =  request_no_
order by s.COLUMN_ID;

cursor get_rowid(request_no_   number,line_no_ number)
is
select rowid from MDM_DATA_VALUES_tab v
where v.request_no = request_no_
and id = line_no_;
err_msg_      varchar2(2000);
rowid_     rowid;
count_    number;
result_s_     varchar2(2000);
result_n_     number;
script_      varchar2(32000);
result_d_     date;
package_name_    varchar2(200);
req_objver_    varchar2(200);
req_objid_      varchar2(200);
attr_            varchar2(32000);
packexist__      number;
--lu_name_     varchar2(200) := 'Mdm';
CUR         sys_refcursor;
on_new_    varchar2(5);
on_modify_     varchar2(5);
info_      varchar2(2000);
next_line_     varchar2(10) := chr(10);

cursor get_Package(templateid_ varchar2,revision_  number)
is
select v.template_id,
       v.revision,
       v.execute_seq,
       v.view_name,
       v.method_name,
       v.on_new,
       v.on_modify,
       method_name||decode(v.on_new,'TRUE','.New__','.Modify__') pck_methd from mdm_method_list v
where template_id = templateid_
and revision = revision_;
 rec2_  get_Package%rowtype;
 
 cursor get_req_info
 is 
 select * from mdm_request_header v
where objid = req_objid_
and objversion = req_objver_;

rec1_    get_req_info%rowtype;

objid_     VARCHAR2(200);
objversion_  VARCHAR2(200);

CURSOR pack_Exist(package_name_ varchar2)
is
select count(*) from all_objects
where object_name like regexp_substr(upper(package_name_),'[^.]+',1,1)
and object_type like 'PACKAGE';
client_sys_attr_  varchar2(32000);

begin
  SELECT COUNT(*) into count_ FROM MDM_DATA_VALUES V
WHERE V.request_no = request_no_
;
dbms_output.put_line('count_ -->'||count_);
select objid,objversion INTO req_objid_,req_objver_ from mdm_request_header
where request_no = request_no_;
/*req_objid_ := 'AACAxsAAFAACKUEAAA';
req_objver_ := '20171024132159';
*/
open get_req_info;
fetch get_req_info into rec1_;
close get_req_info;
 
 open get_Package(rec1_.template_id,rec1_.revision);
 fetch get_Package into rec2_;
 close get_Package;
 package_name_ := rec2_.pck_methd;
 on_new_     := rec2_.on_new;
 on_modify_   := rec2_.on_modify;
  dbms_output.put_line('package_name_ -->'||rec2_.pck_methd);
  dbms_output.put_line('on_new_ -->'||on_new_);
  dbms_output.put_line('on_modify_ -->'||on_modify_);
 select count(*) into packexist__ from all_objects
where object_name like regexp_substr(upper(rec2_.pck_methd),'[^.]+',1,1)
and object_type like 'PACKAGE';
dbms_output.put_line('packexist__ -->'||packexist__);
if packexist__ = 0 then
Error_Sys.Record_General(lu_name_,': Packaage Does not exist. Please check MDM Basic Data');
end if;
  
for i in 1..count_ loop

  begin
    objid_   := null;
    objversion_ := null;
  rowid_      := null;
  open get_rowid(request_no_ ,i);
  fetch get_rowid into rowid_;
  close get_rowid;
  Client_Sys_Attr_ := 'Client_Sys.Clear_Attr(attr_);'||next_line_;
  for j in get_Columns loop

 REC_ :=  'select 
            '||j.DESG_COLUMN||'
            from mdm_general v,MDM_DATA_VALUES C
            where V.request_no =  '''||request_no_||''''
            ||' AND V.request_no = C.request_no(+)
            and NVL(c.Row_Status,'*') != ''Transferred''
            and regexp_substr(v.column_name,''[^.]+'',1,2) =  '''||j.column_name||''''||'
            and C.id = '''||i||'''';
           
if j.DESG_COLUMN like 'S%' then
            open CUR for REC_;
            loop
            fetch CUR into result_s_;
             exit when CUR%notfound;
             end loop;
             IF result_s_ IS NOT NULL THEN
             Client_Sys_Attr_ := Client_Sys_Attr_||'Client_Sys.Add_To_Attr('''||j.column_name||''','''||result_s_||''',attr_);'||next_line_;
             Client_Sys.Add_To_Attr(j.column_name,result_s_,attr_);
             dbms_output.put_line('Client_Sys.Add_To_Attr('''||j.column_name||''','''||result_s_||''',attr_);');
             END IF;
  elsif j.DESG_COLUMN like 'N%' then

         open CUR for REC_;
            loop
            fetch CUR into result_n_;
             exit when CUR%notfound;
             end loop;
             IF result_n_ IS NOT NULL THEN
             Client_Sys_Attr_ := Client_Sys_Attr_||'Client_Sys.Add_To_Attr('''||j.column_name||''','||result_n_||',attr_);'||next_line_;
             Client_Sys.Add_To_Attr(j.column_name,result_n_,attr_);
            dbms_output.put_line('Client_Sys.Add_To_Attr('''||j.column_name||''','||result_n_||',attr_);');
             END IF;
    else
     
       open CUR for REC_;
     
            loop
            fetch CUR into result_d_;
             exit when CUR%notfound;
             end loop;
             IF result_d_ IS NOT NULL THEN
              Client_Sys_Attr_ := Client_Sys_Attr_||'Client_Sys.Add_To_Attr('''||j.column_name||''',TO_DATE('''||TO_CHAR(result_d_,'DD/MM/YYYY')||''',''DD/MM/YYYY''),attr_);'||next_line_;
             Client_Sys.Add_To_Attr(j.column_name,result_d_,attr_);
             dbms_output.put_line('Client_Sys.Add_To_Attr('''||j.column_name||''',TO_DATE('''||result_d_||''',''DD/MM/YYYY''),attr_);');
             END IF;
  end if;
    end loop;
    script_  := 'DECLARE '||next_line_||'ATTR_ VARCHAR2(32000);'||next_line_||'BEGIN '||next_line_||Client_Sys_Attr_ ||next_line_||'
    
    IFSAPP.'||package_name_||'(:a,:b,:c,ATTR_,:e);
    end;';
    dbms_output.put_line(package_name_);
    dbms_output.put_line(script_);
   @ApproveDynamicStatement(2017-11-02,ovjose)
    execute immediate script_ using  out info_, out objid_, out objversion_, in action_;
  UPDATE MDM_DATA_VALUES_TAB b
            SET b.Row_Status = 'Transferred',
            b.ERROR = 'Transfered  objid-->'||objid_ 
            WHERE ROWID = rowid_            
            ;  
  EXCEPTION
     WHEN OTHERS THEN
        err_msg_  := SUBSTR(SQLERRM(SQLCODE),1,2000);            
            UPDATE MDM_DATA_VALUES_TAB b
            SET b.Row_Status = 'Error',
            b.ERROR = err_msg_   
            WHERE ROWID = rowid_            
            ;  
          
  END ;
  end loop;

   END CreateMasterData_;
   
      

-------------------- LU SPECIFIC PRIVATE METHODS ----------------------------


-------------------- LU SPECIFIC PROTECTED METHODS --------------------------


-------------------- LU SPECIFIC PUBLIC METHODS -----------------------------

