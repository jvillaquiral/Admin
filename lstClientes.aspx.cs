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

public partial class lstClientes : System.Web.UI.Page
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
        strProceso = "5";
        if (!Page.IsPostBack)
        {
            //Validar acceso a la opcion
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            if (!objProcesos.validarAcceso(1))
                Response.Redirect("dspAccesoInvalido.aspx");
            else
                objProcesos.registrarAuditoria("Listando clientes", 2);
        }
        if (!Page.IsPostBack)
        {
            if (Session["strConsulta"] != null)
            {
                hdfFiltro.Value = Session["strConsulta"].ToString();
                Session["strConsulta"] = null;
            }
        }
        if (hdfFiltro.Value != null)
            sdsClientes.SelectCommand = sdsClientes.SelectCommand + hdfFiltro.Value;
    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        Response.Redirect("bsqClientes.aspx");
    }
}
