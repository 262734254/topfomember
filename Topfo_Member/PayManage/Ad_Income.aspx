﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" ResponseEncoding="GB2312"
    Title="我的资源的收入管理-拓富中心-中国招商投资网" AutoEventWireup="true" CodeFile="Ad_Income.aspx.cs"
    Inherits="PayManage_Ad_Income" %>

<%@ Register Src="../Controls/PayPageFoot.ascx" TagName="PayPageFoot" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/paymanage.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!--我的购物车 -->
    <div class="mainconbox">
        <div class="topzi">
            <div class="left">
                我的资源的收入管理</div>
            <div class="right" style="margin-bottom: 13px;">
                <img src="http://member.topfo.com/images/hand_1_2.gif" />
                <a href="http://www.topfo.com/help/resourceswap.shtml" target="_blank">交易完全教程</a></div>
            <div class="clear">
            </div>
        </div>
        <div class="suggestbox lightc allxian" style=" display:none;">
            <h1>
                温馨提示：</h1>
            <p>
                我们为您开通了多种支付渠道，无论金额大小皆可轻松支付！
                <br />
                如果您的账户余额充足，使用账户余额支付是最快捷的支付方式。您现在的账户余额为<asp:Literal ID="lblUserPoint" runat="server">0</asp:Literal>元。
                点此&gt;&gt;<a href="account_cz.aspx">立即充值</a><br />
                为降低您的交易风险，建议您优先选择<a href="http://www.topfo.com/TopfoCenter/Application/superiorityApp.shtml"
                    target="_blank">拓富通会员</a>发布的资源！<br />
            </p>
        </div>
        <div class="blank20">
        </div>
        <!--我的购物车 -->
        <div class="mycartbox">
            <div class="handtop">
                <%--<ul>
                    <li class="liwai">我的资源的收入管理</li>
                </ul>--%>
                <asp:Label ID="Lab_Count" runat="server"></asp:Label>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contenttemplate>
            <div class="con cshibiank">
                <div class="search">
                    <div class="lefts">
                        资源查询：
                        <select id="ddldiff" name="select" runat="server">
                            <option value="all" selected="selected">全部</option>
                            <option value="90">三个月以上</option>
                            <option value="30">最近一月</option>
                            <option value="3">最近三天</option>
                            <option value="7">最近一周</option>
                            <option value="14">最近两周</option>
                        </select>
                        <input id="Submit1" type="submit"  value="查询" name="button" runat="server" onserverclick="button_ServerClick" />
                    </div>
                    <div class="rights">
                        每页显示：<a href="#"><asp:LinkButton ID="PageSize10" runat="server" OnClick="PageSize10_Click">10</asp:LinkButton></a>条
                        <asp:LinkButton ID="PageSize20" runat="server" OnClick="PageSize20_Click">20</asp:LinkButton>
                        条 <a href="#">
                            <asp:LinkButton ID="PageSize30" runat="server" OnClick="PageSize30_Click">30</asp:LinkButton></a>
                        条</div>
                    <div class="clear">
                    </div>
                </div>
               <table width="100%" align="center" cellspacing="0" class="taba">
                    <tr class="tabtitle">
                        <td width="10%" align="center" class="tabtitle">
                            类别</td>
                        <td width="26%" align="left" class="tabtitle">
                            资源标题</td>
                        <td width="19%" align="center" class="tabtitle">
                            价格(元)</td>
                        <td width="15%" align="center" class="tabtitle">
                            发布时间</td>
                        <td width="10%" align="center" class="tabtitle">
                            购买次数</td>
                        <td width="18%" align="center" class="tabtitle">
                            信息总收益</td>
                    </tr>
                    <asp:Repeater runat="server" ID="myList">
                        <ItemTemplate>
                            <tr>
                                <td width="10%" height="25" align="center">
                                    <%#GetTypeName(Eval("InfoTypeID"))%>
                                </td>
                                <td width="26%">
                                   <a href='http://www.topfo.com/<%#Eval("HtmlFile")%>' target="_blank" title="<%#Eval("Title")%>">
                                        <%#GetStr(Eval("Title"),15)%>
                                    </a>
                                </td>
                                <td width="19%" align="center">
                                   <%#Eval("PointCount")%>
                                    元
                                </td>
                                <td width="15%" align="center">
                                    <%#Eval("ConsumeTime","{0:yyyy-MM-dd}")%>
                                </td>
                                <td width="10%" align="center">
                                    <%#Eval("infoCount")%>
                                </td>
                                <td width="18%" align="center">
                                   <%#Convert.ToInt32(Eval("PointCount"))*Convert.ToInt32(Eval("infoCount"))%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="tabb">
                               
                                <td width="10%" height="25" class="tabb" align=center>
                                     <%#GetTypeName(Eval("InfoTypeID"))%>
                                </td>
                                <td width="26%" class="tabb">
                                  <a href='http://www.topfo.com/<%#Eval("HtmlFile")%>' target="_blank" title="<%#Eval("Title")%>">
                                        <%#GetStr(Eval("Title"), 15)%>
                                    </a>
                                </td>
                                <td width="19%" align="center" class="tabb">
                                   <%#Eval("PointCount")%>
                                    元
                                </td>
                                <td width="15%" align="center" class="tabb">
                                    <%#Eval("ConsumeTime","{0:yyyy-MM-dd}")%>
                                </td>
                                <td width="10%" align="center" class="tabb">
                                    <%#Eval("infoCount")%>
                                </td>
                                <td width="18%" align="center" class="tabb">
                                   <%#Convert.ToInt32(Eval("PointCount"))*Convert.ToInt32(Eval("infoCount"))%></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
                <p>
                     共<asp:Literal ID="lblCount" runat="server" Text="0"></asp:Literal>条 页次：<asp:Literal
                        ID="lblCurrPage" runat="server" Text="0"></asp:Literal>/<asp:Literal ID="lblPageCount"
                            runat="server" Text="0"></asp:Literal>页
                    <asp:LinkButton ID="FirstPage" runat="server" OnClick="FirstPage_Click">首页</asp:LinkButton>
                    <asp:LinkButton ID="PerPage" runat="server" OnClick="PerPage_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="NextPage" runat="server" OnClick="NextPage_Click">下一页</asp:LinkButton>
                    <asp:LinkButton ID="LastPage" runat="server" OnClick="LastPage_Click">尾页</asp:LinkButton><span>转到
                        第<input name="textarea" type="text" id="txtPage" style="width: 36px; height: 15px;"
                            runat="server">
                        页</span>
                    <input type="button" name="button2" id="btnGo" value="GO" style="width: 30px; height: 20px;
                        font-size: 12px;" runat="server" onserverclick="btnGo_ServerClick" />
                </p>
            </div>
            </contenttemplate>
            </asp:UpdatePanel>
            <div class="buttom" style=" display:none;">>
                <input type="button" class="buttomal" onclick="window.open('http://search.topfo.com/SearchAllResult.aspx')"
                    value="继续寻找资源>>" />
            </div>
        </div>
    </div>
    <div class="blank20">
    </div>
    <!--帮助 -->
    <div class="mainconbox">
        <div class="helpbox">
            <div class="titleh">
                <img src="../images/PayManage/biao_print.gif" />
                <a href="javascript:;" onclick="window.print()">打印该页</a></div>
            <div class="con">
                <h1>
                    <img src="../images/icon_yb.gif" align="absmiddle" />
                    帮助</h1>
                <p>
                    · 如果您提交了订单，点击<a href="trade_info_wait.aspx">我的购物车</a>可以查看订单的明细情况；<br />
                    · 相关资源是指系统根据您选择的资源为您推荐的类似资源；<br />
                </p>
                <dir>
                    <img src="../images/PayManage/hand.gif" width="18" height="12" />
                    <a href="http://www.topfo.com/help/resourceswap.shtml" target="_blank">更多帮助</a></dir></div>
            <div class="bottomzi">
                <uc1:PayPageFoot ID="PayPageFoot1" runat="server" />
                &nbsp;</div>
        </div>
    </div>
</asp:Content>