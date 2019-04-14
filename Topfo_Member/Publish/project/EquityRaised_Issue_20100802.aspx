<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EquityRaised_Issue.aspx.cs" Inherits="Publish_project_EquityRaised_Issue" Title="Untitled Page" %>

<%@ Register Src="../../Controls/FilesUploadControl.ascx" TagName="FilesUploadControl"
    TagPrefix="uc4" %>
<%@ Register Src="../../Controls/ZoneSelectControl.ascx" TagName="ZoneSelectControl"
    TagPrefix="uc1" %>
<%@ Register Src="../../Controls/SelectIndustryControl.ascx" TagName="SelectIndustryControl"
    TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../../img/member.css" rel="stylesheet" type="text/css" />
    <link href="../../css/index_fhy.css" rel="stylesheet" type="text/css" />
    <link href="../../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../../css/right_fhy.css" rel="stylesheet" type="text/css" />
    
    
<script language="javascript" type="text/javascript">
   
   //显示层
   function DispLayer()
   {
        document.getElementById("imgLoding").style.display="";
   }
   
   function ValidErr()
   {
        document.getElementById("step1").style.display="none";
        document.getElementById("step2").style.display="block";
        alert('验证码错误,请重新输入！');
        document.getElementById("ctl00_ContentPlaceHolder1_ImageCode").focus();
        document.getElementById("ctl00_ContentPlaceHolder1_ImageCode").select();
   }
   
   
   function ChangeValidCode(id)
    {
           document.getElementById(id).src = "../../ValidateNumber.aspx?r="+Math.random();
    }
        
   function disp(iType)
    {
        if(iType=="1")
        {
            window.document.getElementById("step1").style.display="none";
            window.document.getElementById("step2").style.display="block";
        }
        if(iType=="2")
        {
            window.document.getElementById("step1").style.display="block";
            window.document.getElementById("step2").style.display="none";
        }
    }
    
    function chkpost()
   {   
            var c="ctl00_ContentPlaceHolder1_";
            var kj="";
            var zt="";
            var obj="";
            
            //标题
            var ProjectName="ctl00_ContentPlaceHolder1_txtProjectName";
            if(trim(document.getElementById(ProjectName).value)=="")
            {
                alert("项目标题不能为空...");
                document.getElementById(ProjectName).focus();
                return false;
            }
            
            //行业
            if(document.getElementById(c+"SelectIndustryControl1_hdselectValue").value=="")
            {
                alert("请选择行业...");
                document.getElementById(c+"SelectIndustryControl1_sltIndustryName_all").focus();
                return false;
            }
            
            //区域
            if(document.getElementById("CountryListCN").value=="CN")
            {
                if(document.getElementById(c+"ZoneSelectControl1_hideProvince").value=="")
                { 
                    alert("请选择省份...");
                    document.getElementById("provinceCN").focus();
                    return false;
                }
                if(document.getElementById(c+"ZoneSelectControl1_hideCapitalCity").value=="")
                {
                    alert("请选择城市...");
                    document.getElementById("capitalCN").focus();
                    return false;
                }
            }
            
               //项目立项情况 cblXmlxqk
            if(!ChkCbl("<%=this.cblXmlxqk.ClientID %>","项目立项情况"))
            {
                return ;
            }


            //项目投资总额 txtCapitalTotal
            var obj=document.getElementById(c+"txtCapitalTotal");
            if(trim(trim(obj.value))=="")
            {
                alert("项目投资总额不能为空，请检查！");
                obj.focus();
                obj.select();
                return ;
            }
            else 
            {
                if(isNaN(trim(obj.value)))
                {
                    alert("项目投资总额的值只能为数字，请检查!！");
                    obj.focus();
                    obj.select();
                    return ;
                }
            }
            
            
            
            //融资金额 rbtnCapital
            if(!ChkRbl("<%=this.rbtnCapital.ClientID %>","融资金额"))
            {
                return ;
            }
            
            //融资额占股份比重
            kj="ctl00_ContentPlaceHolder1_txtSellStockShare";
            zt="融资额占股份比重";
            if(!ChkData(kj,zt))
            {
                return ;
            }
            
            //融资对象cblTnObj
            if(!ChkCbl("<%=this.cblTnObj.ClientID %>","融资对象"))
            {
                return;
            }
            
            //退出方式 chkReturn
            if(!ChkCbl("<%=this.chkReturn.ClientID %>","退出方式"))
            {
                return ;
            }
            
            //企业发展阶段rblQyfzjd
            if(!ChkRbl("<%=this.rblQyfzjd.ClientID %>","企业发展阶段"))
            {
                return;
            }
            
            // 要求资金到位情况 rblYqzjdwqk
            if(!ChkRbl("<%=this.rblYqzjdwqk.ClientID %>","要求资金到位情况"))
            {
                return ;
            }
            
            //市场占有率(份额) tbSczylfy
            kj="ctl00_ContentPlaceHolder1_tbSczylfy";
            zt="市场占有率(份额)"
            if(!ChkData(kj,zt))
            {
                return ;
            }
            
            //行业市场增长率 tbYysczzl
            kj="ctl00_ContentPlaceHolder1_tbYysczzl";
            zt="行业市场增长率";
            if(!ChkData(kj,zt))
            {
                return ;
            }
            
            //资产负债率 tbZcfzl
            kj="ctl00_ContentPlaceHolder1_tbZcfzl";
            zt="资产负债率";
            if(!ChkData(kj,zt))
            {
                return ;
            }
            
            //暂不用
//            //项目投资回报周期 rblXmtzfbzq
//            if(!ChkRbl("<%=this.rblXmtzfbzq.ClientID %>","项目投资回报周期"))
//            {
//                return ;
//            }
            
            //项目有效期限 rblXmyxqxx
            if(!ChkRbl("<%=this.rblXmyxqxx.ClientID %>","项目有效期限"))
            {
                return ;
            }
            
            //项目摘要
            var ProIntro="ctl00_ContentPlaceHolder1_txtProIntro";
            obj=document.getElementById(ProIntro);
            if(!checkByteLength(obj.value,50,1200))
            {
                alert("填写项目摘要.建议600字以内（不少于50字）");
                document.getElementById(ProIntro).focus();
                document.getElementById(ProIntro).select();
                return ;
            }
            
            //项目详细描述
            kj="ctl00_ContentPlaceHolder1_txtXmqxms";
            obj=document.getElementById(kj);
            if(!checkByteLength(obj.value,50,1000))
            {
                alert("项目详细描述不得超过1000个汉字(不少于50字),请检查！");
                obj.focus();
                obj.select();
                return ;
            }
            
            
            
            //产品概述
            var displ="（字数请控制在30到1000字以内！）";
            kj="ctl00_ContentPlaceHolder1_txtProjectAbout";
            obj=document.getElementById(kj);
            if(!checkByteLength(obj.value,30,2000))
            {
                alert("产品概述不得超过1000个汉字，请检查！"+displ);
                obj.focus();
                obj.select();
                return ;
            }
            
            //市场前景
            kj="ctl00_ContentPlaceHolder1_txtMarketAbout";
            obj=document.getElementById(kj);
            if(!checkByteLength(obj.value,30,2000))
            {
                alert("市场前景不得超过1000个汉字，请检查！"+displ);
                obj.focus();
                obj.select();
                return ;
            }
            
            //竞争分析
            kj="ctl00_ContentPlaceHolder1_txtCompetitioAbout";
            obj=document.getElementById(kj);
            if(!checkByteLength(obj.value,30,2000))
            {
                alert("竞争分析不得超过1000个汉字，请检查！"+displ);
                obj.focus();
                obj.select();
                return ;
            }
            
            //商业模式
            kj="ctl00_ContentPlaceHolder1_txtBussinessModeAbout";
            obj=document.getElementById(kj);
            if(!checkByteLength(obj.value,30,2000))
            {
                alert("商业模式不得超过1000个汉字,请检查！"+displ);
                obj.focus();
                obj.select();
                return ;
            }
            
            //管理团队
            kj="ctl00_ContentPlaceHolder1_txtManageTeamAbout";
            obj=document.getElementById(kj);
            if(!checkByteLength(obj.value,30,2000))
            {
                alert("管理团队不得超过1000个汉字，请检查！"+displ);
                obj.focus();
                obj.select();
                return ;
            }
    
            //我已阅读不能为空
            if(!document.getElementById("chkReadMe").checked)
            {
                alert("请选择‘我已阅读《拓富·中国招商投资网服务协议》’。");
                document.getElementById("chkReadMe").focus();
                return false;
            }
            
            //第二步
            window.document.getElementById("step1").style.display="none";
            window.document.getElementById("step2").style.display="block";
            
            kj="ctl00_ContentPlaceHolder1_txtCompanyName";
            document.getElementById(kj).focus();
            
    }
    
    function disp(iType)
    {
        if(iType=="1")
        {
            window.document.getElementById("step1").style.display="none";
            window.document.getElementById("step2").style.display="block";
        }
        if(iType=="2")
        {
            window.document.getElementById("step1").style.display="block";
            window.document.getElementById("step2").style.display="none";
        }
    }
    
    
     //输入0到100之间的数值
    function ChkData(kjName,ztName)
    {
        var val=document.getElementById(kjName).value;
        if(val!="")
        {
            if(!isNaN(val))
            {
                if(val>100 || val<0)
                    {
                        alert("输入的数值应该在0到100之间，请检查！");
                        document.getElementById(kjName).focus();
                        document.getElementById(kjName).select();
                        return false;
                    }
                    else
                    {
                        return true;
                    }
            }
            else
            {
                alert(ztName+"只能为数值，且输入的范围应该在0到100之间！");
                document.getElementById(kjName).focus();
                document.getElementById(kjName).select();
                return false;
            }
        }
        else
        {
            alert(ztName+"不能空，且输入的范围应该在0到100之间，请检查！");
            document.getElementById(kjName).focus();
            document.getElementById(kjName).select();
            return false;
        }
    }
    
    
    
    
    
    //---------------------------公用，单选框的判断----------------------
    function ChkRbl(kjID,kjName)
    {
        var kjVal=kjID.replace(/_/g,"$");
        if(GetCheckNum(kjVal)<=0)
        {
            alert("请选择"+kjName);
            document.getElementById(kjID).focus();
            return false;
        }
        else 
        {
            return true;
        }
    }
    function GetCheckNum(checkobjectname)
    {
	    var truei2 = 0;
	    var checkobject = document.getElementsByName(checkobjectname);
    //	var checkobject = eval("document.all." + checkobjectname + "");
	    var inum = checkobject.length;
	    if (isNaN(inum))
	    {
		    inum = 0;
	    }
	    for(i=0;i<inum;i++){
		    if (checkobject[i].checked == 1){
			    truei2 = truei2 + 1;
		    }
	    }
	    return truei2;
    }
    //----------------------END-----------------------------------
   

    //-------------------公用 ，选择checkbox------------------------
    function ChkCbl(kjID,kjName)
    {
        if(GetCheckBoxListCheckNum(kjID)<=0)
        {
            alert("请选择"+kjName);
            document.getElementById(kjID).focus();
            return false;
        }
        else
        {
            return true;
        }
    }
    function GetCheckBoxListCheckNum(checkobjectid)
    {
        var selectedItemCount = 0;
        var liIndex = 0;
        var currentListItem = document.getElementById(checkobjectid + '_' + liIndex.toString());
        while (currentListItem != null)
        {
            if (currentListItem.checked) selectedItemCount++;
            liIndex++;
            currentListItem = document.getElementById(checkobjectid + '_' + liIndex.toString());
        }
        return selectedItemCount;
    }
    //-------------------------------END----------------------------------
    
    
    //判断多少个汉字,限制汉字
    function checkByteLength(str,minlen,maxlen) 
    {
	if (str == null) return false;
	var l = str.length;
	var blen = 0;
	for(i=0; i<l; i++) {
		if ((str.charCodeAt(i) & 0xff00) != 0) {
			blen ++;
		}
		blen ++;
	}
	if (blen > maxlen || blen < minlen) {
		return false;
	}
	return true;
    }
    
    
    
//////////////////////
//去除字符串两边空格的函数
//参数：mystr传入的字符串
//返回：字符串mystr
function trim(mystr){
while ((mystr.indexOf(" ")==0) && (mystr.length>1)){
mystr=mystr.substring(1,mystr.length);
}//去除前面空格
while ((mystr.lastIndexOf(" ")==mystr.length-1)&&(mystr.length>1)){
mystr=mystr.substring(0,mystr.length-1);
}//去除后面空格
if (mystr==" "){
mystr="";
}
return mystr;
}


//替换掉字符串空格
function repl(obj)
{
    if(obj.value.length>0)
    {
        obj.value=trim(obj.value);
    }
}
//////////////////////////
  
   </script>
   
   
   

<div id="step1" style="display:block;">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" style=" height:60px; text-align:center; line-height:20px; margin:15px 0;" class="f_14">
  <tr>
    <td width="130" class="strong">发布资源只需<span class="f_red">2</span>步：</td>
    <td width="125" style="background:url(../../img/member_bg1_on.gif) no-repeat;" class="f_red strong">第一步<br />
      填写项目信息</td>
    <td width="50"><img src="../../img/member_icon1.gif"  alt=""  /></td>
    <td width="125" style="background:url(../../img/member_bg1_off.gif) no-repeat;">第二步<br />
      确认联系方式</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:5px 10px; height: 30px;" class="f_14 strong">
      <asp:RadioButton ID="RadioButton1" GroupName="group1" Text="股权融资" Checked="true" runat="server" AutoPostBack="True" />
      <asp:RadioButton ID="RadioButton2" GroupName="group1" Text="债权融资" runat="server" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="True" />
      </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:5px 10px;" class="f_14"><span class="f_red strong">项目详细资料</span><span class="f_gray">（以下基本信息均为必填项）</span></td>
  </tr>
</table>
<table cellspacing="0" class="mem_tab1">
  <tr>
    <td width="145" class="tdbg"><span class="f_red">*</span> <strong>项目标题：</strong></td>
    <td><input id="txtProjectName" style="width: 286px" size="15" runat="server" maxlength="30"  onblur="repl(this);"/>
      <span class="f_gray">标题最好控制在30个字以内</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>所属行业：</strong></td>
    <td>
      <span class="f_gray">
          <uc2:SelectIndustryControl ID="SelectIndustryControl1" runat="server" />
          </span></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>所属区域：</strong></td>
    <td>
        <uc1:ZoneSelectControl ID="ZoneSelectControl1" runat="server" />
    </td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>项目立项情况：</strong></td>
    <td>
    <asp:CheckBoxList ID="cblXmlxqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:CheckBoxList><br />
    <span class="f_gray">说明：项目若缺乏所需批文、执照和证件，则对项目评价有较大影响。</span></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>项目投资总额：</strong></td>
    <td>
        <input id="txtCapitalTotal" type="text"  runat="server" maxlength="15"  width="75px"  onblur="repl(this);" onkeyup="value=value.replace(/[^\d]/g,'') "  />
                            万人民币<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="项目投资总额不能为空！" ControlToValidate="txtCapitalTotal" Display="Dynamic" Enabled="False"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtCapitalTotal"
            Display="Dynamic" ErrorMessage="请输入数字,保留两位小数！" ValidationExpression="^[1-9]+(.[0-9]{1,2})?" Enabled="False"></asp:RegularExpressionValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>融资金额：</strong></td>
    <td>
	<asp:RadioButtonList ID="rbtnCapital" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                            </asp:RadioButtonList> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rbtnCapital"
            Display="Dynamic" ErrorMessage="请选择融资金额！"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>融资额占股份比重</strong><strong>：</strong></td>
    <td>
        <input id="txtSellStockShare" type="text" runat="server"  width="75px"  onblur="repl(this);" />
                            %<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
        ControlToValidate="txtSellStockShare" Display="Dynamic" ErrorMessage="融资额占股份比重不能为空！"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSellStockShare"
            Display="Dynamic" ErrorMessage="融资额占股份比重的范围0到100，请输入！" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>融资对象：</strong></td>
    <td>
        <asp:CheckBoxList ID="cblTnObj" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
        </asp:CheckBoxList>
        </td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>退出方式：</strong></td>
    <td><asp:CheckBoxList ID="chkReturn" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:CheckBoxList>
        </td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>企业发展阶段：</strong></td>
    <td>
        <asp:RadioButtonList ID="rblQyfzjd" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rblQyfzjd"
            Display="Dynamic" ErrorMessage="请选择企业发展阶段！"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>要求资金到位情况：</strong></td>
    <td><asp:RadioButtonList ID="rblYqzjdwqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="rblYqzjdwqk"
            Display="Dynamic" ErrorMessage="请选择要求资金到位情况！"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>市场占有率(份额)：</strong></td>
    <td>
        <input id="tbSczylfy" type="text"    maxlength="5" runat="server" onblur="repl(this);"/>
	%<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbSczylfy"
            Display="Dynamic" ErrorMessage="市场占有率不能为空！"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tbSczylfy"
            Display="Dynamic" ErrorMessage="市场占有率的范围0到100，请输入！" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>行业市场增长率：</strong></td>
    <td>
        <input id="tbYysczzl" type="text" runat="server" maxlength="5"  onblur="repl(this);"/>
	%<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbYysczzl"
            Display="Dynamic" ErrorMessage="行业市场增长率不能为空！"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="tbYysczzl"
            Display="Dynamic" ErrorMessage="行业市场增长率的范围0到100，请输入！" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>资产负债率：</strong></td>
    <td style="line-height:18px;">
        <input id="tbZcfzl" type="text"  runat="server" maxlength="5"  onblur="repl(this);"/>
	%<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="tbZcfzl"
            Display="Dynamic" ErrorMessage="资产负债率不能为空！"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="tbZcfzl"
            Display="Dynamic" ErrorMessage="资产负债率的范围0到100，请输入！" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"> <strong>项目投资回报周期：</strong></td>
    <td>
        <asp:RadioButtonList ID="rblXmtzfbzq" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="rblXmtzfbzq"
            Display="Dynamic" ErrorMessage="请选择项目投资回报周期！" Enabled="False"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="tdbg"><span class="f_red">*</span> <strong>项目有效期限：</strong></td>
    <td>发布之日起
        <asp:RadioButtonList ID="rblXmyxqxx" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="rblXmyxqxx"
            Display="Dynamic" ErrorMessage="请选择项目有效期限！"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>项目摘要：</strong></td>
    <td><textarea id="txtProIntro" runat="server" cols="50" style="width: 558px; height: 153px" onblur="repl(this);" ></textarea><span
                                id="spProIntro"></span>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtProIntro"
            Display="Dynamic" ErrorMessage="项目摘要不能为空！"></asp:RequiredFieldValidator><br />
      <span class="f_gray">为吸引投资方的关注，请对项目重点内容进行简单、清晰的描述，建议600字以内（不少于50字）！</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>项目详细描述：</strong></td>
    <td><textarea id="txtXmqxms" runat="server" cols="50" style="width: 558px; height: 149px" onblur="repl(this);"></textarea>
        <br />
    <span class="f_gray">项目内容越详细越有利于投资方了解您项目的具体情况，请尽量详尽完善！建议1000字以内（不少于50字）！</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><strong>项目关键字：</strong></td>
    <td>
    <input id="Xmgjz1" type="text" size="12" runat="server" maxlength="10" />
    <input id="Xmgjz2" type="text" size="12" runat="server" maxlength="10" />
    <input id="Xmgjz3" type="text" size="12" runat="server" maxlength="10" />
    <span class="f_red"><a href="#">如何定义关键字？</a></span><br />
    <span class="f_gray">定义相关的关键字能让您的需求更容易被潜在合作方找到</span></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:25px 0 5px 0;">
  <tr>
    <td class="f_14"><span class="f_red strong">※ 项目详细资料</span><span class="f_gray">（完善的资料可以得到投资方更多信任，请完善以下信息！）</span></td>
  </tr>
</table>
<table cellspacing="0" class="mem_tab1">
  <tr>
    <td width="145" class="tdbg"><strong>单位年营业收入：</strong></td>
    <td><input id="tbDwlyysy" type="text" size="15" runat="server" onkeyup="value=value.replace(/[^\d]/g,'') " />
    万元(人民币)</td>
  </tr>
  <tr>
    <td class="tdbg"><strong>单位年净利润：</strong></td>
    <td><input id="tbDwljly" type="text" size="15" runat="server"  onkeyup="value=value.replace(/[^\d]/g,'') " />
    万元(人民币)</td>
  </tr>
  <tr>
    <td class="tdbg" style="height: 40px"><strong>单位总资产：</strong></td>
    <td style="height: 40px"><input id="tbDwzzc" type="text" size="15" runat="server"  onkeyup="value=value.replace(/[^\d]/g,'') " />
    万元(人民币)</td>
  </tr>
  <tr>
    <td class="tdbg"><strong>单位总负债：</strong></td>
    <td><input id="tbDwzfz" type="text" size="15" runat="server"  onkeyup="value=value.replace(/[^\d]/g,'') " />
    万元(人民币)</td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>产品概述：</strong></td>
    <td><textarea id="txtProjectAbout" style="width:80%" rows="5" cols="50" runat="server" onblur="repl(this);"></textarea>
      <br />
      <span class="f_gray">您主要提供哪些产品与服务，针对哪些客户进行服务，如何定价。建议1000字以内（不少于30字）！</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>市场前景：</strong></td>
    <td><textarea id="txtMarketAbout" cols="50"  rows="5" style="width:80%" runat="server" onblur="repl(this);"></textarea>
    <br />
    <span class="f_gray">当前市场法制环境、目标消费人群分析、市场总量多大，市场发展潜力多大。建议1000字以内（不少于30字）！</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>竞争分析：</strong></td>
    <td><textarea id="txtCompetitioAbout" cols="50" name="textarea2" rows="5" style="width:80%" runat="server" onblur="repl(this);"></textarea>
    <br />
    <span class="f_gray">竞争状况、你所能占领的市场份额、SWOT分析（优势、劣势、机会、威胁）。建议1000字以内（不少于30字）！</span> </td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>商业模式：</strong></td>
    <td><textarea id="txtBussinessModeAbout" cols="50" name="textarea2" rows="5" style="width:80%" runat="server" onblur="repl(this);"></textarea>
    <br />
    <span class="f_gray">您在市场、产品、销售、管理、收入来源以及盈利等方面以什么形式实现，您的核心竞争力是什么？ 如何保证核心竞争力？建议1000字以内（不少于30字）！</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><span class="f_red">*</span> <strong>管理团队：</strong></td>
    <td><textarea id="txtManageTeamAbout" cols="50"  rows="5" style="width:80%" runat="server" onblur="repl(this);"></textarea>
    <br />
    <span class="f_gray">团队架构、高管人员的从业经历等。建议1000字以内（不少于30字）！</span></td>
  </tr>
  <tr>
    <td valign="top" class="tdbg"><strong>项目资料附件：</strong></td>
    <td>
        <uc4:FilesUploadControl ID="FilesUploadControl1" runat="server" />
    </td>
       <span class="f_gray">
        您可以上传项目的相关文件，如营业执照、项目批文、证书等；</span>
  </tr>
</table>
<table width="100%" cellspacing="0" style="text-align:center;">
  <tr>
    <td style="height: 40px">
    <input type="checkbox" id="chkReadMe"  checked="checked" />
    我已阅读<span class="f_red"><a href="#">《拓富·中国招商投资网服务协议》</a></span></td>
  </tr>
  <tr>
    <td>
        <input id="btnNext"  type="button" value="下一步：确认联系方式" onclick="chkpost();" />
        </td>
  </tr>
</table>
</div>


<!--########### 第二步，确认联络方式 #########-->
<div id="step2" style="display: none;">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height: 60px;
            text-align: center; line-height: 20px; margin: 15px 0;" class="f_14">
            <tr>
                <td width="130" class="strong">
                    发布资源只需<span class="f_red">2</span>步：</td>
                <td width="125" style="background: url(../../img/member_bg1_off.gif) no-repeat;">
                    第一步<br />
                    填写项目信息</td>
                <td width="50">
                    <img src="../../img/member_icon1.gif" alt="" /></td>
                <td width="125" style="background: url(../../img/member_bg1_on.gif) no-repeat;" class="f_red strong">
                    第二步<br />
                    确认联系方式</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="f_14 f_red strong" style="padding: 5px 10px;">
                    联系方式确认</td>
            </tr>
        </table>
        <table cellspacing="0" class="mem_tab1">
            <tr>
                <td width="130" class="tdbg">
                    <span class="f_red">*</span> <strong>项目单位名称：</strong></td>
                <td>
                    <input id="txtCompanyName" class="show" type="text" style="width: 210px" runat="server" maxlength="30"  onblur="repl(this);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtCompanyName"
                        runat="server" ErrorMessage="项目单位名称不能为空！"  Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="tdbg">
                    <span class="f_red">*</span> <strong>联系人：</strong></td>
                <td>
                    <input id="txtLinkMan" class="show" type="text" style="width: 210px" runat="server" maxlength="16"  onblur="repl(this);"  />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtLinkMan"
                        runat="server" ErrorMessage="联系人不能为空！"  Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbg">
                    <strong>职位：</strong></td>
                <td>
                    <input id="txtCareer" class="show" type="text" style="width: 210px" runat="server" maxlength="12"   onblur="repl(this);" />
                </td>
            </tr>
            <tr>
                <td class="tdbg">
                    <span class="f_red">*</span> <strong>联系电话：</strong></td>
                <td>
                    固话
                    <input id="telArea1" type="text" size="3" value="+86" runat="server" />
                    <input id="txtTelStateCode" maxlength="4" type="text" size="5" runat="server" />
                    <input id="txtTel" type="text" maxlength="8" size="15" runat="server"  />
                    <input id="telFg" type="text" maxlength="5" size="5" runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTelStateCode"
                        ErrorMessage="区号输有误！" ValidationExpression='[0-9]{3,4}' Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTel"
                        ErrorMessage="电话号码有误！" ValidationExpression='[0-9]{7,8}' Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="telFg"
                        ErrorMessage="分机号码有误！" ValidationExpression='[0-9]{1,5}' Display="Dynamic"></asp:RegularExpressionValidator>
                    <br />
                    手机
                    <input id="txtMobile" class="show" maxlength="11" type="text" style="width: 210px"
                        runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtMobile"
                        ErrorMessage="手机号码格式有误" ValidationExpression="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"  Display="Dynamic"></asp:RegularExpressionValidator>
                    <span class="f_gray">（固定电话或手机至少填写一项）</span></td>
            </tr>
            <tr>
                <td class="tdbg">
                    <span class="f_red">*</span> <strong>电子邮箱：</strong></td>
                <td>
                    <input id="txtEmail" class="show" type="text" style="width: 210px" runat="server" maxlength="40"   onblur="repl(this);" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="E-mail格式有误！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="电子邮箱不能为空！" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdbg">
                    <strong>项目单位详细地址：</strong></td>
                <td>
                    <input id="txtAddress" type="text" value="" style="width: 210px" runat="server" maxlength="50"  onblur="repl(this);"  /></td>
            </tr>
            <tr>
                <td class="tdbg">
                    <strong>单位网址：</strong></td>
                <td>
                    <input id="txtWebSite" type="text" value="" style="width: 210px" runat="server" maxlength="40"   onblur="repl(this);" /><span class="f_gray">例如：http://www.topfo.com</span>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtWebSite"
            ErrorMessage="网址格式如：http://www.topfo,com，请检查!" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="tdbg">
                    <span class="f_red">*</span> <strong>验证码：</strong>
                </td>
                <td>
                    <label>
                        <asp:TextBox ID="ImageCode" runat="server" Width="120px"></asp:TextBox>
                        <img id="validimg" src="../../ValidateNumber.aspx" onclick="this.src='../../ValidateNumber.aspx?temp=' + (new Date())"
                            alt="" />
                        <a href="javascript:" onclick="ChangeValidCode('validimg');return false;">换一张图片</a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="验证码不能为空！" ControlToValidate="ImageCode"  Display="Dynamic"></asp:RequiredFieldValidator></label></td>
            </tr>
        </table>
        <table width="100%" cellspacing="0" style="height: 60px; text-align: center;">
            <tr>
                <td>
                    <input id="Button1" type="button" value="上一步(修改项目信息)" onclick="disp(2);" />
                    <asp:Button ID="btnIssueOK" runat="server" Text="确认发布"  OnClientClick="DispLayer();" OnClick="btnIssueOK_Click" />
                </td>
            </tr>
        </table>
    </div>
<!--###########  第二步结束  #########-->


 <div id="imgLoding" Style="position: absolute;
            display:none;
            background-color: #A9A9A9; 
            top: 0px; 
            bottom:0px;
            left: 0px; 
            width: 100%; 
            height: 100%; 
            filter: alpha(opacity=60);">
            <div class="content">
                <p>
                    数据正在提交,请稍候...</p>
                <img src="../../img/img-loading.gif" alt="Loading..." /></div>
        </div>   
        

</asp:Content>

