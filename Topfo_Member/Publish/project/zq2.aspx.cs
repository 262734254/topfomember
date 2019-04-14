﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class Publish_project_zq2 : System.Web.UI.Page
{
    protected long _infoID;
    protected string title;
    protected string cooperationDemandType;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        bool isTof = Page.User.IsInRole("GT1002");

        if (isTof)
        {
            Page.MasterPageFile = "/indexTof.master";
        }
        else
        {
            Page.MasterPageFile = "/MasterPage.master";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Page.User.Identity.Name))
        {
            Response.Redirect("/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        }
        ImageButton1.Attributes.Add("onclick", "return chkpost()");
        if (this.Page.Request.QueryString["code"] != null)
        {
            string code = this.Page.Request.QueryString["code"].ToString();
            try
            {
                code = Tz888.Common.DEncrypt.DESEncrypt.Decrypt(code);
                string[] arr = code.Split('|');
                if (arr.Length == 4)
                {
                    this._infoID = Convert.ToInt64(arr[0]);
                    string InfoType = arr[1].ToString();
                    this.title = arr[2].ToString();
                    if (InfoType.ToLower() != "project")
                        throw new Exception();
                    this.cooperationDemandType = arr[3].ToString();

                    this.FilesUploadControl1.InfoType = "Project";
                    this.FilesUploadControl1.NoneCount = 5;
                    this.FilesUploadControl1.Count = 5;

                    //this.UpFileControl1.InfoID = _infoID;
                    //this.UpFileControl1.InfoType = "Project";
                }
                else
                {
                    Tz888.Common.MessageBox.ShowAndRedirect(this.Page, "请通过正常途径访问!", "http://member.topfo.com");
                }
            }
            catch
            {
                Tz888.Common.MessageBox.ShowAndRedirect(this.Page, "请通过正常途径访问!", "http://member.topfo.com");
            }
        }
        else
            Tz888.Common.MessageBox.ShowAndRedirect(this.Page, "请通过正常途径访问!", "http://member.topfo.com");


    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Tz888.BLL.Info.ProjectInfoBLL dal = new Tz888.BLL.Info.ProjectInfoBLL();
        Tz888.Model.Info.ProjectInfoModel model = new Tz888.Model.Info.ProjectInfoModel();
        model.marketAbout = txtMarketAbout.Value.Trim();
        decimal CompanyNG = 0;
        if (Tz888.Common.Utility.PageValidate.IsNumber(txtCompanyNG.Value.Trim()))
        {
            CompanyNG = Convert.ToDecimal(txtCompanyNG.Value.Trim());
        }
        model.CompanyNG = CompanyNG;
        decimal CompanyTotalDebet = 0;
        if (Tz888.Common.Utility.PageValidate.IsNumber(txtCompanyTotalDebet.Value.Trim()))
        {
            CompanyTotalDebet = Convert.ToDecimal(txtCompanyTotalDebet.Value.Trim());
        }
        model.CompanyTotalDebet = CompanyTotalDebet;


        decimal CompanyYearIncome = 0;
        if (Tz888.Common.Utility.PageValidate.IsNumber(txtCompanyYearIncome.Value.Trim()))
        {
            CompanyYearIncome = Convert.ToDecimal(txtCompanyYearIncome.Value.Trim());
        }
        model.CompanyYearIncome = CompanyYearIncome;

        decimal CompanyTotalCapital = 0;
        if (Tz888.Common.Utility.PageValidate.IsNumber(txtCompanyTotalCapital.Value.Trim()))
        {
            CompanyYearIncome = Convert.ToDecimal(txtCompanyTotalCapital.Value.Trim());
        }
        model.CompanyTotalCapital = CompanyTotalCapital;

        model.InfoID = _infoID;
        bool b = dal.PublishProjectZQ2(model);

        //Response.Write(b.ToString());
        if (b)
        {

            //为信息添加多个资源
            List<Tz888.Model.Info.InfoResourceModel> infoResourceModels = new List<Tz888.Model.Info.InfoResourceModel>();//资源信息实体
            infoResourceModels = FilesUploadControl1.InfoList;
            if (infoResourceModels != null)
            {
                if (infoResourceModels != null)
                {
                    Tz888.SQLServerDAL.Info.InfoResourceDAL obj2 = new Tz888.SQLServerDAL.Info.InfoResourceDAL();
                    foreach (Tz888.Model.Info.InfoResourceModel ResModel in infoResourceModels)
                    {
                        ResModel.InfoID = _infoID;
                        obj2.Insert(ResModel);
                    }
                }
            }

            Response.Redirect("ContactInfo.aspx?code=" + this.Page.Request.QueryString["code"].ToString());
        }
    }
}
