using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LeftMenus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ShowTreeView("0", null);
    }
    public DataTable AllCategories()
    {
        DataTable dt = new DataTable();
        DataTable DT = new DataTable();
        SqlConnection con = new SqlConnection(SqlHelper.ConnString);
        con.Open();
        string sqlstr = "select * from MapCategory";
        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);
        sda.Fill(dt);
        string sqlStr = "select Id,ServicePoint,ParentId from PointDetails";
        sda = new SqlDataAdapter(sqlStr, con);
        sda.Fill(DT);
        int count = dt.Rows.Count + 1;
        for (int i = 0; i < DT.Rows.Count; i++)
        {
            DataRow DR = dt.NewRow();
            DR[0] = count;
            DR[1] = DT.Rows[i]["ServicePoint"].ToString();
            DR[2] = DT.Rows[i]["ParentId"];
            count++;
            dt.Rows.Add(DR);
        }
        con.Close();
        return dt;
    }
    public void ShowTreeView(string nodeId, TreeNode tempNode)
    {

        DataView dv = new DataView(AllCategories());
        dv.RowFilter = "ParentId=" + nodeId;
        foreach (DataRowView drv in dv)
        {
            TreeNode node = new TreeNode();
            node.Text = drv["Department"].ToString();
            node.Value = drv["Id"].ToString();
            if (nodeId == "0")
            {
                if (node.Text == "一览图") { node.NavigateUrl = "AllPoints.aspx"; }
                TreeView1.Nodes.Add(node);
            }
            else
            {
                tempNode.ChildNodes.Add(node);
                if (node.Depth == 2) { node.NavigateUrl = "SinglePoint.aspx?ServicePoint=" + node.Text + "&&Department=" + node.Parent.Text + ""; }

            }
            ShowTreeView(node.Value, node);
        }
    }
    public bool IsHaveChildren()//判断选中的节点是否含有子节点
    {
        bool flag = false;
        TreeNode node = new TreeNode();
        node = this.TreeView1.SelectedNode;
        if (node.ChildNodes.Count > 0)
        { flag = true; }
        return flag;
    }
    //protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    //{
    //    if (IsHaveChildren() == false)//判断是否含有子节点
    //    {
    //        //没有子节点
    //        TreeNode node = this.TreeView1.SelectedNode;
    //        if (node.Text != "一览图")
    //        {
    //            //Session["ServicePoint"] = node.Text;
    //            //Session["Department"] = node.Parent.Text;
    //            //string ServicePoint = node.Text;
    //            //string Department = node.Parent.Text;
    //            //node.Target = "right";
    //            node.NavigateUrl = "SinglePoint.aspx?ServicePoint=" + node.Text + "&&Department=" + node.Parent.Text + "";
    //            //Response.Redirect("SinglePoint.aspx?ServicePoint=" + node.Text + "&&Department=" + node.Parent.Text + "");
    //        }
    //        else
    //        {
    //            //node.Target = "right";
    //            node.NavigateUrl = "AllPoints.aspx";
    //            //Response.Redirect("AllPoints.aspx");
    //        }

    //    }


    //}
}