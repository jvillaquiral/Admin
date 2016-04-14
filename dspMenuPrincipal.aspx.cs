using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class dspMenuPrincipal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdUsuarioACWEB"] == null)
            Response.Redirect("dspMensaje.aspx");
    }
    protected void btnEmpresa_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("dspDatosEmpresa.aspx");
    }
    protected void btnProductos_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("lstProductos.aspx");
    }
    protected void btnPedidos_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("lstPedidos.aspx");
    }
    protected void btnClientes_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("lstClientes.aspx");
    }
    protected void btnSeguridad_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("lstUsuarios.aspx");
    }
    protected void btnSalida_Click(object sender, ImageClickEventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}
