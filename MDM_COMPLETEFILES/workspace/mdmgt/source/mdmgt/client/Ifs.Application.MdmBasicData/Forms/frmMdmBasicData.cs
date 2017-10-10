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

namespace Ifs.Application.MdmBasicData
{

    /// <summary>
    /// </summary>
    public partial class frmMdmBasicData : cMasterDetailTabFormWindow
    {
        #region Member Variables

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

        private void picTab_Load(object sender, EventArgs e)
        {

        }

        private void labelStatus_Click(object sender, EventArgs e)
        {

        }

        private void dfsStatus_TextChanged(object sender, EventArgs e)
        {

        }

        private void cmdActive_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            e.Handled = true;
        }

        private void cmdActive_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            ((Ifs.Fnd.Windows.Forms.FndCommand)sender).Enabled = true;
        }

        private void cmdReOpen_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            e.Handled = true;
        }

        private void cmdReOpen_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            ((Ifs.Fnd.Windows.Forms.FndCommand)sender).Enabled = false;
        }

        private void cmdCreateRevision_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            e.Handled = true;
        }

        private void cmdCreateRevision_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            ((Ifs.Fnd.Windows.Forms.FndCommand)sender).Enabled = false;
        }



        #region Properties

        #endregion

        #region Methods

        #endregion

        #region Overrides

        #endregion

        #region Window Actions

        #endregion

        #region Event Handlers

        #endregion

        #region Menu Event Handlers

        #endregion
    }
}
