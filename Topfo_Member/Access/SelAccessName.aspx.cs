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

public partial class Access_SelAccessName : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Page.User.Identity.Name))
        {
            Response.Redirect("/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        }
        if (!IsPostBack)
        {
            string Lg = Request["AccessName"].ToString().Trim();
            Login(Lg);
        }
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        bool isTof = Page.User.IsInRole("GT1002");

        //if (isTof)
        //{
        //    Page.MasterPageFile = "/indexTof.master";
        //}
        //else
        //{
        //    Page.MasterPageFile = "/MasterPage.master";
        //}
    }
    private void Login(string name)
    {
        Tz888.BLL.Register.common bll = new Tz888.BLL.Register.common();
        Tz888.Model.Register.MemberInfoModel model = new Tz888.Model.Register.MemberInfoModel();
        model = bll.SelorgContact(name);
        this.lblEmial.Text = model.Email.ToString();
        this.lblMobile.Text = model.Mobile.ToString();
        this.lblPhone.Text = model.Tel.ToString();
        this.lblAddress.Text = model.Address.ToString();
    }
}
