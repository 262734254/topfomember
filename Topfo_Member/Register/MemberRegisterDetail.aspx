<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberRegisterDetail.aspx.cs" 
    MasterPageFile="~/MasterPage.master" Inherits="Register_MemberRegisterDetail" %>

<%@ Register Src="Control/FileUploader.ascx" TagName="FileUploader" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<!--融资发布 --><link href="../css/memberdata.css" rel="stylesheet" type="text/css" />
    <div class="mainconbox">
        <div class="titled">
            <div class="left">
                修改联系信息
            </div>
            <div class="clear">
            </div>
        </div>
        <!-- -->
        <div class="suggestbox allxian lightc">
            您的联系信息是对口合作方非常关注的，填写的内容务必真实、详细，否则可能失去合作方对您的信任！<br />
            <a href="#"></a>
            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank">预览您的会员资料</asp:HyperLink></div>
        <div class="blank20">
        </div>
        <!--联系方式 -->
        <table border="1" cellpadding="0" cellspacing="0" class="tabbiank">
            <tr>
                <td width="124" align="right" bgcolor="#F7F7F7">
                    <strong>用户名：</strong></td>
                <td >
                    <span class="chengcu">
                        <asp:Label ID="lbLoginName" runat="server" Text="uren812131125 "></asp:Label></span><span
                            class="hui"></span></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7">
                    <strong>会员类型：</strong></td>
                <td >
                    <span class="chengcu">
                        <asp:Label ID="lbManageType" runat="server"></asp:Label></span> <span class="hui"></span></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7">
                    <span class="hong">*</span> <strong>需求意向：</strong></td>
              <td ><asp:CheckBoxList ID="ChkLstRequirInfo" runat="server" RepeatColumns="6" RepeatDirection="Horizontal">
                <asp:ListItem Value="1001">政府招商</asp:ListItem>
                <asp:ListItem Value="1004">产业招商</asp:ListItem>
                <asp:ListItem Value="1002">项目融资</asp:ListItem>
                <asp:ListItem Value="1003">项目投资</asp:ListItem>
                <asp:ListItem Value="1005">创业合作</asp:ListItem>
                <asp:ListItem Value="1006">产品供求</asp:ListItem>
              </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td align="right" valign="top" bgcolor="#F7F7F7">
                   <strong>昵 称：</strong></td>
                <td valign="bottom" >
                    <div class="namefill" >
                        <asp:Label ID="lbNickName" runat="server" ></asp:Label>   
                             <span class="hui">昵称不可修改</span>  
                         
        </div>
                           <div id="lbName"><br /></div>                  
                    <div class="namepic">
                        <uc1:FileUploader ID="FileUploader1" runat="server" Visible="true" IsCancel="0"  ImgHeight="220" ImgWidth="160" />
                      </div>
                           <div class="blank0"> </div> 
					    [上传图片： (大小:220*160px;类型:.jpg|.gif|.png) ]
                     </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7">
                    <strong>真实姓名：</strong></td>
                <td >
                    <asp:TextBox ID="txtMemberName" runat="server" Width="176px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7">
                    <strong>性 别：</strong></td>
                <td >
                    <asp:RadioButtonList ID="rblSex" runat="server" Height="8px" RepeatDirection="Horizontal"
                        Width="136px">
                        <asp:ListItem Selected="True" Value="False">男</asp:ListItem>
                        <asp:ListItem Value="True">女</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7">
                    <strong>工作单位</strong></td>
                <td valign="top" >
                    <asp:TextBox ID="txtOrganizationName" runat="server" Width="324px"></asp:TextBox>   
                    <asp:Label ID="Label2" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7" >
                    <strong>您的职位</strong></td>
                <td valign="top" >
                    <asp:TextBox ID="tbCareer" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" valign="top" bgcolor="#F7F7F7" style="height: 44px">
                    <strong>
                        <asp:Label ID="Label1" runat="server"></asp:Label></strong></td>
                <td valign="top" style="height: 44px" >
                    http://<asp:TextBox ID="txtWebSite" runat="server" size="18" Width="229px"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server"></asp:Label> <br />
                    </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7">
                    <span class="hong">*</span> <strong>固定电话：</strong></td>
                <td valign="top" >
                    <ul>
                        <li class="liwai" style="width: 66px;">国家</li><li style="width: 70px;">城市区号</li><li>电话号码</li></ul>
                    <br />
                    <asp:TextBox ID="txtTelCountry" runat="server" size="4">+86</asp:TextBox>
                    <asp:TextBox ID="txtTelZoneCode" runat="server" size="7"></asp:TextBox>
                    <asp:TextBox ID="txtTelNumber" runat="server" size="18"></asp:TextBox>
                    <span class="hui">如果要输入多个号码，请使用&quot;,&quot;分隔；分机号码用&quot;－&quot;分隔</span>&nbsp;<br />
                        </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7" >
                    <strong>手 机：</strong></td>
                <td style="width: 638px; height: 33px;">
                    <asp:TextBox ID="txtMobile" runat="server" Width="169px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7" style="height: 52px">
                    <strong>传 真：</strong></td>
                <td valign="top" style="width: 638px; height: 52px">
                    <ul>
                        <li class="liwai" style="width: 66px;">国家</li><li style="width: 70px;">城市区号</li><li>电话号码</li></ul>
                    <br />
                    <asp:TextBox ID="txtFaxCountry" runat="server" size="4">+86</asp:TextBox>
                    <asp:TextBox ID="txtFaxZoneCode" runat="server" size="7"></asp:TextBox>
                    <asp:TextBox ID="txtFaxNumber" runat="server" size="18"></asp:TextBox>
                    <span class="hui">如果要输入多个号码，请使用&quot;,&quot;分隔；分机号码用&quot;－&quot;分隔
                        </span></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7" >
                    <strong>联系地址：</strong></td>
                <td >
                    <asp:TextBox ID="txtAddress" runat="server" size="18" Width="269px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F7F7F7" >
                    <strong>邮 编：</strong></td>
                <td >
                    <asp:TextBox ID="txtPostCode" runat="server" size="18" Width="115px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td align="right" valign="top" bgcolor="#F7F7F7">
                    <span class="hong">*</span> <strong>电子邮箱：</strong></td>
              <td >
                    <asp:TextBox ID="txtEmail" runat="server" size="18" Width="185px"></asp:TextBox>
                  &nbsp;
                    <br />
                  <span class="hui">请填写您最常用的电子邮箱。如果您还没有，推荐您使用中国招商投资网的免费邮箱。</span></td>
            </tr>
        </table>
        <div class="blank0">
        </div>
        <div>
            &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="是否愿意接收本站邮件通知" /></div>
        <div class="mbbuttom">
            <img src="../images/Application/icon_yuan.gif" width="17" height="17" style="position:relative;top:3px;" />
            <asp:HyperLink ID="hlView" runat="server" Text="预览我的会员资料" Target="_blank"></asp:HyperLink><br />
            <p>
                &nbsp;<asp:Button ID="btnOk" runat="server" CausesValidation="False" Height="22"
                    Style="padding-top: 1px" Text="确  认" Width="50" OnClick="btnOk_Click" /><label>
                    </label>
            </p>
        </div>
    </div>

    <script type="text/javascript">	
		function GetName(name)
		{ 
		    AjaxMethod.GetMemberByLN(name,showMessage);	
		}
		function showMessage(res)
		{	
		 var ln = document.getElementById("lbName");	
		    if(res=="会员存在")
		    {
			    ln.innerHTML ="<font color='red'>对不起，此昵称己被使用</font>";	
		    }
		    else
		    {
		         ln.innerHTML ="<font color='red'>此昵称可使用</font>";
		    }	
		}
		
	function chkPost()
     {
        var objWebSite = document.getElementById("ctl00_ContentPlaceHolder1_txtWebSite").value;
		if(objWebSite !="")
		{
		    var filter =/^.*(.com|.cn|.com.cn|.org|.net)$/;	
            if (!filter.test(objWebSite))
             { 
                alert("网址填写不正确!");
			    document.getElementById("ctl00_ContentPlaceHolder1_txtWebSite").focus();
                return false;
             }
		}
		var objZoneCode = document.getElementById("ctl00_ContentPlaceHolder1_txtTelZoneCode").value;
		var objNumber = document.getElementById("ctl00_ContentPlaceHolder1_txtTelNumber").value;
		var objMobile = document.getElementById("ctl00_ContentPlaceHolder1_txtMobile").value;
		if(objMobile=="")
		{
		    if(objZoneCode =="" ||  objNumber=="")
		    {
		        alert("电话号码不能为空!");
		        document.getElementById("ctl00_ContentPlaceHolder1_txtTelNumber").focus();
			    return false;
		     }
		     else
		     {
    	        var patn = /^[0-9-\/]+$/;
    	        if(!patn.test(objNumber)) 
    	        {
    	            alert("电话号码填写不正确!");
			        document.getElementById("ctl00_ContentPlaceHolder1_txtTelNumber").focus();
			        return false;			    
    	        } 
    	     }	
    	}
		if(objMobile !="")
		{
		    if(!checkMobile(objMobile))
		    {
		    
		        alert("手机填写不正确!");
			    document.getElementById("ctl00_ContentPlaceHolder1_txtMobile").focus();
			    return false;
			}
		}
		
		var objPostCode= document.getElementById("ctl00_ContentPlaceHolder1_txtPostCode").value;
		if(objPostCode !="")
		 {
		   	var filter =/^\d{6}$/;
		   	if (!filter.test(objPostCode))
             { 
                alert("邮编填写不正确!");
			    document.getElementById("ctl00_ContentPlaceHolder1_txtPostCode").focus();
                return false;
             }
		 }
		var objMail = document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").value;
		if(obj =="")
		{
		    alert("邮箱不能为空!");
			document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").focus();
			return false;
		}
		else
		{
		  	var filter = '/^[_a-zA-Z0-9\-]+(\.[_a-zA-Z0-9\-]*)*@[a-zA-Z0-9\-]+([\.][a-zA-Z0-9\-]+)+$/';
            if (!filter.test(objMail))
             { 
                alert("邮箱填写不正确!");
			    document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").focus();
                return false;
             }
		 }		
	 }
		
	function checkMobile(strValue)
	{
	/*^13\d{5,9}$/ //130–139。至少5位，最多9位
/^153\d{4,8}$/ //联通153。至少4位，最多8位
/^159\d{4,8}$/ //移动159。至少4位，最多8位 */
        var mobile=strValue;
        var reg0 = /^13\d{5,9}$/;
        var reg1 = /^153\d{4,8}$/;
        var reg2 = /^159\d{4,8}$/;
        var reg3 = /^158\d{4,8}$/;
        var reg4 = /^157\d{4,8}$/;
        var reg5 = /^0\d{10,11}$/;
        var my = false;
        if (reg0.test(mobile))my=true;
        if (reg1.test(mobile))my=true;
        if (reg2.test(mobile))my=true;
        if (reg3.test(mobile))my=true;
        if (reg4.test(mobile))my=true;
        if (reg5.test(mobile))my=true;
              
        return my;	
	}	
    </script>
    
    

</asp:Content>
