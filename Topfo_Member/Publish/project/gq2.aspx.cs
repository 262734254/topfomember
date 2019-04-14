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

public partial class Publish_project_gq2 : System.Web.UI.Page
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
        //if (string.IsNullOrEmpty(Page.User.Identity.Name))
        //{
        //    Response.Redirect("/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        //}
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
                    this.UpFileControl1.InfoID = _infoID;
                    this.UpFileControl1.InfoType = InfoType;
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
       
        model.ProjectAbout=txtProjectAbout.Value.Trim();
        model.marketAbout = txtMarketAbout.Value.Trim();
        model.competitioAbout = txtCompetitioAbout.Value.Trim();
        model.BussinessModeAbout = txtBussinessModeAbout.Value.Trim();
        model.ManageTeamAbout=txtManageTeamAbout.Value.Trim();
        model.InfoID = _infoID;
        bool b = dal.PublishProjectGQ2(model);
        if(b)
            Response.Redirect("ContactInfo.aspx?code=" + this.Page.Request.QueryString["code"].ToString());
    }
}
