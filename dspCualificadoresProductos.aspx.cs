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

public partial class dspCualificadoresProductos : System.Web.UI.Page
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
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(3))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Modificando los cualificadores para un producto", 1);
    }
    protected void ddlValAnteriores_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtNuevoValor.Text = ddlValAnteriores.SelectedValue;
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("dspProductos.aspx?IdProducto=" + Request.QueryString["IdProducto"].ToString());
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        //Validar que el valor a crear ya no esté el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (objProcesos.validarCualificadorProducto(Request.QueryString["IdProducto"].ToString(),
            ddlCualificadores.SelectedValue, txtNuevoValor.Text))
            cvlNuevoValor.IsValid = true;
        else
            cvlNuevoValor.IsValid = false;
        if (cvlNuevoValor.IsValid)
        {
            objProcesos.grabarCualificadorProducto(Request.QueryString["IdProducto"].ToString(),
            ddlCualificadores.SelectedValue, txtNuevoValor.Text);
            objProcesos.registrarAuditoria("Agregando cualificador [" + ddlCualificadores.SelectedValue
                + "] con valor [" + txtNuevoValor.Text + "] para producto [" + Request.QueryString["IdProducto"].ToString() + "]",1);
            gdvCualiProductos.DataBind();
            txtNuevoValor.Text = "";
        }
    }
}