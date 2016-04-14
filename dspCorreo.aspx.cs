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
using System.Threading;

public partial class dspCorreo : System.Web.UI.Page
{
    private ArrayList altListaCorreos;
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
                objProcesos.registrarAuditoria("Enviando correo a clientes", 2);
        }
    }
    protected void gdvClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Obtener el codigo
        string strCodSeleccionado = gdvClientes.SelectedDataKey.Value.ToString();
        //Verificar si ya se adicionó la cuenta
        if (lstClientes.Items.FindByValue(strCodSeleccionado) == null)
        {
            GridViewRow objRegistro = gdvClientes.SelectedRow;
            ListItem objItem = new ListItem(objRegistro.Cells[3].Text, strCodSeleccionado);
            lstClientes.Items.Add(objItem);
        }
        //Habilitar el botón de eliminar todos
        btnEliminarT.Enabled = true;
    }
    protected void lstClientes_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnEliminar.Enabled = true;
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        if (lstClientes.SelectedItem != null)
            lstClientes.Items.Remove(lstClientes.SelectedItem);
        btnEliminar.Enabled = false;
        lstClientes.SelectedIndex = -1;
    }
    protected void btnEliminarT_Click(object sender, EventArgs e)
    {
        lstClientes.Items.Clear();
    }
    protected void btnSumarT_Click(object sender, EventArgs e)
    {
        ListItem objItem = null;
        string strCodSeleccionado = null;
        GridViewRowCollection objRegistros = gdvClientes.Rows;
        foreach (GridViewRow r in objRegistros)
        {
            strCodSeleccionado = gdvClientes.DataKeys[r.RowIndex].Value.ToString();
            if (lstClientes.Items.FindByValue(strCodSeleccionado) == null)
            {
                objItem = new ListItem(r.Cells[3].Text, strCodSeleccionado);
                lstClientes.Items.Add(objItem);
            }
        }
        //Habilitar el botón de eliminar todos
        btnEliminarT.Enabled = true;
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        //Validar si se seleccionó por lo menos una cuenta
        if (lstClientes.Items.Count == 0)
        {
            cmvCuentas.IsValid = false;
            return;
        }
        altListaCorreos = new ArrayList();
        //Crear lista con correos
        foreach (ListItem li in lstClientes.Items)
            altListaCorreos.Add(li.Text);
        //Creo Hilo
        ThreadStart objDelegado = new ThreadStart(iniciarCorreo);
        Thread hiloCorreo = new Thread(objDelegado);
        hiloCorreo.Start();
        Response.Redirect("dspMenuPrincipal.aspx");
    }
    protected void iniciarCorreo()
    {
        //Crear objeto de procesos
        csCWProcesos_V1_0 objProceso = new csCWProcesos_V1_0(ConfigurationManager.ConnectionStrings["cnxBDPrincipal"].ConnectionString, "", "");
        objProceso.correoClientes(altListaCorreos, txtAsunto.Text, txtMensaje.Text);
    }
    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        lstClientes.Items.Clear();
        txtMensaje.Text = "";
        txtAsunto.Text = "";
        btnEliminarT.Enabled = false;
        btnEliminar.Enabled = false;
    }
}
