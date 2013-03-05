<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 278px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="height: 460px; width: 1255px">
    <tr>
     <td class="style1">
     <iframe name="left" id="menuframe" frameborder="0" src="LeftMenus.aspx" 
             
             style="height:782px; width:100%; z-index:111;background-color:#ffffff; margin-top: 0px; margin-right: 9px;"></iframe></td>
     <td align="right">
         <iframe name="right" id="rightframe" frameborder="0" src="AllPoints.aspx" 
             style="height:782px; width:1025px; z-index:111;background-color:#ffffff"></iframe></td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
