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

    public partial class tbwMdmRequests
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(tbwMdmRequests));
            this.colnRequestNo = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsDescription = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsState = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsTemplateId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsRequestedBy = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldRequestedDate = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colApprovalRequired = new Ifs.Fnd.ApplicationForms.cCheckBoxColumn();
            this.colApprovalRejected = new Ifs.Fnd.ApplicationForms.cCheckBoxColumn();
            this.colnRevision = new Ifs.Fnd.ApplicationForms.cColumn();
            this.cmdMdmRequest = new Ifs.Fnd.Windows.Forms.FndCommand(this.components);
            this.contextMenu = new Ifs.Fnd.Windows.Forms.FndContextMenuStrip(this.components);
            this.tsMenuItemMdmRequest = new Ifs.Fnd.Windows.Forms.FndToolStripMenuItem(this.components);
            this.contextMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // commandManager
            // 
            this.commandManager.Commands.Add(this.cmdMdmRequest);
            this.commandManager.ContextMenus.Add(this.contextMenu);
            this.commandManager.ImageList = null;
            // 
            // colnRequestNo
            // 
            this.colnRequestNo.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnRequestNo.Name = "colnRequestNo";
            this.colnRequestNo.NamedProperties.Put("EnumerateMethod", "");
            this.colnRequestNo.NamedProperties.Put("FieldFlags", "163");
            this.colnRequestNo.NamedProperties.Put("Format", "");
            this.colnRequestNo.NamedProperties.Put("LovReference", "");
            this.colnRequestNo.NamedProperties.Put("SqlColumn", "REQUEST_NO");
            this.colnRequestNo.Position = 3;
            this.colnRequestNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnRequestNo, "colnRequestNo");
            // 
            // colsDescription
            // 
            this.colsDescription.MaxLength = 50;
            this.colsDescription.Name = "colsDescription";
            this.colsDescription.NamedProperties.Put("EnumerateMethod", "");
            this.colsDescription.NamedProperties.Put("FieldFlags", "295");
            this.colsDescription.NamedProperties.Put("LovReference", "");
            this.colsDescription.NamedProperties.Put("SqlColumn", "DESCRIPTION");
            this.colsDescription.Position = 4;
            resources.ApplyResources(this.colsDescription, "colsDescription");
            // 
            // colsState
            // 
            this.colsState.MaxLength = 20;
            this.colsState.Name = "colsState";
            this.colsState.NamedProperties.Put("EnumerateMethod", "");
            this.colsState.NamedProperties.Put("FieldFlags", "288");
            this.colsState.NamedProperties.Put("LovReference", "");
            this.colsState.NamedProperties.Put("SqlColumn", "STATE");
            this.colsState.Position = 5;
            resources.ApplyResources(this.colsState, "colsState");
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
            this.colsTemplateId.Position = 6;
            resources.ApplyResources(this.colsTemplateId, "colsTemplateId");
            // 
            // colsRequestedBy
            // 
            this.colsRequestedBy.MaxLength = 10;
            this.colsRequestedBy.Name = "colsRequestedBy";
            this.colsRequestedBy.NamedProperties.Put("EnumerateMethod", "");
            this.colsRequestedBy.NamedProperties.Put("FieldFlags", "291");
            this.colsRequestedBy.NamedProperties.Put("LovReference", "");
            this.colsRequestedBy.NamedProperties.Put("SqlColumn", "REQUESTED_BY");
            this.colsRequestedBy.Position = 8;
            resources.ApplyResources(this.colsRequestedBy, "colsRequestedBy");
            // 
            // coldRequestedDate
            // 
            this.coldRequestedDate.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldRequestedDate.Format = "d";
            this.coldRequestedDate.Name = "coldRequestedDate";
            this.coldRequestedDate.NamedProperties.Put("EnumerateMethod", "");
            this.coldRequestedDate.NamedProperties.Put("FieldFlags", "291");
            this.coldRequestedDate.NamedProperties.Put("LovReference", "");
            this.coldRequestedDate.NamedProperties.Put("SqlColumn", "REQUESTED_DATE");
            this.coldRequestedDate.Position = 9;
            resources.ApplyResources(this.coldRequestedDate, "coldRequestedDate");
            // 
            // colApprovalRequired
            // 
            this.colApprovalRequired.Name = "colApprovalRequired";
            this.colApprovalRequired.NamedProperties.Put("EnumerateMethod", "");
            this.colApprovalRequired.NamedProperties.Put("FieldFlags", "294");
            this.colApprovalRequired.NamedProperties.Put("LovReference", "");
            this.colApprovalRequired.NamedProperties.Put("SqlColumn", "APPROVAL_REQUIRED");
            this.colApprovalRequired.Position = 10;
            resources.ApplyResources(this.colApprovalRequired, "colApprovalRequired");
            // 
            // colApprovalRejected
            // 
            this.colApprovalRejected.Name = "colApprovalRejected";
            this.colApprovalRejected.NamedProperties.Put("EnumerateMethod", "");
            this.colApprovalRejected.NamedProperties.Put("FieldFlags", "294");
            this.colApprovalRejected.NamedProperties.Put("LovReference", "");
            this.colApprovalRejected.NamedProperties.Put("SqlColumn", "APPROVAL_REJECTED");
            this.colApprovalRejected.Position = 11;
            resources.ApplyResources(this.colApprovalRejected, "colApprovalRejected");
            // 
            // colnRevision
            // 
            this.colnRevision.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnRevision.Name = "colnRevision";
            this.colnRevision.NamedProperties.Put("EnumerateMethod", "");
            this.colnRevision.NamedProperties.Put("FieldFlags", "99");
            this.colnRevision.NamedProperties.Put("Format", "");
            this.colnRevision.NamedProperties.Put("LovReference", "MDM_BASIC_DATA_HEADER(TEMPLATE_ID)");
            this.colnRevision.NamedProperties.Put("SqlColumn", "REVISION");
            this.colnRevision.Position = 7;
            this.colnRevision.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnRevision, "colnRevision");
            // 
            // cmdMdmRequest
            // 
            resources.ApplyResources(this.cmdMdmRequest, "cmdMdmRequest");
            this.cmdMdmRequest.Name = "cmdMdmRequest";
            this.cmdMdmRequest.Execute += new Ifs.Fnd.Windows.Forms.FndCommandExecuteHandler(this.cmdMdmRequest_Execute);
            this.cmdMdmRequest.Inquire += new Ifs.Fnd.Windows.Forms.FndCommandInquireHandler(this.cmdMdmRequest_Inquire);
            // 
            // contextMenu
            // 
            this.contextMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsMenuItemMdmRequest});
            this.contextMenu.Name = "contextMenu";
            resources.ApplyResources(this.contextMenu, "contextMenu");
            // 
            // tsMenuItemMdmRequest
            // 
            this.tsMenuItemMdmRequest.Command = this.cmdMdmRequest;
            this.tsMenuItemMdmRequest.Name = "tsMenuItemMdmRequest";
            resources.ApplyResources(this.tsMenuItemMdmRequest, "tsMenuItemMdmRequest");
            this.tsMenuItemMdmRequest.Text = "Mdm Request";
            // 
            // tbwMdmRequests
            // 
            resources.ApplyResources(this, "$this");
            this.ContextMenuStrip = this.contextMenu;
            this.Controls.Add(this.colsDescription);
            this.Controls.Add(this.colsState);
            this.Controls.Add(this.colsTemplateId);
            this.Controls.Add(this.colnRevision);
            this.Controls.Add(this.colsRequestedBy);
            this.Controls.Add(this.coldRequestedDate);
            this.Controls.Add(this.colApprovalRequired);
            this.Controls.Add(this.colApprovalRejected);
            this.Controls.Add(this.colnRequestNo);
            this.Name = "tbwMdmRequests";
            this.NamedProperties.Put("LogicalUnit", "MdmRequestHeader");
            this.NamedProperties.Put("Module", "MDMGT");
            this.NamedProperties.Put("PackageName", "MDM_REQUEST_HEADER_API");
            this.NamedProperties.Put("ViewName", "MDM_REQUEST_HEADER");
            this.Controls.SetChildIndex(this.colnRequestNo, 0);
            this.Controls.SetChildIndex(this.colApprovalRejected, 0);
            this.Controls.SetChildIndex(this.colApprovalRequired, 0);
            this.Controls.SetChildIndex(this.coldRequestedDate, 0);
            this.Controls.SetChildIndex(this.colsRequestedBy, 0);
            this.Controls.SetChildIndex(this.colnRevision, 0);
            this.Controls.SetChildIndex(this.colsTemplateId, 0);
            this.Controls.SetChildIndex(this.colsState, 0);
            this.Controls.SetChildIndex(this.colsDescription, 0);
            this.Controls.SetChildIndex(this.@__colObjversion, 0);
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

        protected cColumn colnRequestNo;
        protected cColumn colsDescription;
        protected cColumn colsState;
        protected cColumn colsTemplateId;
        protected cColumn colsRequestedBy;
        protected cColumn coldRequestedDate;
        protected cCheckBoxColumn colApprovalRequired;
        protected cCheckBoxColumn colApprovalRejected;
        protected cColumn colnRevision;
        protected Fnd.Windows.Forms.FndCommand cmdMdmRequest;
        protected Fnd.Windows.Forms.FndContextMenuStrip contextMenu;
        protected Fnd.Windows.Forms.FndToolStripMenuItem tsMenuItemMdmRequest;
    }
}
