<%@ Page Language="C#" AutoEventWireup="true" CodeFile="p_upload_picture.aspx.cs"
    Inherits="Member_p_upload_picture" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>图片上传</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .megerror { 
        BORDER-RIGHT: #ffcc00 1px solid; 
        BORDER-TOP: #ffcc00 1px solid; 
        DISPLAY: none; 
        BACKGROUND: url(../images/t_ok.gif) #ffffcc no-repeat 5px 50%; 
        BORDER-LEFT: #ffcc00 1px solid; 
        COLOR: red; 
        BORDER-BOTTOM: #ffcc00 1px solid }
    .megerror span{
        padding:3px 4px 0 24px;
    }
	.msgok { 
	    BORDER-RIGHT: #0099ff 1px solid; 
	    BORDER-TOP: #0099ff 1px solid; 
	    DISPLAY: none; 
	    BACKGROUND: url(../images/r_nonce.gif) #e2f5ff no-repeat 5px 50%; 
	    BORDER-LEFT: #0099ff 1px solid; 
	    COLOR: #0033cc; 
	    BORDER-BOTTOM: #0099ff 1px solid }
	.msgok span{
        padding:3px 4px 0 24px;
    }
    </style>

    <script type="text/javascript" language="javascript">
	//document.domain = "tz888.cn";
	function check()
	{
	    var is = 0;
	    if(document.getElementById("txtImgDesc").value.length > 15){
	        document.getElementById("msg1").className = "megerror";
	        is = 1;
	    }else
	        document.getElementById("msg1").className = "";
	    if(document.getElementById("fileUpload").value == ""){
	        var str = "<span>没有选择图片！</span>";
	        document.getElementById("msg2").innerHTML = str;
	        document.getElementById("msg2").className = "megerror";
	        is = 1;
	    }
	    else{
	        document.getElementById("msg2").innerHTML = "<span>图片须为jpg或gif格式，大小不超过500k！</span>";
	        document.getElementById("msg2").className = "";
	    }    
	    if(is==1)
	        return false;
	}
	
	function showErrMsg(msg)
	{
	    var str = "<span>" + msg + "</span>";
	    document.getElementById("msg2").innerHTML = str;
	    document.getElementById("msg2").className = "megerror";
	}
	
	var parentIframe = "<%=this.ParentIframe %>";
	
	function resize()
	{
	    alert("1");
	    parent.document.all(parentIframe).style.height=document.body.scrollHeight; 
        parent.document.all(parentIframe).style.width=document.body.scrollWidth; 
    }
    
    window.onresize = resize;
    </script>

</head>
<body>
    <form id="form1" runat="server" onsubmit="return check();">
        <div>
            <table class="cshibiank" cellspacing="0" cellpadding="5" width="560" align="center"
                border="0">
                <tbody>
                    <tr>
                        <td align="right" width="104">
                            <p>
                                图片描述：</p>
                        </td>
                        <td width="434">
                            <input type="text" id="txtImgDesc" style="width: 272px" runat="server">
                            <div id="msg1" style="display: inline;">
                                <span>不超过15个汉字</span></div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            <input type="file" ID="fileUpload" runat="server" style="width: 341px; height: 20px"/></td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            <div id="msg2" style="display: inline;">
                                <span>图片须为jpg或gif格式，大小不超过500k。</span></div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            <p>
                                <label>
                                    <asp:CheckBox ID="cbxWaterPic" runat="server" Text="添加水印以防盗用" />&nbsp;</label>
                                <a class="lanlink" href="#">查看水印效果 </a>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            <label>
                                <asp:Button ID="btnUpload" runat="server" Text="上传" Width="58px" OnClick="btnUpload_Click" />
                                &nbsp;&nbsp; &nbsp;<input type="reset" value="重 置" style="width: 60px">
                            </label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
