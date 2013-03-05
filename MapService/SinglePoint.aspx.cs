using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SinglePoint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public DataTable PointDetails()//根据服务点和服务点部门返回该服务点的所有资料
    {
        DataTable dt = new DataTable();
        string servicepoint = Request.QueryString["ServicePoint"].ToString();
        string department = Request.QueryString["Department"].ToString();
        string sqlstr = "select * from PointDetails where ServicePoint='" + servicepoint + "' and Department='" + department + "'";
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);
        sda.Fill(dt);
        return dt;
    }
    public string[] sessionvalue()
    {
        string[] sv = new string[2];
        sv[0] = Request.QueryString["ServicePoint"].ToString();
        sv[1] = Request.QueryString["Department"].ToString();
        return sv;
    }
    public DataTable MapImages()//根据服务点搜索出该服务点所有的图片
    {
        DataTable dt = new DataTable();
        //int ParentId = Convert.ToInt32(PointDetails().Rows[0]["Id"]);
        string sqlstr = "select * from MapImages where ParentId=(select Id from PointDetails where ServicePoint='" + Request.QueryString["ServicePoint"] + "' and Department='" + Request.QueryString["Department"] + "')";
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);
        sda.Fill(dt);
        return dt;
    }
    public int PointImagesCount()//该服务点的图片总数
    {
        int count = MapImages().Rows.Count;
        return count;
    }
}