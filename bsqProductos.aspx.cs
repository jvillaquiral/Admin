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
using System.Text;

public partial class bsqProductos : System.Web.UI.Page
{
    private string strUsuario;
    private string strConexion;
    private string strProceso;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdUsuarioACWEB"] == null)
            Response.Redirect("dspMensaje.aspx");
        else
            strUsuario = Session["IdUsuarioACWEB"].ToString();
        strConexion = ConfigurationManager.ConnectionStrings["cnxBDPrincipal"].ConnectionString;
        strProceso = "2";
        if (!Page.IsPostBack)
        {
            //Validar acceso a la opcion
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            if (!objProcesos.validarAcceso(1))
                Response.Redirect("dspAccesoInvalido.aspx");
            else
                objProcesos.registrarAuditoria("Consultando productos", 2);
        }
    }
    protected void ddlCategorias_DataBound(object sender, EventArgs e)
    {
        ListItem objListItem = new ListItem("Todas", "0");
        ddlCategorias.Items.Add(objListItem);
        ddlCategorias.Items.FindByValue("0").Selected = true;
    }
    protected void ddlEstados_DataBound(object sender, EventArgs e)
    {
        ListItem objListItem = new ListItem("Todos", "0");
        ddlEstados.Items.Add(objListItem);
        ddlEstados.Items.FindByValue("0").Selected = true;
    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        StringBuilder strConsulta = new StringBuilder();
        if (txtReferencia.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Productos.varReferencia = '" + txtReferencia.Text + "'");
        }
        if (txtNombre.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Productos.varNombre like '%" + txtNombre.Text + "%'");
        }
        if (txtVMin.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Productos.numValor >= " + txtVMin.Text);
        }
        if (txtVMax.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Productos.numValor <= '" + txtVMax.Text);
        }
        if (ddlCategorias.SelectedValue != "0")
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Productos.idCategoria = " + ddlCategorias.SelectedValue);
        }
        if (ddlEstados.SelectedValue != "0")
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Productos.idEstado = " + ddlEstados.SelectedValue);
        }
        if (strConsulta.ToString().Length != 0)
        {
            Session["strConsulta"] = " where " + strConsulta.ToString();
        }
        Response.Redirect("lstProductos.aspx");
    }
}
