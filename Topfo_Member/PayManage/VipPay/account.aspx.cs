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

public partial class PayManage_VipPay_account : System.Web.UI.Page
{
    public string par;
    public string orderNo;
    Tz888.BLL.GetDataList bll = new Tz888.BLL.GetDataList();
    public int status;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["order_no"] != null)
        {
            //解密订单号
            par = Request.QueryString["order_no"].Replace(" ", "+");
            orderNo = tzWeb.pay.comm.JieMi(par);
        }

        if (!IsPostBack)
        {
            string strLoginName = Page.User.Identity.Name;

            DataTable dtPoint = bll.GetList("OrderTab", "TotalCount,DisCount", "OrderNo", 1, 1, 0, 1, "OrderNO=" + orderNo);
            if (dtPoint.Rows.Count > 0)
            {
                double payPoint = Convert.ToDouble(dtPoint.Rows[0]["TotalCount"]);//资源价格
                double dispayPoint = Convert.ToDouble(dtPoint.Rows[0]["DisCount"]);//实际需要支付(需要扣除的金额)
                if (strLoginName != "")//tzWeb.LoginInfo.GetUserIsLogin(0)
                {
                    //用户余额
                    double UserPoint = Convert.ToDouble(tzWeb.pay.comm.getUserPoint(strLoginName));
                    string TransAmt = String.Format("{0:N}", dispayPoint);
                    lblorderby_no.Text = TransAmt;//应付金额

                    lblorder_no.Text = TransAmt;//应付金额

                    lblUser_no.Text = String.Format("{0:N}", UserPoint);//用户余额

                }

            }
            else
            {
                Response.Write("<script>alert('出现异常请稍后再试!');window.location.href='VipManage.aspx';</script>");
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        string ValliDate = Request.QueryString["Validate"].ToString().Trim();
        string vadate = Request.QueryString["vadate"].ToString().Trim();
        if (ValliDate != "")
        {
            string strLoginName = Page.User.Identity.Name;
            string strPassword = txtPwd.Value.Trim();
            //判断支付密码
            Tz888.BLL.PayPwd payDll = new Tz888.BLL.PayPwd();
            Tz888.BLL.Pay paypwdDll = new Tz888.BLL.Pay();
            if (tzWeb.pay.comm.isSetPwd(strLoginName))//设置了支付密码 则使用支付验证
            {
                DataTable dtpaypwd = payDll.valiPayPwd(strLoginName, txtPwd.Value.Trim());
                if (dtpaypwd.Rows.Count > 0)//支付密码正确
                {
                    Tz888.BLL.Pay1.PayOrder bll = new Tz888.BLL.Pay1.PayOrder();
                    bool b = bll.VipaccountPaySuccess(orderNo, strLoginName, lblorderby_no.Text.ToString().Trim(), lblUser_no.Text.ToString().Trim(), ValliDate, vadate.ToString().Trim());
                    if (b)
                    {
                        Response.Write("<script>alert('结算成功!');window.location.href='../../Pay/UserMoney.aspx?Money=" + lblorder_no.Text.ToString().Trim() + "&order_no=" + orderNo + "';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('支付失败！');</script>");
                    }
                }
                else
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('密码不正确点击确认找回密码！');location.href='../getPayPwd.aspx'", true);
                    return;
                }
            }
            else//按照登录密码验证
            {
                //判断登录密码
                DataTable dtLoginPwd = payDll.valiLoginPwd(strLoginName, txtPwd.Value.Trim());
                if (dtLoginPwd.Rows.Count > 0)
                {

                    Tz888.BLL.Pay1.PayOrder bll = new Tz888.BLL.Pay1.PayOrder();
                    bool b = bll.VipaccountPaySuccess(orderNo, strLoginName, lblorderby_no.Text.ToString().Trim(), lblUser_no.Text.ToString().Trim(), ValliDate, vadate.ToString().Trim());
                    if (b)
                    {
                        Response.Write("<script>alert('结算成功!');window.location.href='../../Pay/UserMoney.aspx?Money=" + lblorder_no.Text.ToString().Trim() + "&order_no=" + orderNo + "';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('支付失败！');</script>");
                    }

                }
                else
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('密码错误!您没有设置支付密码,默认为登录密码！')", true);
                    return;
                }
            }
        }
        else
        {
            Response.Write("<script>alert('出现异常请稍后再试!');window.location.href='VipManage.aspx';</script>");
        }


    }
}

