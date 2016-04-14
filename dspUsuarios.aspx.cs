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

public partial class dspUsuarios : System.Web.UI.Page
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
        strProceso = "0";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["IdUsuario"] == null)
                fvwUsuarios.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwUsuarios.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwUsuarios.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAccesoAdmin())
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando usuarios.  Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstUsuarios.aspx");
    }
    protected void dtmFechaTextBox_Init(object sender, EventArgs e)
    {
        ((Label)fvwUsuarios.FindControl("dtmFechaTextBox")).Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstUsuarios.aspx");
    }
    protected void fvwUsuarios_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //Ejecutar el proceso de bd que generar masivamente los permisos para el usuario recién creado
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtUsuario = (TextBox)fvwUsuarios.FindControl("varUsuarioTextBox");
        objProcesos.generarPermisosUsuario(objTxtUsuario.Text);
        //Auditoria
        objProcesos.registrarAuditoria("Creando usuario [" + objTxtUsuario.Text + "]",1);
        Response.Redirect("lstUsuarios.aspx");
    }
    protected void fvwUsuarios_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //Validar que el usuario a crear ya no estén el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtUsuario = (TextBox)fvwUsuarios.FindControl("varUsuarioTextBox");
        CustomValidator cvlTemporal = (CustomValidator)fvwUsuarios.FindControl("cvlUsuario");
        if (objProcesos.validarUsuario(objTxtUsuario.Text))
            cvlTemporal.IsValid = true;
        else
            cvlTemporal.IsValid = false;
        if (!cvlTemporal.IsValid)
            e.Cancel = true;
    }
    protected void fvwUsuarios_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //Auditoria
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtUsuario = (TextBox)fvwUsuarios.FindControl("varUsuarioTextBox");
        objProcesos.registrarAuditoria("Modificando usuario [" + objTxtUsuario.Text + "]",1);
    }
}
