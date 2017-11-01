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

    public partial class dlgForwardAuthorization
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(dlgForwardAuthorization));
            this.cCommandButtonOK = new Ifs.Fnd.ApplicationForms.cCommandButton();
            this.commandOk = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.cCommandButtonCancel = new Ifs.Fnd.ApplicationForms.cCommandButton();
            this.commandCancel = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.commandList = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.cCommandButtonList = new Ifs.Fnd.ApplicationForms.cCommandButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dfsTemplateId = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labelTemplateId = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfnRevision = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labelRevision = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfnRequestNo = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labelRequestNo = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfsApprover = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labelApprover = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfsGroupId = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labelGroupId = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dfsApprover1 = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labelApprover1 = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // commandManager
            // 
            this.commandManager.Commands.Add(this.commandOk);
            this.commandManager.Commands.Add(this.commandCancel);
            this.commandManager.Commands.Add(this.commandList);
            this.commandManager.Components.Add(this.cCommandButtonOK);
            this.commandManager.Components.Add(this.cCommandButtonCancel);
            this.commandManager.Components.Add(this.cCommandButtonList);
            this.commandManager.ImageList = null;
            // 
            // cCommandButtonOK
            // 
            resources.ApplyResources(this.cCommandButtonOK, "cCommandButtonOK");
            this.cCommandButtonOK.Command = this.commandOk;
            this.cCommandButtonOK.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.cCommandButtonOK.Name = "cCommandButtonOK";
            this.cCommandButtonOK.NamedProperties.Put("MethodIdStr", "");
            this.cCommandButtonOK.NamedProperties.Put("MethodParameterType", "String");
            // 
            // commandOk
            // 
            resources.ApplyResources(this.commandOk, "commandOk");
            this.commandOk.Name = "commandOk";
            this.commandOk.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.commandOk_Execute);
            // 
            // cCommandButtonCancel
            // 
            resources.ApplyResources(this.cCommandButtonCancel, "cCommandButtonCancel");
            this.cCommandButtonCancel.Command = this.commandCancel;
            this.cCommandButtonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.cCommandButtonCancel.Name = "cCommandButtonCancel";
            this.cCommandButtonCancel.NamedProperties.Put("MethodIdStr", "");
            this.cCommandButtonCancel.NamedProperties.Put("MethodParameterType", "String");
            // 
            // commandCancel
            // 
            resources.ApplyResources(this.commandCancel, "commandCancel");
            this.commandCancel.Name = "commandCancel";
            this.commandCancel.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.commandCancel_Execute);
            // 
            // commandList
            // 
            resources.ApplyResources(this.commandList, "commandList");
            this.commandList.Enabled = false;
            this.commandList.EventCategory = Ifs.Fnd.Windows.Forms.CommandEventCategory.Focus;
            this.commandList.Name = "commandList";
            this.commandList.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.commandList_Execute);
            this.commandList.Inquire += new Ifs.Fnd.Windows.Forms.FndCommandInquireHandler(this.commandList_Inquire);
            // 
            // cCommandButtonList
            // 
            this.cCommandButtonList.Command = this.commandList;
            resources.ApplyResources(this.cCommandButtonList, "cCommandButtonList");
            this.cCommandButtonList.Name = "cCommandButtonList";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dfsGroupId);
            this.groupBox2.Controls.Add(this.labelGroupId);
            this.groupBox2.Controls.Add(this.dfsApprover);
            this.groupBox2.Controls.Add(this.labelApprover);
            resources.ApplyResources(this.groupBox2, "groupBox2");
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.TabStop = false;
            // 
            // dfsTemplateId
            // 
            this.dfsTemplateId.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            resources.ApplyResources(this.dfsTemplateId, "dfsTemplateId");
            this.dfsTemplateId.Name = "dfsTemplateId";
            this.dfsTemplateId.NamedProperties.Put("EnumerateMethod", "");
            this.dfsTemplateId.NamedProperties.Put("FieldFlags", "99");
            this.dfsTemplateId.NamedProperties.Put("LovReference", "MDM_BASIC_DATA(PROFILE_ID)");
            this.dfsTemplateId.NamedProperties.Put("SqlColumn", "TEMPLATE_ID");
            // 
            // labelTemplateId
            // 
            resources.ApplyResources(this.labelTemplateId, "labelTemplateId");
            this.labelTemplateId.Name = "labelTemplateId";
            // 
            // dfnRevision
            // 
            this.dfnRevision.DataType = PPJ.Runtime.Windows.DataType.Number;
            resources.ApplyResources(this.dfnRevision, "dfnRevision");
            this.dfnRevision.Name = "dfnRevision";
            this.dfnRevision.NamedProperties.Put("EnumerateMethod", "");
            this.dfnRevision.NamedProperties.Put("FieldFlags", "99");
            this.dfnRevision.NamedProperties.Put("Format", "");
            this.dfnRevision.NamedProperties.Put("LovReference", "MDM_BASIC_DATA(PROFILE_ID)");
            this.dfnRevision.NamedProperties.Put("SqlColumn", "REVISION");
            // 
            // labelRevision
            // 
            resources.ApplyResources(this.labelRevision, "labelRevision");
            this.labelRevision.Name = "labelRevision";
            // 
            // dfnRequestNo
            // 
            this.dfnRequestNo.DataType = PPJ.Runtime.Windows.DataType.Number;
            resources.ApplyResources(this.dfnRequestNo, "dfnRequestNo");
            this.dfnRequestNo.Name = "dfnRequestNo";
            this.dfnRequestNo.NamedProperties.Put("EnumerateMethod", "");
            this.dfnRequestNo.NamedProperties.Put("FieldFlags", "99");
            this.dfnRequestNo.NamedProperties.Put("Format", "");
            this.dfnRequestNo.NamedProperties.Put("LovReference", "MDM_REQUEST_HEADER(TEMPLATE_ID,REVISION)");
            this.dfnRequestNo.NamedProperties.Put("SqlColumn", "REQUEST_NO");
            // 
            // labelRequestNo
            // 
            resources.ApplyResources(this.labelRequestNo, "labelRequestNo");
            this.labelRequestNo.Name = "labelRequestNo";
            // 
            // dfsApprover
            // 
            this.dfsApprover.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            resources.ApplyResources(this.dfsApprover, "dfsApprover");
            this.dfsApprover.Name = "dfsApprover";
            this.dfsApprover.NamedProperties.Put("EnumerateMethod", "");
            this.dfsApprover.NamedProperties.Put("FieldFlags", "294");
            this.dfsApprover.NamedProperties.Put("LovReference", "");
            this.dfsApprover.NamedProperties.Put("SqlColumn", "APPROVER");
            // 
            // labelApprover
            // 
            resources.ApplyResources(this.labelApprover, "labelApprover");
            this.labelApprover.Name = "labelApprover";
            // 
            // dfsGroupId
            // 
            resources.ApplyResources(this.dfsGroupId, "dfsGroupId");
            this.dfsGroupId.Name = "dfsGroupId";
            this.dfsGroupId.NamedProperties.Put("EnumerateMethod", "");
            this.dfsGroupId.NamedProperties.Put("FieldFlags", "294");
            this.dfsGroupId.NamedProperties.Put("LovReference", "");
            this.dfsGroupId.NamedProperties.Put("SqlColumn", "GROUP_ID");
            // 
            // labelGroupId
            // 
            resources.ApplyResources(this.labelGroupId, "labelGroupId");
            this.labelGroupId.Name = "labelGroupId";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dfsApprover1);
            this.groupBox1.Controls.Add(this.labelApprover1);
            resources.ApplyResources(this.groupBox1, "groupBox1");
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.TabStop = false;
            // 
            // dfsApprover1
            // 
            this.dfsApprover1.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            resources.ApplyResources(this.dfsApprover1, "dfsApprover1");
            this.dfsApprover1.Name = "dfsApprover1";
            this.dfsApprover1.NamedProperties.Put("EnumerateMethod", "");
            this.dfsApprover1.NamedProperties.Put("FieldFlags", "294");
            this.dfsApprover1.NamedProperties.Put("LovReference", "");
            this.dfsApprover1.NamedProperties.Put("SqlColumn", "APPROVER");
            // 
            // labelApprover1
            // 
            resources.ApplyResources(this.labelApprover1, "labelApprover1");
            this.labelApprover1.Name = "labelApprover1";
            // 
            // dlgForwardAuthorization
            // 
            this.AcceptButton = this.cCommandButtonOK;
            this.CancelButton = this.cCommandButtonCancel;
            resources.ApplyResources(this, "$this");
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dfnRequestNo);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.cCommandButtonList);
            this.Controls.Add(this.labelRequestNo);
            this.Controls.Add(this.cCommandButtonOK);
            this.Controls.Add(this.cCommandButtonCancel);
            this.Controls.Add(this.dfnRevision);
            this.Controls.Add(this.dfsTemplateId);
            this.Controls.Add(this.labelTemplateId);
            this.Controls.Add(this.labelRevision);
            this.Name = "dlgForwardAuthorization";
            this.NamedProperties.Put("LogicalUnit", "MdmApproval");
            this.NamedProperties.Put("Module", "MDMGT");
            this.NamedProperties.Put("PackageName", "MDM_APPROVAL_API");
            this.NamedProperties.Put("ViewName", "MDM_DLGAPPROVAL");
            this.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dlgForwardAuthorization_WindowActions);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion

        #region System Methods/Properties

        /// <summary>
        /// Release global reference.
        /// </summary>
        /// <param name="disposing"></param>
        //public static SalNumber ModalDialog(Control owner)
        //{
        //    dlgMoveProducts dlg = new dlgMoveProducts();
        //    SalNumber ret = dlg.ShowDialog(owner);
        //    return ret;
        //}
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }
        #endregion

        private cCommandButton cCommandButtonOK;
        private cCommandButton cCommandButtonCancel;
        private Ifs.Fnd.Windows.Forms.FndCommand commandOk;
        private Ifs.Fnd.Windows.Forms.FndCommand commandCancel;
        protected Fnd.Windows.Forms.FndCommand commandList;
        protected cCommandButton cCommandButtonList;
        private GroupBox groupBox2;
        protected cDataField dfsGroupId;
        protected cBackgroundText labelGroupId;
        protected cDataField dfsApprover;
        protected cBackgroundText labelApprover;
        protected cDataField dfsTemplateId;
        protected cBackgroundText labelTemplateId;
        protected cDataField dfnRevision;
        protected cBackgroundText labelRevision;
        protected cDataField dfnRequestNo;
        protected cBackgroundText labelRequestNo;
        private GroupBox groupBox1;
        protected cDataField dfsApprover1;
        protected cBackgroundText labelApprover1;

    }
}
