﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SelAccessName.aspx.cs" Inherits="Access_SelAccessName" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="member-right">
    <div class="publication">
          <h1><span class="fl"><span class="f_14px strong f_cen">访问者的详细资料</span></span><span class="fr"><img src="http://img2.topfo.com/member/images/biao_01.gif" align="absMiddle"/> <a href="http://www.topfo.com/help/demandrelease.shtml#16" class="publica-fbxq">需求发布规则</a></span></h1>

        <table width="100%"  cellpadding="0" cellspacing="0"  class="publica">
         <tr>
        <td class="f_14px strong f_cen" colspan="2" >访问者资料</td>
        </tr>
            <tr>
                <td  class="publica-td-left" width="30%">
                   <strong>固定电话：</strong></td>
                <td>
                    
                    <asp:Label runat="server" ID="lblPhone"></asp:Label></td>
            </tr>
            <tr>
                <td class="publica-td-left" width="30%">
                    <span class="f_red"></span><strong>手机号码：</strong></td>
                <td>
                       <asp:Label runat="server" ID="lblMobile"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="publica-td-left" width="30%">
                    <span class="f_red"></span> <strong>电子邮箱：</strong></td>
                <td>
                    <asp:Label runat="server" ID="lblEmial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="publica-td-left" width="30%">
                    <strong>详细地址：</strong></td>
                <td>
                    <asp:Label runat="server" ID="lblAddress"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <a href="Access.aspx" class="btn-003">返回上一步</a>
                    </td>
                
            </tr>
            

</table>

    </div>
      </div>
</asp:Content>

