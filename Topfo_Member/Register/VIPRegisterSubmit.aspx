<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VIPRegisterSubmit.aspx.cs"
    Inherits="Register_VIPRegisterSubmit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ظ�ͨ����</title>
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
                <img src="../images/Application/zi_01.gif" alt="�ظ�ͨ��Ա��������" /></h1> 
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
                            <img src="../images/Application/pay_zi01.gif" alt="��ϲ�������������Ѿ��ύ�ɹ���" />
                            <span>��л��ѡ�����ǵ��ظ�ͨ������һ������ѡ���ʺ����ĸ��ʽ</span>
                        </p>
                    </div>
                    <div class="di">
                        <h1>
                            <img src="../images/Application/icon_jt02.gif" width="14" height="15" />
                            �ظ�ͨ��Ա<font class="hong">4</font>�����ƣ�</h1>
                        <p>
                            ��������������60��ע���Ա����ӱ����,�ú�������һʱ���ҵ���<br />
                            �����֤��־�� 99�����û�Ը����ͨ��������֤�Ļ�ԱǢ̸����</p>
                        <span><a href="http://www.topfo.com/TopfoCenter/Application/superiorityApp.shtml" class="lanlink" target="_blank">&gt;&gt;����˽����</a></span></div>
                </div>
                <!-- -->
                <div class="right">
                    <div class="top">
                    </div>
                    <div class="title">
                        ��ȷ��������Ϣ�Ƿ���ȷ��<img src="../images/Application/icon_jt03.gif" width="20" height="21" /></div>
                    <h1>
                        <asp:Label ID="lbOrgName" runat="server" ForeColor="#FF8000"></asp:Label>
                        <asp:Label ID="lbtbRealName" runat="server" ForeColor="#FF8000"></asp:Label><asp:Label
                            ID="lbSex" runat="server"></asp:Label></h1>
                    <p>
                        ��Ա���ͣ��ظ�ͨ��Ա<asp:Label ID="lbManageType" runat="server"></asp:Label><br />
                        �������ޣ�<asp:Label ID="lbBuyTerm" runat="server"></asp:Label><br />
                        �ܽ�<asp:Label ID="lbPrice" runat="server"></asp:Label>Ԫ<br />
                        ��ϵ�绰��<asp:Label ID="lbTel" runat="server"></asp:Label><br />
                        �������䣺<asp:Label ID="lbEmail" runat="server"></asp:Label></p>
                    <div class="dizi">
                        �����Ϣ����
                        <img src="../images/icon_yb.gif" width="17" height="17" align="absmiddle" />
                        <asp:HyperLink ID="hlUpdate" runat="server">�����޸�</asp:HyperLink></div>
                    <div class="dibg">
                    </div>
                </div>
                <div class="clear ">
                </div>
            </div>
            <!-- -->
            <div class="pjtbox">
                <div class="anliu">
                    <img src="../images/Application/buttom_gx.gif" alt="��л��ѡ�����ǵ��ظ�ͨ������ѡ���ʺ�����֧����ʽ" /></div>
            </div>
            <div class="pmainxia">
                <img src="../images/icon_yb.gif" width="17" height="17" />
                <b>ȥ�����������и���</b><br />
                <p>
                    �����������и�������ǻ�Ա������&gt;&gt;<a href="#" class="lanlink">ע��</a>��Ա��<br />
                    �Ѿ��ǻ�Ա�����>><a href="#" class="lanlink">��½</a></p>
                <img src="../images/icon_yb.gif" width="17" height="17" />
                <b>ȥ���и���</b><i><img src="../images/PayManage/biao_print.gif" />
                    <a href="javascript:window.print()">��ӡ��ҳ</a></i><br />
                <table width="100%" height="222" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="22" colspan="3" bgcolor="#EBEBEB">
                            &nbsp;<strong>�Թ��ʺ�</strong></td>
                    </tr>
                    <tr>
                        <td width="155" height="64" align="center" valign="center">
                            [01]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/icbc.gif" width="98" border="0" /></td>
                        <td height="64">
                            &nbsp;�������ƣ������й��й�ó֧��<br />
                            &nbsp;��˾���ƣ�����������Ͷ�����޹�˾<br />
                            &nbsp;�����ʺţ�4000022819200018954</td>
                    </tr>
                    <tr>
                        <td height="69" align="center" valign="center">
                            [02]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="30" src="http://www.tz888.cn/images/ADBusinessImg/adimages/le.gif" width="100" /></td>
                        <td width="419" height="69">
                            &nbsp;�������ƣ�������ũ�й�ó֧��<br />
                            &nbsp;��˾���ƣ�����������Ͷ�����޹�˾<br />
                            &nbsp;�����ʺţ�41008900040016258</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [03]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/cbb.gif" width="96" border="0" /></td>
                        <td height="60">
                            &nbsp;�������ƣ������н��гǶ�֧��<br />
                            &nbsp;��˾���ƣ�����������Ͷ�����޹�˾<br />
                            &nbsp;�����ʺţ�001010020002945</td>
                    </tr>
                    <tr>
                        <td height="22" colspan="3" bgcolor="#EBEBEB">
                            <strong>&nbsp;</strong><strong>�����ʻ�</strong></td>
                    </tr>
                    <tr>
                        <td width="155" align="center" valign="center" style="height: 61px">
                            [01]</td>
                        <td width="301" align="middle" valign="center" style="height: 61px">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/icbc.gif" width="98" border="0" /></td>
                        <td width="419" style="height: 61px">
                            &nbsp;�������ƣ������������ڷ��й�ó֧��<br />
                            &nbsp;��˾���ƣ����������������޹�˾<br />
                            &nbsp;�����ʺţ�4000022819200043364</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center" style="height: 48px">
                            [02]</td>
                        <td width="301" align="middle" valign="center" style="height: 48px">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/cmb.gif" width="96" border="0" /></td>
                        <td style="height: 48px">
                            &nbsp;�������ƣ���������<br />
                            &nbsp;��������������<br />
                            &nbsp;�����ʺţ�5124257555525555</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [03]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="30" src="http://www.tz888.cn/images/ADBusinessImg/adimages/le.gif" width="100" /></td>
                        <td height="50">
                            &nbsp;�������ƣ�ũҵ����<br />
                            &nbsp;��������������<br />
                            &nbsp;�����ʺţ�6228480120057721116</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [04]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/icbc.gif" width="98" border="0" /></td>
                        <td height="50">
                            &nbsp;�������ƣ���������<br />
                            &nbsp;��������������<br />
                            &nbsp;�����ʺţ�9558804000111681363</td>
                    </tr>
                    <tr>
                        <td align="center" valign="center">
                            [05]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="28" src="http://www.tz888.cn/images/ADBusinessImg/adimages/ibbank.gif" width="98"
                                border="0" /></td>
                        <td height="50">
                            &nbsp;�������ƣ���ͨ����<br />
                            &nbsp;��������������<br />
                            &nbsp;�����ʺţ�40551266319272106</td>
                    </tr>
                </table>
                <img src="../images/icon_yb.gif" width="17" height="17" />
                <b>ȥ�ʾָ��� </b><i>
                    <img src="../images/PayManage/biao_print.gif" />
                    <a href="javascript:window.print()">��ӡ��ҳ</a></i><br />
                <table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="155" align="center" valign="center">
                            [01]</td>
                        <td width="301" align="middle" valign="center">
                            <img height="31" src="http://www.tz888.cn/images/ADbusinessImg/adimages/syouzhen.gif" width="89"
                                border="0" /></td>
                        <td width="419" height="50">
                            &nbsp;�������ƣ���������<br />
                            &nbsp;��������������<br />
                            &nbsp;�����ʺţ�6221885840003803934</td>
                    </tr>
                </table>
                <p>
                    <b>�ʾֻ��</b>
                    <br />
                    ���񲿣����������գ�<br />
                    ͨ�ŵ�ַ���㶫ʡ������������·��ó����29�㶫��<br />
                    �������룺518001</p>
                <img src="../images/Application/icon_yuan02.gif" width="16" height="16" align="absmiddle" />
                <strong class="chengcu">����ϸ�Ķ�����ע�����</strong><br />
                <p>
                    1.�����뽫���ƾ֤���浽 <span class="chengcu">0755-82213689 </span>����������֧���ͻ����ӡ����ɹ�ҳ�棩<br />
                    2.����ʺ󣬹�˾���ϱ�������������֤��˾������֤����֤���ڣ����ʺ�7���������ڣ���
                    <br />
                    3.��֤��˺����ǽ���ͨ���Ļ�ԱȨ�ޣ�����3���������ڼĳ���Ʊ
                    <br />
                    4.��֮ͨ�����й�����Ͷ�����Ŀͷ�רԱ��Ϊ���ṩȫ�̡�רҵ����ѯ����<br />
                    <span class="cheng">����ע��������������˽�������!��</span></p>
            </div>
            <div class="clear ">
            </div>
        </div>
        
		<div style="width:948px;margin:0 auto; text-align:center;margin-top:10px;"> 
		</div>
    </form>
</body>
</html>