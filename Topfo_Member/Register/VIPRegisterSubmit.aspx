<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VIPRegisterSubmit.aspx.cs"
    Inherits="Register_VIPRegisterSubmit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>拓富通申请</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/application.css" rel="stylesheet" type="text/css" />
	
</head>
<body>
    <form runat="server">
        <div id="header">
           
        </div>
        <div class="headerhr">
        </div>
        <div class="blank20">
        </div>
        <div class="processbox">

	  <h1>
                <img src="../images/Application/zi_01.gif" alt="拓富通会员申请流程" /></h1> 
				<table width="872" height="143" border="0">
  <tr>
    <td><img src="../images/Application/li_10.gif" width="125" height="129" />
      </td>
	  <td><div class="liwai"></div></td>
    <td><img src="../images/Application/li_3.gif" /></td>
	 <td><div class="liwai"></div></td>
    <td><img src="../images/Application/li_50.gif" width="125" height="129" /></td>
	 <td><div class="liwai"></div></td>
    <td><img src="../images/Application/li_7.gif" /></td>
	 <td><div class="liwai"></div></td>
    <td><img src="../images/Application/li_9.gif" /></td>
  </tr>
</table>          
            <div class="clear ">
            </div>
            <div class="blank8 ">
            </div>
            <div class="payhtop">
            </div>
        </div>
        <div class="blank20">
        </div>
        <!-- -->
        <div class="paymain">
            <div class="pmains">
                <div class="left">
                    <div class="top">
                    </div>
                    <div class="con">
                        <p>
                            <img src="../images/Application/pay_zi01.gif" alt="恭喜您，您的资料已经提交成功！" />
                            <span>感谢您选择我们的拓富通服务！下一步，请选择适合您的付款方式</span>
                        </p>
                    </div>
                    <div class="di">
                        <h1>
                            <img src="../images/Application/icon_jt02.gif" width="14" height="15" />
                            拓富通会员<font class="hong">4</font>大优势：</h1>
                        <p>
                            优先排序：让您在60万注册会员中脱颖而出,让合作方第一时间找到您<br />
                            获得认证标志， 99％的用户愿意与通过身份认证的会员洽谈合作</p>
                        <span><a href="http://www.topfo.com/TopfoCenter/Application/superiorityApp.shtml" class="lanlink" target="_blank">&gt;&gt;点此了解更多</a></span></div>
                </div>
                <!-- -->
                <div class="right">
                    <div class="top">
                    </div>
                    <div class="title">
                        请确认以下信息是否正确！<img src="../images/Application/icon_jt03.gif" width="20" height="21" /></div>
                    <h1>
                        <asp:Label ID="lbOrgName" runat="server" ForeColor="#FF8000"></asp:Label>
                        <asp:Label ID="lbtbRealName" runat="server" ForeColor="#FF8000"></asp:Label><asp:Label
                            ID="lbSex" runat="server"></asp:Label></h1>
                    <p>
                        会员类型：拓富通会员<asp:Label ID="lbManageType" runat="server"></asp:Label><br />
                        申请期限：<asp:Label ID="lbBuyTerm" runat="server"></asp:Label><br />
                        总金额：<asp:Label ID="lbPrice" runat="server"></asp:Label>元<br />
                        联系电话：<asp:Label ID="lbTel" runat="server"></asp:Label><br />
                        常用邮箱：<asp:Label ID="lbEmail" runat="server"></asp:Label></p>
                    <div class="dizi">
                        如果信息有误，
                        <img src="../images/icon_yb.gif" width="17" height="17" align="absmiddle" />
                        <asp:HyperLink ID="hlUpdate" runat="server">请点此修改</asp:HyperLink></div>
                    <div class="dibg">
                    </div>
                </div>
                <div class="clear ">
                </div>
            </div>
            <!-- -->
            <div class="pjtbox">
                <div class="anliu">
                    <img src="../images/Application/buttom_gx.gif" alt="感谢您选择我们的拓富通服务，请选择适合您的支付方式" /></div>
            </div>
            <div class="pmainxia">
                <img src="../images/icon_yb.gif" width="17" height="17" />
                <b>去网上在线银行付款</b><br />
                <p>
                    网上在线银行付款，还不是会员，请先&gt;&gt;<a href="#" class="lanlink">注册</a>会员。<br />
                    已经是会员，点此>><a href="#" class="lanlink">登陆</a></p>
                <img src="../images/icon_yb.gif" width="17" height="17" />
                <b>去银行付款</b><i><img src="../images/PayManage/biao_print.gif" />
                    <a href="javascript:window.print()">打印该页</a></i><br />
                <table width="100%" height="222" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="22" colspan="3" bgcolor="#EBEBEB">
                            &nbsp;<strong>对公帐号</strong></td>
                    </tr>
                    <tr>
                        <td width="155" height="64" align="center" valign="center">
                            [01]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/icbc.gif" width="98" border="0" /></td>
                        <td height="64">
                            &nbsp;银行名称：深圳市工行国贸支行<br />
                            &nbsp;公司名称：深圳市贤泽投资有限公司<br />
                            &nbsp;银行帐号：4000022819200018954</td>
                    </tr>
                    <tr>
                        <td height="69" align="center" valign="center">
                            [02]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="30" src="http://www.tz888.cn/images/ADBusinessImg/adimages/le.gif" width="100" /></td>
                        <td width="419" height="69">
                            &nbsp;银行名称：深圳市农行国贸支行<br />
                            &nbsp;公司名称：深圳市贤泽投资有限公司<br />
                            &nbsp;银行帐号：41008900040016258</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [03]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/cbb.gif" width="96" border="0" /></td>
                        <td height="60">
                            &nbsp;银行名称：深圳市建行城东支行<br />
                            &nbsp;公司名称：深圳市贤泽投资有限公司<br />
                            &nbsp;银行帐号：001010020002945</td>
                    </tr>
                    <tr>
                        <td height="22" colspan="3" bgcolor="#EBEBEB">
                            <strong>&nbsp;</strong><strong>个人帐户</strong></td>
                    </tr>
                    <tr>
                        <td width="155" align="center" valign="center" style="height: 61px">
                            [01]</td>
                        <td width="301" align="middle" valign="center" style="height: 61px">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/icbc.gif" width="98" border="0" /></td>
                        <td width="419" style="height: 61px">
                            &nbsp;银行名称：工商银行深圳分行国贸支行<br />
                            &nbsp;公司名称：深圳市明润广告有限公司<br />
                            &nbsp;银行帐号：4000022819200043364</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center" style="height: 48px">
                            [02]</td>
                        <td width="301" align="middle" valign="center" style="height: 48px">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/cmb.gif" width="96" border="0" /></td>
                        <td style="height: 48px">
                            &nbsp;银行名称：招商银行<br />
                            &nbsp;财务户名：张新亮<br />
                            &nbsp;银行帐号：5124257555525555</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [03]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="30" src="http://www.tz888.cn/images/ADBusinessImg/adimages/le.gif" width="100" /></td>
                        <td height="50">
                            &nbsp;银行名称：农业银行<br />
                            &nbsp;财务户名：张新亮<br />
                            &nbsp;银行帐号：6228480120057721116</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [04]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/icbc.gif" width="98" border="0" /></td>
                        <td height="50">
                            &nbsp;银行名称：工商银行<br />
                            &nbsp;财务户名：张新亮<br />
                            &nbsp;银行帐号：9558804000111681363</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [05]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/ibbank.gif" width="98"
                                border="0" /></td>
                        <td height="50">
                            &nbsp;银行名称：交通银行<br />
                            &nbsp;财务户名：张新亮<br />
                            &nbsp;银行帐号：40551266319272106</td>
                    </tr>
                </table>
                <img src="../images/icon_yb.gif" width="17" height="17" />
                <b>去邮局付款 </b><i>
                    <img src="../images/PayManage/biao_print.gif" />
                    <a href="javascript:window.print()">打印该页</a></i><br />
                <table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="155" align="center" valign="center">
                            [01]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="31" src="http://www.tz888.cn/images/ADbusinessImg/adimages/syouzhen.gif" width="89"
                                border="0" /></td>
                        <td width="419" height="50">
                            &nbsp;银行名称：邮政储蓄<br />
                            &nbsp;财务户名：张新亮<br />
                            &nbsp;银行帐号：6221885840003803934</td>
                    </tr>
                </table>
                <p>
                    <b>邮局汇款</b>
                    <br />
                    财务部：张新亮（收）<br />
                    通信地址：广东省深圳市人民南路国贸大厦29层东座<br />
                    邮政编码：518001</p>
                <img src="../images/Application/icon_yuan02.gif" width="16" height="16" align="absmiddle" />
                <strong class="chengcu">请仔细阅读以下注意事项！</strong><br />
                <p>
                    1.汇款后，请将汇款凭证传真到 <span class="chengcu">0755-82213689 </span>（网上银行支付客户请打印付款成功页面）<br />
                    2.款项到帐后，贵公司资料被送至第三方认证公司进行认证（认证周期：到帐后7个工作日内）；
                    <br />
                    3.认证审核后，我们将开通您的会员权限，并在3个工作日内寄出发票
                    <br />
                    4.开通之日起，中国招商投资网的客服专员将为您提供全程、专业的咨询服务。<br />
                    <span class="cheng">（请注意查收您的邮箱了解更多情况!）</span></p>
            </div>
            <div class="clear ">
            </div>
        </div>
        
		<div style="width:948px;margin:0 auto; text-align:center;margin-top:10px;"> 
		</div>
    </form>
</body>
</html>
