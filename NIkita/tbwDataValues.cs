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
    public partial class tbwDataValues : cTableWindow
    {
        #region Member Variables
        public SalString sTemplateId = "";
        public SalNumber sRevision = 0;

        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public tbwDataValues()
        {
            // This call is required by the Windows Form Designer.
            InitializeComponent();
            ChangeColumnTitles();
        }

        #endregion

        #region System Methods/Properties

        /// <summary>
        /// Returns the object instance associated with the window handle.
        /// </summary>
        /// <param name="handle"></param>
        /// <returns></returns>
        [DebuggerStepThrough]
        public new static tbwDataValues FromHandle(SalWindowHandle handle)
        {
            return ((tbwDataValues)SalWindow.FromHandle(handle, typeof(tbwDataValues)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods
        //public void  ChangeColumnTitles()
        //{
        //  #region Local Variables
        //    SalNumber nRows = 0;
        //    SalNumber n = 0;
        //    SalArray<SalString> sNames = new SalArray<SalString>();
        //    SalArray<SalString> sValues = new SalArray<SalString>();
        //    SalNumber nRows2 = 0;
        //    SalNumber n2 = 0;
        //    SalArray<SalString> sNames2 = new SalArray<SalString>();
        //    SalArray<SalString> sValues2 = new SalArray<SalString>();
        //    SalNumber nRows3 = 0;
        //    SalNumber n3 = 0;
        //    SalArray<SalString> sNames3 = new SalArray<SalString>();
        //    SalArray<SalString> sValues3 = new SalArray<SalString>();
        //    SalString sColName = "";
        //    SalString sColDesc = "";
        //    #endregion

        //    #region Actions
        //    using (new SalContext(this))
        //    {
        //        this.sTemplateId = this.dfsTemplateId.Text;
        //      //  this.sRevision = Convert.ToInt32(this.dfnRevision);
        //        this.sRevision = 1;
        //        IDictionary<string, string> namedBindVariables = new Dictionary<string, string>();
        //        namedBindVariables.Add("ColumnTranslationMsg", this.QualifiedVarBindName("sColumnTranslationMsg"));
        //        namedBindVariables.Add("TemplateId", this.QualifiedVarBindName("sTemplateId"));
        //        namedBindVariables.Add("Revision", this.QualifiedVarBindName("sRevision"));
        //        string stmt = @"&AO.MDM_DATA_VALUES_API.Mdm_Get_Column_Names({ColumnTranslationMsg} OUT, {TemplateId} IN, {Revision} IN );";

        //        if (DbPLSQLBlock(stmt, namedBindVariables))
        //       {
        //      //       this.cColumnTranslationMsg.Unpack(this.sColumnTranslationMsg);
        //           //    if (this.cColumnTranslationMsg.GetName() == "COLUMNNAMES")
        //           //    {
        //           //        Sal.SendMsgToChildren(this.tbwDataValues, Const.PAM_ExtEnableDisable, Const.METHOD_ExtDisable, Sys.lParam);
        //           //        nRows = this.cColumnTranslationMsg.EnumAttributes(sNames, sValues);
        //           //        n = 0;
        //           //        while (n < nRows)
        //           //        {
        //           //            this.cColumnTranslationMsg2.Unpack(sValues[n]);
        //           //            if (this.cColumnTranslationMsg2.GetName() == "DETAILS")
        //           //            {
        //           //                nRows2 = this.cColumnTranslationMsg2.EnumAttributes(sNames2, sValues2);
        //           //                n2 = 0;
        //           //                if (nRows2 < 1)
        //           //                {
        //           //                    Sal.SendMsgToChildren(this.tbwDataValues, Const.PAM_ExtEnableDisable, Const.METHOD_ExtEnableDefault, Sys.lParam);
        //           //                }
        //           //                else
        //           //                {
        //           //                    while (n2 < nRows2)
        //           //                    {
        //           //                        this.cColumnTranslationMsg3.Unpack(sValues2[n2]);
        //           //                        if (this.cColumnTranslationMsg3.GetName() == "LINE")
        //           //                        {
        //           //                            nRows3 = this.cColumnTranslationMsg3.EnumAttributes(sNames3, sValues3);
        //           //                            n3 = 0;
        //           //                            sColName = this.cColumnTranslationMsg3.FindAttribute("NAME", Ifs.Fnd.ApplicationForms.Const.strNULL);
        //           //                            sColDesc = this.cColumnTranslationMsg3.FindAttribute("TRANS", Ifs.Fnd.ApplicationForms.Const.strNULL);
        //           //                            if (sColName != Ifs.Fnd.ApplicationForms.Const.strNULL)
        //           //                            {
        //           //                                Sal.SendMsgToChildren(this.tbwDataValues, Const.PAM_ExtTranslateTitle, sColName.ToHandle(), sColDesc.ToHandle());
        //           //                            }
        //           //                        }
        //           //                        n2 = n2 + 1;
        //           //                    }
        //           //                }
        //           //            }
        //           //            n = n + 1;
        //           //        }
        //           //    }
        //           //    Sal.PostMsg(this.tbwDataValues, Ifs.Fnd.ApplicationForms.Const.PM_TableColumnsOptimize, Ifs.Fnd.ApplicationForms.Const.METHOD_Execute, 0);
        //       }
        //        //else
        //        //{
        //        //    Sal.SendMsgToChildren(this.tbwDataValues, Const.PAM_ExtEnableDisable, Const.METHOD_ExtDisable, Sys.lParam);
        //        //}

        //    }

        //  //  return 0;
        //    #endregion
        //}

        public void ChangeColumnTitles()
        {
            SalNumber nIndex = 0;
            Sal.WaitCursor(true);
            SignatureHints hints = SignatureHints.NewContext();
            hints.Add("mdm_data_values_api.Mdm_Get_Column_Names", System.Data.ParameterDirection.Input, System.Data.ParameterDirection.Input);
            DbPLSQLBlock(cSessionManager.c_hSql, ":i_hWndFrame.tbwDataValues.sObjid := &AO.mdm_data_values_api.Mdm_Get_Column_Names (:hWndForm.frmMdmBasicData.ecmbTemplateId.i_sMyValue,:i_hWndFrame.frmMdmBasicData.dfnRevision)");
        }
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
