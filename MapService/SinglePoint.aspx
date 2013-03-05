<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SinglePoint.aspx.cs" Inherits="SinglePoint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
<title>广东工业大学志愿服务点</title>
    
<style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #milkMap{height:600px;width:1024px;border:1px solid blue;}
    </style>
   
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.1&services=false">
　　</script>
</head>
<body>
    <form id="form1" runat="server" target="right">
     <div id="milkMap"></div>
  
  <script type="text/javascript">

      var map = new BMap.Map("milkMap");          // 创建地图实例

      var point = new BMap.Point(<%=PointDetails().Rows[0]["Coordinate"] %>);  // 创建点坐标

      map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别
      var marker = new BMap.Marker(point);        // 创建标注  
      map.addOverlay(marker);                     // 将标注添加到地图中


      function initMap() {
          setMapEvent(); //设置地图事件
          addMapControl(); //向地图添加控件
      }


      //地图事件设置函数：
      function setMapEvent() {
          map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
          map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
          map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
          map.enableKeyboard(); //启用键盘上下左右键移动地图
      }

      //地图控件添加函数：
      function addMapControl() {
          //向地图中添加缩放控件
          var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
          map.addControl(ctrl_nav);
          //向地图中添加缩略图控件
          var ctrl_ove = new BMap.OverviewMapControl({ anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1 });
          map.addControl(ctrl_ove);
          //向地图中添加比例尺控件
          var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
          map.addControl(ctrl_sca);
      }

      var infoWindow = new BMap.InfoWindow("<p><% for(int i=0;i<PointImagesCount();i++) { %><a target='_blank' title='相片' alt='相片' >  <img src=<%=MapImages().Rows[i]["ImageAddress"] %> /></a>&nbsp;<% } %></p><p style='font-size:12px;'>服务点： <%=PointDetails().Rows[0]["ServicePoint"] %></p><p style='font-size:12px;'>服务点简介：<%=PointDetails().Rows[0]["Intro"]%></p><p style='font-size:12px;'>地址：<%=PointDetails().Rows[0]["Location"]%></p>-------------------------------------------------</p><p style='font-size:12px;'>志愿组织：<%=PointDetails().Rows[0]["Department"]%></p><p style='font-size:12px;'>服务内容：<%=PointDetails().Rows[0]["Works"]%></p><p style='font-size:12px;'>志愿服务负责人：<% =PointDetails().Rows[0]["Principal"]%></p><p style='font-size:12px;'>联系方式：<%=PointDetails().Rows[0]["Contact"]%></p>");  // 创建信息窗口对象

      marker.openInfoWindow(infoWindow)
      marker.addEventListener("onmouseover", function () {
          this.openInfoWindow(infoWindow);
      });
     marker.addEventListener("click", function () {window.location.href = "Details.aspx?ServicePoint=<%=sessionvalue()[0] %>&&Department=<%=sessionvalue()[1] %>";});
      initMap();
</script>
    </form>
</body>
</html>
