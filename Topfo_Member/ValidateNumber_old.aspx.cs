﻿using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;

public partial class ValidateNumber : System.Web.UI.Page
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string strRndNum = RndNum(4);
            Session.Add("valationNo", strRndNum);
            //				HttpCookie cookRndNum = new HttpCookie("ImageV",strRndNum);   
            //				Response.Cookies.Add(cookRndNum);
            this.ValidateCode(strRndNum);
        }
    }
    #region 生成验证码
    private void ValidateCode(string VNum)
    {
        if (VNum == null || VNum.Trim() == String.Empty)
            return;

        System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling(Convert.ToDouble((VNum.Length * 15))), 25);
        Graphics g = Graphics.FromImage(image);

        try
        {
            //生成随机生成器 
            Random random = new Random();

            //清空图片背景色 
            g.Clear(Color.White);

            //画图片的背景噪音线 
            for (int i = 0; i < 30; i++)
            {
                int x1 = random.Next(image.Width);
                int x2 = random.Next(image.Width);
                int y1 = random.Next(image.Height);
                int y2 = random.Next(image.Height);

                g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
            }

            Font font = new System.Drawing.Font("Arial", 14, (System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            g.DrawString(VNum, font, brush, 2, 2);

            //画图片的前景噪音点 
            for (int i = 0; i < 100; i++)
            {
                int x = random.Next(image.Width);
                int y = random.Next(image.Height);

                image.SetPixel(x, y, Color.FromArgb(random.Next()));
            }

            //画图片的边框线 
            g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            Response.ClearContent();
            Response.ContentType = "image/Gif";
            Response.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }

    #endregion

    #region 产生随机数
    private string RndNum(int VcodeNum)
    {
        string Vchar = "0,1,2,3,4,5,6,7,8,9";

        string[] VcArray = Vchar.Split(new Char[] { ',' });
        string VNum = "";
        int temp = -1;

        Random rand = new Random();

        for (int i = 1; i < VcodeNum + 1; i++)
        {


            int valNum = rand.Next(10);
            if (temp != -1 && temp == valNum)
            {
                return RndNum(VcodeNum);
            }
            temp = valNum;
            VNum += VcArray[valNum];
        }
        return VNum;
    }
    #endregion
}
