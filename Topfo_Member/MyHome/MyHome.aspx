﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="MyHome.aspx.cs" Inherits="MyHome_MyHome"  EnableEventValidation="false"  %>


<%@ Register Assembly="Tz888.Pager" Namespace="Tz888.Pager" TagPrefix="cc2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="Tz888.BLL" Namespace="OurControl" TagPrefix="cc1" %>
   
 <script type="text/jscript">
  function hidd(a,b){
   
      var  a=document.getElementById(a);
      var more_section=document.getElementById(b)
  
            if (a.style.display=="block"){
                a.style.display="none";
    more_section.innerText='添加主页信息';
    
            } else {
                a.style.display="block";
    more_section.innerText='隐藏主页信息';
            }
            }
        function yjhkk() {           
          var txtNumebr = document.getElementById("txtsorct").value;
		if(txtNumebr !="")
		{
		   var newPar=/^\d+$/ 
            if (!newPar.test(txtNumebr))
             { 
                alert("排序值只能为数字!");
			    document.getElementById("txtsorct").focus();
                return false;
             }
		}
             
         var objWebSite = document.getElementById("txtURL").value;
		if(objWebSite !="")
		{
		    var filter =/^.*(.com|.cn|.com.cn|.org|.net)$/;	
            if (!filter.test(objWebSite))
             { 
                alert("网址填写不正确!");
			    document.getElementById("txtURL").focus();
                return false;
             }
		}
            if (document.getElementById("txtURL").value = "") {
                alert('请输入您的网址！');
                document.getElementById("txtURL").focus();
                return false;
            }
            if (document.getElementById("txtName").value == "") {
                alert('请输入网站名称！');
                document.getElementById("txtName").focus();
                return false;
            }
            
              if (document.getElementById("txtDOC").value == "") {
                alert('请输入网站备注！');
                document.getElementById("txtDOC").focus();
                return false;
            }
              if (document.getElementById("txtsorct").value == "") {
                alert('请输入排序值！');
                document.getElementById("txtsorct").focus();
                return false;
            }
              if (document.getElementById("txtNumber").value == "") {
                alert('请输入网站帐号！');
                document.getElementById("txtNumber").focus();
                return false;
            }
              if (document.getElementById("txtPass").value == "") {
                alert('请输入网站密码！');
                document.getElementById("txtPass").focus();
                return false;
            }

        }
    </script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="border-left:1px #6f97b1 solid;border-right:1px #6f97b1 solid">
        <tr>
          <td align="center" bgcolor="#f6f6f6" style="height: 36px; width: 85px;"><strong>网站名称</strong></td>
          <td align="center" bgcolor="#f6f6f6" style="height: 36px; width: 149px;"><strong>地址</strong></td>
          <td width="50" align="center" bgcolor="#f6f6f6" style="height: 36px"><strong>类别</strong></td>
          <td width="132" align="center" bgcolor="#f6f6f6" style="height: 36px"><strong>状态</strong></td>
          <td width="100" align="center" bgcolor="#f6f6f6" style="height: 36px"><strong>创建时间</strong></td>
          <td width="80" align="center" bgcolor="#f6f6f6" style="height: 36px"><strong>排序</strong></td>
          <td width="100" align="center" bgcolor="#f6f6f6" style="height: 36px"><strong>操作</strong></td>
        </tr>
         <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
        <tr>
          <td align="center" bgcolor="#FFFFFF"><%#Eval("LName")%></td>
          <td height="30" align="left" bgcolor="#FFFFFF"><%#Eval("Linkwww")%></td>
        <td align="center" bgcolor="#FFFFFF"><%#ShowUserName(Eval("nid").ToString())%></td>
          <td align="center" bgcolor="#FFFFFF"><%#HomeState(Eval("States"))%></td>
          <td align="center" bgcolor="#FFFFFF"><%#Eval("CreateTimes","{0:yyyy-MM-dd}")%></td>
          <td align="center" bgcolor="#FFFFFF"><%# Eval("WSort") %>  </td>
           <td align="center" bgcolor="#FFFFFF">
           <asp:LinkButton ID="lbdel" CommandArgument='<%#Eval("LID")%>' CommandName="del"  runat="server" OnCommand="LinkButton1_Command" ToolTip="删除本条记录" OnClientClick="return confirm('确认删除此文件?');">删除</asp:LinkButton>
         <asp:LinkButton ID="lbDetail" runat="server" CommandArgument='<%# Eval("LID") %>' onclick="lkUpdate_Click">修改</asp:LinkButton>



           </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
      </table>
       <a href="ListExcel.aspx" target="_blank" style="color:Red">下载Excel文档格式信息</a>
    </div>
    
    <div id="sidebar-list-b" style="display:none;">

        网站类别：<asp:DropDownList ID="ddlType" runat="server"></asp:DropDownList><br />
        网站名称：<asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
        连接地址：<asp:TextBox ID="txtURL" runat="server" ></asp:TextBox><br />                 
        网站备注：<asp:TextBox ID="txtDOC" runat="server"></asp:TextBox><br />
        排    序：<asp:TextBox ID="txtsorct" runat="server"></asp:TextBox><br />
        网站帐号：<asp:TextBox ID="txtNumber" runat="server"></asp:TextBox><br />
        帐号密码：<asp:TextBox ID="txtPass" runat="server"></asp:TextBox><br />
        状 &nbsp;&nbsp; 态：&nbsp;&nbsp; 
        <asp:RadioButtonList ID="rdostate" runat="server"  RepeatDirection="Horizontal" Width="124px" >
            <asp:ListItem Selected="True">启用</asp:ListItem>
            <asp:ListItem >禁用</asp:ListItem>
        </asp:RadioButtonList>
        &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" OnClientClick="return yjhkk();" />&nbsp;
</div>
<div id="more_section"><span style="float:right;margin-right:10px;">
<a href="#"></a></span>
<a href="#" id="hidd" onclick="hidd('sidebar-list-b','hidd')">添加主页信息</a>
</div>

        <br />
        
    
        <cc2:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged" >
        </cc2:AspNetPager>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <br /> 

        <br />
        <br />
        <br /><div>   网站类别<asp:TextBox ID="txtType" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtTypeSort" runat="server" Width="20px"></asp:TextBox>
            排序<asp:Button ID="btnType" runat="server" OnClick="btnType_Click" Text="新建分类" /></div>
 <div>
     <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="border-left:1px #6f97b1 solid;border-right:1px #6f97b1 solid">
        <tr>
          <td align="center" bgcolor="#f6f6f6" style="height: 36px; width: 73px;"><strong>编号</strong></td>
          <td align="center" bgcolor="#f6f6f6" style="height: 36px; width: 73px;"><strong>分类名称</strong></td>
          <td align="center" bgcolor="#f6f6f6" style="height: 36px; width: 74px;"><strong>创建时间</strong></td>

          <td width="100" align="center" bgcolor="#f6f6f6" style="height: 36px"><strong>操作</strong></td>
        </tr>
         <asp:Repeater ID="Repeater2" runat="server">
        <ItemTemplate>
        
        <tr>
        <td align="center" bgcolor="#FFFFFF"><%# Eval("TID")%></td>
          <td align="center" bgcolor="#FFFFFF"><%# Eval("TypeName")%></td>
          <td align="center" bgcolor="#FFFFFF"><%#Eval("Datatimes","{0:yyyy-MM-dd}")%></td>
           <td align="center" bgcolor="#FFFFFF">
           <asp:LinkButton ID="lbdel" CommandArgument='<%#Eval("TID")%>' CommandName="del"  runat="server" OnCommand="LnkdelteType_Command" ToolTip="删除本条记录" OnClientClick="return confirm('确认删除此信息?');">删除</asp:LinkButton>
           <asp:LinkButton ID="lbUpdate" runat="server" CommandArgument='<%# Eval("TID") %>' onclick="lkUpdateType_Click">修改</asp:LinkButton>
           </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
        
      </table>
    </div><cc2:AspNetPager ID="AspNetPager2" runat="server" OnPageChanged="AspNetPager1_PageChanged" >
    </cc2:AspNetPager>
        
    </form>
</body>
</html>
