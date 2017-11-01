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

    public partial class tbwApproval
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(tbwApproval));
            this.colsLuName = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnStepNo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsDescription = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsPersonId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsName = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsGroupId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsGroupDescription = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsApprovalStatus = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsApprover = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsApproverName = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldApprovalDate = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsRevokedId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsRevokedName = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldRevokedDate = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsForwardedBy = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsForwardedTo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldForwardedDate = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsTemplateId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnRevision = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnRequestNo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsKeyRef = new Ifs.Fnd.ApplicationForms.cColumn();
            this.cmdApprove = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.cmdReject = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.cmdRevoke = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.cmdForward = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.contextMenu = new Ifs.Fnd.Windows.Forms.FndContextMenuStrip(this.components);
            this.tsMenuItemApprove = new Ifs.Fnd.Windows.Forms.FndToolStripMenuItem(this.components);
            this.tsMenuItemReject = new Ifs.Fnd.Windows.Forms.FndToolStripMenuItem(this.components);
            this.tsMenuItemRevoke = new Ifs.Fnd.Windows.Forms.FndToolStripMenuItem(this.components);
            this.tsMenuItemForward = new Ifs.Fnd.Windows.Forms.FndToolStripMenuItem(this.components);
            this.contextMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // commandManager
            // 
            this.commandManager.Commands.Add(this.cmdApprove);
            this.commandManager.Commands.Add(this.cmdReject);
            this.commandManager.Commands.Add(this.cmdRevoke);
            this.commandManager.Commands.Add(this.cmdForward);
            this.commandManager.ContextMenus.Add(this.contextMenu);
            this.commandManager.ImageList = null;
            // 
            // colsLuName
            // 
            this.colsLuName.MaxLength = 50;
            this.colsLuName.Name = "colsLuName";
            this.colsLuName.NamedProperties.Put("EnumerateMethod", "");
            this.colsLuName.NamedProperties.Put("FieldFlags", "294");
            this.colsLuName.NamedProperties.Put("LovReference", "");
            this.colsLuName.NamedProperties.Put("SqlColumn", "LU_NAME");
            this.colsLuName.Position = 4;
            resources.ApplyResources(this.colsLuName, "colsLuName");
            // 
            // colnStepNo
            // 
            this.colnStepNo.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnStepNo.MaxLength = 3;
            this.colnStepNo.Name = "colnStepNo";
            this.colnStepNo.NamedProperties.Put("EnumerateMethod", "");
            this.colnStepNo.NamedProperties.Put("FieldFlags", "294");
            this.colnStepNo.NamedProperties.Put("Format", "");
            this.colnStepNo.NamedProperties.Put("LovReference", "");
            this.colnStepNo.NamedProperties.Put("SqlColumn", "STEP_NO");
            this.colnStepNo.Position = 5;
            this.colnStepNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnStepNo, "colnStepNo");
            // 
            // colsDescription
            // 
            this.colsDescription.MaxLength = 40;
            this.colsDescription.Name = "colsDescription";
            this.colsDescription.NamedProperties.Put("EnumerateMethod", "");
            this.colsDescription.NamedProperties.Put("FieldFlags", "294");
            this.colsDescription.NamedProperties.Put("LovReference", "");
            this.colsDescription.NamedProperties.Put("SqlColumn", "DESCRIPTION");
            this.colsDescription.Position = 6;
            resources.ApplyResources(this.colsDescription, "colsDescription");
            // 
            // colsPersonId
            // 
            this.colsPersonId.MaxLength = 30;
            this.colsPersonId.Name = "colsPersonId";
            this.colsPersonId.NamedProperties.Put("EnumerateMethod", "");
            this.colsPersonId.NamedProperties.Put("FieldFlags", "294");
            this.colsPersonId.NamedProperties.Put("LovReference", "");
            this.colsPersonId.NamedProperties.Put("SqlColumn", "PERSON_ID");
            this.colsPersonId.Position = 7;
            resources.ApplyResources(this.colsPersonId, "colsPersonId");
            // 
            // colsName
            // 
            this.colsName.Name = "colsName";
            this.colsName.NamedProperties.Put("EnumerateMethod", "");
            this.colsName.NamedProperties.Put("FieldFlags", "294");
            this.colsName.NamedProperties.Put("LovReference", "");
            this.colsName.NamedProperties.Put("SqlColumn", "NAME");
            this.colsName.Position = 8;
            resources.ApplyResources(this.colsName, "colsName");
            // 
            // colsGroupId
            // 
            this.colsGroupId.MaxLength = 20;
            this.colsGroupId.Name = "colsGroupId";
            this.colsGroupId.NamedProperties.Put("EnumerateMethod", "");
            this.colsGroupId.NamedProperties.Put("FieldFlags", "294");
            this.colsGroupId.NamedProperties.Put("LovReference", "");
            this.colsGroupId.NamedProperties.Put("SqlColumn", "GROUP_ID");
            this.colsGroupId.Position = 9;
            resources.ApplyResources(this.colsGroupId, "colsGroupId");
            // 
            // colsGroupDescription
            // 
            this.colsGroupDescription.MaxLength = 1000;
            this.colsGroupDescription.Name = "colsGroupDescription";
            this.colsGroupDescription.NamedProperties.Put("EnumerateMethod", "");
            this.colsGroupDescription.NamedProperties.Put("FieldFlags", "294");
            this.colsGroupDescription.NamedProperties.Put("LovReference", "");
            this.colsGroupDescription.NamedProperties.Put("SqlColumn", "GROUP_DESCRIPTION");
            this.colsGroupDescription.Position = 10;
            resources.ApplyResources(this.colsGroupDescription, "colsGroupDescription");
            // 
            // colsApprovalStatus
            // 
            this.colsApprovalStatus.MaxLength = 4000;
            this.colsApprovalStatus.Name = "colsApprovalStatus";
            this.colsApprovalStatus.NamedProperties.Put("EnumerateMethod", "");
            this.colsApprovalStatus.NamedProperties.Put("FieldFlags", "310");
            this.colsApprovalStatus.NamedProperties.Put("LovReference", "");
            this.colsApprovalStatus.NamedProperties.Put("SqlColumn", "APPROVAL_STATUS");
            this.colsApprovalStatus.Position = 11;
            resources.ApplyResources(this.colsApprovalStatus, "colsApprovalStatus");
            // 
            // colsApprover
            // 
            this.colsApprover.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.colsApprover.MaxLength = 50;
            this.colsApprover.Name = "colsApprover";
            this.colsApprover.NamedProperties.Put("EnumerateMethod", "");
            this.colsApprover.NamedProperties.Put("FieldFlags", "294");
            this.colsApprover.NamedProperties.Put("LovReference", "");
            this.colsApprover.NamedProperties.Put("SqlColumn", "APPROVER");
            this.colsApprover.Position = 12;
            resources.ApplyResources(this.colsApprover, "colsApprover");
            // 
            // colsApproverName
            // 
            this.colsApproverName.Name = "colsApproverName";
            this.colsApproverName.NamedProperties.Put("EnumerateMethod", "");
            this.colsApproverName.NamedProperties.Put("FieldFlags", "294");
            this.colsApproverName.NamedProperties.Put("LovReference", "");
            this.colsApproverName.NamedProperties.Put("SqlColumn", "APPROVER_NAME");
            this.colsApproverName.Position = 13;
            resources.ApplyResources(this.colsApproverName, "colsApproverName");
            // 
            // coldApprovalDate
            // 
            this.coldApprovalDate.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldApprovalDate.Format = "d";
            this.coldApprovalDate.Name = "coldApprovalDate";
            this.coldApprovalDate.NamedProperties.Put("EnumerateMethod", "");
            this.coldApprovalDate.NamedProperties.Put("FieldFlags", "294");
            this.coldApprovalDate.NamedProperties.Put("LovReference", "");
            this.coldApprovalDate.NamedProperties.Put("SqlColumn", "APPROVAL_DATE");
            this.coldApprovalDate.Position = 14;
            resources.ApplyResources(this.coldApprovalDate, "coldApprovalDate");
            // 
            // colsRevokedId
            // 
            this.colsRevokedId.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.colsRevokedId.MaxLength = 50;
            this.colsRevokedId.Name = "colsRevokedId";
            this.colsRevokedId.NamedProperties.Put("EnumerateMethod", "");
            this.colsRevokedId.NamedProperties.Put("FieldFlags", "294");
            this.colsRevokedId.NamedProperties.Put("LovReference", "");
            this.colsRevokedId.NamedProperties.Put("SqlColumn", "REVOKED_ID");
            this.colsRevokedId.Position = 15;
            resources.ApplyResources(this.colsRevokedId, "colsRevokedId");
            // 
            // colsRevokedName
            // 
            this.colsRevokedName.Name = "colsRevokedName";
            this.colsRevokedName.NamedProperties.Put("EnumerateMethod", "");
            this.colsRevokedName.NamedProperties.Put("FieldFlags", "294");
            this.colsRevokedName.NamedProperties.Put("LovReference", "");
            this.colsRevokedName.NamedProperties.Put("SqlColumn", "REVOKED_NAME");
            this.colsRevokedName.Position = 16;
            resources.ApplyResources(this.colsRevokedName, "colsRevokedName");
            // 
            // coldRevokedDate
            // 
            this.coldRevokedDate.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldRevokedDate.Format = "d";
            this.coldRevokedDate.Name = "coldRevokedDate";
            this.coldRevokedDate.NamedProperties.Put("EnumerateMethod", "");
            this.coldRevokedDate.NamedProperties.Put("FieldFlags", "294");
            this.coldRevokedDate.NamedProperties.Put("LovReference", "");
            this.coldRevokedDate.NamedProperties.Put("SqlColumn", "REVOKED_DATE");
            this.coldRevokedDate.Position = 17;
            resources.ApplyResources(this.coldRevokedDate, "coldRevokedDate");
            // 
            // colsForwardedBy
            // 
            this.colsForwardedBy.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.colsForwardedBy.MaxLength = 20;
            this.colsForwardedBy.Name = "colsForwardedBy";
            this.colsForwardedBy.NamedProperties.Put("EnumerateMethod", "");
            this.colsForwardedBy.NamedProperties.Put("FieldFlags", "294");
            this.colsForwardedBy.NamedProperties.Put("LovReference", "");
            this.colsForwardedBy.NamedProperties.Put("SqlColumn", "FORWARDED_BY");
            this.colsForwardedBy.Position = 18;
            resources.ApplyResources(this.colsForwardedBy, "colsForwardedBy");
            // 
            // colsForwardedTo
            // 
            this.colsForwardedTo.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.colsForwardedTo.MaxLength = 20;
            this.colsForwardedTo.Name = "colsForwardedTo";
            this.colsForwardedTo.NamedProperties.Put("EnumerateMethod", "");
            this.colsForwardedTo.NamedProperties.Put("FieldFlags", "294");
            this.colsForwardedTo.NamedProperties.Put("LovReference", "");
            this.colsForwardedTo.NamedProperties.Put("SqlColumn", "FORWARDED_TO");
            this.colsForwardedTo.Position = 19;
            resources.ApplyResources(this.colsForwardedTo, "colsForwardedTo");
            // 
            // coldForwardedDate
            // 
            this.coldForwardedDate.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldForwardedDate.Format = "d";
            this.coldForwardedDate.Name = "coldForwardedDate";
            this.coldForwardedDate.NamedProperties.Put("EnumerateMethod", "");
            this.coldForwardedDate.NamedProperties.Put("FieldFlags", "294");
            this.coldForwardedDate.NamedProperties.Put("LovReference", "");
            this.coldForwardedDate.NamedProperties.Put("SqlColumn", "FORWARDED_DATE");
            this.coldForwardedDate.Position = 20;
            resources.ApplyResources(this.coldForwardedDate, "coldForwardedDate");
            // 
            // colsTemplateId
            // 
            this.colsTemplateId.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.colsTemplateId.MaxLength = 30;
            this.colsTemplateId.Name = "colsTemplateId";
            this.colsTemplateId.NamedProperties.Put("EnumerateMethod", "");
            this.colsTemplateId.NamedProperties.Put("FieldFlags", "99");
            this.colsTemplateId.NamedProperties.Put("LovReference", "");
            this.colsTemplateId.NamedProperties.Put("SqlColumn", "TEMPLATE_ID");
            this.colsTemplateId.Position = 21;
            resources.ApplyResources(this.colsTemplateId, "colsTemplateId");
            // 
            // colnRevision
            // 
            this.colnRevision.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnRevision.Name = "colnRevision";
            this.colnRevision.NamedProperties.Put("EnumerateMethod", "");
            this.colnRevision.NamedProperties.Put("FieldFlags", "99");
            this.colnRevision.NamedProperties.Put("Format", "");
            this.colnRevision.NamedProperties.Put("LovReference", "");
            this.colnRevision.NamedProperties.Put("SqlColumn", "REVISION");
            this.colnRevision.Position = 22;
            this.colnRevision.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnRevision, "colnRevision");
            // 
            // colnRequestNo
            // 
            this.colnRequestNo.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnRequestNo.Name = "colnRequestNo";
            this.colnRequestNo.NamedProperties.Put("EnumerateMethod", "");
            this.colnRequestNo.NamedProperties.Put("FieldFlags", "99");
            this.colnRequestNo.NamedProperties.Put("Format", "");
            this.colnRequestNo.NamedProperties.Put("LovReference", "MDM_REQUEST_HEADER(TEMPLATE_ID,REVISION)");
            this.colnRequestNo.NamedProperties.Put("SqlColumn", "REQUEST_NO");
            this.colnRequestNo.Position = 23;
            this.colnRequestNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnRequestNo, "colnRequestNo");
            // 
            // colsKeyRef
            // 
            this.colsKeyRef.MaxLength = 600;
            this.colsKeyRef.Name = "colsKeyRef";
            this.colsKeyRef.NamedProperties.Put("EnumerateMethod", "");
            this.colsKeyRef.NamedProperties.Put("FieldFlags", "162");
            this.colsKeyRef.NamedProperties.Put("LovReference", "");
            this.colsKeyRef.NamedProperties.Put("SqlColumn", "KEY_REF");
            this.colsKeyRef.Position = 3;
            resources.ApplyResources(this.colsKeyRef, "colsKeyRef");
            // 
            // cmdApprove
            // 
            resources.ApplyResources(this.cmdApprove, "cmdApprove");
            this.cmdApprove.Name = "cmdApprove";
            this.cmdApprove.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.cmdApprove_Execute);
            this.cmdApprove.Inquire += new Ifs.Fnd.Windows.Forms.FndCommandInquireHandler(this.cmdApprove_Inquire);
            // 
            // cmdReject
            // 
            resources.ApplyResources(this.cmdReject, "cmdReject");
            this.cmdReject.Name = "cmdReject";
            this.cmdReject.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.cmdReject_Execute);
            this.cmdReject.Inquire += new Ifs.Fnd.Windows.Forms.FndCommandInquireHandler(this.cmdReject_Inquire);
            // 
            // cmdRevoke
            // 
            resources.ApplyResources(this.cmdRevoke, "cmdRevoke");
            this.cmdRevoke.Name = "cmdRevoke";
            this.cmdRevoke.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.cmdRevoke_Execute);
            this.cmdRevoke.Inquire += new Ifs.Fnd.Windows.Forms.FndCommandInquireHandler(this.cmdRevoke_Inquire);
            // 
            // cmdForward
            // 
            resources.ApplyResources(this.cmdForward, "cmdForward");
            this.cmdForward.Name = "cmdForward";
            this.cmdForward.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.cmdForward_Execute);
            this.cmdForward.Inquire += new Ifs.Fnd.Windows.Forms.FndCommandInquireHandler(this.cmdForward_Inquire);
            // 
            // contextMenu
            // 
            this.contextMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsMenuItemApprove,
            this.tsMenuItemReject,
            this.tsMenuItemRevoke,
            this.tsMenuItemForward});
            this.contextMenu.Name = "contextMenu";
            resources.ApplyResources(this.contextMenu, "contextMenu");
            // 
            // tsMenuItemApprove
            // 
            this.tsMenuItemApprove.Command = this.cmdApprove;
            this.tsMenuItemApprove.Name = "tsMenuItemApprove";
            resources.ApplyResources(this.tsMenuItemApprove, "tsMenuItemApprove");
            this.tsMenuItemApprove.Text = "Approve";
            // 
            // tsMenuItemReject
            // 
            this.tsMenuItemReject.Command = this.cmdReject;
            this.tsMenuItemReject.Name = "tsMenuItemReject";
            resources.ApplyResources(this.tsMenuItemReject, "tsMenuItemReject");
            this.tsMenuItemReject.Text = "Reject";
            // 
            // tsMenuItemRevoke
            // 
            this.tsMenuItemRevoke.Command = this.cmdRevoke;
            this.tsMenuItemRevoke.Name = "tsMenuItemRevoke";
            resources.ApplyResources(this.tsMenuItemRevoke, "tsMenuItemRevoke");
            this.tsMenuItemRevoke.Text = "Revoke";
            // 
            // tsMenuItemForward
            // 
            this.tsMenuItemForward.Command = this.cmdForward;
            this.tsMenuItemForward.Name = "tsMenuItemForward";
            resources.ApplyResources(this.tsMenuItemForward, "tsMenuItemForward");
            this.tsMenuItemForward.Text = "Forward";
            // 
            // tbwApproval
            // 
            resources.ApplyResources(this, "$this");
            this.ContextMenuStrip = this.contextMenu;
            this.Controls.Add(this.colsKeyRef);
            this.Controls.Add(this.colsLuName);
            this.Controls.Add(this.colnStepNo);
            this.Controls.Add(this.colsDescription);
            this.Controls.Add(this.colsPersonId);
            this.Controls.Add(this.colsName);
            this.Controls.Add(this.colsGroupId);
            this.Controls.Add(this.colsGroupDescription);
            this.Controls.Add(this.colsApprovalStatus);
            this.Controls.Add(this.colsApprover);
            this.Controls.Add(this.colsApproverName);
            this.Controls.Add(this.coldApprovalDate);
            this.Controls.Add(this.colsRevokedId);
            this.Controls.Add(this.colsRevokedName);
            this.Controls.Add(this.coldRevokedDate);
            this.Controls.Add(this.colsForwardedBy);
            this.Controls.Add(this.colsForwardedTo);
            this.Controls.Add(this.coldForwardedDate);
            this.Controls.Add(this.colsTemplateId);
            this.Controls.Add(this.colnRevision);
            this.Controls.Add(this.colnRequestNo);
            this.Name = "tbwApproval";
            this.NamedProperties.Put("LogicalUnit", "MdmApproval");
            this.NamedProperties.Put("Module", "MDMGT");
            this.NamedProperties.Put("PackageName", "MDM_APPROVAL_API");
            this.NamedProperties.Put("ViewName", "MDM_APPROVAL");
            this.Controls.SetChildIndex(this.@__colObjversion, 0);
            this.Controls.SetChildIndex(this.colnRequestNo, 0);
            this.Controls.SetChildIndex(this.colnRevision, 0);
            this.Controls.SetChildIndex(this.colsTemplateId, 0);
            this.Controls.SetChildIndex(this.coldForwardedDate, 0);
            this.Controls.SetChildIndex(this.colsForwardedTo, 0);
            this.Controls.SetChildIndex(this.colsForwardedBy, 0);
            this.Controls.SetChildIndex(this.coldRevokedDate, 0);
            this.Controls.SetChildIndex(this.colsRevokedName, 0);
            this.Controls.SetChildIndex(this.colsRevokedId, 0);
            this.Controls.SetChildIndex(this.coldApprovalDate, 0);
            this.Controls.SetChildIndex(this.colsApproverName, 0);
            this.Controls.SetChildIndex(this.colsApprover, 0);
            this.Controls.SetChildIndex(this.colsApprovalStatus, 0);
            this.Controls.SetChildIndex(this.colsGroupDescription, 0);
            this.Controls.SetChildIndex(this.colsGroupId, 0);
            this.Controls.SetChildIndex(this.colsName, 0);
            this.Controls.SetChildIndex(this.colsPersonId, 0);
            this.Controls.SetChildIndex(this.colsDescription, 0);
            this.Controls.SetChildIndex(this.colnStepNo, 0);
            this.Controls.SetChildIndex(this.colsLuName, 0);
            this.Controls.SetChildIndex(this.colsKeyRef, 0);
            this.Controls.SetChildIndex(this.@__colObjid, 0);
            this.contextMenu.ResumeLayout(false);
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

        protected cColumn colsLuName;
        protected cColumn colnStepNo;
        protected cColumn colsDescription;
        protected cColumn colsPersonId;
        protected cColumn colsName;
        protected cColumn colsGroupId;
        protected cColumn colsGroupDescription;
        protected cColumn colsApprovalStatus;
        protected cColumn colsApprover;
        protected cColumn colsApproverName;
        protected cColumn coldApprovalDate;
        protected cColumn colsRevokedId;
        protected cColumn colsRevokedName;
        protected cColumn coldRevokedDate;
        protected cColumn colsForwardedBy;
        protected cColumn colsForwardedTo;
        protected cColumn coldForwardedDate;
        protected cColumn colsTemplateId;
        protected cColumn colnRevision;
        protected cColumn colnRequestNo;
        protected cColumn colsKeyRef;
        protected Fnd.Windows.Forms.FndCommand cmdApprove;
        protected Fnd.Windows.Forms.FndCommand cmdReject;
        protected Fnd.Windows.Forms.FndCommand cmdRevoke;
        protected Fnd.Windows.Forms.FndCommand cmdForward;
        protected Fnd.Windows.Forms.FndContextMenuStrip contextMenu;
        protected Fnd.Windows.Forms.FndToolStripMenuItem tsMenuItemApprove;
        protected Fnd.Windows.Forms.FndToolStripMenuItem tsMenuItemReject;
        protected Fnd.Windows.Forms.FndToolStripMenuItem tsMenuItemRevoke;
        protected Fnd.Windows.Forms.FndToolStripMenuItem tsMenuItemForward;
    }
}
