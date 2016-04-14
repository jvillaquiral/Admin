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

public partial class bsqPedidos : System.Web.UI.Page
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
                objProcesos.registrarAuditoria("Consultando pedidos", 2);
        }
    }
    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        StringBuilder strConsulta = new StringBuilder();
        if (txtNoPedido.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Pedidos.varNoPedido = '" + txtNoPedido.Text + "'");
        }
        if (txtIdCliente.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varIdentificacion = '" + txtIdCliente.Text + "'");
        }
        if (txtNomCliente.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varNombre like '%" + txtNomCliente.Text + "%'");
        }
        if (txtApeCliente.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Clientes.varApellido like '%" + txtApeCliente.Text + "%'");
        }
        if (txtDesde.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Pedidos.dtmFecha >= '" + txtDesde.Text + "'");
        }
        if (txtHasta.Text.Length > 0)
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Pedidos.dtmFecha <= '" + txtHasta.Text + "'");
        }
        if ((txtProducto.Text.Length != 0) || (txtReferencia.Text.Length != 0))
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            //Validar cual de los dos campos tiene valor
            String strConsultaTemporal=null;
            if (txtProducto.Text.Length != 0)
                strConsultaTemporal = " (d.varNombre like '%" + txtProducto.Text + "%') ";
            if (txtReferencia.Text.Length != 0)
                if (strConsultaTemporal != null)
                    strConsultaTemporal = "(" + strConsultaTemporal + " OR (d.varReferencia like '%" + txtReferencia.Text + "%')) ";
                else
                    strConsultaTemporal = "(d.varReferencia like '%" + txtReferencia.Text + "%') ";
            //Terminar de formar el filtro de producto
            strConsulta.Append("Pedidos.idPedido in (select p.idpedido from  pedidos p, items i, productos d where "+
                strConsultaTemporal+ " and d.idProducto = i.idProducto and p.idpedido = i.idpedido)");
        }
        if (ddlEstados.SelectedValue != "0")
        {
            if (strConsulta.ToString().Length != 0)
                strConsulta.Append(" and ");
            strConsulta.Append("Estados.idEstado = " + ddlEstados.SelectedValue);
        }
        if (strConsulta.ToString().Length != 0)
        {
            Session["strConsulta"] = " where " + strConsulta.ToString();
        }
        Response.Redirect("lstPedidos.aspx");
    }
    protected void ddlEstados_DataBound(object sender, EventArgs e)
    {
        ListItem objListItem = new ListItem("Todos", "0");
        ddlEstados.Items.Add(objListItem);
        ddlEstados.Items.FindByValue("0").Selected = true;
    }
}
