var para = new Array();
para[0] = "<a href='http://www.tz888.cn/exchange/intro2.aspx' target='_blank' ><span style='color:#18A531;'> ";
para[0] += "资源付费交易<img src='/Web1.1/img/zhongpic/toadyrighttubiao2_b.gif' width='16' height='13' /></span></a>";
para[1] = "<span style='color:#FF6600;'> 资源免费互换<img src='/Web1.1/img/zhongpic/toadyrighttubiao.gif' width='15' height='14' /></span>";
var tag = 0;

function RefreshIntroLink(){
	tag = tag % 2;
	obj = document.getElementById("SysIntro");
	obj.innerHTML=para[tag]; 
	tag++;
	setTimeout("RefreshIntroLink()",5000);
}