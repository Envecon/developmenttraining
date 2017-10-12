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
using System.Diagnostics;
using Ifs.Fnd.ApplicationForms;
using PPJ.Runtime;
using PPJ.Runtime.Windows;
using Ifs.Fnd.Windows.Forms;
using PPJ.Runtime.Sql;

namespace Ifs.Application.MdmBasicData
{

    /// <summary>
    /// </summary>
    [FndWindowRegistration("MDM_BASIC_DATA_HEADER", "MdmBasicDataHeader")]
    public partial class frmMdmBasicData : cMasterDetailTabFormWindow
    {
        #region Member Variables
        public SalNumber bReturn = 0;
        public SalNumber nTempId = 0;
        public SalString sPmRevision = "";
        public SalString sCopyStruc = "";
        public SalString sMoveStruc = "";
        public SalString sResult = "";
        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public frmMdmBasicData()
        {
            // This call is required by the Windows Form Designer.
            InitializeComponent();
        }

        #endregion

        #region System Methods/Properties

        /// <summary>
        /// Returns the object instance associated with the window handle.
        /// </summary>
        /// <param name="handle"></param>
        /// <returns></returns>
        [DebuggerStepThrough]
        public new static frmMdmBasicData FromHandle(SalWindowHandle handle)
        {
            return ((frmMdmBasicData)SalWindow.FromHandle(handle, typeof(frmMdmBasicData)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods

        private void Method_cmdActive_Execute()
       {
               ecmbTemplateId.Enabled=false;
               dfnRevision.Enabled=false;
               dfsDescription.Enabled=false;
               dfsState.Enabled=false;
               dfsCreatedBy.Enabled=false;
               dfdCreatedDate.Enabled=false;
               dfsProfileId.Enabled = false;
        }

        private void Method_cmdReOpen_Execute()
        {
            ecmbTemplateId.Enabled = true;
            dfnRevision.Enabled = true;
            dfsDescription.Enabled = true;
            dfsState.Enabled = true;
            dfsCreatedBy.Enabled = true;
            dfdCreatedDate.Enabled = true;
            dfsProfileId.Enabled = true;
        }

        private void Method_cmdCreateRevision_Execute()
        {
            SignatureHints hints = SignatureHints.NewContext();
            hints.Add("mdm_basic_data_header_api.C_Create_New_Revis_Struct", System.Data.ParameterDirection.Input, System.Data.ParameterDirection.Input);
            DbPLSQLTransaction(cSessionManager.c_hSql, "&AO.mdm_basic_data_header_api.C_Create_New_Revis_Struct( :hWndForm.frmMdmBasicData.ecmbTemplateId, :hWndForm.frmMdmBasicData.dfnRevision)");
        }

        #endregion

        #region Overrides
        public override SalNumber vrtActivate(fcURL URL)
        {
            return base.vrtActivate(URL);
        }
        #endregion

        #region Window Actions
        private void frmMdmBasicData_WindowActions(object sender, WindowActionsEventArgs e)
        {
            #region Actions
            switch (e.ActionType)
            {
                case Ifs.Fnd.ApplicationForms.Const.PM_DataSourcePopulate:
                    if(dfsState.Text=="Activated")
                    {
                        Method_cmdActive_Execute();
                    }
                    else
                    {
                        Method_cmdReOpen_Execute();
                    }
                    break;
            }
            #endregion

        }

        #endregion

        #region Event Handlers
        private void cmdActive_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataRecordStateEvent(Const.METHOD_Execute, "Active");
            Method_cmdActive_Execute();
        }

        private void cmdActive_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            if(dfsState.Text=="New")
            {
                ((FndCommand)sender).Enabled = true;
            }
            else
            {
                ((FndCommand)sender).Enabled = false;
            }
        }

        private void cmdReOpen_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataRecordStateEvent(Const.METHOD_Execute, "Reopen");
            Method_cmdReOpen_Execute();
        }

       

        private void cmdReOpen_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            if (dfsState.Text == "Activated")
            {
                ((FndCommand)sender).Enabled = true;
            }
            else
            {
                ((FndCommand)sender).Enabled = false;
            }
        }

        private void cmdCreateRevision_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            Method_cmdCreateRevision_Execute();
        }

        

        private void cmdCreateRevision_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            if (dfsState.Text == "Activated")
            {
                ((FndCommand)sender).Enabled = true;
            }
            else
            {
                ((FndCommand)sender).Enabled = false;
            }
        }
        #endregion

        #region Menu Event Handlers

        #endregion
    }
}
