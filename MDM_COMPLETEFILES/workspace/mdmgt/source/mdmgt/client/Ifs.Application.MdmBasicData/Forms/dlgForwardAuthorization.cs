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
    public partial class dlgForwardAuthorization : cDialog
    {
        #region Member Variables
        SalWindowHandle hWndFocusField;
        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        protected dlgForwardAuthorization()
        {
            // This call is required by the Windows Form Designer.
            InitializeComponent();
        }

        #endregion

        #region System Methods/Properties

        /// <summary>
        /// Shows the modal dialog.
        /// </summary>
        /// <param name="owner"></param>
        /// <returns></returns>
        public static SalNumber ModalDialog(Control owner)
        {
            dlgForwardAuthorization dlg = DialogFactory.CreateInstance<dlgForwardAuthorization>();
            SalNumber ret = dlg.ShowDialog(owner);
            return ret;
        }

        /// <summary>
        /// Returns the object instance associated with the window handle.
        /// </summary>
        /// <param name="handle"></param>
        /// <returns></returns>
        [DebuggerStepThrough]
        public new static dlgForwardAuthorization FromHandle(SalWindowHandle handle)
        {
            return ((dlgForwardAuthorization)SalWindow.FromHandle(handle, typeof(dlgForwardAuthorization)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods

        #endregion

        #region Overrides
        public override SalBoolean vrtFrameStartupUser()
        {
            SalArray<SalString> sItemValues = new SalArray<SalString>();

            if (Var.DataTransfer.RecCountGet() > 0)
            {
                Var.DataTransfer.ItemGet("TEMPLATE_ID", sItemValues);
                dfsTemplateId.Text = sItemValues[0];

                Var.DataTransfer.ItemGet("REVISION", sItemValues);
                dfnRevision.Text = sItemValues[0];

                Var.DataTransfer.ItemGet("REQUEST_NO", sItemValues);
                dfnRevision.Text = sItemValues[0];

               Var.DataTransfer.Reset();
            }

            return base.vrtFrameStartupUser();
        }

        #endregion

        #region Window Actions
        private void dlgForwardAuthorization_WindowActions(object sender, WindowActionsEventArgs e)
        {
            switch (e.ActionType)
            {
                case Const.PM_DataSourceQueryFieldName:
                    dlgForwardAuthorization_OnPM_DataSourceQueryFieldName(sender, e);
                    break;
            }
        }

        private void dlgForwardAuthorization_OnPM_DataSourceQueryFieldName(object sender, WindowActionsEventArgs e)
        {
            e.Handled = true;

            if (e.WParam.ToInt32() != PPJ.Runtime.Vis.Vis.DT_Handle)
            {
                if (Sal.NumberToHString(e.LParam) == "TEMPLATE_ID")
                {
                    e.Return = ((SalString)"i_hWndFrame.dlgForwardAuthorization.dfsTemplateId").ToHandle();
                }
                else if (Sal.NumberToHString(e.LParam) == "REVISION")
                {
                    e.Return = ((SalString)"i_hWndFrame.dlgForwardAuthorization.dfnRevision").ToHandle();
                }
                else if (Sal.NumberToHString(e.LParam) == "REQUEST_NO")
                {
                    e.Return = ((SalString)"i_hWndFrame.dlgForwardAuthorization.dfnRequestNo").ToHandle();
                }
                else
                {
                    e.Return = Sal.SendClassMessage(Const.PM_DataSourceQueryFieldName, e.WParam, e.LParam);
                }
            }
            else if (e.WParam.ToInt32() == PPJ.Runtime.Vis.Vis.DT_Handle)
            {
                if (Sal.NumberToHString(e.LParam) == "TEMPLATE_ID")
                {
                    e.Return = Sal.WindowHandleToNumber(dfsTemplateId);
                }
                else if (Sal.NumberToHString(e.LParam) == "REVISION")
                {
                    e.Return = Sal.WindowHandleToNumber(dfnRevision);
                }
                else if (Sal.NumberToHString(e.LParam) == "REQUEST_NO")
                {
                    e.Return = Sal.WindowHandleToNumber(dfnRequestNo);
                }
                else
                {
                    e.Return = Sal.SendClassMessage(Const.PM_DataSourceQueryFieldName, e.WParam, e.LParam);
                }
            }
        }
        #endregion

        #region Event Handlers

        private void commandOk_Execute(object sender, Ifs.Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            // Dialog class have AcceptButton set to run this logic if the user ends the dialog using the Return button.
            // PPJ dialog close trough Sal.EndDialog so we set DialogResult to prevent the dialog from closing premature.
            DialogResult = DialogResult.None;

            Sal.EndDialog(this, Sys.IDOK);
        }

        private void commandCancel_Execute(object sender, Ifs.Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            // Dialog class have CancelButton set to run this logic even if the user close the dialog trough the esc button.
            // PPJ dialog close trough Sal.EndDialog so we set DialogResult to prevent the dialog from closing premature.
            DialogResult = DialogResult.None;

            Sal.EndDialog(this, Sys.IDCANCEL);
        }

        #endregion

       

        private void commandList_Execute(object sender, Fnd.Windows.Forms.FndCommandExecuteEventArgs e)
        {
            hWndFocusField.SendMessage(Const.PM_DataItemLov, Const.METHOD_Execute, 0);
        }

        private void commandList_Inquire(object sender, Fnd.Windows.Forms.FndCommandInquireEventArgs e)
        {
           // hWndFocusField = Sal.GetFocus();
           // ((FndCommand)sender).Enabled = hWndFocusField.SendMessage(Const.PM_DataItemLov, Const.METHOD_Inquire, 0);
        }

       
        #region Menu Event Handlers

        #endregion
    }
}
