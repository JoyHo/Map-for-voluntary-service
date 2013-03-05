<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllPoints.aspx.cs" Inherits="AllPoints" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广东工业大学志愿服务点</title>
<style type="text/css">
html{height:100%}
body{height:100%;margin:0px;padding:0px}
#milkMap{height:654px;
width:1261px;
border:1px solid blue;
    }
    .style2
    {
        width: 570px;
    }
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.1&services=false"></script>

</head>
<body>
    <form id="form1" runat="server" target="right">
   <div id="milkMap"></div>
    </form>
</body>
<script type="text/javascript">
    function initMap() {
        setMapEvent(); //设置地图事件

    }
    //地图事件设置函数：
    function setMapEvent() {
        map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
        map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard(); //启用键盘上下左右键移动地图
    }

    
    var map = new BMap.Map("milkMap"); // 创建地图实例
    var point = new BMap.Point(113.439, 23.0916); // 创建点坐标
    map.centerAndZoom(point, 12); // 初始化地图，设置中心点坐标和地图级别
    map.addControl(new BMap.OverviewMapControl({ isOpen: 1, anchor: BMAP_ANCHOR_TOP_RIGHT })); //为地图添加鹰眼
    map.addControl(new BMap.NavigationControl()); //为地图添加鱼骨
//    var zsIcon = new BMap.Icon("http://openapi.baidu.com/map/images/us_mk_icon.png", //图片地址
//new BMap.Size(20, 20), // 标注显示大小
//{
//offset: new BMap.Size(0, 0), // 标注底部小尖尖的偏移量
//imageOffset: new BMap.Size(-46, 0) // 这里相当于CSS sprites
//});
   var zsIcon = new Array();
   var pointMarker = new Array();
   var marker = new Array();
   var infoWindow = new Array();
<% int i=0;while(i<SitesCount()) { %> 
     zsIcon[<%=i%>] = new BMap.Icon("http://openapi.baidu.com/map/images/us_mk_icon.png", //图片地址
     new BMap.Size(20, 20), // 标注显示大小
{
offset: new BMap.Size(0, 0), // 标注底部小尖尖的偏移量
imageOffset: new BMap.Size(<%=Icon(i)[0]%>,<%=Icon(i)[1]%>) // 这里相当于CSS sprites
});
     pointMarker[<%=i%>] = new BMap.Point(<%=DTMapSite().Rows[i]["Coordinate"]%>);
     marker[<%=i%>] = new BMap.Marker(pointMarker[<%=i%>], { icon: zsIcon[<%=i%>] });
     map.addOverlay(marker[<%=i%>]);
     infoWindow[<%=i%>] = new BMap.InfoWindow("<p><% for(int j=0;j<PointImagesCount(Convert.ToInt32(DTMapSite().Rows[i]["Id"]));j++) {%> <a target='_blank' title='相片' alt='相片' >  <img src=<%=PointImages(Convert.ToInt32(DTMapSite().Rows[i]["Id"])).Rows[j]["ImageAddress"] %> /></a>&nbsp<% } %></p><p style='font-size:12px;'>服务点：<%=DTMapSite().Rows[i]["ServicePoint"]%></p><p style='font-size:12px;'>服务点简介：<%=DTMapSite().Rows[i]["Intro"] %></p><p style='font-size:12px;'>地址：<%=DTMapSite().Rows[i]["Location"] %></p>-------------------------------------------------</p><p style='font-size:12px;'>志愿组织：<%=DTMapSite().Rows[i]["Department"] %></p><p style='font-size:12px;'>服务内容：<%=DTMapSite().Rows[i]["Works"] %></p><p style='font-size:12px;'>志愿服务负责人：<%=DTMapSite().Rows[i]["Principal"] %></p><p style='font-size:12px;'>联系方式：<%=DTMapSite().Rows[i]["Contact"] %></p>");  // 创建信息窗口对象

     marker[<%=i%>].addEventListener("onmouseover", function () { //给招商银行标注添加点击事件
        this.openInfoWindow(infoWindow[<%=i%>]); //打开招商银行的窗口
     });
     marker[<%=i%>].addEventListener("click", function () {window.open("Details.aspx?ServicePoint=<%=DTMapSite().Rows[i]["ServicePoint"] %>&&Department=<%=DTMapSite().Rows[i]["Department"] %>");});
     <% i++; %>
    <% } %>
    initMap();

</script>
</html>
