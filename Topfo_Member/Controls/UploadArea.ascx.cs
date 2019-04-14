using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Krystalware.SlickUpload.Controls;
using Krystalware.SlickUpload.Status;
using System.IO;

using SelfCreateWeb.Common;

public partial class UploadArea : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void uploadManager_UploadComplete(object sender, UploadStatusEventArgs args)
	{
		uploadPanel.Visible = false;
		resultsMessage.Visible = true;

		if (args.Status.Reason == UploadTerminationReason.NotTerminated)
		{
			if ((sender as UploadManager).UploadedFiles.Count == 0)
			{
				return;
			}
			string filename = Constant.GetRandomFileName(ConfigurationManager.AppSettings["UploadVideo"].ToString()) + args.Status.CurrentFileName.Substring(args.Status.CurrentFileName.LastIndexOf("."));
			if (System.IO.File.Exists(filename))
			{
				resultsMessage.Text = "文件已经存在";
			}
			else
			{
				System.IO.File.Move(Server.MapPath("../") + "/TempUploadFile/" + args.Status.CurrentFileName, filename);
				Response.Write("成功上传");
				Response.End();
			}
		}
		else
		{
			if (args.Status.Reason == UploadTerminationReason.Disconnected)
			{
				resultsMessage.Text = "已取消上传";
			}
			else
			{
				resultsMessage.Text = "上传时发生一个错误" + args.Status.ErrorMessage;
			}
			resultsMessage.Style["color"] = "red";
		}
	}

	protected void restartButton_Click(object sender, EventArgs e)
	{
		uploadPanel.Visible = true;
		resultsMessage.Visible = false;
		Response.Write("<script>alert('正在上传')</script>");
	}
    protected void submitButton_Click(object sender, EventArgs e)
    {

    }
}