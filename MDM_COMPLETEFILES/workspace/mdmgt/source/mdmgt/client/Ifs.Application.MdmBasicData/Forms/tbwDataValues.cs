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

using System.IO;
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
using System.Text.RegularExpressions;


namespace Ifs.Application.MdmBasicData
{

    /// <summary>
    /// </summary>
    [FndWindowRegistration("MDM_DATA_VALUES", "MdmDataValues")]

    public partial class tbwDataValues : cTableWindow
    {
        #region Member Variables
        public SalString sResMsg = "";
        public cMessage cColumnTranslationMsg = new cMessage();
        public cMessage cColumnTranslationMsg2 = new cMessage();
        public cMessage cColumnTranslationMsg3 = new cMessage();
        SalString sParentTemplate = "";
        SalNumber nChngeColRes = 0;
        #endregion

        #region Constructors/Destructors

        /// <summary>
        /// Default Constructor.
        /// </summary>
        public tbwDataValues()
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
        public new static tbwDataValues FromHandle(SalWindowHandle handle)
        {
            return ((tbwDataValues)SalWindow.FromHandle(handle, typeof(tbwDataValues)));
        }

        #endregion

        #region Properties

        #endregion

        #region Methods

        private void TbwDataValues_ONPM_DataSourcePopulate(object sender, WindowActionsEventArgs e)
        {
            //ChangeColumnTitles();
        }

        public virtual SalNumber ChangeColumnTitles()
        {
            #region Local Variables
            SalNumber nRows = 0;
            SalNumber n = 0;
            SalArray<SalString> sNames = new SalArray<SalString>();
            SalArray<SalString> sValues = new SalArray<SalString>();
            SalNumber nRows2 = 0;
            SalNumber n2 = 0;
            SalArray<SalString> sNames2 = new SalArray<SalString>();
            SalArray<SalString> sValues2 = new SalArray<SalString>();
            SalNumber nRows3 = 0;
            SalNumber n3 = 0;
            SalArray<SalString> sNames3 = new SalArray<SalString>();
            SalArray<SalString> sValues3 = new SalArray<SalString>();
            SalString sColName = "";
            SalString sColDesc = "";
            int tempPos = 2;
            #endregion
            SalString sRes = "";
            //i_hWndParent = ((System.Windows.Forms.Form)(i_hWndParent.Control));  
            sParentTemplate = ((PPJ.Runtime.Windows.SalDataField)(((Ifs.Application.MdmBasicData.frmMdmRequestHeader)(i_hWndParent.Control)).dfsTemplateId)).Text;
            nChngeColRes = Convert.ToInt32(((System.Windows.Forms.TextBox)(((Ifs.Application.MdmBasicData.frmMdmRequestHeader)(i_hWndParent.Control)).dfnRevision)).Text);

            SignatureHints hints = SignatureHints.NewContext();
            hints.Add("mdm_data_values_api.Mdm_Get_Column_Names", System.Data.ParameterDirection.Output, System.Data.ParameterDirection.Input, System.Data.ParameterDirection.Input);
            if (sParentTemplate != "" && nChngeColRes != 0)
            {
                if (DbPLSQLBlock(cSessionManager.c_hSql, cSessionManager.c_sDbPrefix + "mdm_data_values_api.Mdm_Get_Column_Names(\r\n" +
                                " 	  :hWndForm.tbwDataValues.sResMsg,\r\n" +
                                "                  :hWndForm.tbwDataValues.sParentTemplate,\r\n" +
                                "	  :hWndForm.tbwDataValues.nChngeColRes )"))
                {
                    sRes = sResMsg;
                }
            }

           // sRes = frmMdmRequestHeader.FromHandle(i_hWndParent).sResult;
            if (sRes != "")
            {
                this.cColumnTranslationMsg.Unpack(sRes);
                nRows = this.cColumnTranslationMsg.EnumAttributes(sNames, sValues);
                n = 0;
                while (n < nRows)
                {
                    this.cColumnTranslationMsg2.Unpack(sValues[n]);
                    if (this.cColumnTranslationMsg2.GetName() == "DETAILS")
                    {
                        nRows2 = this.cColumnTranslationMsg2.EnumAttributes(sNames2, sValues2);
                        n2 = 0;


                        while (n2 < nRows2)
                        {
                            this.cColumnTranslationMsg3.Unpack(sValues2[n2]);
                            if (this.cColumnTranslationMsg3.GetName() == "LINE")
                            {
                                nRows3 = this.cColumnTranslationMsg3.EnumAttributes(sNames3, sValues3);
                                n3 = 0;
                                sColName = this.cColumnTranslationMsg3.FindAttribute("NAME", Ifs.Fnd.ApplicationForms.Const.strNULL);
                                sColDesc = this.cColumnTranslationMsg3.FindAttribute("TRANS", Ifs.Fnd.ApplicationForms.Const.strNULL);


                                if (sColName == "N1") { colnN1.Title = sColDesc.ToString(); colnN1.Visible = true; colnN1.Position = tempPos; tempPos++; }
                                if (sColName == "N2") { colnN2.Title = sColDesc.ToString(); colnN2.Visible = true; colnN2.Position = tempPos; tempPos++; }
                                if (sColName == "N3") { colnN3.Title = sColDesc.ToString(); colnN3.Visible = true; colnN3.Position = tempPos; tempPos++; }
                                if (sColName == "N4") { colnN4.Title = sColDesc.ToString(); colnN4.Visible = true; colnN4.Position = tempPos; tempPos++; }
                                if (sColName == "N5") { colnN5.Title = sColDesc.ToString(); colnN5.Visible = true; colnN5.Position = tempPos; tempPos++; }
                                if (sColName == "N6") { colnN6.Title = sColDesc.ToString(); colnN6.Visible = true; colnN6.Position = tempPos; tempPos++; }
                                if (sColName == "N7") { colnN7.Title = sColDesc.ToString(); colnN7.Visible = true; colnN7.Position = tempPos; tempPos++; }
                                if (sColName == "N8") { colnN8.Title = sColDesc.ToString(); colnN8.Visible = true; colnN8.Position = tempPos; tempPos++; }
                                if (sColName == "N9") { colnN9.Title = sColDesc.ToString(); colnN9.Visible = true; colnN9.Position = tempPos; tempPos++; }
                                if (sColName == "N10") { colnN10.Title = sColDesc.ToString(); colnN10.Visible = true; colnN10.Position = tempPos; tempPos++; }

                                if (sColName == "D1") { coldD1.Title = sColDesc.ToString(); coldD1.Visible = true; coldD1.Position = tempPos; tempPos++; }
                                if (sColName == "D2") { coldD2.Title = sColDesc.ToString(); coldD2.Visible = true; coldD2.Position = tempPos; tempPos++; }
                                if (sColName == "D3") { coldD3.Title = sColDesc.ToString(); coldD3.Visible = true; coldD3.Position = tempPos; tempPos++; }
                                if (sColName == "D4") { coldD4.Title = sColDesc.ToString(); coldD4.Visible = true; coldD4.Position = tempPos; tempPos++; }
                                if (sColName == "D5") { coldD5.Title = sColDesc.ToString(); coldD5.Visible = true; coldD5.Position = tempPos; tempPos++; }
                                if (sColName == "D6") { coldD6.Title = sColDesc.ToString(); coldD6.Visible = true; coldD6.Position = tempPos; tempPos++; }
                                if (sColName == "D7") { coldD7.Title = sColDesc.ToString(); coldD7.Visible = true; coldD7.Position = tempPos; tempPos++; }
                                if (sColName == "D8") { coldD8.Title = sColDesc.ToString(); coldD8.Visible = true; coldD8.Position = tempPos; tempPos++; }
                                if (sColName == "D9") { coldD9.Title = sColDesc.ToString(); coldD9.Visible = true; coldD9.Position = tempPos; tempPos++; }
                                if (sColName == "D10") { coldD10.Title = sColDesc.ToString(); coldD10.Visible = true; coldD10.Position = tempPos; tempPos++; }

                                if (sColName == "S1") { colsS1.Title = sColDesc.ToString(); colsS1.Visible = true; colsS1.Position = tempPos; tempPos++; }
                                if (sColName == "S2") { colsS2.Title = sColDesc.ToString(); colsS2.Visible = true; colsS2.Position = tempPos; tempPos++; }
                                if (sColName == "S3") { colsS3.Title = sColDesc.ToString(); colsS3.Visible = true; colsS3.Position = tempPos; tempPos++; }
                                if (sColName == "S4") { colsS4.Title = sColDesc.ToString(); colsS4.Visible = true; colsS4.Position = tempPos; tempPos++; }
                                if (sColName == "S5") { colsS5.Title = sColDesc.ToString(); colsS5.Visible = true; colsS5.Position = tempPos; tempPos++; }
                                if (sColName == "S6") { colsS6.Title = sColDesc.ToString(); colsS6.Visible = true; colsS6.Position = tempPos; tempPos++; }
                                if (sColName == "S7") { colsS7.Title = sColDesc.ToString(); colsS7.Visible = true; colsS7.Position = tempPos; tempPos++; }
                                if (sColName == "S8") { colsS8.Title = sColDesc.ToString(); colsS8.Visible = true; colsS8.Position = tempPos; tempPos++; }
                                if (sColName == "S9") { colsS9.Title = sColDesc.ToString(); colsS9.Visible = true; colsS9.Position = tempPos; tempPos++; }
                                if (sColName == "S10") { colsS10.Title = sColDesc.ToString(); colsS10.Visible = true; colsS10.Position = tempPos; tempPos++; }
                                if (sColName == "S11") { colsS11.Title = sColDesc.ToString(); colsS11.Visible = true; colsS11.Position = tempPos; tempPos++; }
                                if (sColName == "S12") { colsS12.Title = sColDesc.ToString(); colsS12.Visible = true; colsS12.Position = tempPos; tempPos++; }
                                if (sColName == "S13") { colsS13.Title = sColDesc.ToString(); colsS13.Visible = true; colsS13.Position = tempPos; tempPos++; }
                                if (sColName == "S14") { colsS14.Title = sColDesc.ToString(); colsS14.Visible = true; colsS14.Position = tempPos; tempPos++; }
                                if (sColName == "S15") { colsS15.Title = sColDesc.ToString(); colsS15.Visible = true; colsS15.Position = tempPos; tempPos++; }
                                if (sColName == "S16") { colsS16.Title = sColDesc.ToString(); colsS16.Visible = true; colsS16.Position = tempPos; tempPos++; }
                                if (sColName == "S17") { colsS17.Title = sColDesc.ToString(); colsS17.Visible = true; colsS17.Position = tempPos; tempPos++; }
                                if (sColName == "S18") { colsS18.Title = sColDesc.ToString(); colsS18.Visible = true; colsS18.Position = tempPos; tempPos++; }
                                if (sColName == "S19") { colsS19.Title = sColDesc.ToString(); colsS19.Visible = true; colsS19.Position = tempPos; tempPos++; }
                                if (sColName == "S20") { colsS20.Title = sColDesc.ToString(); colsS20.Visible = true; colsS20.Position = tempPos; tempPos++; }
                                if (sColName == "S21") { colsS21.Title = sColDesc.ToString(); colsS21.Visible = true; colsS21.Position = tempPos; tempPos++; }
                                if (sColName == "S22") { colsS22.Title = sColDesc.ToString(); colsS22.Visible = true; colsS22.Position = tempPos; tempPos++; }
                                if (sColName == "S23") { colsS23.Title = sColDesc.ToString(); colsS23.Visible = true; colsS23.Position = tempPos; tempPos++; }
                                if (sColName == "S24") { colsS24.Title = sColDesc.ToString(); colsS24.Visible = true; colsS24.Position = tempPos; tempPos++; }
                                if (sColName == "S25") { colsS25.Title = sColDesc.ToString(); colsS25.Visible = true; colsS25.Position = tempPos; tempPos++; }
                                if (sColName == "S26") { colsS26.Title = sColDesc.ToString(); colsS26.Visible = true; colsS26.Position = tempPos; tempPos++; }
                                if (sColName == "S27") { colsS27.Title = sColDesc.ToString(); colsS27.Visible = true; colsS27.Position = tempPos; tempPos++; }
                                if (sColName == "S28") { colsS28.Title = sColDesc.ToString(); colsS28.Visible = true; colsS28.Position = tempPos; tempPos++; }
                                if (sColName == "S29") { colsS29.Title = sColDesc.ToString(); colsS29.Visible = true; colsS29.Position = tempPos; tempPos++; }
                                if (sColName == "S30") { colsS30.Title = sColDesc.ToString(); colsS30.Visible = true; colsS30.Position = tempPos; tempPos++; }
                                if (sColName == "S31") { colsS31.Title = sColDesc.ToString(); colsS31.Visible = true; colsS31.Position = tempPos; tempPos++; }
                                if (sColName == "S32") { colsS32.Title = sColDesc.ToString(); colsS32.Visible = true; colsS32.Position = tempPos; tempPos++; }
                                if (sColName == "S33") { colsS33.Title = sColDesc.ToString(); colsS33.Visible = true; colsS33.Position = tempPos; tempPos++; }
                                if (sColName == "S34") { colsS34.Title = sColDesc.ToString(); colsS34.Visible = true; colsS34.Position = tempPos; tempPos++; }
                                if (sColName == "S35") { colsS35.Title = sColDesc.ToString(); colsS35.Visible = true; colsS35.Position = tempPos; tempPos++; }
                                if (sColName == "S36") { colsS36.Title = sColDesc.ToString(); colsS36.Visible = true; colsS36.Position = tempPos; tempPos++; }
                                if (sColName == "S37") { colsS37.Title = sColDesc.ToString(); colsS37.Visible = true; colsS37.Position = tempPos; tempPos++; }
                                if (sColName == "S38") { colsS38.Title = sColDesc.ToString(); colsS38.Visible = true; colsS38.Position = tempPos; tempPos++; }
                                if (sColName == "S39") { colsS39.Title = sColDesc.ToString(); colsS39.Visible = true; colsS39.Position = tempPos; tempPos++; }
                                if (sColName == "S40") { colsS40.Title = sColDesc.ToString(); colsS40.Visible = true; colsS40.Position = tempPos; tempPos++; }
                                if (sColName == "S41") { colsS41.Title = sColDesc.ToString(); colsS41.Visible = true; colsS41.Position = tempPos; tempPos++; }
                                if (sColName == "S42") { colsS42.Title = sColDesc.ToString(); colsS42.Visible = true; colsS42.Position = tempPos; tempPos++; }
                                if (sColName == "S43") { colsS43.Title = sColDesc.ToString(); colsS43.Visible = true; colsS43.Position = tempPos; tempPos++; }
                                if (sColName == "S44") { colsS44.Title = sColDesc.ToString(); colsS44.Visible = true; colsS44.Position = tempPos; tempPos++; }
                                if (sColName == "S45") { colsS45.Title = sColDesc.ToString(); colsS45.Visible = true; colsS45.Position = tempPos; tempPos++; }
                                if (sColName == "S46") { colsS46.Title = sColDesc.ToString(); colsS46.Visible = true; colsS46.Position = tempPos; tempPos++; }
                                if (sColName == "S47") { colsS47.Title = sColDesc.ToString(); colsS47.Visible = true; colsS47.Position = tempPos; tempPos++; }
                                if (sColName == "S48") { colsS48.Title = sColDesc.ToString(); colsS48.Visible = true; colsS48.Position = tempPos; tempPos++; }
                                if (sColName == "S49") { colsS49.Title = sColDesc.ToString(); colsS49.Visible = true; colsS49.Position = tempPos; tempPos++; }
                                if (sColName == "S50") { colsS50.Title = sColDesc.ToString(); colsS50.Visible = true; colsS50.Position = tempPos; tempPos++; }
                                if (sColName == "S51") { colsS51.Title = sColDesc.ToString(); colsS51.Visible = true; colsS51.Position = tempPos; tempPos++; }
                                if (sColName == "S52") { colsS52.Title = sColDesc.ToString(); colsS52.Visible = true; colsS52.Position = tempPos; tempPos++; }
                                if (sColName == "S53") { colsS53.Title = sColDesc.ToString(); colsS53.Visible = true; colsS53.Position = tempPos; tempPos++; }
                                if (sColName == "S54") { colsS54.Title = sColDesc.ToString(); colsS54.Visible = true; colsS54.Position = tempPos; tempPos++; }
                                if (sColName == "S55") { colsS55.Title = sColDesc.ToString(); colsS55.Visible = true; colsS55.Position = tempPos; tempPos++; }
                                if (sColName == "S56") { colsS56.Title = sColDesc.ToString(); colsS56.Visible = true; colsS56.Position = tempPos; tempPos++; }
                                if (sColName == "S57") { colsS57.Title = sColDesc.ToString(); colsS57.Visible = true; colsS57.Position = tempPos; tempPos++; }
                                if (sColName == "S58") { colsS58.Title = sColDesc.ToString(); colsS58.Visible = true; colsS58.Position = tempPos; tempPos++; }
                                if (sColName == "S59") { colsS59.Title = sColDesc.ToString(); colsS59.Visible = true; colsS59.Position = tempPos; tempPos++; }
                                if (sColName == "S60") { colsS60.Title = sColDesc.ToString(); colsS60.Visible = true; colsS60.Position = tempPos; tempPos++; }
                                if (sColName == "S61") { colsS61.Title = sColDesc.ToString(); colsS61.Visible = true; colsS61.Position = tempPos; tempPos++; }
                                if (sColName == "S62") { colsS62.Title = sColDesc.ToString(); colsS62.Visible = true; colsS62.Position = tempPos; tempPos++; }
                                if (sColName == "S63") { colsS63.Title = sColDesc.ToString(); colsS63.Visible = true; colsS63.Position = tempPos; tempPos++; }
                                if (sColName == "S64") { colsS64.Title = sColDesc.ToString(); colsS64.Visible = true; colsS64.Position = tempPos; tempPos++; }
                                if (sColName == "S65") { colsS65.Title = sColDesc.ToString(); colsS65.Visible = true; colsS65.Position = tempPos; tempPos++; }
                                if (sColName == "S66") { colsS66.Title = sColDesc.ToString(); colsS66.Visible = true; colsS66.Position = tempPos; tempPos++; }
                                if (sColName == "S67") { colsS67.Title = sColDesc.ToString(); colsS67.Visible = true; colsS67.Position = tempPos; tempPos++; }
                                if (sColName == "S68") { colsS68.Title = sColDesc.ToString(); colsS68.Visible = true; colsS68.Position = tempPos; tempPos++; }
                                if (sColName == "S69") { colsS69.Title = sColDesc.ToString(); colsS69.Visible = true; colsS69.Position = tempPos; tempPos++; }
                                if (sColName == "S70") { colsS70.Title = sColDesc.ToString(); colsS70.Visible = true; colsS70.Position = tempPos; tempPos++; }
                                if (sColName == "S71") { colsS71.Title = sColDesc.ToString(); colsS71.Visible = true; colsS71.Position = tempPos; tempPos++; }
                                if (sColName == "S72") { colsS72.Title = sColDesc.ToString(); colsS72.Visible = true; colsS72.Position = tempPos; tempPos++; }
                                if (sColName == "S73") { colsS73.Title = sColDesc.ToString(); colsS73.Visible = true; colsS73.Position = tempPos; tempPos++; }
                                if (sColName == "S74") { colsS74.Title = sColDesc.ToString(); colsS74.Visible = true; colsS74.Position = tempPos; tempPos++; }
                                if (sColName == "S75") { colsS75.Title = sColDesc.ToString(); colsS75.Visible = true; colsS75.Position = tempPos; tempPos++; }
                                if (sColName == "S76") { colsS76.Title = sColDesc.ToString(); colsS76.Visible = true; colsS76.Position = tempPos; tempPos++; }
                                if (sColName == "S77") { colsS77.Title = sColDesc.ToString(); colsS77.Visible = true; colsS77.Position = tempPos; tempPos++; }
                                if (sColName == "S78") { colsS78.Title = sColDesc.ToString(); colsS78.Visible = true; colsS78.Position = tempPos; tempPos++; }
                                if (sColName == "S79") { colsS79.Title = sColDesc.ToString(); colsS79.Visible = true; colsS79.Position = tempPos; tempPos++; }
                                if (sColName == "S80") { colsS80.Title = sColDesc.ToString(); colsS80.Visible = true; colsS80.Position = tempPos; tempPos++; }
                                if (sColName == "S81") { colsS81.Title = sColDesc.ToString(); colsS81.Visible = true; colsS81.Position = tempPos; tempPos++; }
                                if (sColName == "S82") { colsS82.Title = sColDesc.ToString(); colsS82.Visible = true; colsS82.Position = tempPos; tempPos++; }
                                if (sColName == "S83") { colsS83.Title = sColDesc.ToString(); colsS83.Visible = true; colsS83.Position = tempPos; tempPos++; }
                                if (sColName == "S84") { colsS84.Title = sColDesc.ToString(); colsS84.Visible = true; colsS84.Position = tempPos; tempPos++; }
                                if (sColName == "S85") { colsS85.Title = sColDesc.ToString(); colsS85.Visible = true; colsS85.Position = tempPos; tempPos++; }
                                if (sColName == "S86") { colsS86.Title = sColDesc.ToString(); colsS86.Visible = true; colsS86.Position = tempPos; tempPos++; }
                                if (sColName == "S87") { colsS87.Title = sColDesc.ToString(); colsS87.Visible = true; colsS87.Position = tempPos; tempPos++; }
                                if (sColName == "S88") { colsS88.Title = sColDesc.ToString(); colsS88.Visible = true; colsS88.Position = tempPos; tempPos++; }
                                if (sColName == "S89") { colsS89.Title = sColDesc.ToString(); colsS89.Visible = true; colsS89.Position = tempPos; tempPos++; }
                                if (sColName == "S90") { colsS90.Title = sColDesc.ToString(); colsS90.Visible = true; colsS90.Position = tempPos; tempPos++; }
                                if (sColName == "S91") { colsS91.Title = sColDesc.ToString(); colsS91.Visible = true; colsS91.Position = tempPos; tempPos++; }
                                if (sColName == "S92") { colsS92.Title = sColDesc.ToString(); colsS92.Visible = true; colsS92.Position = tempPos; tempPos++; }
                                if (sColName == "S93") { colsS93.Title = sColDesc.ToString(); colsS93.Visible = true; colsS93.Position = tempPos; tempPos++; }
                                if (sColName == "S94") { colsS94.Title = sColDesc.ToString(); colsS94.Visible = true; colsS94.Position = tempPos; tempPos++; }
                                if (sColName == "S95") { colsS95.Title = sColDesc.ToString(); colsS95.Visible = true; colsS95.Position = tempPos; tempPos++; }
                                if (sColName == "S96") { colsS96.Title = sColDesc.ToString(); colsS96.Visible = true; colsS96.Position = tempPos; tempPos++; }
                                if (sColName == "S97") { colsS97.Title = sColDesc.ToString(); colsS97.Visible = true; colsS97.Position = tempPos; tempPos++; }
                                if (sColName == "S98") { colsS98.Title = sColDesc.ToString(); colsS98.Visible = true; colsS98.Position = tempPos; tempPos++; }
                                if (sColName == "S99") { colsS99.Title = sColDesc.ToString(); colsS99.Visible = true; colsS99.Position = tempPos; tempPos++; }
                                if (sColName == "S100") { colsS100.Title = sColDesc.ToString(); colsS100.Visible = true; colsS100.Position = tempPos; tempPos++; }

                            }
                            n2 = n2 + 1;
                        }
                    }
                    n = n + 1;
                }
            }
            return 0;
        }

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

        #region Window Actions

        private void tbwDataValues_WindowActions(object sender, WindowActionsEventArgs e)
        {
            switch (e.ActionType)
            {
                case Ifs.Fnd.ApplicationForms.Const.AM_DataSourcePopulateCascade:
                    ChangeColumnTitles();
                    break;
                case Ifs.Fnd.ApplicationForms.Const.AM_DataSourceSaveNew:
                    ChangeColumnTitles();
                    break;
                case Ifs.Fnd.ApplicationForms.Const.PM_DataSourcePopulate:
                    TbwDataValues_ONPM_DataSourcePopulate(sender, e);
                    break;
            }
        }

        #endregion

        #region Event Handlers

        #endregion
        #region Menu Event Handlers

        #endregion
    }
}
