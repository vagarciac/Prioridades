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
        if (ddlInmuebles.SelectedIndex == -1)
        {
            Response.Write("<script>alert('¡¡ Seleccionar una Localidad !!')</script>");
            ddlInmuebles.Focus();
            return;
        }
    }

    protected void ddlInmuebles_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource2.ConnectionString = "Data Source=" + ddlInmuebles.SelectedValue + "\\SQLEXPRESS;Initial Catalog=Turnos;User ID=writer;Password=Wr1ter";
    }
}