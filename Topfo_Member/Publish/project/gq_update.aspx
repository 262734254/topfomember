<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    ValidateRequest="false" EnableEventValidation="false" CodeFile="gq_update.aspx.cs"
    Inherits="Publish_project_gq_update" %>

<%@ Register Src="../../Controls/FilesUploadControl.ascx" TagName="FilesUploadControl"
    TagPrefix="uc4" %>
<%@ Register Src="../../Controls/UpFileControl.ascx" TagName="UpFileControl" TagPrefix="uc3" %>
<%@ Register Src="../../Controls/ZoneSelectControl.ascx" TagName="ZoneSelectControl"
    TagPrefix="uc1" %>
<%@ Register Src="../../Controls/SelectIndustryControl.ascx" TagName="SelectIndustryControl"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <link href="/css/stake.css" rel="stylesheet" type="text/css">
    <div id="right_box">
        <div class="mainconbox">
            <div class="titled">
                <div class="left">
                    �޸��������󡪡���Ȩ����
                </div>
                <div class="right">
                    <img src="/images/biao_01.gif" align="absMiddle">
                    <a href="http://www.topfo.com/help/demandrelease.shtml#16" target="_blank">���󷢲�����</a></div>
                <div class="clear">
                </div>
            </div>
            <div class="stepsbox">
                <div class="suggestbox lightc allxian">
                    <img src="/images/falaba.jpg" width="16" height="10">
                    �������Ͻ�������١���ƭ��������Ϣ�����ڴ���Ϣ���������κη��ɺ���ɷ��������ге���</div>
            </div>
            <div class="blank0">
            </div>
            <div>
                <strong>��Ŀ������Ϣ</strong>��ǰ����� <span class="hong">*</span> ��Ϊ������)</div>
            <table class="tabbiank" cellspacing="0" cellpadding="0" border="1">
                <tbody>
                    <tr>
                        <td style="height: 2px" align="right" width="124" bgcolor="#f7f7f7">
                            <span class="hong">* </span><strong>��Ŀ����</strong>��</td>
                        <td style="height: 2px" width="618">
                            <input id="txtProjectName" style="width: 286px" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <span class="hong">* </span><strong>������ҵ��</strong></td>
                        <td>
                            <uc2:SelectIndustryControl ID="SelectIndustryControl1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 5px" align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span> <strong>��������</strong></td>
                        <td style="height: 5px" width="618">
                            <uc1:ZoneSelectControl ID="ZoneSelectControl1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span> <strong>��Ŀ������</strong>
                            <br>
                        </td>
                        <td valign="top" width="618">
                            <textarea id="txtProIntro" runat="server" cols="50" rows="10" style="width: 558px;
                                height: 300px"></textarea><span id="spProIntro"></span>
                            <br>
                            <span class="hui">��������Ŀ���м򵥡������Ľ��ܣ�����400�����ڣ�������50�֣�������Ͷ���˺ܿ������жϡ� </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <strong><span class="hong">* </span>���ʶ���</strong></td>
                        <td class="nonepad" width="618">
                            <asp:RadioButtonList ID="rbtnObj" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span> <strong>��ĿͶ���ܶ</strong></td>
                        <td class="nonepad">
                            <asp:TextBox ID="txtCapitalTotal" runat="server" Width="75px">
                            </asp:TextBox>
                            �������
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span> <strong>���ʽ�</strong></td>
                        <td class="nonepad">
                            <asp:RadioButtonList ID="rbtnCapital" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                            </asp:RadioButtonList><br />
                            <span class="hui">���Ļ��ҵ�λΪ�����</span></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <strong><span class="hong">*</span>���ùɷݣ�</strong></td>
                        <td class="nonepad">
                            <asp:TextBox ID="txtSellStockShare" runat="server" Width="75px">
                            </asp:TextBox>%</td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <strong><span class="hong">*</span>�˳���ʽ��</strong></td>
                        <td class="nonepad">
                            <asp:CheckBoxList ID="chkReturn" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:CheckBoxList></td>
                    </tr>
                    <tr>
                        <td width="160" align="right" valign="top" bgcolor="#f7f7f7" style="height: 2px">
                            <b>��Ʒ����</b>��</td>
                        <td valign="top" width="594">
                            <textarea id="txtProjectAbout" style="width: 558px; height: 100px" name="textarea2"
                                rows="5" cols="50" runat="server"></textarea><br />
                            <span class="hui">����Ҫ�ṩ��Щ��Ʒ����������Щ�ͻ����з�����ζ��ۡ�</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <b>�г�ǰ����</b></td>
                        <td width="594">
                            <textarea id="txtMarketAbout" cols="50" name="textarea2" rows="5" style="width: 558px;
                                height: 100px" runat="server"></textarea>
                            <br />
                            <span class="hui">��ǰ�г����ƻ�����Ŀ��������Ⱥ�������г���������г���չǱ�����</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7" style="height: 5px">
                            <b>����������</b></td>
                        <td width="594">
                            <span id="SPAN2">
                                <textarea id="txtCompetitioAbout" cols="50" name="textarea2" rows="5" style="width: 558px;
                                    height: 100px" runat="server"></textarea><br />
                                <span class="hui">����״����������ռ����г��ݶSWOT���������ơ����ơ����ᡢ��в����</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <b>��ҵģʽ��</b>
                            <br>
                        </td>
                        <td width="594">
                            <span id="SPAN3">
                                <textarea id="txtBussinessModeAbout" cols="50" name="textarea2" rows="5" style="width: 558px;
                                    height: 100px" runat="server"></textarea><br />
                                <span class="hui">�����г�����Ʒ�����ۡ�������������Դ�Լ�ӯ���ȷ�����ʲô��ʽʵ�֣����ĺ��ľ�������ʲô�� ��α�֤���ľ������� </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <b>�����Ŷӣ�</b></td>
                        <td class="nonepad">
                            <textarea id="txtManageTeamAbout" cols="50" name="textarea2" rows="5" style="width: 558px;
                                height: 100px" runat="server"></textarea><br />
                            <span class="hui">�ŶӼܹ����߹���Ա�Ĵ�ҵ�����ȡ�</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7" style="height: 21px">
                            <strong>�ϴ�����:</strong></td>
                        <td bgcolor="#EFF6FF">
                            <uc4:FilesUploadControl id="FilesUploadControl1" runat="server" count="5" infotype="Project"
                                nonecount="3" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td align="right" valign="top" bgcolor="#F7F7F7">
                            <b>�ϴ�����:</b>
                        </td>
                        <td bgcolor="#FFFFFF">
                            <div class="fujian">
                                <uc3:UpFileControl ID="UpFileControl1" runat="server" />
                                &nbsp;</div>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="124" align="right" valign="top" bgcolor="#f7f7f7" style="height: 2px">
                            <span class="hong">*</span> ��Ŀ��λ���ƣ�</td>
                        <td valign="top" width="618">
                            <input id="txtCompanyName" class="show" type="text" value="" style="width: 210px"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" bgcolor="#f7f7f7">
                            <span class="hong">* </span>��ϵ��<b>��</b></td>
                        <td valign="top" width="618">
                            <input id="txtLinkMan" class="show" type="text" value="" style="width: 210px" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" bgcolor="#f7f7f7" style="height: 5px">
                            ְλ<b>��</b></td>
                        <td valign="top" width="618">
                            <input id="txtCareer" class="show" type="text" value="" style="width: 210px" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span>�̶��绰<b>��</b></td>
                        <td valign="top" width="618">
                            <input id="txtTelStateCode" runat="server" class="show" style="width: 40px">
                            <input id="txtTel" class="show" type="text" value="" style="width: 160px" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" bgcolor="#f7f7f7">
                            �ֻ���</td>
                        <td class="nonepad" valign="middle">
                            <input id="txtMobile" class="show" type="text" value="" style="width: 210px" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span>�������䣺</td>
                        <td class="nonepad" valign="middle">
                            <input id="txtEmail" class="show" type="text" value="" style="width: 210px" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" bgcolor="#f7f7f7">
                            ��Ŀ��λ��ϸ��ַ��</td>
                        <td class="nonepad" valign="middle">
                            <input id="txtAddress" type="text" value="" style="width: 210px" runat="server" /></td>
                    </tr>
                    <tr>
                        <td valign="top" align="right" bgcolor="#f7f7f7">
                            ��Ŀ��λ��ַ��</td>
                        <td class="nonepad" valign="middle">
                            <input id="txtWebSite" type="text" value="" style="width: 210px" runat="server" /></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#f7f7f7">
                            <span class="hong">*</span> <strong>��Ŀ��Ч���ޣ�</strong></td>
                        <td class="nonepad">
                            �Է���֮����
                            <asp:RadioButtonList ID="rbtnValiDate" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Value="3">������</asp:ListItem>
                                <asp:ListItem Value="6">������</asp:ListItem>
                                <asp:ListItem Value="12">һ����</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right" valign="top" bgcolor="#FFFFFF">
                            <div class="mbbuttom">
                                <asp:ImageButton ID="BtnOk" runat="server" ImageUrl="/images/button3.jpg" OnClick="BtnOk_Click" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script language="javascript">
       
        function chkpost()
        {
            
             var c="ctl00_ContentPlaceHolder1_";
            var ProjectName="<%=this.txtProjectName.ClientID %>";
            if(document.getElementById(ProjectName).value=="")
            {
                alert("��Ŀ���Ʋ���Ϊ��...");
                document.getElementById(ProjectName).focus();
                return false;
            }
            if(document.getElementById(c+"SelectIndustryControl1_hdselectValue").value=="")
            {
                alert("��ѡ����ҵ...");
                document.getElementById(c+"SelectIndustryControl1_sltIndustryName_all").focus();
                return false;
            }
            if(document.getElementById("CountryListCN").value=="CN")
            {
                if(document.getElementById(c+"ZoneSelectControl1_hideProvince").value=="")
                {
                    alert("��ѡ��ʡ��...");
                    document.getElementById("provinceCN").focus();
                    return false;
                }
                if(document.getElementById(c+"ZoneSelectControl1_hideCapitalCity").value=="")
                {
                    alert("��ѡ�����...");
                    document.getElementById("capitalCN").focus();
                    return false;
                }
            }
            var ProIntro="<%=this.txtProIntro.ClientID %>";
            if(document.getElementById(ProIntro).value.length<50)
            {
                alert("��д��Ŀ����.����400�����ڣ�������50�֣�");
                document.getElementById(ProIntro).focus();
                return false;
            }
            var CapitalTotal="<%=this.txtCapitalTotal.ClientID %>";
            if(document.getElementById(CapitalTotal).value=="")
            {
                  alert("����д��ĿͶ���ܶ�...");
                document.getElementById(CapitalTotal).focus();
                return false;
            }
            if(isNaN(document.getElementById(CapitalTotal).value))
            {
                alert("��ĿͶ���ܶ���д����...");
                document.getElementById(CapitalTotal).focus();
                return false;
            }
            var SellStockShare="<%=this.txtSellStockShare.ClientID %>";
             if(document.getElementById(SellStockShare).value=="")
            {
                alert("����д���ùɷ�(��д����)...");
                document.getElementById(SellStockShare).focus();
                return false;
            }
            if(isNaN(document.getElementById(SellStockShare).value))
            {
                alert("���ùɷ�����д����...");
                document.getElementById(SellStockShare).focus();
                return false;
            }
            if(parseInt(document.getElementById(SellStockShare).value)>100 )
            {
                alert("���ùɷݰٷֱ�ҪС��100%...");
                document.getElementById(SellStockShare).focus();
                return false;
            }
             var CompanyName="<%=this.txtCompanyName.ClientID %>";
   if(document.getElementById(CompanyName).value=="")
  {
    alert("��Ŀ��λ���Ʋ���Ϊ��...");
    document.getElementById(CompanyName).focus();
    return false;
  }
  var LinkMan="<%=this.txtLinkMan.ClientID %>";
  if(document.getElementById(LinkMan).value=="")
  {
    alert("��ϵ�˲���Ϊ��...");
    document.getElementById(LinkMan).focus();
    return false;
  }
  var TelStateCode="<%=this.txtTelStateCode.ClientID %>";
  var Tel="<%=this.txtTel.ClientID %>";
  var Mobile="<%=this.txtMobile.ClientID %>";
  if(document.getElementById(Tel).value==""&&document.getElementById(Mobile).value=="")
  {
         alert("�绰������ֻ���������дһ��...");
         document.getElementById(Tel).focus();
         return false;
  }
  if(document.getElementById(Tel).value!="")
  {
      if(isNaN(document.getElementById(Tel).value))
      {
             alert("�绰�����ʽ����");
             document.getElementById(Tel).focus();
             return false;
      }
      if(document.getElementById(TelStateCode).value=="")
      {
        alert("���Ų���Ϊ��...");
        document.getElementById(TelStateCode).focus();
        return false;
      }
      else
      {
           var filter = /^[0-9]+$/;
           if(!filter.test(document.getElementById(TelStateCode).value))
           {
             alert("���Ŵ���...");
             document.getElementById(TelStateCode).focus();
             return false;
           }
      }
  } 
  if(document.getElementById(Mobile).value!="")
  {
        if(isNaN(document.getElementById(Mobile).value)||document.getElementById(Mobile).value.length!=11)
        {
             alert("�ֻ�λ������ȷ...")
             document.getElementById(Mobile).focus();
              return false;
         }
  }
  var Email="<%=this.txtEmail.ClientID %>";
  if(document.getElementById(Email).value=="")
  {
         alert("�����ʼ�����Ϊ��...");
    	  document.getElementById(Email).focus();
	      return false;
  }
  if(document.getElementById(Email).value!="")
  {
                var obj = document.getElementById(Email);
    	        var str = obj.value;
    	        var filter = /^[_a-zA-Z0-9\-]+(\.[_a-zA-Z0-9\-]*)*@[a-zA-Z0-9\-]+([\.][a-zA-Z0-9\-]+)+$/;
    	        if(str !=0 &&!filter.test(str))
    	        {
    	            alert("�����ʼ���ʽ����...");
    	            document.getElementById(Email).focus();
	                return false;
    	        }
   }
}
    </script>

</asp:Content>