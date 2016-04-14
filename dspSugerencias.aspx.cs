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

public partial class Admin_dspSugerencias : System.Web.UI.Page
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
            //Validar acceso a la opción
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            if (!objProcesos.validarAcceso(1))
                Response.Redirect("dspAccesoInvalido.aspx");
            else
                objProcesos.registrarAuditoria("Visualizando sugerencia", 2);
        }
        if (((Label)fvwSugerencias.FindControl("idEstadoLabel")).Text=="11")
             ((Button)fvwSugerencias.FindControl("btnAtendida")).Visible=true;
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstSugerencias.aspx");
    }
    protected void btnAtendida_Click(object sender, EventArgs e)
    {
        ((Button)sender).Visible = false;
        Label objLblIdSugerencia = (Label)fvwSugerencias.FindControl("idSugerenciaLabel");
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.fijarEstadoSugerencias(objLblIdSugerencia.Text);
        objProcesos.registrarAuditoria("Se modificó el estado para la sugerencia  [" + objLblIdSugerencia.Text + "]", 1);
        fvwSugerencias.DataBind();        
    }
}
