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

public partial class bsqClientes : System.Web.UI.Page
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
                objProcesos.registrarAuditoria("Consultando clientes",2);
        }
    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        StringBuilder strConsulta = new StringBuilder();
        if (txtNomCliente.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varNombre like '%" + txtNomCliente.Text + "%'");
        }
        if (txtPais.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varPais = '" + txtPais.Text + "'");
        }
        if (txtDpto.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varDepartamento = '" + txtDpto.Text + "'");
        }
        if (txtCiudad.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varCiudad = '" + txtCiudad.Text + "'");
        }
        if (txtTelefono.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varTelefono = '" + txtTelefono.Text + "'");
        }
        if (txtEMail.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varEMail = '" + txtEMail.Text + "'");
        }
        if (strConsulta.ToString().Length != 0)
        {
            Session["strConsulta"] = " where " + strConsulta.ToString();
        }
        Response.Redirect("lstClientes.aspx");
    }
}
