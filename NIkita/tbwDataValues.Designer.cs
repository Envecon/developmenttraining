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
using Ifs.Fnd.ApplicationForms;
using PPJ.Runtime;
using PPJ.Runtime.Windows;

namespace Ifs.Application.MdmBasicData
{

    public partial class tbwDataValues
    {

        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(tbwDataValues));
            this.colsId = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS1 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS2 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS3 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS4 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS5 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS6 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS7 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS8 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS9 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS10 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS11 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS12 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS13 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS14 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS15 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS16 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS17 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS18 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS19 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS20 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS21 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS22 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS23 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS24 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS25 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS26 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS27 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS28 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS29 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS30 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS31 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS32 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS33 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS34 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS35 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS36 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS37 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS38 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS39 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS40 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS41 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS42 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS43 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS44 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS45 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS46 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS47 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS48 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS49 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS50 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS51 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS52 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS53 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS54 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS55 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS56 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS57 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS58 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS59 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS60 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS61 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS62 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS63 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS64 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS65 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS66 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS67 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS68 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS69 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS70 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS71 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS72 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS73 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS74 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS75 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS76 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS77 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS78 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS79 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS80 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS81 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS82 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS83 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS84 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS85 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS86 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS87 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS88 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS89 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS90 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS91 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS92 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS93 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS94 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS95 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS96 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS97 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS98 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS99 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsS100 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD1 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD2 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD3 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD4 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD5 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD6 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD7 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD8 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD9 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldD10 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN1 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN2 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN3 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN4 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN5 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN6 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN7 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN8 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN9 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colnN10 = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsRowStatus = new Ifs.Fnd.ApplicationForms.cLookupColumn();
            this.colsTransferredBy = new Ifs.Fnd.ApplicationForms.cColumn();
            this.coldTransferredDate = new Ifs.Fnd.ApplicationForms.cColumn();
            this.colsError = new Ifs.Fnd.ApplicationForms.cColumn();
            this.SuspendLayout();
            // 
            // __colObjversion
            // 
            this.@__colObjversion.Position = 101;
            // 
            // colsId
            // 
            this.colsId.MaxLength = 20;
            this.colsId.Name = "colsId";
            this.colsId.NamedProperties.Put("EnumerateMethod", "");
            this.colsId.NamedProperties.Put("FieldFlags", "163");
            this.colsId.NamedProperties.Put("LovReference", "");
            this.colsId.NamedProperties.Put("SqlColumn", "ID");
            this.colsId.Position = 2;
            resources.ApplyResources(this.colsId, "colsId");
            // 
            // colsS1
            // 
            this.colsS1.MaxLength = 1000;
            this.colsS1.Name = "colsS1";
            this.colsS1.NamedProperties.Put("EnumerateMethod", "");
            this.colsS1.NamedProperties.Put("FieldFlags", "294");
            this.colsS1.NamedProperties.Put("LovReference", "");
            this.colsS1.NamedProperties.Put("SqlColumn", "S1");
            this.colsS1.Position = 3;
            resources.ApplyResources(this.colsS1, "colsS1");
            // 
            // colsS2
            // 
            this.colsS2.MaxLength = 1000;
            this.colsS2.Name = "colsS2";
            this.colsS2.NamedProperties.Put("EnumerateMethod", "");
            this.colsS2.NamedProperties.Put("FieldFlags", "294");
            this.colsS2.NamedProperties.Put("LovReference", "");
            this.colsS2.NamedProperties.Put("SqlColumn", "S2");
            this.colsS2.Position = 4;
            resources.ApplyResources(this.colsS2, "colsS2");
            // 
            // colsS3
            // 
            this.colsS3.MaxLength = 1000;
            this.colsS3.Name = "colsS3";
            this.colsS3.NamedProperties.Put("EnumerateMethod", "");
            this.colsS3.NamedProperties.Put("FieldFlags", "294");
            this.colsS3.NamedProperties.Put("LovReference", "");
            this.colsS3.NamedProperties.Put("SqlColumn", "S3");
            this.colsS3.Position = 5;
            resources.ApplyResources(this.colsS3, "colsS3");
            // 
            // colsS4
            // 
            this.colsS4.MaxLength = 1000;
            this.colsS4.Name = "colsS4";
            this.colsS4.NamedProperties.Put("EnumerateMethod", "");
            this.colsS4.NamedProperties.Put("FieldFlags", "294");
            this.colsS4.NamedProperties.Put("LovReference", "");
            this.colsS4.NamedProperties.Put("SqlColumn", "S4");
            this.colsS4.Position = 6;
            resources.ApplyResources(this.colsS4, "colsS4");
            // 
            // colsS5
            // 
            this.colsS5.MaxLength = 1000;
            this.colsS5.Name = "colsS5";
            this.colsS5.NamedProperties.Put("EnumerateMethod", "");
            this.colsS5.NamedProperties.Put("FieldFlags", "294");
            this.colsS5.NamedProperties.Put("LovReference", "");
            this.colsS5.NamedProperties.Put("SqlColumn", "S5");
            this.colsS5.Position = 7;
            resources.ApplyResources(this.colsS5, "colsS5");
            // 
            // colsS6
            // 
            this.colsS6.MaxLength = 1000;
            this.colsS6.Name = "colsS6";
            this.colsS6.NamedProperties.Put("EnumerateMethod", "");
            this.colsS6.NamedProperties.Put("FieldFlags", "294");
            this.colsS6.NamedProperties.Put("LovReference", "");
            this.colsS6.NamedProperties.Put("SqlColumn", "S6");
            this.colsS6.Position = 8;
            resources.ApplyResources(this.colsS6, "colsS6");
            // 
            // colsS7
            // 
            this.colsS7.MaxLength = 1000;
            this.colsS7.Name = "colsS7";
            this.colsS7.NamedProperties.Put("EnumerateMethod", "");
            this.colsS7.NamedProperties.Put("FieldFlags", "294");
            this.colsS7.NamedProperties.Put("LovReference", "");
            this.colsS7.NamedProperties.Put("SqlColumn", "S7");
            this.colsS7.Position = 9;
            resources.ApplyResources(this.colsS7, "colsS7");
            // 
            // colsS8
            // 
            this.colsS8.MaxLength = 1000;
            this.colsS8.Name = "colsS8";
            this.colsS8.NamedProperties.Put("EnumerateMethod", "");
            this.colsS8.NamedProperties.Put("FieldFlags", "294");
            this.colsS8.NamedProperties.Put("LovReference", "");
            this.colsS8.NamedProperties.Put("SqlColumn", "S8");
            this.colsS8.Position = 10;
            resources.ApplyResources(this.colsS8, "colsS8");
            // 
            // colsS9
            // 
            this.colsS9.MaxLength = 1000;
            this.colsS9.Name = "colsS9";
            this.colsS9.NamedProperties.Put("EnumerateMethod", "");
            this.colsS9.NamedProperties.Put("FieldFlags", "294");
            this.colsS9.NamedProperties.Put("LovReference", "");
            this.colsS9.NamedProperties.Put("SqlColumn", "S9");
            this.colsS9.Position = 11;
            resources.ApplyResources(this.colsS9, "colsS9");
            // 
            // colsS10
            // 
            this.colsS10.MaxLength = 1000;
            this.colsS10.Name = "colsS10";
            this.colsS10.NamedProperties.Put("EnumerateMethod", "");
            this.colsS10.NamedProperties.Put("FieldFlags", "294");
            this.colsS10.NamedProperties.Put("LovReference", "");
            this.colsS10.NamedProperties.Put("SqlColumn", "S10");
            this.colsS10.Position = 12;
            resources.ApplyResources(this.colsS10, "colsS10");
            // 
            // colsS11
            // 
            this.colsS11.MaxLength = 1000;
            this.colsS11.Name = "colsS11";
            this.colsS11.NamedProperties.Put("EnumerateMethod", "");
            this.colsS11.NamedProperties.Put("FieldFlags", "294");
            this.colsS11.NamedProperties.Put("LovReference", "");
            this.colsS11.NamedProperties.Put("SqlColumn", "S11");
            this.colsS11.Position = 13;
            resources.ApplyResources(this.colsS11, "colsS11");
            // 
            // colsS12
            // 
            this.colsS12.MaxLength = 1000;
            this.colsS12.Name = "colsS12";
            this.colsS12.NamedProperties.Put("EnumerateMethod", "");
            this.colsS12.NamedProperties.Put("FieldFlags", "294");
            this.colsS12.NamedProperties.Put("LovReference", "");
            this.colsS12.NamedProperties.Put("SqlColumn", "S12");
            this.colsS12.Position = 14;
            resources.ApplyResources(this.colsS12, "colsS12");
            // 
            // colsS13
            // 
            this.colsS13.MaxLength = 1000;
            this.colsS13.Name = "colsS13";
            this.colsS13.NamedProperties.Put("EnumerateMethod", "");
            this.colsS13.NamedProperties.Put("FieldFlags", "294");
            this.colsS13.NamedProperties.Put("LovReference", "");
            this.colsS13.NamedProperties.Put("SqlColumn", "S13");
            this.colsS13.Position = 15;
            resources.ApplyResources(this.colsS13, "colsS13");
            // 
            // colsS14
            // 
            this.colsS14.MaxLength = 1000;
            this.colsS14.Name = "colsS14";
            this.colsS14.NamedProperties.Put("EnumerateMethod", "");
            this.colsS14.NamedProperties.Put("FieldFlags", "294");
            this.colsS14.NamedProperties.Put("LovReference", "");
            this.colsS14.NamedProperties.Put("SqlColumn", "S14");
            this.colsS14.Position = 16;
            resources.ApplyResources(this.colsS14, "colsS14");
            // 
            // colsS15
            // 
            this.colsS15.MaxLength = 1000;
            this.colsS15.Name = "colsS15";
            this.colsS15.NamedProperties.Put("EnumerateMethod", "");
            this.colsS15.NamedProperties.Put("FieldFlags", "294");
            this.colsS15.NamedProperties.Put("LovReference", "");
            this.colsS15.NamedProperties.Put("SqlColumn", "S15");
            this.colsS15.Position = 17;
            resources.ApplyResources(this.colsS15, "colsS15");
            // 
            // colsS16
            // 
            this.colsS16.MaxLength = 1000;
            this.colsS16.Name = "colsS16";
            this.colsS16.NamedProperties.Put("EnumerateMethod", "");
            this.colsS16.NamedProperties.Put("FieldFlags", "294");
            this.colsS16.NamedProperties.Put("LovReference", "");
            this.colsS16.NamedProperties.Put("SqlColumn", "S16");
            this.colsS16.Position = 18;
            resources.ApplyResources(this.colsS16, "colsS16");
            // 
            // colsS17
            // 
            this.colsS17.MaxLength = 1000;
            this.colsS17.Name = "colsS17";
            this.colsS17.NamedProperties.Put("EnumerateMethod", "");
            this.colsS17.NamedProperties.Put("FieldFlags", "294");
            this.colsS17.NamedProperties.Put("LovReference", "");
            this.colsS17.NamedProperties.Put("SqlColumn", "S17");
            this.colsS17.Position = 19;
            resources.ApplyResources(this.colsS17, "colsS17");
            // 
            // colsS18
            // 
            this.colsS18.MaxLength = 1000;
            this.colsS18.Name = "colsS18";
            this.colsS18.NamedProperties.Put("EnumerateMethod", "");
            this.colsS18.NamedProperties.Put("FieldFlags", "294");
            this.colsS18.NamedProperties.Put("LovReference", "");
            this.colsS18.NamedProperties.Put("SqlColumn", "S18");
            this.colsS18.Position = 20;
            resources.ApplyResources(this.colsS18, "colsS18");
            // 
            // colsS19
            // 
            this.colsS19.MaxLength = 1000;
            this.colsS19.Name = "colsS19";
            this.colsS19.NamedProperties.Put("EnumerateMethod", "");
            this.colsS19.NamedProperties.Put("FieldFlags", "294");
            this.colsS19.NamedProperties.Put("LovReference", "");
            this.colsS19.NamedProperties.Put("SqlColumn", "S19");
            this.colsS19.Position = 21;
            resources.ApplyResources(this.colsS19, "colsS19");
            // 
            // colsS20
            // 
            this.colsS20.MaxLength = 1000;
            this.colsS20.Name = "colsS20";
            this.colsS20.NamedProperties.Put("EnumerateMethod", "");
            this.colsS20.NamedProperties.Put("FieldFlags", "294");
            this.colsS20.NamedProperties.Put("LovReference", "");
            this.colsS20.NamedProperties.Put("SqlColumn", "S20");
            this.colsS20.Position = 22;
            resources.ApplyResources(this.colsS20, "colsS20");
            // 
            // colsS21
            // 
            this.colsS21.MaxLength = 1000;
            this.colsS21.Name = "colsS21";
            this.colsS21.NamedProperties.Put("EnumerateMethod", "");
            this.colsS21.NamedProperties.Put("FieldFlags", "294");
            this.colsS21.NamedProperties.Put("LovReference", "");
            this.colsS21.NamedProperties.Put("SqlColumn", "S21");
            this.colsS21.Position = 23;
            resources.ApplyResources(this.colsS21, "colsS21");
            // 
            // colsS22
            // 
            this.colsS22.MaxLength = 1000;
            this.colsS22.Name = "colsS22";
            this.colsS22.NamedProperties.Put("EnumerateMethod", "");
            this.colsS22.NamedProperties.Put("FieldFlags", "294");
            this.colsS22.NamedProperties.Put("LovReference", "");
            this.colsS22.NamedProperties.Put("SqlColumn", "S22");
            this.colsS22.Position = 24;
            resources.ApplyResources(this.colsS22, "colsS22");
            // 
            // colsS23
            // 
            this.colsS23.MaxLength = 1000;
            this.colsS23.Name = "colsS23";
            this.colsS23.NamedProperties.Put("EnumerateMethod", "");
            this.colsS23.NamedProperties.Put("FieldFlags", "294");
            this.colsS23.NamedProperties.Put("LovReference", "");
            this.colsS23.NamedProperties.Put("SqlColumn", "S23");
            this.colsS23.Position = 25;
            resources.ApplyResources(this.colsS23, "colsS23");
            // 
            // colsS24
            // 
            this.colsS24.MaxLength = 1000;
            this.colsS24.Name = "colsS24";
            this.colsS24.NamedProperties.Put("EnumerateMethod", "");
            this.colsS24.NamedProperties.Put("FieldFlags", "294");
            this.colsS24.NamedProperties.Put("LovReference", "");
            this.colsS24.NamedProperties.Put("SqlColumn", "S24");
            this.colsS24.Position = 26;
            resources.ApplyResources(this.colsS24, "colsS24");
            // 
            // colsS25
            // 
            this.colsS25.MaxLength = 1000;
            this.colsS25.Name = "colsS25";
            this.colsS25.NamedProperties.Put("EnumerateMethod", "");
            this.colsS25.NamedProperties.Put("FieldFlags", "294");
            this.colsS25.NamedProperties.Put("LovReference", "");
            this.colsS25.NamedProperties.Put("SqlColumn", "S25");
            this.colsS25.Position = 27;
            resources.ApplyResources(this.colsS25, "colsS25");
            // 
            // colsS26
            // 
            this.colsS26.MaxLength = 1000;
            this.colsS26.Name = "colsS26";
            this.colsS26.NamedProperties.Put("EnumerateMethod", "");
            this.colsS26.NamedProperties.Put("FieldFlags", "294");
            this.colsS26.NamedProperties.Put("LovReference", "");
            this.colsS26.NamedProperties.Put("SqlColumn", "S26");
            this.colsS26.Position = 28;
            resources.ApplyResources(this.colsS26, "colsS26");
            // 
            // colsS27
            // 
            this.colsS27.MaxLength = 1000;
            this.colsS27.Name = "colsS27";
            this.colsS27.NamedProperties.Put("EnumerateMethod", "");
            this.colsS27.NamedProperties.Put("FieldFlags", "294");
            this.colsS27.NamedProperties.Put("LovReference", "");
            this.colsS27.NamedProperties.Put("SqlColumn", "S27");
            this.colsS27.Position = 29;
            resources.ApplyResources(this.colsS27, "colsS27");
            // 
            // colsS28
            // 
            this.colsS28.MaxLength = 1000;
            this.colsS28.Name = "colsS28";
            this.colsS28.NamedProperties.Put("EnumerateMethod", "");
            this.colsS28.NamedProperties.Put("FieldFlags", "294");
            this.colsS28.NamedProperties.Put("LovReference", "");
            this.colsS28.NamedProperties.Put("SqlColumn", "S28");
            this.colsS28.Position = 30;
            resources.ApplyResources(this.colsS28, "colsS28");
            // 
            // colsS29
            // 
            this.colsS29.MaxLength = 1000;
            this.colsS29.Name = "colsS29";
            this.colsS29.NamedProperties.Put("EnumerateMethod", "");
            this.colsS29.NamedProperties.Put("FieldFlags", "294");
            this.colsS29.NamedProperties.Put("LovReference", "");
            this.colsS29.NamedProperties.Put("SqlColumn", "S29");
            this.colsS29.Position = 31;
            resources.ApplyResources(this.colsS29, "colsS29");
            // 
            // colsS30
            // 
            this.colsS30.MaxLength = 1000;
            this.colsS30.Name = "colsS30";
            this.colsS30.NamedProperties.Put("EnumerateMethod", "");
            this.colsS30.NamedProperties.Put("FieldFlags", "294");
            this.colsS30.NamedProperties.Put("LovReference", "");
            this.colsS30.NamedProperties.Put("SqlColumn", "S30");
            this.colsS30.Position = 32;
            resources.ApplyResources(this.colsS30, "colsS30");
            // 
            // colsS31
            // 
            this.colsS31.MaxLength = 1000;
            this.colsS31.Name = "colsS31";
            this.colsS31.NamedProperties.Put("EnumerateMethod", "");
            this.colsS31.NamedProperties.Put("FieldFlags", "294");
            this.colsS31.NamedProperties.Put("LovReference", "");
            this.colsS31.NamedProperties.Put("SqlColumn", "S31");
            this.colsS31.Position = 33;
            resources.ApplyResources(this.colsS31, "colsS31");
            // 
            // colsS32
            // 
            this.colsS32.MaxLength = 1000;
            this.colsS32.Name = "colsS32";
            this.colsS32.NamedProperties.Put("EnumerateMethod", "");
            this.colsS32.NamedProperties.Put("FieldFlags", "294");
            this.colsS32.NamedProperties.Put("LovReference", "");
            this.colsS32.NamedProperties.Put("SqlColumn", "S32");
            this.colsS32.Position = 34;
            resources.ApplyResources(this.colsS32, "colsS32");
            // 
            // colsS33
            // 
            this.colsS33.MaxLength = 1000;
            this.colsS33.Name = "colsS33";
            this.colsS33.NamedProperties.Put("EnumerateMethod", "");
            this.colsS33.NamedProperties.Put("FieldFlags", "294");
            this.colsS33.NamedProperties.Put("LovReference", "");
            this.colsS33.NamedProperties.Put("SqlColumn", "S33");
            this.colsS33.Position = 35;
            resources.ApplyResources(this.colsS33, "colsS33");
            // 
            // colsS34
            // 
            this.colsS34.MaxLength = 1000;
            this.colsS34.Name = "colsS34";
            this.colsS34.NamedProperties.Put("EnumerateMethod", "");
            this.colsS34.NamedProperties.Put("FieldFlags", "294");
            this.colsS34.NamedProperties.Put("LovReference", "");
            this.colsS34.NamedProperties.Put("SqlColumn", "S34");
            this.colsS34.Position = 36;
            resources.ApplyResources(this.colsS34, "colsS34");
            // 
            // colsS35
            // 
            this.colsS35.MaxLength = 1000;
            this.colsS35.Name = "colsS35";
            this.colsS35.NamedProperties.Put("EnumerateMethod", "");
            this.colsS35.NamedProperties.Put("FieldFlags", "294");
            this.colsS35.NamedProperties.Put("LovReference", "");
            this.colsS35.NamedProperties.Put("SqlColumn", "S35");
            this.colsS35.Position = 37;
            resources.ApplyResources(this.colsS35, "colsS35");
            // 
            // colsS36
            // 
            this.colsS36.MaxLength = 1000;
            this.colsS36.Name = "colsS36";
            this.colsS36.NamedProperties.Put("EnumerateMethod", "");
            this.colsS36.NamedProperties.Put("FieldFlags", "294");
            this.colsS36.NamedProperties.Put("LovReference", "");
            this.colsS36.NamedProperties.Put("SqlColumn", "S36");
            this.colsS36.Position = 38;
            resources.ApplyResources(this.colsS36, "colsS36");
            // 
            // colsS37
            // 
            this.colsS37.MaxLength = 1000;
            this.colsS37.Name = "colsS37";
            this.colsS37.NamedProperties.Put("EnumerateMethod", "");
            this.colsS37.NamedProperties.Put("FieldFlags", "294");
            this.colsS37.NamedProperties.Put("LovReference", "");
            this.colsS37.NamedProperties.Put("SqlColumn", "S37");
            this.colsS37.Position = 39;
            resources.ApplyResources(this.colsS37, "colsS37");
            // 
            // colsS38
            // 
            this.colsS38.MaxLength = 1000;
            this.colsS38.Name = "colsS38";
            this.colsS38.NamedProperties.Put("EnumerateMethod", "");
            this.colsS38.NamedProperties.Put("FieldFlags", "294");
            this.colsS38.NamedProperties.Put("LovReference", "");
            this.colsS38.NamedProperties.Put("SqlColumn", "S38");
            this.colsS38.Position = 40;
            resources.ApplyResources(this.colsS38, "colsS38");
            // 
            // colsS39
            // 
            this.colsS39.MaxLength = 1000;
            this.colsS39.Name = "colsS39";
            this.colsS39.NamedProperties.Put("EnumerateMethod", "");
            this.colsS39.NamedProperties.Put("FieldFlags", "294");
            this.colsS39.NamedProperties.Put("LovReference", "");
            this.colsS39.NamedProperties.Put("SqlColumn", "S39");
            this.colsS39.Position = 41;
            resources.ApplyResources(this.colsS39, "colsS39");
            // 
            // colsS40
            // 
            this.colsS40.MaxLength = 1000;
            this.colsS40.Name = "colsS40";
            this.colsS40.NamedProperties.Put("EnumerateMethod", "");
            this.colsS40.NamedProperties.Put("FieldFlags", "294");
            this.colsS40.NamedProperties.Put("LovReference", "");
            this.colsS40.NamedProperties.Put("SqlColumn", "S40");
            this.colsS40.Position = 42;
            resources.ApplyResources(this.colsS40, "colsS40");
            // 
            // colsS41
            // 
            this.colsS41.MaxLength = 1000;
            this.colsS41.Name = "colsS41";
            this.colsS41.NamedProperties.Put("EnumerateMethod", "");
            this.colsS41.NamedProperties.Put("FieldFlags", "294");
            this.colsS41.NamedProperties.Put("LovReference", "");
            this.colsS41.NamedProperties.Put("SqlColumn", "S41");
            this.colsS41.Position = 43;
            resources.ApplyResources(this.colsS41, "colsS41");
            // 
            // colsS42
            // 
            this.colsS42.MaxLength = 1000;
            this.colsS42.Name = "colsS42";
            this.colsS42.NamedProperties.Put("EnumerateMethod", "");
            this.colsS42.NamedProperties.Put("FieldFlags", "294");
            this.colsS42.NamedProperties.Put("LovReference", "");
            this.colsS42.NamedProperties.Put("SqlColumn", "S42");
            this.colsS42.Position = 44;
            resources.ApplyResources(this.colsS42, "colsS42");
            // 
            // colsS43
            // 
            this.colsS43.MaxLength = 1000;
            this.colsS43.Name = "colsS43";
            this.colsS43.NamedProperties.Put("EnumerateMethod", "");
            this.colsS43.NamedProperties.Put("FieldFlags", "294");
            this.colsS43.NamedProperties.Put("LovReference", "");
            this.colsS43.NamedProperties.Put("SqlColumn", "S43");
            this.colsS43.Position = 45;
            resources.ApplyResources(this.colsS43, "colsS43");
            // 
            // colsS44
            // 
            this.colsS44.MaxLength = 1000;
            this.colsS44.Name = "colsS44";
            this.colsS44.NamedProperties.Put("EnumerateMethod", "");
            this.colsS44.NamedProperties.Put("FieldFlags", "294");
            this.colsS44.NamedProperties.Put("LovReference", "");
            this.colsS44.NamedProperties.Put("SqlColumn", "S44");
            this.colsS44.Position = 46;
            resources.ApplyResources(this.colsS44, "colsS44");
            // 
            // colsS45
            // 
            this.colsS45.MaxLength = 1000;
            this.colsS45.Name = "colsS45";
            this.colsS45.NamedProperties.Put("EnumerateMethod", "");
            this.colsS45.NamedProperties.Put("FieldFlags", "294");
            this.colsS45.NamedProperties.Put("LovReference", "");
            this.colsS45.NamedProperties.Put("SqlColumn", "S45");
            this.colsS45.Position = 47;
            resources.ApplyResources(this.colsS45, "colsS45");
            // 
            // colsS46
            // 
            this.colsS46.MaxLength = 1000;
            this.colsS46.Name = "colsS46";
            this.colsS46.NamedProperties.Put("EnumerateMethod", "");
            this.colsS46.NamedProperties.Put("FieldFlags", "294");
            this.colsS46.NamedProperties.Put("LovReference", "");
            this.colsS46.NamedProperties.Put("SqlColumn", "S46");
            this.colsS46.Position = 48;
            resources.ApplyResources(this.colsS46, "colsS46");
            // 
            // colsS47
            // 
            this.colsS47.MaxLength = 1000;
            this.colsS47.Name = "colsS47";
            this.colsS47.NamedProperties.Put("EnumerateMethod", "");
            this.colsS47.NamedProperties.Put("FieldFlags", "294");
            this.colsS47.NamedProperties.Put("LovReference", "");
            this.colsS47.NamedProperties.Put("SqlColumn", "S47");
            this.colsS47.Position = 49;
            resources.ApplyResources(this.colsS47, "colsS47");
            // 
            // colsS48
            // 
            this.colsS48.MaxLength = 1000;
            this.colsS48.Name = "colsS48";
            this.colsS48.NamedProperties.Put("EnumerateMethod", "");
            this.colsS48.NamedProperties.Put("FieldFlags", "294");
            this.colsS48.NamedProperties.Put("LovReference", "");
            this.colsS48.NamedProperties.Put("SqlColumn", "S48");
            this.colsS48.Position = 50;
            resources.ApplyResources(this.colsS48, "colsS48");
            // 
            // colsS49
            // 
            this.colsS49.MaxLength = 1000;
            this.colsS49.Name = "colsS49";
            this.colsS49.NamedProperties.Put("EnumerateMethod", "");
            this.colsS49.NamedProperties.Put("FieldFlags", "294");
            this.colsS49.NamedProperties.Put("LovReference", "");
            this.colsS49.NamedProperties.Put("SqlColumn", "S49");
            this.colsS49.Position = 51;
            resources.ApplyResources(this.colsS49, "colsS49");
            // 
            // colsS50
            // 
            this.colsS50.MaxLength = 1000;
            this.colsS50.Name = "colsS50";
            this.colsS50.NamedProperties.Put("EnumerateMethod", "");
            this.colsS50.NamedProperties.Put("FieldFlags", "294");
            this.colsS50.NamedProperties.Put("LovReference", "");
            this.colsS50.NamedProperties.Put("SqlColumn", "S50");
            this.colsS50.Position = 52;
            resources.ApplyResources(this.colsS50, "colsS50");
            // 
            // colsS51
            // 
            this.colsS51.MaxLength = 1000;
            this.colsS51.Name = "colsS51";
            this.colsS51.NamedProperties.Put("EnumerateMethod", "");
            this.colsS51.NamedProperties.Put("FieldFlags", "294");
            this.colsS51.NamedProperties.Put("LovReference", "");
            this.colsS51.NamedProperties.Put("SqlColumn", "S51");
            this.colsS51.Position = 53;
            resources.ApplyResources(this.colsS51, "colsS51");
            // 
            // colsS52
            // 
            this.colsS52.MaxLength = 1000;
            this.colsS52.Name = "colsS52";
            this.colsS52.NamedProperties.Put("EnumerateMethod", "");
            this.colsS52.NamedProperties.Put("FieldFlags", "294");
            this.colsS52.NamedProperties.Put("LovReference", "");
            this.colsS52.NamedProperties.Put("SqlColumn", "S52");
            this.colsS52.Position = 54;
            resources.ApplyResources(this.colsS52, "colsS52");
            // 
            // colsS53
            // 
            this.colsS53.MaxLength = 1000;
            this.colsS53.Name = "colsS53";
            this.colsS53.NamedProperties.Put("EnumerateMethod", "");
            this.colsS53.NamedProperties.Put("FieldFlags", "294");
            this.colsS53.NamedProperties.Put("LovReference", "");
            this.colsS53.NamedProperties.Put("SqlColumn", "S53");
            this.colsS53.Position = 55;
            resources.ApplyResources(this.colsS53, "colsS53");
            // 
            // colsS54
            // 
            this.colsS54.MaxLength = 1000;
            this.colsS54.Name = "colsS54";
            this.colsS54.NamedProperties.Put("EnumerateMethod", "");
            this.colsS54.NamedProperties.Put("FieldFlags", "294");
            this.colsS54.NamedProperties.Put("LovReference", "");
            this.colsS54.NamedProperties.Put("SqlColumn", "S54");
            this.colsS54.Position = 56;
            resources.ApplyResources(this.colsS54, "colsS54");
            // 
            // colsS55
            // 
            this.colsS55.MaxLength = 1000;
            this.colsS55.Name = "colsS55";
            this.colsS55.NamedProperties.Put("EnumerateMethod", "");
            this.colsS55.NamedProperties.Put("FieldFlags", "294");
            this.colsS55.NamedProperties.Put("LovReference", "");
            this.colsS55.NamedProperties.Put("SqlColumn", "S55");
            this.colsS55.Position = 57;
            resources.ApplyResources(this.colsS55, "colsS55");
            // 
            // colsS56
            // 
            this.colsS56.MaxLength = 1000;
            this.colsS56.Name = "colsS56";
            this.colsS56.NamedProperties.Put("EnumerateMethod", "");
            this.colsS56.NamedProperties.Put("FieldFlags", "294");
            this.colsS56.NamedProperties.Put("LovReference", "");
            this.colsS56.NamedProperties.Put("SqlColumn", "S56");
            this.colsS56.Position = 58;
            resources.ApplyResources(this.colsS56, "colsS56");
            // 
            // colsS57
            // 
            this.colsS57.MaxLength = 1000;
            this.colsS57.Name = "colsS57";
            this.colsS57.NamedProperties.Put("EnumerateMethod", "");
            this.colsS57.NamedProperties.Put("FieldFlags", "294");
            this.colsS57.NamedProperties.Put("LovReference", "");
            this.colsS57.NamedProperties.Put("SqlColumn", "S57");
            this.colsS57.Position = 59;
            resources.ApplyResources(this.colsS57, "colsS57");
            // 
            // colsS58
            // 
            this.colsS58.MaxLength = 1000;
            this.colsS58.Name = "colsS58";
            this.colsS58.NamedProperties.Put("EnumerateMethod", "");
            this.colsS58.NamedProperties.Put("FieldFlags", "294");
            this.colsS58.NamedProperties.Put("LovReference", "");
            this.colsS58.NamedProperties.Put("SqlColumn", "S58");
            this.colsS58.Position = 60;
            resources.ApplyResources(this.colsS58, "colsS58");
            // 
            // colsS59
            // 
            this.colsS59.MaxLength = 1000;
            this.colsS59.Name = "colsS59";
            this.colsS59.NamedProperties.Put("EnumerateMethod", "");
            this.colsS59.NamedProperties.Put("FieldFlags", "294");
            this.colsS59.NamedProperties.Put("LovReference", "");
            this.colsS59.NamedProperties.Put("SqlColumn", "S59");
            this.colsS59.Position = 61;
            resources.ApplyResources(this.colsS59, "colsS59");
            // 
            // colsS60
            // 
            this.colsS60.MaxLength = 1000;
            this.colsS60.Name = "colsS60";
            this.colsS60.NamedProperties.Put("EnumerateMethod", "");
            this.colsS60.NamedProperties.Put("FieldFlags", "294");
            this.colsS60.NamedProperties.Put("LovReference", "");
            this.colsS60.NamedProperties.Put("SqlColumn", "S60");
            this.colsS60.Position = 62;
            resources.ApplyResources(this.colsS60, "colsS60");
            // 
            // colsS61
            // 
            this.colsS61.MaxLength = 1000;
            this.colsS61.Name = "colsS61";
            this.colsS61.NamedProperties.Put("EnumerateMethod", "");
            this.colsS61.NamedProperties.Put("FieldFlags", "294");
            this.colsS61.NamedProperties.Put("LovReference", "");
            this.colsS61.NamedProperties.Put("SqlColumn", "S61");
            this.colsS61.Position = 63;
            resources.ApplyResources(this.colsS61, "colsS61");
            // 
            // colsS62
            // 
            this.colsS62.MaxLength = 1000;
            this.colsS62.Name = "colsS62";
            this.colsS62.NamedProperties.Put("EnumerateMethod", "");
            this.colsS62.NamedProperties.Put("FieldFlags", "294");
            this.colsS62.NamedProperties.Put("LovReference", "");
            this.colsS62.NamedProperties.Put("SqlColumn", "S62");
            this.colsS62.Position = 64;
            resources.ApplyResources(this.colsS62, "colsS62");
            // 
            // colsS63
            // 
            this.colsS63.MaxLength = 1000;
            this.colsS63.Name = "colsS63";
            this.colsS63.NamedProperties.Put("EnumerateMethod", "");
            this.colsS63.NamedProperties.Put("FieldFlags", "294");
            this.colsS63.NamedProperties.Put("LovReference", "");
            this.colsS63.NamedProperties.Put("SqlColumn", "S63");
            this.colsS63.Position = 65;
            resources.ApplyResources(this.colsS63, "colsS63");
            // 
            // colsS64
            // 
            this.colsS64.MaxLength = 1000;
            this.colsS64.Name = "colsS64";
            this.colsS64.NamedProperties.Put("EnumerateMethod", "");
            this.colsS64.NamedProperties.Put("FieldFlags", "294");
            this.colsS64.NamedProperties.Put("LovReference", "");
            this.colsS64.NamedProperties.Put("SqlColumn", "S64");
            this.colsS64.Position = 66;
            resources.ApplyResources(this.colsS64, "colsS64");
            // 
            // colsS65
            // 
            this.colsS65.MaxLength = 1000;
            this.colsS65.Name = "colsS65";
            this.colsS65.NamedProperties.Put("EnumerateMethod", "");
            this.colsS65.NamedProperties.Put("FieldFlags", "294");
            this.colsS65.NamedProperties.Put("LovReference", "");
            this.colsS65.NamedProperties.Put("SqlColumn", "S65");
            this.colsS65.Position = 67;
            resources.ApplyResources(this.colsS65, "colsS65");
            // 
            // colsS66
            // 
            this.colsS66.MaxLength = 1000;
            this.colsS66.Name = "colsS66";
            this.colsS66.NamedProperties.Put("EnumerateMethod", "");
            this.colsS66.NamedProperties.Put("FieldFlags", "294");
            this.colsS66.NamedProperties.Put("LovReference", "");
            this.colsS66.NamedProperties.Put("SqlColumn", "S66");
            this.colsS66.Position = 68;
            resources.ApplyResources(this.colsS66, "colsS66");
            // 
            // colsS67
            // 
            this.colsS67.MaxLength = 1000;
            this.colsS67.Name = "colsS67";
            this.colsS67.NamedProperties.Put("EnumerateMethod", "");
            this.colsS67.NamedProperties.Put("FieldFlags", "294");
            this.colsS67.NamedProperties.Put("LovReference", "");
            this.colsS67.NamedProperties.Put("SqlColumn", "S67");
            this.colsS67.Position = 69;
            resources.ApplyResources(this.colsS67, "colsS67");
            // 
            // colsS68
            // 
            this.colsS68.MaxLength = 1000;
            this.colsS68.Name = "colsS68";
            this.colsS68.NamedProperties.Put("EnumerateMethod", "");
            this.colsS68.NamedProperties.Put("FieldFlags", "294");
            this.colsS68.NamedProperties.Put("LovReference", "");
            this.colsS68.NamedProperties.Put("SqlColumn", "S68");
            this.colsS68.Position = 70;
            resources.ApplyResources(this.colsS68, "colsS68");
            // 
            // colsS69
            // 
            this.colsS69.MaxLength = 1000;
            this.colsS69.Name = "colsS69";
            this.colsS69.NamedProperties.Put("EnumerateMethod", "");
            this.colsS69.NamedProperties.Put("FieldFlags", "294");
            this.colsS69.NamedProperties.Put("LovReference", "");
            this.colsS69.NamedProperties.Put("SqlColumn", "S69");
            this.colsS69.Position = 71;
            resources.ApplyResources(this.colsS69, "colsS69");
            // 
            // colsS70
            // 
            this.colsS70.MaxLength = 1000;
            this.colsS70.Name = "colsS70";
            this.colsS70.NamedProperties.Put("EnumerateMethod", "");
            this.colsS70.NamedProperties.Put("FieldFlags", "294");
            this.colsS70.NamedProperties.Put("LovReference", "");
            this.colsS70.NamedProperties.Put("SqlColumn", "S70");
            this.colsS70.Position = 72;
            resources.ApplyResources(this.colsS70, "colsS70");
            // 
            // colsS71
            // 
            this.colsS71.MaxLength = 1000;
            this.colsS71.Name = "colsS71";
            this.colsS71.NamedProperties.Put("EnumerateMethod", "");
            this.colsS71.NamedProperties.Put("FieldFlags", "294");
            this.colsS71.NamedProperties.Put("LovReference", "");
            this.colsS71.NamedProperties.Put("SqlColumn", "S71");
            this.colsS71.Position = 73;
            resources.ApplyResources(this.colsS71, "colsS71");
            // 
            // colsS72
            // 
            this.colsS72.MaxLength = 1000;
            this.colsS72.Name = "colsS72";
            this.colsS72.NamedProperties.Put("EnumerateMethod", "");
            this.colsS72.NamedProperties.Put("FieldFlags", "294");
            this.colsS72.NamedProperties.Put("LovReference", "");
            this.colsS72.NamedProperties.Put("SqlColumn", "S72");
            this.colsS72.Position = 74;
            resources.ApplyResources(this.colsS72, "colsS72");
            // 
            // colsS73
            // 
            this.colsS73.MaxLength = 1000;
            this.colsS73.Name = "colsS73";
            this.colsS73.NamedProperties.Put("EnumerateMethod", "");
            this.colsS73.NamedProperties.Put("FieldFlags", "294");
            this.colsS73.NamedProperties.Put("LovReference", "");
            this.colsS73.NamedProperties.Put("SqlColumn", "S73");
            this.colsS73.Position = 75;
            resources.ApplyResources(this.colsS73, "colsS73");
            // 
            // colsS74
            // 
            this.colsS74.MaxLength = 1000;
            this.colsS74.Name = "colsS74";
            this.colsS74.NamedProperties.Put("EnumerateMethod", "");
            this.colsS74.NamedProperties.Put("FieldFlags", "294");
            this.colsS74.NamedProperties.Put("LovReference", "");
            this.colsS74.NamedProperties.Put("SqlColumn", "S74");
            this.colsS74.Position = 76;
            resources.ApplyResources(this.colsS74, "colsS74");
            // 
            // colsS75
            // 
            this.colsS75.MaxLength = 1000;
            this.colsS75.Name = "colsS75";
            this.colsS75.NamedProperties.Put("EnumerateMethod", "");
            this.colsS75.NamedProperties.Put("FieldFlags", "294");
            this.colsS75.NamedProperties.Put("LovReference", "");
            this.colsS75.NamedProperties.Put("SqlColumn", "S75");
            this.colsS75.Position = 77;
            resources.ApplyResources(this.colsS75, "colsS75");
            // 
            // colsS76
            // 
            this.colsS76.MaxLength = 1000;
            this.colsS76.Name = "colsS76";
            this.colsS76.NamedProperties.Put("EnumerateMethod", "");
            this.colsS76.NamedProperties.Put("FieldFlags", "294");
            this.colsS76.NamedProperties.Put("LovReference", "");
            this.colsS76.NamedProperties.Put("SqlColumn", "S76");
            this.colsS76.Position = 78;
            resources.ApplyResources(this.colsS76, "colsS76");
            // 
            // colsS77
            // 
            this.colsS77.MaxLength = 1000;
            this.colsS77.Name = "colsS77";
            this.colsS77.NamedProperties.Put("EnumerateMethod", "");
            this.colsS77.NamedProperties.Put("FieldFlags", "294");
            this.colsS77.NamedProperties.Put("LovReference", "");
            this.colsS77.NamedProperties.Put("SqlColumn", "S77");
            this.colsS77.Position = 79;
            resources.ApplyResources(this.colsS77, "colsS77");
            // 
            // colsS78
            // 
            this.colsS78.MaxLength = 1000;
            this.colsS78.Name = "colsS78";
            this.colsS78.NamedProperties.Put("EnumerateMethod", "");
            this.colsS78.NamedProperties.Put("FieldFlags", "294");
            this.colsS78.NamedProperties.Put("LovReference", "");
            this.colsS78.NamedProperties.Put("SqlColumn", "S78");
            this.colsS78.Position = 80;
            resources.ApplyResources(this.colsS78, "colsS78");
            // 
            // colsS79
            // 
            this.colsS79.MaxLength = 1000;
            this.colsS79.Name = "colsS79";
            this.colsS79.NamedProperties.Put("EnumerateMethod", "");
            this.colsS79.NamedProperties.Put("FieldFlags", "294");
            this.colsS79.NamedProperties.Put("LovReference", "");
            this.colsS79.NamedProperties.Put("SqlColumn", "S79");
            this.colsS79.Position = 81;
            resources.ApplyResources(this.colsS79, "colsS79");
            // 
            // colsS80
            // 
            this.colsS80.MaxLength = 1000;
            this.colsS80.Name = "colsS80";
            this.colsS80.NamedProperties.Put("EnumerateMethod", "");
            this.colsS80.NamedProperties.Put("FieldFlags", "294");
            this.colsS80.NamedProperties.Put("LovReference", "");
            this.colsS80.NamedProperties.Put("SqlColumn", "S80");
            this.colsS80.Position = 82;
            resources.ApplyResources(this.colsS80, "colsS80");
            // 
            // colsS81
            // 
            this.colsS81.MaxLength = 1000;
            this.colsS81.Name = "colsS81";
            this.colsS81.NamedProperties.Put("EnumerateMethod", "");
            this.colsS81.NamedProperties.Put("FieldFlags", "294");
            this.colsS81.NamedProperties.Put("LovReference", "");
            this.colsS81.NamedProperties.Put("SqlColumn", "S81");
            this.colsS81.Position = 83;
            resources.ApplyResources(this.colsS81, "colsS81");
            // 
            // colsS82
            // 
            this.colsS82.MaxLength = 1000;
            this.colsS82.Name = "colsS82";
            this.colsS82.NamedProperties.Put("EnumerateMethod", "");
            this.colsS82.NamedProperties.Put("FieldFlags", "294");
            this.colsS82.NamedProperties.Put("LovReference", "");
            this.colsS82.NamedProperties.Put("SqlColumn", "S82");
            this.colsS82.Position = 84;
            resources.ApplyResources(this.colsS82, "colsS82");
            // 
            // colsS83
            // 
            this.colsS83.MaxLength = 1000;
            this.colsS83.Name = "colsS83";
            this.colsS83.NamedProperties.Put("EnumerateMethod", "");
            this.colsS83.NamedProperties.Put("FieldFlags", "294");
            this.colsS83.NamedProperties.Put("LovReference", "");
            this.colsS83.NamedProperties.Put("SqlColumn", "S83");
            this.colsS83.Position = 85;
            resources.ApplyResources(this.colsS83, "colsS83");
            // 
            // colsS84
            // 
            this.colsS84.MaxLength = 1000;
            this.colsS84.Name = "colsS84";
            this.colsS84.NamedProperties.Put("EnumerateMethod", "");
            this.colsS84.NamedProperties.Put("FieldFlags", "294");
            this.colsS84.NamedProperties.Put("LovReference", "");
            this.colsS84.NamedProperties.Put("SqlColumn", "S84");
            this.colsS84.Position = 86;
            resources.ApplyResources(this.colsS84, "colsS84");
            // 
            // colsS85
            // 
            this.colsS85.MaxLength = 1000;
            this.colsS85.Name = "colsS85";
            this.colsS85.NamedProperties.Put("EnumerateMethod", "");
            this.colsS85.NamedProperties.Put("FieldFlags", "294");
            this.colsS85.NamedProperties.Put("LovReference", "");
            this.colsS85.NamedProperties.Put("SqlColumn", "S85");
            this.colsS85.Position = 87;
            resources.ApplyResources(this.colsS85, "colsS85");
            // 
            // colsS86
            // 
            this.colsS86.MaxLength = 1000;
            this.colsS86.Name = "colsS86";
            this.colsS86.NamedProperties.Put("EnumerateMethod", "");
            this.colsS86.NamedProperties.Put("FieldFlags", "294");
            this.colsS86.NamedProperties.Put("LovReference", "");
            this.colsS86.NamedProperties.Put("SqlColumn", "S86");
            this.colsS86.Position = 88;
            resources.ApplyResources(this.colsS86, "colsS86");
            // 
            // colsS87
            // 
            this.colsS87.MaxLength = 1000;
            this.colsS87.Name = "colsS87";
            this.colsS87.NamedProperties.Put("EnumerateMethod", "");
            this.colsS87.NamedProperties.Put("FieldFlags", "294");
            this.colsS87.NamedProperties.Put("LovReference", "");
            this.colsS87.NamedProperties.Put("SqlColumn", "S87");
            this.colsS87.Position = 89;
            resources.ApplyResources(this.colsS87, "colsS87");
            // 
            // colsS88
            // 
            this.colsS88.MaxLength = 1000;
            this.colsS88.Name = "colsS88";
            this.colsS88.NamedProperties.Put("EnumerateMethod", "");
            this.colsS88.NamedProperties.Put("FieldFlags", "294");
            this.colsS88.NamedProperties.Put("LovReference", "");
            this.colsS88.NamedProperties.Put("SqlColumn", "S88");
            this.colsS88.Position = 90;
            resources.ApplyResources(this.colsS88, "colsS88");
            // 
            // colsS89
            // 
            this.colsS89.MaxLength = 1000;
            this.colsS89.Name = "colsS89";
            this.colsS89.NamedProperties.Put("EnumerateMethod", "");
            this.colsS89.NamedProperties.Put("FieldFlags", "294");
            this.colsS89.NamedProperties.Put("LovReference", "");
            this.colsS89.NamedProperties.Put("SqlColumn", "S89");
            this.colsS89.Position = 91;
            resources.ApplyResources(this.colsS89, "colsS89");
            // 
            // colsS90
            // 
            this.colsS90.MaxLength = 1000;
            this.colsS90.Name = "colsS90";
            this.colsS90.NamedProperties.Put("EnumerateMethod", "");
            this.colsS90.NamedProperties.Put("FieldFlags", "294");
            this.colsS90.NamedProperties.Put("LovReference", "");
            this.colsS90.NamedProperties.Put("SqlColumn", "S90");
            this.colsS90.Position = 92;
            resources.ApplyResources(this.colsS90, "colsS90");
            // 
            // colsS91
            // 
            this.colsS91.MaxLength = 1000;
            this.colsS91.Name = "colsS91";
            this.colsS91.NamedProperties.Put("EnumerateMethod", "");
            this.colsS91.NamedProperties.Put("FieldFlags", "294");
            this.colsS91.NamedProperties.Put("LovReference", "");
            this.colsS91.NamedProperties.Put("SqlColumn", "S91");
            this.colsS91.Position = 93;
            resources.ApplyResources(this.colsS91, "colsS91");
            // 
            // colsS92
            // 
            this.colsS92.MaxLength = 1000;
            this.colsS92.Name = "colsS92";
            this.colsS92.NamedProperties.Put("EnumerateMethod", "");
            this.colsS92.NamedProperties.Put("FieldFlags", "294");
            this.colsS92.NamedProperties.Put("LovReference", "");
            this.colsS92.NamedProperties.Put("SqlColumn", "S92");
            this.colsS92.Position = 94;
            resources.ApplyResources(this.colsS92, "colsS92");
            // 
            // colsS93
            // 
            this.colsS93.MaxLength = 1000;
            this.colsS93.Name = "colsS93";
            this.colsS93.NamedProperties.Put("EnumerateMethod", "");
            this.colsS93.NamedProperties.Put("FieldFlags", "294");
            this.colsS93.NamedProperties.Put("LovReference", "");
            this.colsS93.NamedProperties.Put("SqlColumn", "S93");
            this.colsS93.Position = 95;
            resources.ApplyResources(this.colsS93, "colsS93");
            // 
            // colsS94
            // 
            this.colsS94.MaxLength = 1000;
            this.colsS94.Name = "colsS94";
            this.colsS94.NamedProperties.Put("EnumerateMethod", "");
            this.colsS94.NamedProperties.Put("FieldFlags", "294");
            this.colsS94.NamedProperties.Put("LovReference", "");
            this.colsS94.NamedProperties.Put("SqlColumn", "S94");
            this.colsS94.Position = 96;
            resources.ApplyResources(this.colsS94, "colsS94");
            // 
            // colsS95
            // 
            this.colsS95.MaxLength = 1000;
            this.colsS95.Name = "colsS95";
            this.colsS95.NamedProperties.Put("EnumerateMethod", "");
            this.colsS95.NamedProperties.Put("FieldFlags", "294");
            this.colsS95.NamedProperties.Put("LovReference", "");
            this.colsS95.NamedProperties.Put("SqlColumn", "S95");
            this.colsS95.Position = 97;
            resources.ApplyResources(this.colsS95, "colsS95");
            // 
            // colsS96
            // 
            this.colsS96.MaxLength = 1000;
            this.colsS96.Name = "colsS96";
            this.colsS96.NamedProperties.Put("EnumerateMethod", "");
            this.colsS96.NamedProperties.Put("FieldFlags", "294");
            this.colsS96.NamedProperties.Put("LovReference", "");
            this.colsS96.NamedProperties.Put("SqlColumn", "S96");
            this.colsS96.Position = 98;
            resources.ApplyResources(this.colsS96, "colsS96");
            // 
            // colsS97
            // 
            this.colsS97.MaxLength = 1000;
            this.colsS97.Name = "colsS97";
            this.colsS97.NamedProperties.Put("EnumerateMethod", "");
            this.colsS97.NamedProperties.Put("FieldFlags", "294");
            this.colsS97.NamedProperties.Put("LovReference", "");
            this.colsS97.NamedProperties.Put("SqlColumn", "S97");
            this.colsS97.Position = 99;
            resources.ApplyResources(this.colsS97, "colsS97");
            // 
            // colsS98
            // 
            this.colsS98.MaxLength = 1000;
            this.colsS98.Name = "colsS98";
            this.colsS98.NamedProperties.Put("EnumerateMethod", "");
            this.colsS98.NamedProperties.Put("FieldFlags", "294");
            this.colsS98.NamedProperties.Put("LovReference", "");
            this.colsS98.NamedProperties.Put("SqlColumn", "S98");
            this.colsS98.Position = 100;
            resources.ApplyResources(this.colsS98, "colsS98");
            // 
            // colsS99
            // 
            this.colsS99.MaxLength = 1000;
            this.colsS99.Name = "colsS99";
            this.colsS99.NamedProperties.Put("EnumerateMethod", "");
            this.colsS99.NamedProperties.Put("FieldFlags", "294");
            this.colsS99.NamedProperties.Put("LovReference", "");
            this.colsS99.NamedProperties.Put("SqlColumn", "S99");
            this.colsS99.Position = 102;
            resources.ApplyResources(this.colsS99, "colsS99");
            // 
            // colsS100
            // 
            this.colsS100.MaxLength = 1000;
            this.colsS100.Name = "colsS100";
            this.colsS100.NamedProperties.Put("EnumerateMethod", "");
            this.colsS100.NamedProperties.Put("FieldFlags", "294");
            this.colsS100.NamedProperties.Put("LovReference", "");
            this.colsS100.NamedProperties.Put("SqlColumn", "S100");
            this.colsS100.Position = 103;
            resources.ApplyResources(this.colsS100, "colsS100");
            // 
            // coldD1
            // 
            this.coldD1.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD1.Format = "d";
            this.coldD1.Name = "coldD1";
            this.coldD1.NamedProperties.Put("EnumerateMethod", "");
            this.coldD1.NamedProperties.Put("FieldFlags", "294");
            this.coldD1.NamedProperties.Put("LovReference", "");
            this.coldD1.NamedProperties.Put("SqlColumn", "D1");
            this.coldD1.Position = 104;
            resources.ApplyResources(this.coldD1, "coldD1");
            // 
            // coldD2
            // 
            this.coldD2.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD2.Format = "d";
            this.coldD2.Name = "coldD2";
            this.coldD2.NamedProperties.Put("EnumerateMethod", "");
            this.coldD2.NamedProperties.Put("FieldFlags", "294");
            this.coldD2.NamedProperties.Put("LovReference", "");
            this.coldD2.NamedProperties.Put("SqlColumn", "D2");
            this.coldD2.Position = 105;
            resources.ApplyResources(this.coldD2, "coldD2");
            // 
            // coldD3
            // 
            this.coldD3.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD3.Format = "d";
            this.coldD3.Name = "coldD3";
            this.coldD3.NamedProperties.Put("EnumerateMethod", "");
            this.coldD3.NamedProperties.Put("FieldFlags", "294");
            this.coldD3.NamedProperties.Put("LovReference", "");
            this.coldD3.NamedProperties.Put("SqlColumn", "D3");
            this.coldD3.Position = 106;
            resources.ApplyResources(this.coldD3, "coldD3");
            // 
            // coldD4
            // 
            this.coldD4.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD4.Format = "d";
            this.coldD4.Name = "coldD4";
            this.coldD4.NamedProperties.Put("EnumerateMethod", "");
            this.coldD4.NamedProperties.Put("FieldFlags", "294");
            this.coldD4.NamedProperties.Put("LovReference", "");
            this.coldD4.NamedProperties.Put("SqlColumn", "D4");
            this.coldD4.Position = 107;
            resources.ApplyResources(this.coldD4, "coldD4");
            // 
            // coldD5
            // 
            this.coldD5.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD5.Format = "d";
            this.coldD5.Name = "coldD5";
            this.coldD5.NamedProperties.Put("EnumerateMethod", "");
            this.coldD5.NamedProperties.Put("FieldFlags", "294");
            this.coldD5.NamedProperties.Put("LovReference", "");
            this.coldD5.NamedProperties.Put("SqlColumn", "D5");
            this.coldD5.Position = 108;
            resources.ApplyResources(this.coldD5, "coldD5");
            // 
            // coldD6
            // 
            this.coldD6.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD6.Format = "d";
            this.coldD6.Name = "coldD6";
            this.coldD6.NamedProperties.Put("EnumerateMethod", "");
            this.coldD6.NamedProperties.Put("FieldFlags", "294");
            this.coldD6.NamedProperties.Put("LovReference", "");
            this.coldD6.NamedProperties.Put("SqlColumn", "D6");
            this.coldD6.Position = 109;
            resources.ApplyResources(this.coldD6, "coldD6");
            // 
            // coldD7
            // 
            this.coldD7.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD7.Format = "d";
            this.coldD7.Name = "coldD7";
            this.coldD7.NamedProperties.Put("EnumerateMethod", "");
            this.coldD7.NamedProperties.Put("FieldFlags", "294");
            this.coldD7.NamedProperties.Put("LovReference", "");
            this.coldD7.NamedProperties.Put("SqlColumn", "D7");
            this.coldD7.Position = 110;
            resources.ApplyResources(this.coldD7, "coldD7");
            // 
            // coldD8
            // 
            this.coldD8.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD8.Format = "d";
            this.coldD8.Name = "coldD8";
            this.coldD8.NamedProperties.Put("EnumerateMethod", "");
            this.coldD8.NamedProperties.Put("FieldFlags", "294");
            this.coldD8.NamedProperties.Put("LovReference", "");
            this.coldD8.NamedProperties.Put("SqlColumn", "D8");
            this.coldD8.Position = 111;
            resources.ApplyResources(this.coldD8, "coldD8");
            // 
            // coldD9
            // 
            this.coldD9.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD9.Format = "d";
            this.coldD9.Name = "coldD9";
            this.coldD9.NamedProperties.Put("EnumerateMethod", "");
            this.coldD9.NamedProperties.Put("FieldFlags", "294");
            this.coldD9.NamedProperties.Put("LovReference", "");
            this.coldD9.NamedProperties.Put("SqlColumn", "D9");
            this.coldD9.Position = 112;
            resources.ApplyResources(this.coldD9, "coldD9");
            // 
            // coldD10
            // 
            this.coldD10.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldD10.Format = "d";
            this.coldD10.Name = "coldD10";
            this.coldD10.NamedProperties.Put("EnumerateMethod", "");
            this.coldD10.NamedProperties.Put("FieldFlags", "294");
            this.coldD10.NamedProperties.Put("LovReference", "");
            this.coldD10.NamedProperties.Put("SqlColumn", "D10");
            this.coldD10.Position = 113;
            resources.ApplyResources(this.coldD10, "coldD10");
            // 
            // colnN1
            // 
            this.colnN1.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN1.Name = "colnN1";
            this.colnN1.NamedProperties.Put("EnumerateMethod", "");
            this.colnN1.NamedProperties.Put("FieldFlags", "294");
            this.colnN1.NamedProperties.Put("Format", "");
            this.colnN1.NamedProperties.Put("LovReference", "");
            this.colnN1.NamedProperties.Put("SqlColumn", "N1");
            this.colnN1.Position = 114;
            this.colnN1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN1, "colnN1");
            // 
            // colnN2
            // 
            this.colnN2.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN2.Name = "colnN2";
            this.colnN2.NamedProperties.Put("EnumerateMethod", "");
            this.colnN2.NamedProperties.Put("FieldFlags", "294");
            this.colnN2.NamedProperties.Put("Format", "");
            this.colnN2.NamedProperties.Put("LovReference", "");
            this.colnN2.NamedProperties.Put("SqlColumn", "N2");
            this.colnN2.Position = 115;
            this.colnN2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN2, "colnN2");
            // 
            // colnN3
            // 
            this.colnN3.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN3.Name = "colnN3";
            this.colnN3.NamedProperties.Put("EnumerateMethod", "");
            this.colnN3.NamedProperties.Put("FieldFlags", "294");
            this.colnN3.NamedProperties.Put("Format", "");
            this.colnN3.NamedProperties.Put("LovReference", "");
            this.colnN3.NamedProperties.Put("SqlColumn", "N3");
            this.colnN3.Position = 116;
            this.colnN3.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN3, "colnN3");
            // 
            // colnN4
            // 
            this.colnN4.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN4.Name = "colnN4";
            this.colnN4.NamedProperties.Put("EnumerateMethod", "");
            this.colnN4.NamedProperties.Put("FieldFlags", "294");
            this.colnN4.NamedProperties.Put("Format", "");
            this.colnN4.NamedProperties.Put("LovReference", "");
            this.colnN4.NamedProperties.Put("SqlColumn", "N4");
            this.colnN4.Position = 117;
            this.colnN4.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN4, "colnN4");
            // 
            // colnN5
            // 
            this.colnN5.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN5.Name = "colnN5";
            this.colnN5.NamedProperties.Put("EnumerateMethod", "");
            this.colnN5.NamedProperties.Put("FieldFlags", "294");
            this.colnN5.NamedProperties.Put("Format", "");
            this.colnN5.NamedProperties.Put("LovReference", "");
            this.colnN5.NamedProperties.Put("SqlColumn", "N5");
            this.colnN5.Position = 118;
            this.colnN5.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN5, "colnN5");
            // 
            // colnN6
            // 
            this.colnN6.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN6.Name = "colnN6";
            this.colnN6.NamedProperties.Put("EnumerateMethod", "");
            this.colnN6.NamedProperties.Put("FieldFlags", "294");
            this.colnN6.NamedProperties.Put("Format", "");
            this.colnN6.NamedProperties.Put("LovReference", "");
            this.colnN6.NamedProperties.Put("SqlColumn", "N6");
            this.colnN6.Position = 119;
            this.colnN6.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN6, "colnN6");
            // 
            // colnN7
            // 
            this.colnN7.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN7.Name = "colnN7";
            this.colnN7.NamedProperties.Put("EnumerateMethod", "");
            this.colnN7.NamedProperties.Put("FieldFlags", "294");
            this.colnN7.NamedProperties.Put("Format", "");
            this.colnN7.NamedProperties.Put("LovReference", "");
            this.colnN7.NamedProperties.Put("SqlColumn", "N7");
            this.colnN7.Position = 120;
            this.colnN7.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN7, "colnN7");
            // 
            // colnN8
            // 
            this.colnN8.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN8.Name = "colnN8";
            this.colnN8.NamedProperties.Put("EnumerateMethod", "");
            this.colnN8.NamedProperties.Put("FieldFlags", "294");
            this.colnN8.NamedProperties.Put("Format", "");
            this.colnN8.NamedProperties.Put("LovReference", "");
            this.colnN8.NamedProperties.Put("SqlColumn", "N8");
            this.colnN8.Position = 121;
            this.colnN8.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN8, "colnN8");
            // 
            // colnN9
            // 
            this.colnN9.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN9.Name = "colnN9";
            this.colnN9.NamedProperties.Put("EnumerateMethod", "");
            this.colnN9.NamedProperties.Put("FieldFlags", "294");
            this.colnN9.NamedProperties.Put("Format", "");
            this.colnN9.NamedProperties.Put("LovReference", "");
            this.colnN9.NamedProperties.Put("SqlColumn", "N9");
            this.colnN9.Position = 122;
            this.colnN9.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN9, "colnN9");
            // 
            // colnN10
            // 
            this.colnN10.DataType = PPJ.Runtime.Windows.DataType.Number;
            this.colnN10.Name = "colnN10";
            this.colnN10.NamedProperties.Put("EnumerateMethod", "");
            this.colnN10.NamedProperties.Put("FieldFlags", "294");
            this.colnN10.NamedProperties.Put("Format", "");
            this.colnN10.NamedProperties.Put("LovReference", "");
            this.colnN10.NamedProperties.Put("SqlColumn", "N10");
            this.colnN10.Position = 123;
            this.colnN10.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            resources.ApplyResources(this.colnN10, "colnN10");
            // 
            // colsRowStatus
            // 
            this.colsRowStatus.MaxLength = 200;
            this.colsRowStatus.Name = "colsRowStatus";
            this.colsRowStatus.NamedProperties.Put("EnumerateMethod", "DATA_VALUE_OVERVIEW_API.Enumerate");
            this.colsRowStatus.NamedProperties.Put("FieldFlags", "288");
            this.colsRowStatus.NamedProperties.Put("LovReference", "");
            this.colsRowStatus.NamedProperties.Put("SqlColumn", "ROW_STATUS");
            this.colsRowStatus.Position = 124;
            resources.ApplyResources(this.colsRowStatus, "colsRowStatus");
            // 
            // colsTransferredBy
            // 
            this.colsTransferredBy.MaxLength = 10;
            this.colsTransferredBy.Name = "colsTransferredBy";
            this.colsTransferredBy.NamedProperties.Put("EnumerateMethod", "");
            this.colsTransferredBy.NamedProperties.Put("FieldFlags", "288");
            this.colsTransferredBy.NamedProperties.Put("LovReference", "");
            this.colsTransferredBy.NamedProperties.Put("SqlColumn", "TRANSFERRED_BY");
            this.colsTransferredBy.Position = 125;
            resources.ApplyResources(this.colsTransferredBy, "colsTransferredBy");
            // 
            // coldTransferredDate
            // 
            this.coldTransferredDate.DataType = PPJ.Runtime.Windows.DataType.DateTime;
            this.coldTransferredDate.Format = "d";
            this.coldTransferredDate.Name = "coldTransferredDate";
            this.coldTransferredDate.NamedProperties.Put("EnumerateMethod", "");
            this.coldTransferredDate.NamedProperties.Put("FieldFlags", "288");
            this.coldTransferredDate.NamedProperties.Put("LovReference", "");
            this.coldTransferredDate.NamedProperties.Put("SqlColumn", "TRANSFERRED_DATE");
            this.coldTransferredDate.Position = 126;
            resources.ApplyResources(this.coldTransferredDate, "coldTransferredDate");
            // 
            // colsError
            // 
            this.colsError.MaxLength = 200;
            this.colsError.Name = "colsError";
            this.colsError.NamedProperties.Put("EnumerateMethod", "");
            this.colsError.NamedProperties.Put("FieldFlags", "288");
            this.colsError.NamedProperties.Put("LovReference", "");
            this.colsError.NamedProperties.Put("SqlColumn", "ERROR");
            this.colsError.Position = 127;
            resources.ApplyResources(this.colsError, "colsError");
            // 
            // tbwDataValues
            // 
            resources.ApplyResources(this, "$this");
            this.Controls.Add(this.colsId);
            this.Controls.Add(this.colsS1);
            this.Controls.Add(this.colsS2);
            this.Controls.Add(this.colsS3);
            this.Controls.Add(this.colsS4);
            this.Controls.Add(this.colsS5);
            this.Controls.Add(this.colsS6);
            this.Controls.Add(this.colsS7);
            this.Controls.Add(this.colsS8);
            this.Controls.Add(this.colsS9);
            this.Controls.Add(this.colsS10);
            this.Controls.Add(this.colsS11);
            this.Controls.Add(this.colsS12);
            this.Controls.Add(this.colsS13);
            this.Controls.Add(this.colsS14);
            this.Controls.Add(this.colsS15);
            this.Controls.Add(this.colsS16);
            this.Controls.Add(this.colsS17);
            this.Controls.Add(this.colsS18);
            this.Controls.Add(this.colsS19);
            this.Controls.Add(this.colsS20);
            this.Controls.Add(this.colsS21);
            this.Controls.Add(this.colsS22);
            this.Controls.Add(this.colsS23);
            this.Controls.Add(this.colsS24);
            this.Controls.Add(this.colsS25);
            this.Controls.Add(this.colsS26);
            this.Controls.Add(this.colsS27);
            this.Controls.Add(this.colsS28);
            this.Controls.Add(this.colsS29);
            this.Controls.Add(this.colsS30);
            this.Controls.Add(this.colsS31);
            this.Controls.Add(this.colsS32);
            this.Controls.Add(this.colsS33);
            this.Controls.Add(this.colsS34);
            this.Controls.Add(this.colsS35);
            this.Controls.Add(this.colsS36);
            this.Controls.Add(this.colsS37);
            this.Controls.Add(this.colsS38);
            this.Controls.Add(this.colsS39);
            this.Controls.Add(this.colsS40);
            this.Controls.Add(this.colsS41);
            this.Controls.Add(this.colsS42);
            this.Controls.Add(this.colsS43);
            this.Controls.Add(this.colsS44);
            this.Controls.Add(this.colsS45);
            this.Controls.Add(this.colsS46);
            this.Controls.Add(this.colsS47);
            this.Controls.Add(this.colsS48);
            this.Controls.Add(this.colsS49);
            this.Controls.Add(this.colsS50);
            this.Controls.Add(this.colsS51);
            this.Controls.Add(this.colsS52);
            this.Controls.Add(this.colsS53);
            this.Controls.Add(this.colsS54);
            this.Controls.Add(this.colsS55);
            this.Controls.Add(this.colsS56);
            this.Controls.Add(this.colsS57);
            this.Controls.Add(this.colsS58);
            this.Controls.Add(this.colsS59);
            this.Controls.Add(this.colsS60);
            this.Controls.Add(this.colsS61);
            this.Controls.Add(this.colsS62);
            this.Controls.Add(this.colsS63);
            this.Controls.Add(this.colsS64);
            this.Controls.Add(this.colsS65);
            this.Controls.Add(this.colsS66);
            this.Controls.Add(this.colsS67);
            this.Controls.Add(this.colsS68);
            this.Controls.Add(this.colsS69);
            this.Controls.Add(this.colsS70);
            this.Controls.Add(this.colsS71);
            this.Controls.Add(this.colsS72);
            this.Controls.Add(this.colsS73);
            this.Controls.Add(this.colsS74);
            this.Controls.Add(this.colsS75);
            this.Controls.Add(this.colsS76);
            this.Controls.Add(this.colsS77);
            this.Controls.Add(this.colsS78);
            this.Controls.Add(this.colsS79);
            this.Controls.Add(this.colsS80);
            this.Controls.Add(this.colsS81);
            this.Controls.Add(this.colsS82);
            this.Controls.Add(this.colsS83);
            this.Controls.Add(this.colsS84);
            this.Controls.Add(this.colsS85);
            this.Controls.Add(this.colsS86);
            this.Controls.Add(this.colsS87);
            this.Controls.Add(this.colsS88);
            this.Controls.Add(this.colsS89);
            this.Controls.Add(this.colsS90);
            this.Controls.Add(this.colsS91);
            this.Controls.Add(this.colsS92);
            this.Controls.Add(this.colsS93);
            this.Controls.Add(this.colsS94);
            this.Controls.Add(this.colsS95);
            this.Controls.Add(this.colsS96);
            this.Controls.Add(this.colsS97);
            this.Controls.Add(this.colsS98);
            this.Controls.Add(this.colsS99);
            this.Controls.Add(this.coldD1);
            this.Controls.Add(this.coldD2);
            this.Controls.Add(this.coldD3);
            this.Controls.Add(this.coldD4);
            this.Controls.Add(this.coldD5);
            this.Controls.Add(this.coldD6);
            this.Controls.Add(this.coldD7);
            this.Controls.Add(this.coldD8);
            this.Controls.Add(this.coldD9);
            this.Controls.Add(this.coldD10);
            this.Controls.Add(this.colnN1);
            this.Controls.Add(this.colnN2);
            this.Controls.Add(this.colnN3);
            this.Controls.Add(this.colnN4);
            this.Controls.Add(this.colnN5);
            this.Controls.Add(this.colnN6);
            this.Controls.Add(this.colnN7);
            this.Controls.Add(this.colnN8);
            this.Controls.Add(this.colnN9);
            this.Controls.Add(this.colnN10);
            this.Controls.Add(this.colsRowStatus);
            this.Controls.Add(this.colsTransferredBy);
            this.Controls.Add(this.coldTransferredDate);
            this.Controls.Add(this.colsError);
            this.Controls.Add(this.colsS100);
            this.Name = "tbwDataValues";
            this.NamedProperties.Put("LogicalUnit", "MdmDataValues");
            this.NamedProperties.Put("Module", "MDMGT");
            this.NamedProperties.Put("PackageName", "MDM_DATA_VALUES_API");
            this.NamedProperties.Put("ViewName", "MDM_DATA_VALUES");
            this.Controls.SetChildIndex(this.colsS100, 0);
            this.Controls.SetChildIndex(this.colsError, 0);
            this.Controls.SetChildIndex(this.coldTransferredDate, 0);
            this.Controls.SetChildIndex(this.colsTransferredBy, 0);
            this.Controls.SetChildIndex(this.colsRowStatus, 0);
            this.Controls.SetChildIndex(this.colnN10, 0);
            this.Controls.SetChildIndex(this.colnN9, 0);
            this.Controls.SetChildIndex(this.colnN8, 0);
            this.Controls.SetChildIndex(this.colnN7, 0);
            this.Controls.SetChildIndex(this.colnN6, 0);
            this.Controls.SetChildIndex(this.colnN5, 0);
            this.Controls.SetChildIndex(this.colnN4, 0);
            this.Controls.SetChildIndex(this.colnN3, 0);
            this.Controls.SetChildIndex(this.colnN2, 0);
            this.Controls.SetChildIndex(this.colnN1, 0);
            this.Controls.SetChildIndex(this.coldD10, 0);
            this.Controls.SetChildIndex(this.coldD9, 0);
            this.Controls.SetChildIndex(this.coldD8, 0);
            this.Controls.SetChildIndex(this.coldD7, 0);
            this.Controls.SetChildIndex(this.coldD6, 0);
            this.Controls.SetChildIndex(this.coldD5, 0);
            this.Controls.SetChildIndex(this.coldD4, 0);
            this.Controls.SetChildIndex(this.coldD3, 0);
            this.Controls.SetChildIndex(this.coldD2, 0);
            this.Controls.SetChildIndex(this.coldD1, 0);
            this.Controls.SetChildIndex(this.colsS99, 0);
            this.Controls.SetChildIndex(this.@__colObjversion, 0);
            this.Controls.SetChildIndex(this.colsS98, 0);
            this.Controls.SetChildIndex(this.colsS97, 0);
            this.Controls.SetChildIndex(this.colsS96, 0);
            this.Controls.SetChildIndex(this.colsS95, 0);
            this.Controls.SetChildIndex(this.colsS94, 0);
            this.Controls.SetChildIndex(this.colsS93, 0);
            this.Controls.SetChildIndex(this.colsS92, 0);
            this.Controls.SetChildIndex(this.colsS91, 0);
            this.Controls.SetChildIndex(this.colsS90, 0);
            this.Controls.SetChildIndex(this.colsS89, 0);
            this.Controls.SetChildIndex(this.colsS88, 0);
            this.Controls.SetChildIndex(this.colsS87, 0);
            this.Controls.SetChildIndex(this.colsS86, 0);
            this.Controls.SetChildIndex(this.colsS85, 0);
            this.Controls.SetChildIndex(this.colsS84, 0);
            this.Controls.SetChildIndex(this.colsS83, 0);
            this.Controls.SetChildIndex(this.colsS82, 0);
            this.Controls.SetChildIndex(this.colsS81, 0);
            this.Controls.SetChildIndex(this.colsS80, 0);
            this.Controls.SetChildIndex(this.colsS79, 0);
            this.Controls.SetChildIndex(this.colsS78, 0);
            this.Controls.SetChildIndex(this.colsS77, 0);
            this.Controls.SetChildIndex(this.colsS76, 0);
            this.Controls.SetChildIndex(this.colsS75, 0);
            this.Controls.SetChildIndex(this.colsS74, 0);
            this.Controls.SetChildIndex(this.colsS73, 0);
            this.Controls.SetChildIndex(this.colsS72, 0);
            this.Controls.SetChildIndex(this.colsS71, 0);
            this.Controls.SetChildIndex(this.colsS70, 0);
            this.Controls.SetChildIndex(this.colsS69, 0);
            this.Controls.SetChildIndex(this.colsS68, 0);
            this.Controls.SetChildIndex(this.colsS67, 0);
            this.Controls.SetChildIndex(this.colsS66, 0);
            this.Controls.SetChildIndex(this.colsS65, 0);
            this.Controls.SetChildIndex(this.colsS64, 0);
            this.Controls.SetChildIndex(this.colsS63, 0);
            this.Controls.SetChildIndex(this.colsS62, 0);
            this.Controls.SetChildIndex(this.colsS61, 0);
            this.Controls.SetChildIndex(this.colsS60, 0);
            this.Controls.SetChildIndex(this.colsS59, 0);
            this.Controls.SetChildIndex(this.colsS58, 0);
            this.Controls.SetChildIndex(this.colsS57, 0);
            this.Controls.SetChildIndex(this.colsS56, 0);
            this.Controls.SetChildIndex(this.colsS55, 0);
            this.Controls.SetChildIndex(this.colsS54, 0);
            this.Controls.SetChildIndex(this.colsS53, 0);
            this.Controls.SetChildIndex(this.colsS52, 0);
            this.Controls.SetChildIndex(this.colsS51, 0);
            this.Controls.SetChildIndex(this.colsS50, 0);
            this.Controls.SetChildIndex(this.colsS49, 0);
            this.Controls.SetChildIndex(this.colsS48, 0);
            this.Controls.SetChildIndex(this.colsS47, 0);
            this.Controls.SetChildIndex(this.colsS46, 0);
            this.Controls.SetChildIndex(this.colsS45, 0);
            this.Controls.SetChildIndex(this.colsS44, 0);
            this.Controls.SetChildIndex(this.colsS43, 0);
            this.Controls.SetChildIndex(this.colsS42, 0);
            this.Controls.SetChildIndex(this.colsS41, 0);
            this.Controls.SetChildIndex(this.colsS40, 0);
            this.Controls.SetChildIndex(this.colsS39, 0);
            this.Controls.SetChildIndex(this.colsS38, 0);
            this.Controls.SetChildIndex(this.colsS37, 0);
            this.Controls.SetChildIndex(this.colsS36, 0);
            this.Controls.SetChildIndex(this.colsS35, 0);
            this.Controls.SetChildIndex(this.colsS34, 0);
            this.Controls.SetChildIndex(this.colsS33, 0);
            this.Controls.SetChildIndex(this.colsS32, 0);
            this.Controls.SetChildIndex(this.colsS31, 0);
            this.Controls.SetChildIndex(this.colsS30, 0);
            this.Controls.SetChildIndex(this.colsS29, 0);
            this.Controls.SetChildIndex(this.colsS28, 0);
            this.Controls.SetChildIndex(this.colsS27, 0);
            this.Controls.SetChildIndex(this.colsS26, 0);
            this.Controls.SetChildIndex(this.colsS25, 0);
            this.Controls.SetChildIndex(this.colsS24, 0);
            this.Controls.SetChildIndex(this.colsS23, 0);
            this.Controls.SetChildIndex(this.colsS22, 0);
            this.Controls.SetChildIndex(this.colsS21, 0);
            this.Controls.SetChildIndex(this.colsS20, 0);
            this.Controls.SetChildIndex(this.colsS19, 0);
            this.Controls.SetChildIndex(this.colsS18, 0);
            this.Controls.SetChildIndex(this.colsS17, 0);
            this.Controls.SetChildIndex(this.colsS16, 0);
            this.Controls.SetChildIndex(this.colsS15, 0);
            this.Controls.SetChildIndex(this.colsS14, 0);
            this.Controls.SetChildIndex(this.colsS13, 0);
            this.Controls.SetChildIndex(this.colsS12, 0);
            this.Controls.SetChildIndex(this.colsS11, 0);
            this.Controls.SetChildIndex(this.colsS10, 0);
            this.Controls.SetChildIndex(this.colsS9, 0);
            this.Controls.SetChildIndex(this.colsS8, 0);
            this.Controls.SetChildIndex(this.colsS7, 0);
            this.Controls.SetChildIndex(this.colsS6, 0);
            this.Controls.SetChildIndex(this.colsS5, 0);
            this.Controls.SetChildIndex(this.colsS4, 0);
            this.Controls.SetChildIndex(this.colsS3, 0);
            this.Controls.SetChildIndex(this.colsS2, 0);
            this.Controls.SetChildIndex(this.colsS1, 0);
            this.Controls.SetChildIndex(this.colsId, 0);
            this.Controls.SetChildIndex(this.@__colObjid, 0);
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

        protected cColumn colsId;
        protected cColumn colsS1;
        protected cColumn colsS2;
        protected cColumn colsS3;
        protected cColumn colsS4;
        protected cColumn colsS5;
        protected cColumn colsS6;
        protected cColumn colsS7;
        protected cColumn colsS8;
        protected cColumn colsS9;
        protected cColumn colsS10;
        protected cColumn colsS11;
        protected cColumn colsS12;
        protected cColumn colsS13;
        protected cColumn colsS14;
        protected cColumn colsS15;
        protected cColumn colsS16;
        protected cColumn colsS17;
        protected cColumn colsS18;
        protected cColumn colsS19;
        protected cColumn colsS20;
        protected cColumn colsS21;
        protected cColumn colsS22;
        protected cColumn colsS23;
        protected cColumn colsS24;
        protected cColumn colsS25;
        protected cColumn colsS26;
        protected cColumn colsS27;
        protected cColumn colsS28;
        protected cColumn colsS29;
        protected cColumn colsS30;
        protected cColumn colsS31;
        protected cColumn colsS32;
        protected cColumn colsS33;
        protected cColumn colsS34;
        protected cColumn colsS35;
        protected cColumn colsS36;
        protected cColumn colsS37;
        protected cColumn colsS38;
        protected cColumn colsS39;
        protected cColumn colsS40;
        protected cColumn colsS41;
        protected cColumn colsS42;
        protected cColumn colsS43;
        protected cColumn colsS44;
        protected cColumn colsS45;
        protected cColumn colsS46;
        protected cColumn colsS47;
        protected cColumn colsS48;
        protected cColumn colsS49;
        protected cColumn colsS50;
        protected cColumn colsS51;
        protected cColumn colsS52;
        protected cColumn colsS53;
        protected cColumn colsS54;
        protected cColumn colsS55;
        protected cColumn colsS56;
        protected cColumn colsS57;
        protected cColumn colsS58;
        protected cColumn colsS59;
        protected cColumn colsS60;
        protected cColumn colsS61;
        protected cColumn colsS62;
        protected cColumn colsS63;
        protected cColumn colsS64;
        protected cColumn colsS65;
        protected cColumn colsS66;
        protected cColumn colsS67;
        protected cColumn colsS68;
        protected cColumn colsS69;
        protected cColumn colsS70;
        protected cColumn colsS71;
        protected cColumn colsS72;
        protected cColumn colsS73;
        protected cColumn colsS74;
        protected cColumn colsS75;
        protected cColumn colsS76;
        protected cColumn colsS77;
        protected cColumn colsS78;
        protected cColumn colsS79;
        protected cColumn colsS80;
        protected cColumn colsS81;
        protected cColumn colsS82;
        protected cColumn colsS83;
        protected cColumn colsS84;
        protected cColumn colsS85;
        protected cColumn colsS86;
        protected cColumn colsS87;
        protected cColumn colsS88;
        protected cColumn colsS89;
        protected cColumn colsS90;
        protected cColumn colsS91;
        protected cColumn colsS92;
        protected cColumn colsS93;
        protected cColumn colsS94;
        protected cColumn colsS95;
        protected cColumn colsS96;
        protected cColumn colsS97;
        protected cColumn colsS98;
        protected cColumn colsS99;
        protected cColumn colsS100;
        protected cColumn coldD1;
        protected cColumn coldD2;
        protected cColumn coldD3;
        protected cColumn coldD4;
        protected cColumn coldD5;
        protected cColumn coldD6;
        protected cColumn coldD7;
        protected cColumn coldD8;
        protected cColumn coldD9;
        protected cColumn coldD10;
        protected cColumn colnN1;
        protected cColumn colnN2;
        protected cColumn colnN3;
        protected cColumn colnN4;
        protected cColumn colnN5;
        protected cColumn colnN6;
        protected cColumn colnN7;
        protected cColumn colnN8;
        protected cColumn colnN9;
        protected cColumn colnN10;
        protected cLookupColumn colsRowStatus;
        protected cColumn colsTransferredBy;
        protected cColumn coldTransferredDate;
        protected cColumn colsError;
    }
}
