using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvMaestro_PreRender(object sender, EventArgs e)
    {
        SqlDataSource2.ConnectionString = "Data Source=" + ddlIP.SelectedItem.Text + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }

    protected void dvDetalle_ItemCreated(object sender, EventArgs e)
    {
        SqlDataSource3.ConnectionString = "Data Source=" + ddlIP.SelectedItem.Text + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }
}