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
using Tz888.Common;

public partial class agent_PublishCapital1 : System.Web.UI.Page
{
    private string fz_LoginName = "";
    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    bool isTof = Page.User.IsInRole("GT1002");

    //    if (isTof)
    //    {
    //        Page.MasterPageFile = "/indexTof.master";
    //    }
    //    else
    //    {
    //        Page.MasterPageFile = "/MasterPage.master";
    //    }
    //}
    protected void Page_Load(object sender, EventArgs e)
    {

        fz_LoginName = Request.QueryString["fzname"].ToString();
        if (string.IsNullOrEmpty(fz_LoginName))
        {
            Response.Redirect(ConfigurationManager.AppSettings["AgentLogin"] + "&ReturnURL=" + this.Request.Url.ToString());
        }

        //if (string.IsNullOrEmpty(Page.User.Identity.Name))
        //{
        //    Response.Redirect("/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        //    return;
        //}
        AjaxPro.Utility.RegisterTypeForAjax(typeof(Tz888.Common.Ajax.AjaxMethod));

        if (!this.Page.IsPostBack)
        {
            this.BindCapitalType();
            this.BindSetCapital();
            this.BindStage();

            this.BindRegDollar();
            this.BindTeam();
            this.BindPin();
            this.BindCheng();

            this.BindCooperationDemandType();
            this.BindJoinManage();
            this.BindDateEnd();
            //联系的初试化
            this.InitInfoContact();


        }
        #region 以下是做判断的的方法
        //资本类型
        for (int i = 0; i < this.rblfinancingTarget.Items.Count; i++)
        {
            this.rblfinancingTarget.Items[i].Attributes.Add("onclick", "checkCapitalType();");
        }
        //单项目可投资金额
        for (int i = 0; i < this.rblCurreny.Items.Count; i++)
        {
            this.rblCurreny.Items[i].Attributes.Add("onclick", "checkCurrency();");
        }
        //投资项目阶段
        for (int i = 0; i < this.rblStage.Items.Count; i++)
        {
            this.rblStage.Items[i].Attributes.Add("onclick", "checkStage();");
        }
        //投资方式
        for (int i = 0; i < this.chkLstCooperationDemand.Items.Count; i++)
        {
            this.chkLstCooperationDemand.Items[i].Attributes.Add("onclick", "checkCooperationDemand();");
        }
        //是否参与项目方管理
        for (int i = 0; i < this.rdlJoinManage.Items.Count; i++)
        {
            this.rdlJoinManage.Items[i].Attributes.Add("onclick", "checkJoinManage();");
        }
        //意向有效期限
        for (int i = 0; i < this.rdlValiditeTerm.Items.Count; i++)
        {
            this.rdlValiditeTerm.Items[i].Attributes.Add("onclick", "checkValiditeTerm();");
        }
        //机构注册资金
        for (int i = 0; i < this.rblRegisterdollar.Items.Count; i++)
        {
            this.rblRegisterdollar.Items[i].Attributes.Add("onclick", "checkCurreny();");
        }
        //机构团队规模
        for (int i = 0; i < this.rblTeam.Items.Count; i++)
        {

            this.rblTeam.Items[i].Attributes.Add("onclick", "checkTeam();");
        }
        //机构年平均投资事件数
        for (int i = 0; i < this.rblPinJ.Items.Count; i++)
        {

            this.rblPinJ.Items[i].Attributes.Add("onclick", "checkPinjun();");

        }
        //机构成功投资事件总数
        for (int i = 0; i < this.rblSucess.Items.Count; i++)
        {

            this.rblSucess.Items[i].Attributes.Add("onclick", "checkSucess();");

        }
        #endregion
        //以下是取得上传文件信息
        this.FilesUploadControl1.InfoType = "Capital";
        this.FilesUploadControl1.NoneCount = 5;
        this.FilesUploadControl1.Count = 5;

    }
    #region 初试值
    /// <summary>
    /// 设置项目发展阶段
    /// </summary>
    private void BindStage()
    {
        Tz888.BLL.Common.ParameterBLL bll = new Tz888.BLL.Common.ParameterBLL();
        this.rblStage.DataSource = bll.GetALLStage();
        this.rblStage.DataValueField = "StageID";
        this.rblStage.DataTextField = "StageName";
        this.rblStage.DataBind();
    }

    /// <summary>
    /// 设置投资类型
    /// </summary>
    private void BindCapitalType()
    {
        Tz888.BLL.Common.ParameterBLL bll = new Tz888.BLL.Common.ParameterBLL();
        rblfinancingTarget.DataSource = bll.GetALLfinancingTarget();
        rblfinancingTarget.DataValueField = "financingID";
        rblfinancingTarget.DataTextField = "FinancingName";
        rblfinancingTarget.DataBind();
    }
    /// <summary>
    /// 设置融资金额
    /// </summary>
    private void BindSetCapital()
    {
        Tz888.BLL.Common.SetCapitalBLL bll = new Tz888.BLL.Common.SetCapitalBLL();
        rblCurreny.DataSource = bll.GetList();
        rblCurreny.DataTextField = "CapitalName";
        rblCurreny.DataValueField = "CapitalID";
        rblCurreny.DataBind();
    }

    /// <summary>
    /// 机构注册资金
    /// </summary>
    private void BindRegDollar()
    {
        Tz888.BLL.Conn dal = new Tz888.BLL.Conn();
        DataTable dt = dal.GetList("dicttab", "*", "idictvalue", 10, 1, 0, 0, " cdicttype='jgzczj' ");
        this.rblRegisterdollar.DataTextField = "cdictname";
        this.rblRegisterdollar.DataValueField = "idictvalue";
        this.rblRegisterdollar.DataSource = dt;
        this.rblRegisterdollar.DataBind();
    }
    /// <summary>
    /// 机构团队规模
    /// </summary>
    private void BindTeam()
    {
        Tz888.BLL.Conn dal = new Tz888.BLL.Conn();
        DataTable dt = dal.GetList("dicttab", "*", "idictvalue", 10, 1, 0, 0, " cdicttype='jgtdgm' ");
        this.rblTeam.DataTextField = "cdictname";
        this.rblTeam.DataValueField = "idictvalue";
        this.rblTeam.DataSource = dt;
        this.rblTeam.DataBind();


    }
    /// <summary>
    /// 机构年平均投资事件数
    /// </summary>
    private void BindPin()
    {
        Tz888.BLL.Conn dal = new Tz888.BLL.Conn();
        DataTable dt = dal.GetList("dicttab", "*", "idictvalue", 10, 1, 0, 0, " cdicttype='jgpjtzsjs' ");
        this.rblPinJ.DataTextField = "cdictname";
        this.rblPinJ.DataValueField = "idictvalue";
        this.rblPinJ.DataSource = dt;
        this.rblPinJ.DataBind();
    }

    /// <summary>
    /// 机构成功投资事件总数
    /// </summary>
    private void BindCheng()
    {

        Tz888.BLL.Conn dal = new Tz888.BLL.Conn();
        DataTable dt = dal.GetList("dicttab", "*", "idictvalue", 10, 1, 0, 0, " cdicttype='jgcgtzsjs' ");
        this.rblSucess.DataTextField = "cdictname";
        this.rblSucess.DataValueField = "idictvalue";
        this.rblSucess.DataSource = dt;
        this.rblSucess.DataBind();
    }

    /// <summary>
    /// 绑定项目合作类型
    /// </summary>
    private void BindCooperationDemandType()
    {
        this.chkLstCooperationDemand.DataSource = Tz888.BLL.Info.Common.GetCooperationDemandList("Capital");
        this.chkLstCooperationDemand.DataTextField = "CooperationDemandName";
        this.chkLstCooperationDemand.DataValueField = "CooperationDemandTypeID";
        this.chkLstCooperationDemand.DataBind();
    }
    /// <summary>
    /// 设置参与管理
    /// </summary>
    private void BindJoinManage()
    {
        Tz888.BLL.Common.ParameterBLL bll = new Tz888.BLL.Common.ParameterBLL();
        this.rdlJoinManage.DataSource = bll.GetALLJoinManageTab();
        this.rdlJoinManage.DataValueField = "JoinManageID";
        this.rdlJoinManage.DataTextField = "JoinManageName";
        this.rdlJoinManage.DataBind();
    }
    /// <summary>
    /// 项目有效期限
    /// </summary>
    private void BindDateEnd()
    {
        Tz888.BLL.Conn dal = new Tz888.BLL.Conn();
        DataTable dt = dal.GetList("dicttab", "*", "idictvalue", 10, 1, 0, 0, " cdicttype='xmyxqxx' ");
        this.rdlValiditeTerm.DataTextField = "cdictname";
        this.rdlValiditeTerm.DataValueField = "idictvalue";
        this.rdlValiditeTerm.DataSource = dt;
        this.rdlValiditeTerm.DataBind();
    }

    #endregion


    #region 从OrgContactModel 获取相应的数据 插入到InfoContactModel中通过insert 传到下一步中 然后下面的就update之
   //private Tz888.Model.Info.InfoContactModel GetInfoContact()
   // {
   //     //string loginName = Page.User.Identity.Name;
   //     string loginName = fz_LoginName;
   //     Tz888.BLL.Register.common bll = new Tz888.BLL.Register.common();
   //     Tz888.Model.Register.OrgContactModel model = new Tz888.Model.Register.OrgContactModel();

   //     model = bll.getContactModel(loginName);
   //     Tz888.Model.Info.InfoContactModel model1 = new Tz888.Model.Info.InfoContactModel();

   //     if (model == null)
   //         return model1;
   //     // 这里改变投资机构名称到联系方式中
   //     //model1.OrganizationName = this.txtGovName.Text;

   //     model1.OrganizationName = " ";
   //     model1.OrgIntro = this.txtGovIntro.Value;
   //     model1.Name = model.Name.Trim();
   //     model1.Mobile = model.Mobile.Trim();
   //     model1.PostCode = model.PostCode.Trim();
   //     model1.TelCountryCode = model.TelCountryCode.Trim();
   //     model1.TelNum = model.TelNum.Trim();
   //     model1.TelStateCode = model.TelStateCode.Trim();
   //     model1.WebSite = model.Website.Trim();
   //     model1.FaxCountryCode = model.FaxCountryCode.Trim();
   //     model1.FaxNum = model.FaxNum.Trim();
   //     model1.FaxStateCode = model.FaxStateCode.Trim();
   //     model1.Email = model.Email.Trim();
   //     model1.Address = model.address.Trim();
   //     model1.Career = model.Career.Trim();


   //     return model1;
   // }

    #endregion

    /// <summary>
    /// 添加数据
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    #region
    // protected void btnSubmit_ServerClick(object sender, EventArgs e)
    //{
    //Response.Write("<script>alert('ok1')</script>");

    ////20090811 判断权限
    //Tz888.BLL.Login.LoginInfoBLL loginbll = new Tz888.BLL.Login.LoginInfoBLL();
    //bool yanzheng = loginbll.yanzheng(Page.User.Identity.Name);
    //if (!yanzheng)
    //{
    //    Tz888.Common.MessageBox.Show(this.Page, "发布失败,你没有发布信息的权限！\\n可能是你发布违规信息帐户被锁定了。\\n详情请联系客服。");
    //    return;
    //}
    ////-----end--

    ////获取投资资源的信息
    //Tz888.Model.Info.MainInfoModel mainInfoModel = new Tz888.Model.Info.MainInfoModel();  //创建主体信息实体
    //Tz888.Model.Info.V124.CapitalInfoModel capitalInfoModel = new Tz888.Model.Info.V124.CapitalInfoModel(); //创建投资信息实体
    //List<Tz888.Model.Info.CapitalInfoAreaModel> capitalInfoAreaModels = new List<Tz888.Model.Info.CapitalInfoAreaModel>();//投资区域信息实体列表
    //Tz888.Model.Info.ShortInfoModel shortInfoModel = new Tz888.Model.Info.ShortInfoModel(); //创建短信息实体
    ////以下是文件上传的实体声明
    //List<Tz888.Model.Info.InfoResourceModel> infoResourceModels = new List<Tz888.Model.Info.InfoResourceModel>();

    //DateTime time_now = DateTime.Now;

    ////拟投向区域
    //capitalInfoAreaModels = this.ZoneSelect1.CapitalInfoAreaModels;

    ////主体信息实体付值


    //#region 投资信息实体赋值

    ////投资意向详细说明
    //capitalInfoModel.ComAbout = Tz888.Common.Utility.PageValidate.TxtToHtml(this.txtCapitalIntent.Value.Trim());
    ////资本类型
    ////capitalInfoModel.CapitalTypeID = this.rblfinancingTarget.SelectedValue;
    //for (int i = 0; rblfinancingTarget.Items.Count > i; i++)
    //{
    //    if (rblfinancingTarget.Items[i].Selected)
    //    {
    //        capitalInfoModel.CapitalTypeID += rblfinancingTarget.Items[i].Value + ",";
    //    }
    //}
    ////单项目可投资金额
    //capitalInfoModel.CapitalID = this.rblCurreny.SelectedValue;
    ////项目介绍提炼
    //capitalInfoModel.ComBreif = "";

    //capitalInfoModel.CooperationDemandType = "";

    ////拟投资行业
    //capitalInfoModel.IndustryBID = this.SelectIndustryControl1.IndustryString;
    ////投资项目阶段
    //capitalInfoModel.stageID = Convert.ToInt32(this.rblStage.SelectedValue);
    //// 是否参与项目方管理
    //capitalInfoModel.joinManageID = Convert.ToInt32(this.rdlJoinManage.SelectedValue);

    ////投资方式
    //for (int i = 0; chkLstCooperationDemand.Items.Count > i; i++)
    //{
    //    if (chkLstCooperationDemand.Items[i].Selected)
    //    {
    //        capitalInfoModel.CooperationDemandType += chkLstCooperationDemand.Items[i].Value + ",";
    //    }
    //}

    ////以下是需要添加的参数
    ////注册资金
    //capitalInfoModel.RegisteredCapital = this.rblRegisterdollar.SelectedValue;
    ////团队规模  
    //capitalInfoModel.TeamScale = this.rblTeam.SelectedValue;
    ////机构年平均投资事件数
    //capitalInfoModel.AverageInvestment = this.rblPinJ.SelectedValue;
    ////机构成功投资事件总数
    //capitalInfoModel.SuccessfulInvestment = this.rblSucess.SelectedValue;
    ////投资需求摘要
    //capitalInfoModel.InvestmentDemand = this.txtDemand.Value;
    ////添加所属区域

    //capitalInfoModel.SCountryID = this.ZoneSelectControl1.CountryID;
    //capitalInfoModel.SProvinceID = this.ZoneSelectControl1.ProvinceID;
    //capitalInfoModel.SCityID = this.ZoneSelectControl1.CityID;
    //capitalInfoModel.SCountyID = this.ZoneSelectControl1.CountyID;
    ////项目承办单位
    //capitalInfoModel.Prorganizers = "no";
    ////文件上传的
    //infoResourceModels = FilesUploadControl1.InfoList;


    //#endregion


    ////这里是其他的实体值
    //if (!string.IsNullOrEmpty(this.txtCapitalName.Text.Trim()))
    //    mainInfoModel.Title = Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtCapitalName.Text.Trim());

    //string CountryCode;
    //try
    //{
    //    CountryCode = capitalInfoAreaModels[0].CountryCode;
    //}
    //catch
    //{
    //    CountryCode = "ALL";
    //}
    //mainInfoModel.InfoCode = Tz888.BLL.Info.Common.CreateInfoCode("Capital", capitalInfoModel.IndustryBID.Split(',')[0], CountryCode, time_now);
    //mainInfoModel.publishT = time_now;
    //mainInfoModel.Hit = 0;

    //mainInfoModel.IsCore = true;
    //mainInfoModel.LoginName = "cxj";

    ////mainInfoModel.LoginName = Page.User.Identity.Name; //用户名称
    //mainInfoModel.InfoOriginRoleName = "0"; //用户角色
    //mainInfoModel.GradeID = "0";
    //mainInfoModel.FixPriceID = "1";
    //mainInfoModel.FeeStatus = 0;

    //string keyword = "";
    //if (!string.IsNullOrEmpty(this.txtKeyword1.Text.Trim()))
    //    keyword += Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtKeyword1.Text.Trim()) + ",";
    //if (!string.IsNullOrEmpty(this.txtKeyword2.Text.Trim()))
    //    keyword += Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtKeyword2.Text.Trim()) + ",";
    //if (!string.IsNullOrEmpty(this.txtKeyword3.Text.Trim()))
    //    keyword += Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtKeyword3.Text.Trim()) + ",";

    //mainInfoModel.KeyWord = keyword;
    //mainInfoModel.Descript = "";
    //if (!string.IsNullOrEmpty(this.txtCapitalName.Text.Trim()))
    //    mainInfoModel.DisplayTitle = Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtCapitalName.Text.Trim());
    //mainInfoModel.FrontDisplayTime = time_now;
    //mainInfoModel.ValidateStartTime = time_now;
    ////意向有效期限
    //mainInfoModel.ValidateTerm = Convert.ToInt32(this.rdlValiditeTerm.SelectedValue.Trim());
    //mainInfoModel.TemplateID = "001";
    //mainInfoModel.HtmlFile = "";

    //shortInfoModel.ShortInfoControlID = "CapitalIndex1";
    //if (!string.IsNullOrEmpty(this.txtCapitalName.Text.Trim()))
    //    shortInfoModel.ShortTitle = Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtCapitalName.Text.Trim());
    //shortInfoModel.ShortContent = "";
    //shortInfoModel.Remark = "";

    //Tz888.BLL.Info.V124.CapitalInfoBLL bll = new Tz888.BLL.Info.V124.CapitalInfoBLL();

    ////这里是插入资源投资信息
    ////long infoID = bll.Insert(mainInfoModel, capitalInfoModel, this.GetInfoContact(), shortInfoModel, capitalInfoAreaModels, null, infoResourceModels);
    //long infoID = bll.Insert(mainInfoModel, capitalInfoModel, this.GetInfoContact(), shortInfoModel, capitalInfoAreaModels, infoResourceModels);
    ////以下进行图片的插入


    //if (infoID > 0)
    //{
    //    bool isTof = Page.User.IsInRole("GT1002");
    //    if (isTof)
    //    {
    //        string HtmlFile = Tz888.BLL.Info.Common.createStaticPageFileName("Capital", mainInfoModel.InfoCode, infoID);
    //        Tz888.BLL.Info.MainInfoBLL mainBll = new Tz888.BLL.Info.MainInfoBLL();
    //        Page.Response.Write(infoID.ToString() + HtmlFile.ToString());
    //        mainBll.HasHtmlFile(infoID, HtmlFile);
    //        string actionMsg = "";
    //        Tz888.BLL.PageStatic.CapitalPageStatic staticobj = new Tz888.BLL.PageStatic.CapitalPageStatic();
    //        staticobj.CreateStaticPageCapital(infoID.ToString(), ref actionMsg);
    //    }
    //    // Response.Redirect("publishCapital_step2.aspx?code=" + Tz888.Common.DEncrypt.DESEncrypt.Encrypt(infoID.ToString() + "|Capital|" + this.txtCapitalName.Text.Trim() + "|" + txtGovName.Text.Trim()));
    //    Response.Redirect("publishCapital_step2.aspx?code=" + Tz888.Common.DEncrypt.DESEncrypt.Encrypt(infoID.ToString() + "|Capital|" + this.txtCapitalName.Text.Trim() + "|" + "no"));
    //}
    //else
    //{
    //    Tz888.Common.MessageBox.Show(this.Page, "发布失败！");
    //}

    //}
    #endregion
    private void InitInfoContact()
    {
        string loginName = fz_LoginName;
        Tz888.BLL.Register.common bll = new Tz888.BLL.Register.common();
        Tz888.Model.Register.OrgContactModel model = new Tz888.Model.Register.OrgContactModel();

        model = bll.getContactModel(loginName);

        if (model == null)
            return;
        Tz888.Model.Info.InfoContactModel model1 = new Tz888.Model.Info.InfoContactModel();

        model1.OrganizationName = model.OrganizationName.Trim();
        model1.Name = model.Name.Trim();
        model1.Mobile = model.Mobile.Trim();
        model1.PostCode = model.PostCode.Trim();
        model1.TelCountryCode = model.TelCountryCode.Trim();
        model1.TelNum = model.TelNum.Trim();
        model1.TelStateCode = model.TelStateCode.Trim();
        model1.WebSite = model.Website.Trim();
        model1.FaxCountryCode = model.FaxCountryCode.Trim();
        model1.FaxNum = model.FaxNum.Trim();
        model1.FaxStateCode = model.FaxStateCode.Trim();
        model1.Email = model.Email.Trim();
        model1.Address = model.address.Trim();
        model1.Career = model.Career.Trim();

        this.CapitalAddressInfo1.InfoContact = model1;

    }


    protected void IbtnSubmit_Click(object sender, EventArgs e)
    {
        //20090811 判断权限
        Tz888.BLL.Login.LoginInfoBLL loginbll = new Tz888.BLL.Login.LoginInfoBLL();
        bool yanzheng = loginbll.yanzheng(fz_LoginName);
        if (!yanzheng)
        {
            Tz888.Common.MessageBox.Show(this.Page, "发布失败,你没有发布信息的权限！\\n可能是你发布违规信息帐户被锁定了。\\n详情请联系客服。");
            return;
        }
        //-----end--



        //获取投资资源的信息
        Tz888.Model.Info.MainInfoModel mainInfoModel = new Tz888.Model.Info.MainInfoModel();  //创建主体信息实体
        Tz888.Model.Info.V124.CapitalInfoModel capitalInfoModel = new Tz888.Model.Info.V124.CapitalInfoModel(); //创建投资信息实体

        Tz888.Model.Info.InfoContactModel infoContactModel = new Tz888.Model.Info.InfoContactModel(); //创建信息联系方式主体

        List<Tz888.Model.Info.CapitalInfoAreaModel> capitalInfoAreaModels = new List<Tz888.Model.Info.CapitalInfoAreaModel>();//投资区域信息实体列表
        Tz888.Model.Info.ShortInfoModel shortInfoModel = new Tz888.Model.Info.ShortInfoModel(); //创建短信息实体
        //以下是文件上传的实体声明
        List<Tz888.Model.Info.InfoResourceModel> infoResourceModels = new List<Tz888.Model.Info.InfoResourceModel>();

        DateTime time_now = DateTime.Now;

        //拟投向区域
        capitalInfoAreaModels = this.ZoneSelect1.CapitalInfoAreaModels;

        //主体信息实体付值
        //联系2010-06-29 
        infoContactModel = this.CapitalAddressInfo1.InfoContact;

        #region 投资信息实体赋值

        //投资意向详细说明
        capitalInfoModel.ComAbout = Tz888.Common.Utility.PageValidate.TxtToHtml(this.txtCapitalIntent.Value.Trim());
        //资本类型
        //capitalInfoModel.CapitalTypeID = this.rblfinancingTarget.SelectedValue;
        for (int i = 0; rblfinancingTarget.Items.Count > i; i++)
        {
            if (rblfinancingTarget.Items[i].Selected)
            {
                capitalInfoModel.CapitalTypeID += rblfinancingTarget.Items[i].Value + ",";
            }
        }
        //单项目可投资金额
        capitalInfoModel.CapitalID = this.rblCurreny.SelectedValue;
        //项目介绍提炼
        capitalInfoModel.ComBreif = "";

        capitalInfoModel.CooperationDemandType = "";

        //拟投资行业
        capitalInfoModel.IndustryBID = this.SelectIndustryControl1.IndustryString;
        //投资项目阶段
        //2010-06-23

        capitalInfoModel.stageID = Convert.ToInt32(this.rblStage.SelectedValue);
        // 是否参与项目方管理
        //2010-06-23
        capitalInfoModel.joinManageID = Convert.ToInt32(this.rdlJoinManage.SelectedValue);

        //投资方式
        for (int i = 0; chkLstCooperationDemand.Items.Count > i; i++)
        {
            if (chkLstCooperationDemand.Items[i].Selected)
            {
                capitalInfoModel.CooperationDemandType += chkLstCooperationDemand.Items[i].Value + ",";
            }
        }

        //以下是需要添加的参数
        //注册资金
        capitalInfoModel.RegisteredCapital = this.rblRegisterdollar.SelectedValue;
        //团队规模  
        capitalInfoModel.TeamScale = this.rblTeam.SelectedValue;
        //机构年平均投资事件数
        capitalInfoModel.AverageInvestment = this.rblPinJ.SelectedValue;
        //机构成功投资事件总数
        capitalInfoModel.SuccessfulInvestment = this.rblSucess.SelectedValue;
        //投资需求摘要
        capitalInfoModel.InvestmentDemand = Tz888.Common.Utility.PageValidate.TxtToHtml(this.txtDemand.Value.Trim());

        //添加所属区域

        //capitalInfoModel.SCountryID = this.ZoneSelectControl1.CountryID;
        //capitalInfoModel.SProvinceID = this.ZoneSelectControl1.ProvinceID;
        //capitalInfoModel.SCityID = this.ZoneSelectControl1.CityID;
        //capitalInfoModel.SCountyID = this.ZoneSelectControl1.CountyID;
        capitalInfoModel.SCountryID = "001";
        capitalInfoModel.SProvinceID = "001";
        capitalInfoModel.SCityID = "001";
        capitalInfoModel.SCountyID = "001";



        //项目承办单位
        capitalInfoModel.Prorganizers = "no";
        //文件上传的
        infoResourceModels = FilesUploadControl1.InfoList;


        #endregion


        //这里是其他的实体值
        if (!string.IsNullOrEmpty(this.txtCapitalName.Text.Trim()))
            mainInfoModel.Title = Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtCapitalName.Text.Trim());

        string CountryCode;
        try
        {
            CountryCode = capitalInfoAreaModels[0].CountryCode;
        }
        catch
        {
            CountryCode = "ALL";
        }
        mainInfoModel.InfoCode = Tz888.BLL.Info.Common.CreateInfoCode("Capital", capitalInfoModel.IndustryBID.Split(',')[0], CountryCode, time_now);
        mainInfoModel.publishT = time_now;
        mainInfoModel.Hit = 0;

        mainInfoModel.IsCore = true;
        //mainInfoModel.LoginName = "cxj";

        mainInfoModel.LoginName = fz_LoginName; //用户名称
        mainInfoModel.InfoOriginRoleName = "0"; //用户角色
        mainInfoModel.GradeID = "0";
        mainInfoModel.FixPriceID = "1";
        mainInfoModel.FeeStatus = 0;

        string keyword = "";
        if (!string.IsNullOrEmpty(this.txtKeyword1.Text.Trim()))
            keyword += Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtKeyword1.Text.Trim()) + ",";
        if (!string.IsNullOrEmpty(this.txtKeyword2.Text.Trim()))
            keyword += Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtKeyword2.Text.Trim()) + ",";
        if (!string.IsNullOrEmpty(this.txtKeyword3.Text.Trim()))
            keyword += Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtKeyword3.Text.Trim()) + ",";

        mainInfoModel.KeyWord = keyword;
        mainInfoModel.Descript = "";
        if (!string.IsNullOrEmpty(this.txtCapitalName.Text.Trim()))
            mainInfoModel.DisplayTitle = Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtCapitalName.Text.Trim());
        mainInfoModel.FrontDisplayTime = time_now;
        mainInfoModel.ValidateStartTime = time_now;
        //意向有效期限
        //20100623
        mainInfoModel.ValidateTerm = Convert.ToInt32(this.rdlValiditeTerm.SelectedValue.Trim());

        mainInfoModel.TemplateID = "001";
        mainInfoModel.HtmlFile = "";

        shortInfoModel.ShortInfoControlID = "CapitalIndex1";
        if (!string.IsNullOrEmpty(this.txtCapitalName.Text.Trim()))
            shortInfoModel.ShortTitle = Tz888.Common.Utility.PageValidate.FiltrateHTMLTag(this.txtCapitalName.Text.Trim());
        shortInfoModel.ShortContent = "";
        shortInfoModel.Remark = "";

        Tz888.BLL.Info.V124.CapitalInfoBLL bll = new Tz888.BLL.Info.V124.CapitalInfoBLL();

        //这里是插入资源投资信息
        //long infoID = bll.Insert(mainInfoModel, capitalInfoModel, this.GetInfoContact(), shortInfoModel, capitalInfoAreaModels, null, infoResourceModels);
        long infoID = bll.Insert(mainInfoModel, capitalInfoModel, infoContactModel , shortInfoModel, capitalInfoAreaModels, infoResourceModels);
        //以下进行图片的插入


        if (infoID > 0)
        {
           // bool isTof = Page.User.IsInRole("GT1002");
            //if (isTof)
           // {
                string HtmlFile = Tz888.BLL.Info.Common.createStaticPageFileName("Capital", mainInfoModel.InfoCode, infoID);
                Tz888.BLL.Info.MainInfoBLL mainBll = new Tz888.BLL.Info.MainInfoBLL();
                Page.Response.Write(infoID.ToString() + HtmlFile.ToString());
                mainBll.HasHtmlFile(infoID, HtmlFile);
                string actionMsg = "";
                Tz888.BLL.PageStatic.CapitalPageStatic staticobj = new Tz888.BLL.PageStatic.CapitalPageStatic();
                staticobj.CreateStaticPageCapital(infoID.ToString(), ref actionMsg);
           // }
            // Response.Redirect("publishCapital_step2.aspx?code=" + Tz888.Common.DEncrypt.DESEncrypt.Encrypt(infoID.ToString() + "|Capital|" + this.txtCapitalName.Text.Trim() + "|" + txtGovName.Text.Trim()));
            Response.Redirect("publishCapital_step2.aspx?code=" + Tz888.Common.DEncrypt.DESEncrypt.Encrypt(infoID.ToString() + "|Capital|" + this.txtCapitalName.Text.Trim() + "|" + "no"));
        }
        else
        {
            Tz888.Common.MessageBox.Show(this.Page, "发布失败！");
        }
    }
}
