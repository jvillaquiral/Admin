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

public partial class lstCategorias : System.Web.UI.Page
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
                objProcesos.registrarAuditoria("Listando categorías", 2);
        }
        csCWProcesos_V1_0 objProceso = new csCWProcesos_V1_0(ConfigurationManager.ConnectionStrings["cnxBDPrincipal"].ConnectionString, strUsuario, strProceso);
        //Construir arbol de categorias
        objProceso.construirArbolCategorias(tvwCategorias, 1);
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        Response.Redirect("dspCategorias.aspx");
    }
}
