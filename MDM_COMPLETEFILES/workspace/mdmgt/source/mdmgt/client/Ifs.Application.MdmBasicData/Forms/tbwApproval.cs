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

namespace Ifs.Application.MdmBasicData
{

    /// <summary>
    /// </summary>
    public partial class tbwApproval : cTableWindow
    {
        #region Member Variables

        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public tbwApproval()
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
        public new static tbwApproval FromHandle(SalWindowHandle handle)
        {
            return ((tbwApproval)SalWindow.FromHandle(handle, typeof(tbwApproval)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods
        public new SalNumber DataSourceSaveMarkCommitted()
        {
            #region Local Variables
            SalString sFormName = "";
            #endregion

            #region Actions
            using (new SalContext(this))
            {
                ((cTableManager)this).DataSourceSaveMarkCommitted();
                ((cTableManager)this).DataSourceRefresh(Ifs.Fnd.ApplicationForms.Const.METHOD_Execute);
            }

            return 0;
            #endregion
        }
        #endregion

        #region Overrides

        public override SalNumber vrtDataSourceSaveMarkCommitted()
        {
            return this.DataSourceSaveMarkCommitted();
        }
        #endregion

        #region Window Actions

        #endregion

        #region Event Handlers

        private void cmdApprove_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {

        }

        private void cmdApprove_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {

        }

        private void cmdReject_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {

        }

        private void cmdReject_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {

        }

        private void cmdRevoke_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {

        }

        private void cmdRevoke_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {

        }

        private void cmdForward_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            ((FndCommand)sender).Enabled = false;
            SalNumber nRow = Sys.TBL_MinRow;
            int selectedRow = Sys.ROW_Selected;
            if (this.FindNextRow(ref nRow, selectedRow, 0))
            {
                if (!this.FindNextRow(ref nRow, selectedRow, 0))
                {
                    ((FndCommand)sender).Enabled = true;
                }

            }
        }

        private void cmdForward_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataSourcePrepareKeyTransfer("dlgForwardAuthorization");
            if (dlgForwardAuthorization.ModalDialog(Int.ExplorerForm) == Sys.IDOK)
            {
                this.DataSourceRefresh(Const.METHOD_Execute);
            }
        }

        #endregion

        #region Menu Event Handlers

        #endregion
    }
}
