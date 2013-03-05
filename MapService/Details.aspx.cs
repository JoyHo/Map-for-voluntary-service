using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Request.QueryString["ServicePoint"].ToString() + "<br />");
        //Response.Write(Request.QueryString["Department"].ToString());
    }
    public DataTable PointDetails()//搜索服务点的所有资料
    {
        DataTable dt = new DataTable();
        string servicepoint;
        string department;
        servicepoint = Request.QueryString["ServicePoint"].ToString();
        department = Request.QueryString["Department"].ToString();
        string sqlstr = "select * from PointDetails where ServicePoint='" + servicepoint + "' and Department='" + department + "'";
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);
        sda.Fill(dt);
        con.Close();
        return dt;
    }
    public DataTable PointImages(int ParentId)//该服务点的所有图片
    {
        DataTable dt = new DataTable();
        string sqlstr = "select * from MapImages where ParentId=" + ParentId + "";
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);
        sda.Fill(dt);
        return dt;
    }
}