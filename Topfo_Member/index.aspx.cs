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
using System.Text;
using Tz888.BLL;
using Tz888.BLL.Login;


public partial class index : System.Web.UI.Page
{
    Tz888.BLL.MeberLogin.MemberIndexBLL member = new Tz888.BLL.MeberLogin.MemberIndexBLL();
    string LoginName = "";

    protected void Page_PreInit(object sender, EventArgs e)
    {
//#if DEBUG
//        System.Web.Security.FormsIdentity id;
//        id = (System.Web.Security.FormsIdentity)("hujie2010");
//        String[] myRoles = new String[4];
//        myRoles[0] = "2001";
//        myRoles[1] = "2002";
//        myRoles[2] = "2003";
//        myRoles[3] = "2004";
//        HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(id, myRoles);
//#endif
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
        if (Page.User.Identity.Name == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (Page.User.IsInRole("GT1002"))
        {
            Response.Redirect("indexTof.aspx");
        }
        if (!IsPostBack)
        {
            LoginName = Page.User.Identity.Name.Trim();
           // LoginName = "liulixing";
           // LoginName = "topfo001";
            ShowPublishInfo();
            MemberNews(LoginName);
        }
    }
    private void ShowPublishInfo()
    {
        if (Page.User.IsInRole("MT1004")) //机构
        {
            GetGovInfo();
        }
        else
        {
            GetOtherInfo();
        }
    }

    private int GetItemByPara(string resType, string loginName, string auditStatus)
    {
        string strAudit = "";
        if (auditStatus != null)
            strAudit = " and AuditingStatus=" + auditStatus;

        Tz888.BLL.Info.MainInfoBLL mainInfo = new Tz888.BLL.Info.MainInfoBLL();
        try
        {
            DataSet dsTemp = mainInfo.GetList("InfoID", "InfoID", 1, 1, 1, "(InfoTypeID = '" + resType + "') and loginname='" + loginName + "'" + strAudit);
            return dsTemp.Tables[0].Rows.Count;
        }
        catch (Exception exp)
        {
            return 0;
        }
    }

    protected int GetCount(Tz888.BLL.Common.AuditStatus Type)
    {
        //string loginName = "liulixing";
       // string loginName = "topfo001";
        string loginName = Page.User.Identity.Name;

        Tz888.BLL.Info.MainInfoBLL bll = new Tz888.BLL.Info.MainInfoBLL();
        return bll.GetCount(Type, loginName, "0");
    }
    //////////////////////////////////////////////////////////////////////////
    private void GetOtherInfo()
    {
        int itemCount = GetItemByPara("Capital' or InfoTypeID='Project", LoginName, null);
        if (itemCount == 0)
        {
            this.forInfo.InnerHtml = "想让更多对口的客户找到您吗？赶紧发布需求吧！<span><a href=\"Publish/publishNavigate.aspx\" class=\"Spaces\">" +
                                    "<img src=\"images_fhy/btn_1.png\" align=\"absmiddle\"></a></span>";
        }
        else
        {
            string content = "";
            int iCount = GetCount(Tz888.BLL.Common.AuditStatus.Auditing); //未审核

            int iCount2 = GetCount(Tz888.BLL.Common.AuditStatus.NoPass);// 2审核未通过
            int iCount3 = GetCount(Tz888.BLL.Common.AuditStatus.Overdue);// 2审核未通过
            //<span class="f_cen strong">7</span>条未审需求<span class="f_cen strong">5</span>条已过期需求 <span class="f_cen strong">6</span>条已过期需求 有<span class="f_cen strong">6</span>人关注过你的项目 
            if (iCount > 0)
                content = "您有<span class='f_cen strong'>" + iCount.ToString() + "</span>条正在审核中的新需求。<a href='Manage/ResourceManage_Pass.aspx' class='f_cen'>查看</a>";
            if (iCount2 > 0)
                content += "您有<span class='f_cen strong'>" + iCount2.ToString() + "</span>条未通过审核的新需求。<a href='Manage/ResourceManage_Pass.aspx' class='f_cen'>查看</a>";
            if (iCount3 > 0)
                content += "您有<span class='f_cen strong'>" + iCount3.ToString() + "</span>条已过期的需求。<a href='Manage/ResourceManage_Pass.aspx' class='f_cen'>查看</a>";

            this.forInfo.InnerHtml = content;
        }
    }
    //////////////////////////////////////////////////////////////////////////
    private void GetGovInfo()
    {
        int itemCount = GetItemByPara("Merchant", LoginName, null);
        if (itemCount == 0)
        {
            this.forInfo.InnerHtml = "想让更多对口的客户找到您吗？赶紧发布需求吧！<span><a href=\"Publish/publishNavigate.aspx\" class=\"Spaces\">" +
                                    "<img src=\"images_fhy/btn_1.png\" align=\"absmiddle\"></a></span>";
        }
        else
        {
            string content = "";
            int iCount = GetCount(Tz888.BLL.Common.AuditStatus.Auditing); //未审核

            int iCount2 = GetCount(Tz888.BLL.Common.AuditStatus.NoPass); // 2审核未通过
            int iCount3 = GetCount(Tz888.BLL.Common.AuditStatus.Overdue);

            if (iCount > 0)
                content = "您有<span class='f_cen strong'>" + iCount.ToString() + "</span>条正在审核中的新需求。<a href='Manage/ResourceManage_Audit.aspx' class='f_cen'>查看</a>";
            if (iCount2 > 0)
                content += "您有<span class='f_cen strong'>" + iCount2.ToString() + "</span>条未通过审核的新需求。<a href='Manage/ResourceManage_NoPass.aspx' class='f_cen'>查看</a>";
            if (iCount3 > 0)
                content += "您有<span class='f_cen strong'>" + iCount3.ToString() + "</span>条已过期的需求。<a href='Manage/ResourceManage_Overdue.aspx' class='f_cen'>查看</a>";

            this.forInfo.InnerHtml = content;
        }
    }

    private void MemberNews(string name)
    {
        StringBuilder sb = new StringBuilder();
        string[] num = member.SelMemberNews(name).Split('&');
        if (num.Length ==0)
        {
            sb.Append("<ul>");
            sb.Append("<li>会员名：<span class=\"f_lan\"></span></li>");
            sb.Append("<li>会员组：<span class=\"f_lan\"></span></li>");
            sb.Append("<li>会员ID：<span class=\"f_lan\"></span></li>");
            sb.Append("<li>登录时间：<span class=\"f_lan\">" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "</span></li>");
            sb.Append("<li>注册时间：<span class=\"f_lan\"></span></li>");
            sb.Append("<li>我的手机：<span class=\"f_lan\"></span></li>");
            sb.Append("<li>我的邮箱：<span class=\"f_lan\"></span></li>");
            sb.Append("<li>会员升级：<span class=\"f_lan\"><a href=\"#\" class=\"f_cen\">立即升级</a></span></li>");
            sb.Append("</ul>");
            this.NewsId.InnerHtml = sb.ToString();//绑定会员信息
            this.SpanGradeID.InnerHtml ="";//用户级别
            this.SpanTypeID.InnerHtml = "";//所属类型
        }
        else
        {
            sb.Append("<ul>");
            sb.Append("<li>会员名：<span class=\"f_lan\">" + num[1] + "</span></li>");
            sb.Append("<li>会员组：<span class=\"f_lan\">" + num[4] + "</span></li>");
            sb.Append("<li>会员ID：<span class=\"f_lan\">" + num[0] + "</span></li>");
            sb.Append("<li>登录时间：<span class=\"f_lan\">" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "</span></li>");
            sb.Append("<li>注册时间：<span class=\"f_lan\">" + num[5] + "</span></li>");
            sb.Append("<li>我的手机：<span class=\"f_lan\">" + num[2] + "</span></li>");
            sb.Append("<li>我的邮箱：<span class=\"f_lan\">" + num[3] + "</span></li>");
            sb.Append("<li>会员升级：<span class=\"f_lan\"><a href=\"#\" class=\"f_cen\">立即升级</a></span></li>");
            sb.Append("</ul>");
            this.NewsId.InnerHtml = sb.ToString();//绑定会员信息
            this.SpanGradeID.InnerHtml = num[4].ToString();//用户级别
            this.SpanTypeID.InnerHtml = num[6].ToString();//所属类型
            this.SpanJiFen.InnerHtml = Convert.ToString(member.SelJiFen(name));//积分
        }
        
      //  this.wd_con_20.InnerHtml = member.SelItem(name);//最近项目
        this.spanInnerInfo.InnerHtml = Convert.ToString(member.SelInnerInfo(name));//未读短信

        Tz888.BLL.Company.NarrowAdInfoBLL na=new Tz888.BLL.Company.NarrowAdInfoBLL();
        DivNaID.InnerHtml = na.NarrowName(name);//窄告信息

    }
    protected string ZSNews()
    {
        return member.SelItem(LoginName);
    }

    protected string NewLeate()
    {
        return member.SelLatest();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        if (this.SpanTypeID.InnerHtml=="政府招商") //机构
        {
       
            Response.Redirect("PayManage/VipPay/VipManage.aspx");
        }
        if (this.SpanTypeID.InnerHtml=="融资单位")
        {

            Response.Redirect("PayManage/VipPay/VipRManage.aspx");
        }
        if (this.SpanTypeID.InnerHtml=="投资单位")
        {

            Response.Redirect("PayManage/VipPay/VipRManage.aspx");
        }
        if (this.SpanTypeID.InnerHtml == "中介机构") //机构
        {

            Response.Redirect("PayManage/VipPay/ZVipManage.aspx");
        }
        else
        {
            Response.Redirect("PayManage/VipPay/ZVipManage.aspx");
        }
        
    }
}
