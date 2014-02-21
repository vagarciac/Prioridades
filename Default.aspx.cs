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
        tbPrioridad.Text = "ABC";
        tbServicio.Text = "ABC";
    }

    protected void gvMaestro2_PreRender(object sender, EventArgs e)
    {
        //SqlDataSource7.ConnectionString = "Data Source=" + ddlIP2.SelectedItem.Text + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }

    protected void gvMaestro_PreRender(object sender, EventArgs e)
    {
        //SqlDataSource3.ConnectionString = "Data Source=" + ddlIP.SelectedItem.Text + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }

    protected void dvDetalle2_ItemCreated(object sender, EventArgs e)
    {
        //SqlDataSource8.ConnectionString = "Data Source=" + ddlIP2.SelectedItem.Text + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }

    protected void dvDetalle_ItemCreated(object sender, EventArgs e)
    {
        //SqlDataSource4.ConnectionString = "Data Source=" + ddlIP.SelectedItem.Text + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }
}