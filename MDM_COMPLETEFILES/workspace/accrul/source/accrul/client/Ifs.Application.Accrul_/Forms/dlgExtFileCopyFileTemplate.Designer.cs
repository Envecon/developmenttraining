#region Copyright (c) IFS Research & Development
// ======================================================================================================
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
// ======================================================================================================
#endregion
#region History
#endregion

using System;
using System.Text;
using System.Drawing;
using System.Diagnostics;
using System.Collections;
using System.Windows.Forms;
using System.ComponentModel;
using Ifs.Application.Appsrv;
using Ifs.Application.Enterp;
using Ifs.Fnd.ApplicationForms;
using PPJ.Runtime;
using PPJ.Runtime.Sql;
using PPJ.Runtime.Vis;
using PPJ.Runtime.Windows;
using PPJ.Runtime.Windows.QO;

namespace Ifs.Application.Accrul_
{
	
	public partial class dlgExtFileCopyFileTemplate
	{
		
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		#region Window Controls
		protected SalGroupBox gbSource;
		protected cBackgroundText labeldfFromFileId;
		public cDataField dfFromFileId;
		protected cBackgroundText labeldfsTempDescriptionFrom;
		public cDataField dfsTempDescriptionFrom;
		protected cBackgroundText labeldfFileType;
		public cDataField dfFileType;
		protected cBackgroundText labeldfsTypeDescriptionFrom;
		public cDataField dfsTypeDescriptionFrom;
		protected SalGroupBox gbDestination;
		protected cBackgroundText labeldfFileId;
		public cDataField dfFileId;
		protected cBackgroundText labeldfsTempDescriptionTo;
		public cDataField dfsTempDescriptionTo;
		public cPushButton pbOk;
		public cPushButton pbCancel;
		public cPushButton pbList;
		#endregion
		
		#region Windows Form Designer generated code
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(dlgExtFileCopyFileTemplate));
            this.gbSource = new PPJ.Runtime.Windows.SalGroupBox();
            this.labeldfFromFileId = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfFromFileId = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labeldfsTempDescriptionFrom = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfsTempDescriptionFrom = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labeldfFileType = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfFileType = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labeldfsTypeDescriptionFrom = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfsTypeDescriptionFrom = new Ifs.Fnd.ApplicationForms.cDataField();
            this.gbDestination = new PPJ.Runtime.Windows.SalGroupBox();
            this.labeldfFileId = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfFileId = new Ifs.Fnd.ApplicationForms.cDataField();
            this.labeldfsTempDescriptionTo = new Ifs.Fnd.ApplicationForms.cBackgroundText();
            this.dfsTempDescriptionTo = new Ifs.Fnd.ApplicationForms.cDataField();
            this.pbOk = new Ifs.Fnd.ApplicationForms.cPushButton();
            this.pbCancel = new Ifs.Fnd.ApplicationForms.cPushButton();
            this.pbList = new Ifs.Fnd.ApplicationForms.cPushButton();
            this.ClientArea.SuspendLayout();
            this.SuspendLayout();
            // 
            // ToolBar
            // 
            resources.ApplyResources(this.ToolBar, "ToolBar");
            // 
            // ClientArea
            // 
            this.ClientArea.Controls.Add(this.pbList);
            this.ClientArea.Controls.Add(this.pbCancel);
            this.ClientArea.Controls.Add(this.pbOk);
            this.ClientArea.Controls.Add(this.dfsTempDescriptionTo);
            this.ClientArea.Controls.Add(this.dfFileId);
            this.ClientArea.Controls.Add(this.dfsTypeDescriptionFrom);
            this.ClientArea.Controls.Add(this.dfFileType);
            this.ClientArea.Controls.Add(this.dfsTempDescriptionFrom);
            this.ClientArea.Controls.Add(this.dfFromFileId);
            this.ClientArea.Controls.Add(this.labeldfsTempDescriptionTo);
            this.ClientArea.Controls.Add(this.labeldfFileId);
            this.ClientArea.Controls.Add(this.labeldfsTypeDescriptionFrom);
            this.ClientArea.Controls.Add(this.labeldfFileType);
            this.ClientArea.Controls.Add(this.labeldfsTempDescriptionFrom);
            this.ClientArea.Controls.Add(this.labeldfFromFileId);
            this.ClientArea.Controls.Add(this.gbDestination);
            this.ClientArea.Controls.Add(this.gbSource);
            resources.ApplyResources(this.ClientArea, "ClientArea");
            // 
            // commandManager
            // 
            this.commandManager.Components.Add(this.pbList);
            this.commandManager.Components.Add(this.pbCancel);
            this.commandManager.Components.Add(this.pbOk);
            // 
            // gbSource
            // 
            resources.ApplyResources(this.gbSource, "gbSource");
            this.gbSource.Name = "gbSource";
            this.gbSource.TabStop = false;
            // 
            // labeldfFromFileId
            // 
            resources.ApplyResources(this.labeldfFromFileId, "labeldfFromFileId");
            this.labeldfFromFileId.Name = "labeldfFromFileId";
            // 
            // dfFromFileId
            // 
            resources.ApplyResources(this.dfFromFileId, "dfFromFileId");
            this.dfFromFileId.Name = "dfFromFileId";
            this.dfFromFileId.NamedProperties.Put("EnumerateMethod", "");
            this.dfFromFileId.NamedProperties.Put("FieldFlags", "260");
            this.dfFromFileId.NamedProperties.Put("LovReference", "EXT_FILE_TEMPLATE");
            this.dfFromFileId.NamedProperties.Put("ResizeableChildObject", "");
            this.dfFromFileId.NamedProperties.Put("SqlColumn", "FILE_ID");
            this.dfFromFileId.NamedProperties.Put("ValidateMethod", "");
            this.dfFromFileId.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dfFromFileId_WindowActions);
            // 
            // labeldfsTempDescriptionFrom
            // 
            resources.ApplyResources(this.labeldfsTempDescriptionFrom, "labeldfsTempDescriptionFrom");
            this.labeldfsTempDescriptionFrom.Name = "labeldfsTempDescriptionFrom";
            // 
            // dfsTempDescriptionFrom
            // 
            resources.ApplyResources(this.dfsTempDescriptionFrom, "dfsTempDescriptionFrom");
            this.dfsTempDescriptionFrom.Name = "dfsTempDescriptionFrom";
            this.dfsTempDescriptionFrom.NamedProperties.Put("EnumerateMethod", "");
            this.dfsTempDescriptionFrom.NamedProperties.Put("FieldFlags", "288");
            this.dfsTempDescriptionFrom.NamedProperties.Put("LovReference", "");
            this.dfsTempDescriptionFrom.NamedProperties.Put("ResizeableChildObject", "");
            this.dfsTempDescriptionFrom.NamedProperties.Put("SqlColumn", "");
            this.dfsTempDescriptionFrom.NamedProperties.Put("ValidateMethod", "");
            this.dfsTempDescriptionFrom.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dfsTempDescriptionFrom_WindowActions);
            // 
            // labeldfFileType
            // 
            resources.ApplyResources(this.labeldfFileType, "labeldfFileType");
            this.labeldfFileType.Name = "labeldfFileType";
            // 
            // dfFileType
            // 
            resources.ApplyResources(this.dfFileType, "dfFileType");
            this.dfFileType.Name = "dfFileType";
            this.dfFileType.NamedProperties.Put("EnumerateMethod", "");
            this.dfFileType.NamedProperties.Put("LovReference", "");
            this.dfFileType.NamedProperties.Put("ResizeableChildObject", "");
            this.dfFileType.NamedProperties.Put("SqlColumn", "FILE_TYPE");
            this.dfFileType.NamedProperties.Put("ValidateMethod", "");
            this.dfFileType.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dfFileType_WindowActions);
            // 
            // labeldfsTypeDescriptionFrom
            // 
            resources.ApplyResources(this.labeldfsTypeDescriptionFrom, "labeldfsTypeDescriptionFrom");
            this.labeldfsTypeDescriptionFrom.Name = "labeldfsTypeDescriptionFrom";
            // 
            // dfsTypeDescriptionFrom
            // 
            resources.ApplyResources(this.dfsTypeDescriptionFrom, "dfsTypeDescriptionFrom");
            this.dfsTypeDescriptionFrom.Name = "dfsTypeDescriptionFrom";
            this.dfsTypeDescriptionFrom.NamedProperties.Put("EnumerateMethod", "");
            this.dfsTypeDescriptionFrom.NamedProperties.Put("FieldFlags", "288");
            this.dfsTypeDescriptionFrom.NamedProperties.Put("LovReference", "");
            this.dfsTypeDescriptionFrom.NamedProperties.Put("ResizeableChildObject", "");
            this.dfsTypeDescriptionFrom.NamedProperties.Put("SqlColumn", "");
            this.dfsTypeDescriptionFrom.NamedProperties.Put("ValidateMethod", "");
            this.dfsTypeDescriptionFrom.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dfsTypeDescriptionFrom_WindowActions);
            // 
            // gbDestination
            // 
            resources.ApplyResources(this.gbDestination, "gbDestination");
            this.gbDestination.Name = "gbDestination";
            this.gbDestination.TabStop = false;
            // 
            // labeldfFileId
            // 
            resources.ApplyResources(this.labeldfFileId, "labeldfFileId");
            this.labeldfFileId.Name = "labeldfFileId";
            // 
            // dfFileId
            // 
            resources.ApplyResources(this.dfFileId, "dfFileId");
            this.dfFileId.Name = "dfFileId";
            this.dfFileId.NamedProperties.Put("EnumerateMethod", "");
            this.dfFileId.NamedProperties.Put("FieldFlags", "260");
            this.dfFileId.NamedProperties.Put("LovReference", "");
            this.dfFileId.NamedProperties.Put("ResizeableChildObject", "");
            this.dfFileId.NamedProperties.Put("SqlColumn", "");
            this.dfFileId.NamedProperties.Put("ValidateMethod", "");
            this.dfFileId.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dfFileId_WindowActions);
            // 
            // labeldfsTempDescriptionTo
            // 
            resources.ApplyResources(this.labeldfsTempDescriptionTo, "labeldfsTempDescriptionTo");
            this.labeldfsTempDescriptionTo.Name = "labeldfsTempDescriptionTo";
            // 
            // dfsTempDescriptionTo
            // 
            resources.ApplyResources(this.dfsTempDescriptionTo, "dfsTempDescriptionTo");
            this.dfsTempDescriptionTo.Name = "dfsTempDescriptionTo";
            this.dfsTempDescriptionTo.NamedProperties.Put("EnumerateMethod", "");
            this.dfsTempDescriptionTo.NamedProperties.Put("FieldFlags", "292");
            this.dfsTempDescriptionTo.NamedProperties.Put("LovReference", "");
            this.dfsTempDescriptionTo.NamedProperties.Put("ResizeableChildObject", "");
            this.dfsTempDescriptionTo.NamedProperties.Put("SqlColumn", "");
            this.dfsTempDescriptionTo.NamedProperties.Put("ValidateMethod", "");
            this.dfsTempDescriptionTo.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dfsTempDescriptionTo_WindowActions);
            // 
            // pbOk
            // 
            resources.ApplyResources(this.pbOk, "pbOk");
            this.pbOk.Name = "pbOk";
            this.pbOk.NamedProperties.Put("MethodId", "18385");
            this.pbOk.NamedProperties.Put("MethodParameter", "OKButton");
            this.pbOk.NamedProperties.Put("ResizeableChildObject", "");
            // 
            // pbCancel
            // 
            resources.ApplyResources(this.pbCancel, "pbCancel");
            this.pbCancel.Name = "pbCancel";
            this.pbCancel.NamedProperties.Put("MethodId", "18385");
            this.pbCancel.NamedProperties.Put("MethodParameter", "CancelButton");
            this.pbCancel.NamedProperties.Put("ResizeableChildObject", "");
            // 
            // pbList
            // 
            this.pbList.AcceleratorKey = System.Windows.Forms.Keys.F8;
            resources.ApplyResources(this.pbList, "pbList");
            this.pbList.Name = "pbList";
            this.pbList.NamedProperties.Put("MethodId", "18385");
            this.pbList.NamedProperties.Put("MethodParameter", "ListButton");
            this.pbList.NamedProperties.Put("ResizeableChildObject", "");
            // 
            // dlgExtFileCopyFileTemplate
            // 
            resources.ApplyResources(this, "$this");
            this.Name = "dlgExtFileCopyFileTemplate";
            this.NamedProperties.Put("DefaultOrderBy", "");
            this.NamedProperties.Put("DefaultWhere", "");
            this.NamedProperties.Put("LogicalUnit", "");
            this.NamedProperties.Put("PackageName", "");
            this.NamedProperties.Put("ParentName", "[NaturalParent]");
            this.NamedProperties.Put("ResizeableChildObject", "");
            this.NamedProperties.Put("ViewName", "");
            this.NamedProperties.Put("Warnings", "FALSE");
            this.ShowIcon = false;
            this.WindowActions += new PPJ.Runtime.Windows.WindowActionsEventHandler(this.dlgExtFileCopyFileTemplate_WindowActions);
            this.ClientArea.ResumeLayout(false);
            this.ClientArea.PerformLayout();
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
	}
}
