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


public partial class Default3 : System.Web.UI.Page
{
     private   void   Page_Load(object   sender,   System.EventArgs   e)   
  {   
  string   sat=Request.QueryString["atts"];   
  if(sat==null)return;   
  if(sat.Trim()=="")   
  return;   
  string[]   opt=sat.Split(',');   
  foreach(string   ss   in   opt)   
  {   
  ListItem   lst=new   ListItem(ss);   
  if(ss.Trim()!="")   
  att.Items.Add(lst);   
  }   
  if(att.Items.Count>0)   
  att.SelectedIndex=0;   
  //   在此处放置用户代码以初始化页面   
  }   
    
  #region   Web   窗体设计器生成的代码   
  override   protected   void   OnInit(EventArgs   e)   
  {   
  //   
  //   CODEGEN:   该调用是   ASP.NET   Web   窗体设计器所必需的。   
  //   
  InitializeComponent();   
  base.OnInit(e);   
  }   
    
  ///   <summary>   
  ///   设计器支持所需的方法   -   不要使用代码编辑器修改   
  ///   此方法的内容。   
  ///   </summary>   
  private   void   InitializeComponent()   
  {           
  this.Load   +=   new   System.EventHandler(this.Page_Load);   
    
  }   
  #endregion   
  }   
 