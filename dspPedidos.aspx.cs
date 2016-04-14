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

public partial class dspPedidos : System.Web.UI.Page
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
        strProceso = "4";
        if (!Page.IsPostBack)
        {
            //Validar acceso a la opcion
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            if (!objProcesos.validarAcceso(1))
                Response.Redirect("dspAccesoInvalido.aspx");
            else
                objProcesos.registrarAuditoria("Consultando pedido[" + Request.QueryString["IdPedido"].ToString() + "]", 2);
        }
        if (((Label)fvwPedidos.FindControl("idEstadoLabel")).Text != "6")
        {
            ((Button)fvwPedidos.FindControl("btnEnviado")).Enabled = false;
            ((Button)fvwPedidos.FindControl("btnCancelado")).Enabled = false;
        }
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstPedidos.aspx");
    }
    protected void fvwPedidos_DataBound(object sender, EventArgs e)
    {
        if ((fvwPedidos.FindControl("dtmDespachoLabel") != null) && (((Label)fvwPedidos.FindControl("dtmDespachoLabel")).Text.Length == 0))
        {
            ((Button)fvwPedidos.FindControl("btnEnviado")).Visible = true;
            ((Button)fvwPedidos.FindControl("btnCancelado")).Visible = true;
        }
    }
    protected void btnEnviado_Click(object sender, EventArgs e)
    {
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        string strIdPedido = Request.QueryString["IdPedido"].ToString();
        objProcesos.fijarEstadoPedidos(strIdPedido, 8);
        objProcesos.registrarAuditoria("El pedido [" + strIdPedido + "] fue marcado como despachado", 1);
        fvwPedidos.DataBind();
        ((Button)fvwPedidos.FindControl("btnEnviado")).Enabled = false;
        ((Button)fvwPedidos.FindControl("btnCancelado")).Enabled = false;
    }
    protected void btnCancelado_Click(object sender, EventArgs e)
    {
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        string strIdPedido = Request.QueryString["IdPedido"].ToString();
        objProcesos.fijarEstadoPedidos(strIdPedido, 7);
        objProcesos.registrarAuditoria("El pedido [" + strIdPedido + "] fue marcado como cancelado", 1);
        fvwPedidos.DataBind();
        ((Button)fvwPedidos.FindControl("btnEnviado")).Enabled = false;
        ((Button)fvwPedidos.FindControl("btnCancelado")).Enabled = false;
    }
}
