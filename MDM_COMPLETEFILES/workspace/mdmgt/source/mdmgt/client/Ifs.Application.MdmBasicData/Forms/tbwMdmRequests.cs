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
    public partial class tbwMdmRequests : cTableWindow
    {
        #region Member Variables

        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public tbwMdmRequests()
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
        public new static tbwMdmRequests FromHandle(SalWindowHandle handle)
        {
            return ((tbwMdmRequests)SalWindow.FromHandle(handle, typeof(tbwMdmRequests)));
        }

        #endregion

       

        #region Properties

        #endregion

        #region Methods
       
        #endregion

        #region Overrides
        public override SalNumber vrtDataSourcePrepareKeyTransfer(SalString sWindowName)
        {
            SalNumber nReturn = base.vrtDataSourcePrepareKeyTransfer(sWindowName);
            if (sWindowName == "frmMdmRequestHeader")
            {
                SalArray<SalString> sItemvalues = new SalArray<SalString>();
                sItemvalues[0] = colsTemplateId.Text;
                Var.DataTransfer.ItemAdd("Template_Id", sItemvalues);
            }
            return nReturn;
        }


        public override SalBoolean vrtFrameStartupUser()
        {
            //MessageBox.Show("FrameStartupUser()");
            return base.vrtFrameStartupUser();
        }
        public override SalNumber vrtActivate(fcURL URL)
        {
            //MessageBox.Show("vrtActivate");
            return base.vrtActivate(URL);
        }
        #endregion

        #region Window Actions

        #endregion

        #region Event Handlers
        private void cmdMdmRequest_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            this.DataSourceCreateWindow(Const.METHOD_Execute, "frmMdmRequestHeader");
        }

        private void cmdMdmRequest_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
            ((FndCommand)sender).Enabled = false;
            SalNumber nRow = Sys.TBL_MinRow;
            int selectedRow = Sys.ROW_Selected;
            if (this.FindNextRow(ref nRow, selectedRow, 0))
            {
                if (!this.FindNextRow(ref nRow, selectedRow, 0))
                {
                    ((FndCommand)sender).Enabled = this.DataSourceCreateWindow(Const.METHOD_Inquire, "frmMdmRequestHeader");
                }

            }
        }
        #endregion

        #region Menu Event Handlers

        #endregion
    }
}
