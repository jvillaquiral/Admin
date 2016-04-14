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


public partial class lstCantidadesPrecios : System.Web.UI.Page
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
        strProceso = "3";
        if (!Page.IsPostBack)
        {
            //Validar acceso a la opcion
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            if (!objProcesos.validarAcceso(2))
                Response.Redirect("dspAccesoInvalido.aspx");
            else
                objProcesos.registrarAuditoria("Modificando cantidades y precios", 1);
        }
        if (hdfFiltro.Value != null)
        {
            sdsProductos.SelectCommand = "SELECT [idProducto], [varReferencia], [varNombre], [numCantidad], [numValor] FROM [Productos]" + hdfFiltro.Value + " ORDER BY [dtmFecha] DESC";
        }
    }
    protected void btnFiltrar_Click(object sender, EventArgs e)
    {
        StringBuilder strConsulta = new StringBuilder();
        if (txtReferencia.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" or ");
            strConsulta.Append("Productos.varReferencia = '" + txtReferencia.Text + "'");
        }
        if (txtNombre.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" or ");
            strConsulta.Append("Productos.varNombre like '%" + txtNombre.Text + "%'");
        }
        if (strConsulta.ToString().Length != 0)
        {
            hdfFiltro.Value = " where " + strConsulta.ToString();
            sdsProductos.SelectCommand = "SELECT [idProducto], [varReferencia], [varNombre], [numCantidad], [numValor] FROM [Productos]" + hdfFiltro.Value + " ORDER BY [dtmFecha] DESC";
        }
        else
        {
            sdsProductos.SelectCommand = "SELECT [idProducto], [varReferencia], [varNombre], [numCantidad], [numValor] FROM [Productos] ORDER BY [dtmFecha] DESC";
            hdfFiltro.Value = null;
            gdvProductos.DataBind();
        }
    }
}
