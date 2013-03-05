using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AllPoints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public DataTable DTMapSite()//获取所有服务点的资料
    {
        DataTable dt = new DataTable();
        string sqlstr = "select * from PointDetails";
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);
        sda.Fill(dt);
        con.Close();
        return dt;
    }
    public int SitesCount()//获取所有服务点的数目
    {
        int Count;
        Count = DTMapSite().Rows.Count;
        return Count;
    }
    public DataTable PointImages(int ParentId)//搜索某个服务点的所有图片
    {
        DataTable dt = new DataTable();
        string sqlstr = "select * from MapImages where ParentId="+ParentId+"";
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr,con);
        sda.Fill(dt);
        return dt;
    }
    public int PointImagesCount(int ParentId)//返回某个服务点的图片总数
    {
        int count = PointImages(ParentId).Rows.Count;
        return count;
    }
    public int[] Icon(int i)//返回服务点图标参数
    {
        int[] icon = new int[2];
        string classes = DTMapSite().Rows[i]["Class"].ToString();
        if (classes != null)
        {
            switch (classes)
            {
                case "便民服务及校内活动": icon[0] = 0; icon[1] = 0; break;//绿色
                case "大型赛事及展会服务": icon[0] = -92; icon[1] = 0; break;//紫色
                case "关爱弱势群体": icon[0] = -69; icon[1] = 0; break;//橙色
                case "环境及动物保护": icon[0] = -23; icon[1] = 0; break;//蓝色
                case "西关小屋": icon[0] = -46; icon[1] = 0; break;//红色
                case "义修及义教": icon[0] = -115; icon[1] = 0; break;//粉色
                default: icon[0] = -92; icon[1] = -46; break;//紫旗
            }
        }
        else
        {
            icon[0] = -46; icon[1] = -46;//红旗
        }
        return icon;
    }
}