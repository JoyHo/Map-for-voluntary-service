<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="verify-v1" content="hKfxv9+e6o/2gBwmWKrFJu4vClKiVO4+RrzL0Hqdh2U=" />
<title></title>
    <style type="text/css">
        .style3
        {
            width: 256px;
            height: 63px;
        }
        .style5
        {
            width: 203px;
            height: 63px;
        }
        .style6
        {
            width: 107px;
            height: 63px;
        }
        .style8
        {
            font-size: x-large;
            height: 80px;
        }
        .style10
        {
            height: 80px;
        }
        .style12
        {
            height: 428px;
        }
        .style13
        {
            height: 81px;
        }
        .style17
        {
            width: 111px;
            height: 63px;
        }
        .style18
        {
            height: 63px;
        }
        .style19
        {
            width: 135px;
            height: 63px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <table border="1" cellpadding="1" cellspacing="1" >
    <tr>
    <td class="style8" align="center" colspan="6"><strong><%=PointDetails().Rows[0]["ServicePoint"]%></strong></td>
    </tr>
    <tr>
    <td class="style17" align="center"><strong>详细地址</strong></td><td class="style18" colspan="3"><%=PointDetails().Rows[0]["Location"]%> </td>
        <td class="style19" width="1000px" align="center">
        <strong>负责组织</strong></td>
        <td class="style3"><%=PointDetails().Rows[0]["Department"]%></td>
    </tr>
    <tr>
    <td class="style17" align="center"><strong>服务对象</strong></td><td class="style5"><%=PointDetails().Rows[0]["People"]%></td>
        <td class="style19" align="center">
        <strong>学生负责人</strong></td>
        <td class="style6"><%=PointDetails().Rows[0]["Principal"]%></td>
        <td class="style18" align="center"><strong>联系电话</strong></td><td class="style18"><%=PointDetails().Rows[0]["Contact"]%></td>
    </tr>
    <tr>
    <td colspan="6" align="center" class="style13"><strong>简  介</strong></td>
    </tr>
    <tr>
    <td colspan="6" style="height: 100%;"><p><strong>简介：</strong><%=PointDetails().Rows[0]["Intro"]%></p><p><strong>服务内容：</strong><%=PointDetails().Rows[0]["Works"]%></p><p><%if (PointDetails().Rows[0]["Website"] != null)
                                                                                                                               {%> <strong>服务点网站：</strong><a href=<%=PointDetails().Rows[0]["Website"] %> target="_blank "><%=PointDetails().Rows[0]["Website"]%></a><%} %></p><p><%if (PointDetails().Rows[0]["MicroBlog"] != null)
                                                                                                                                                                                                                                            { %><strong>服务点微博：</strong><a href=<%=PointDetails().Rows[0]["MicroBlog"] %> target="_blank "><%=PointDetails().Rows[0]["MicroBlog"]%></a><%} %></p></td>
    </tr>
    <tr>
    <%int k=0; %>
    <%if(PointImages(Convert.ToInt32(PointDetails().Rows[0]["Id"])).Rows.Count == 0) {k=6;%>
    <td colspan="<%=k%>"></td><%} %>
    <% for (int j = 0; j < PointImages(Convert.ToInt32(PointDetails().Rows[0]["Id"])).Rows.Count; j++)
       {
           if (PointImages(Convert.ToInt32(PointDetails().Rows[0]["Id"])).Rows.Count == 1) { k = 6; }
           if (PointImages(Convert.ToInt32(PointDetails().Rows[0]["Id"])).Rows.Count == 2) { k = 3; }   
    %>
    <td colspan="<%=k%>" align="center"><%if (PointImages(Convert.ToInt32(PointDetails().Rows[0]["Id"])).Rows.Count != 0)
                           { %><img src="<%=PointImages(Convert.ToInt32(PointDetails().Rows[0]["Id"])).Rows[j]["ImageAddress"] %>" /><% } %></td>
    <% } %>
    </tr>
    <tr>
    <td class="style10" align="center"><strong>备注</strong></td><td colspan="5" class="style10"><%=PointDetails().Rows[0]["Remark"]%></td>
    </tr>
    </table>


    </div>
    </form>
</body>
</html>
