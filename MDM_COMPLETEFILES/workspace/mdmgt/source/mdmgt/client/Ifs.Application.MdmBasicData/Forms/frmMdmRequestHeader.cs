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
    [FndWindowRegistration("MDM_REQUEST_HEADER", "MdmRequestHeader")]
    public partial class frmMdmRequestHeader : cMasterDetailTabFormWindow
    {
        #region Member Variables
        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public frmMdmRequestHeader()
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
        public new static frmMdmRequestHeader FromHandle(SalWindowHandle handle)
        {
            return ((frmMdmRequestHeader)SalWindow.FromHandle(handle, typeof(frmMdmRequestHeader)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods

        private void StateEnable()
        {
            dfnRequestNo.Enabled = true;
            dfsDescription.Enabled = true;
            dfnRevision.Enabled = true;
            dfsState.Enabled = true;
            dfsTemplateId.Enabled = true;
            dfsRequestedBy.Enabled = true;
            dfdRequestedDate.Enabled = true;
            cbApprovalRequired.Enabled = true;
            cbApprovalRejected.Enabled = true;
        }

        private void StateDisable()
        {
            dfnRequestNo.Enabled = false;
            dfsDescription.Enabled = false;
            dfnRevision.Enabled = false;
            dfsState.Enabled = false;
            dfsTemplateId.Enabled = false;
            dfsRequestedBy.Enabled = false;
            dfdRequestedDate.Enabled = false;
            cbApprovalRequired.Enabled = false;
            cbApprovalRejected.Enabled = false;
        }

        #endregion

        #region  Overrides

        #endregion

        #region Window Actions

        private void frmMdmRequestHeader_WindowActions(object sender, WindowActionsEventArgs e)
        {
          
        }

        #endregion

        #region Event Handlers

        #endregion

        #region Menu Event Handlers

        private void cmdReleased_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataRecordStateEvent(Const.METHOD_Execute, "Release");

        }

        private void cmdReleased_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {

            if (dfsState.Text == "New" || cbApprovalRequired.Text == "TRUE")
            {
                ((FndCommand)sender).Enabled = true;

            }
            else
            {
                ((FndCommand)sender).Enabled = false;
            }
        }

        private void cmdCompleted_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataRecordStateEvent(Const.METHOD_Execute, "Complete");

        }

        private void cmdCompleted_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            if (dfsState.Text == "Partially Tarnsfered" || dfsState.Text == "Tarnsfered")
            {
                ((FndCommand)sender).Enabled = true;
                StateDisable();
            }
            else
            {
                ((FndCommand)sender).Enabled = false;
            }
        }

        private void cmdCancelled_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataRecordStateEvent(Const.METHOD_Execute, "Cancelled");

        }

        private void cmdCancelled_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            if (dfsState.Text == "Released" || dfsState.Text == "Partially Approved")
            {
                ((FndCommand)sender).Enabled = true;
                StateDisable();
            }
            else
            {
                ((FndCommand)sender).Enabled = false;
            }
        }
        #endregion

        #region Multiple Inheritance Late Bind Interface

        public interface ColumnHeading
        {
            SalNumber ReturnResult();
        }
        #endregion


    }
}
