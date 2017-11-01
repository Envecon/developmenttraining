#region Copyright (c) IFS Research & Development
//
//                 IFS Research & Development
//
//  This program is protected by copyright law and by international
//  conventions. All licensing, renting, lending or copying (including
//  for private use), and all other use of the program, which is not
//  explicitly permitted by IFS, is a violation of the rights
//  of IFS. Such violations will be reported to the
//  appropriate authorities.
//
//  VIOLATIONS OF ANY COPYRIGHT IS PUNISHABLE BY LAW AND CAN LEAD
//  TO UP TO TWO YEARS OF IMPRISONMENT AND LIABILITY TO PAY DAMAGES.
#endregion
#region History
#endregion

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Ifs.Fnd.ApplicationForms;
using PPJ.Runtime;
using PPJ.Runtime.Windows;

namespace Ifs.Application.MdmBasicData
{

    public partial class tbwMdmRequestHistory
    {

        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(tbwMdmRequestHistory));
            this.colsTemplateId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnRevision = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnRequestNo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnSeqNo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldModDate = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsModBy = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsHistoryStatus = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsInfo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.SuspendLayout();
            // 
            // __colObjversion
            // 
            this.@__colObjversion.Position = 8;
            // 
            // colsTemplateId
            // 
            this.colsTemplateId.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.colsTemplateId.MaxLength = 30;
            this.colsTemplateId.Name = "colsTemplateId";
            this.colsTemplateId.NamedProperties.Put("EnumerateMethod", "");
            this.colsTemplateId.NamedProperties.Put("FieldFlags", "4195");
            this.colsTemplateId.NamedProperties.Put("LovReference", "");
            this.colsTemplateId.NamedProperties.Put("SqlColumn", "TEMPLATE_ID");
            this.colsTemplateId.Position = 6;
            resources.ApplyResources(this.colsTemplateId, "colsTemplateId");
            // 
            // colnRevision
            // 
            this.colnRevision.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnRevision.Name = "colnRevision";
            this.colnRevision.NamedProperties.Put("EnumerateMethod", "");
            this.colnRevision.NamedProperties.Put("FieldFlags", "4195");
            this.colnRevision.NamedProperties.Put("Format", "");
            this.colnRevision.NamedProperties.Put("LovReference", "MDM_BASIC_DATA_HEADER(TEMPLATE_ID)");
            this.colnRevision.NamedProperties.Put("SqlColumn", "REVISION");
            this.colnRevision.Position = 7;
            this.colnRevision.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnRevision, "colnRevision");
            // 
            // colnRequestNo
            // 
            this.colnRequestNo.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnRequestNo.Name = "colnRequestNo";
            this.colnRequestNo.NamedProperties.Put("EnumerateMethod", "");
            this.colnRequestNo.NamedProperties.Put("FieldFlags", "4195");
            this.colnRequestNo.NamedProperties.Put("Format", "");
            this.colnRequestNo.NamedProperties.Put("LovReference", "MDM_REQUEST_HEADER(TEMPLATE_ID,REVISION)");
            this.colnRequestNo.NamedProperties.Put("SqlColumn", "REQUEST_NO");
            this.colnRequestNo.Position = 9;
            this.colnRequestNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnRequestNo, "colnRequestNo");
            // 
            // colnSeqNo
            // 
            this.colnSeqNo.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnSeqNo.Name = "colnSeqNo";
            this.colnSeqNo.NamedProperties.Put("EnumerateMethod", "");
            this.colnSeqNo.NamedProperties.Put("FieldFlags", "4256");
            this.colnSeqNo.NamedProperties.Put("Format", "");
            this.colnSeqNo.NamedProperties.Put("LovReference", "");
            this.colnSeqNo.NamedProperties.Put("SqlColumn", "SEQ_NO");
            this.colnSeqNo.Position = 10;
            this.colnSeqNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnSeqNo, "colnSeqNo");
            // 
            // coldModDate
            // 
            this.coldModDate.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldModDate.Format = "d";
            this.coldModDate.Name = "coldModDate";
            this.coldModDate.NamedProperties.Put("EnumerateMethod", "");
            this.coldModDate.NamedProperties.Put("FieldFlags", "288");
            this.coldModDate.NamedProperties.Put("LovReference", "");
            this.coldModDate.NamedProperties.Put("SqlColumn", "MOD_DATE");
            this.coldModDate.Position = 2;
            resources.ApplyResources(this.coldModDate, "coldModDate");
            // 
            // colsModBy
            // 
            this.colsModBy.MaxLength = 20;
            this.colsModBy.Name = "colsModBy";
            this.colsModBy.NamedProperties.Put("EnumerateMethod", "");
            this.colsModBy.NamedProperties.Put("FieldFlags", "288");
            this.colsModBy.NamedProperties.Put("LovReference", "");
            this.colsModBy.NamedProperties.Put("SqlColumn", "MOD_BY");
            this.colsModBy.Position = 3;
            resources.ApplyResources(this.colsModBy, "colsModBy");
            // 
            // colsHistoryStatus
            // 
            this.colsHistoryStatus.MaxLength = 20;
            this.colsHistoryStatus.Name = "colsHistoryStatus";
            this.colsHistoryStatus.NamedProperties.Put("EnumerateMethod", "");
            this.colsHistoryStatus.NamedProperties.Put("FieldFlags", "288");
            this.colsHistoryStatus.NamedProperties.Put("LovReference", "");
            this.colsHistoryStatus.NamedProperties.Put("SqlColumn", "HISTORY_STATUS");
            this.colsHistoryStatus.Position = 4;
            resources.ApplyResources(this.colsHistoryStatus, "colsHistoryStatus");
            // 
            // colsInfo
            // 
            this.colsInfo.Name = "colsInfo";
            this.colsInfo.NamedProperties.Put("EnumerateMethod", "");
            this.colsInfo.NamedProperties.Put("FieldFlags", "288");
            this.colsInfo.NamedProperties.Put("LovReference", "");
            this.colsInfo.NamedProperties.Put("SqlColumn", "INFO");
            this.colsInfo.Position = 5;
            resources.ApplyResources(this.colsInfo, "colsInfo");
            // 
            // tbwMdmRequestHistory
            // 
            resources.ApplyResources(this, "$this");
            this.Controls.Add(this.coldModDate);
            this.Controls.Add(this.colsModBy);
            this.Controls.Add(this.colsHistoryStatus);
            this.Controls.Add(this.colsInfo);
            this.Controls.Add(this.colsTemplateId);
            this.Controls.Add(this.colnRevision);
            this.Controls.Add(this.colnRequestNo);
            this.Controls.Add(this.colnSeqNo);
            this.Name = "tbwMdmRequestHistory";
            this.NamedProperties.Put("LogicalUnit", "MdmRequestHistory");
            this.NamedProperties.Put("Module", "MDMGT");
            this.NamedProperties.Put("PackageName", "MDM_REQUEST_HISTORY_API");
            this.NamedProperties.Put("ViewName", "MDM_REQUEST_HISTORY");
            this.Controls.SetChildIndex(this.colnSeqNo, 0);
            this.Controls.SetChildIndex(this.colnRequestNo, 0);
            this.Controls.SetChildIndex(this.@__colObjversion, 0);
            this.Controls.SetChildIndex(this.colnRevision, 0);
            this.Controls.SetChildIndex(this.colsTemplateId, 0);
            this.Controls.SetChildIndex(this.colsInfo, 0);
            this.Controls.SetChildIndex(this.colsHistoryStatus, 0);
            this.Controls.SetChildIndex(this.colsModBy, 0);
            this.Controls.SetChildIndex(this.coldModDate, 0);
            this.Controls.SetChildIndex(this.@__colObjid, 0);
            this.ResumeLayout(false);

        }
        #endregion

        #region System Methods/Properties

        /// <summary>
        /// Release global reference.
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }
        #endregion

        protected cColumn colsTemplateId;
        protected cColumn colnRevision;
        protected cColumn colnRequestNo;
        protected cColumn colnSeqNo;
        protected cColumn coldModDate;
        protected cColumn colsModBy;
        protected cColumn colsHistoryStatus;
        protected cColumn colsInfo;
    }
}
