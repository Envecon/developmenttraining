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
    ///
    [FndWindowRegistration("MDM_METHOD_LIST", "MdmMethodList")]
    [FndDynamicTabPage("frmMdmBasicData.picTab", "METHODLIST", "tbwMethodList", "TAB_NAME_MethodList", 0)]
    public partial class tbwMethodList : cTableWindow
    {
        #region Member Variables

        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public tbwMethodList()
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
        public new static tbwMethodList FromHandle(SalWindowHandle handle)
        {
            return ((tbwMethodList)SalWindow.FromHandle(handle, typeof(tbwMethodList)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods


        /// <summary>
        /// </summary>
        /// <returns></returns>
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

        private void tableWindow_colsMethodName_WindowActions(object sender, WindowActionsEventArgs e)
        {
            switch (e.ActionType)
            {
                case Ifs.Fnd.ApplicationForms.Const.PM_DataItemEditor:
                    if (colsViewName != null)
                    {
                        colsMethodName.Text = colsViewName.Text + "_API";
                    }
                    break;
            }
        }
        private void Method_ON_PM_DataItemSave(object sender, WindowActionsEventArgs e)
        {
            SalString sResult = "";
            SalString sObjid = "";
            SignatureHints hints = SignatureHints.NewContext();
            // hints.Add("Mdm_method_list_API.Find_Method_Name", System.Data.ParameterDirection.Input, System.Data.ParameterDirection.Input);
            //DbPLSQLTransaction(cSessionManager.c_hSql, "&AO.Mdm_method_list_API.Find_Method_Name( :hWndForm.tbwMethodList.colsViewName, :hWndForm.tbwMethodList.colsMethodName)");
            hints.Add("Mdm_method_list_API.Find_Method_Name", System.Data.ParameterDirection.Input, System.Data.ParameterDirection.Input);
            DbPLSQLBlock(cSessionManager.c_hSql, ":i_hWndFrame.tbwMethodList.sObjid := &AO.Mdm_method_list_API.Find_Method_Name (:hWndForm.tbwMethodList.colsViewName, :hWndForm.tbwMethodList.colsMethodName)");
            sResult = sObjid;
        }

        



        #region Window Actions

        #endregion

        #region Event Handlers

        #endregion

        #region Menu Event Handlers

        #endregion
    }
}
