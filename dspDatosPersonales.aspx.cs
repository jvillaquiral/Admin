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

public partial class dspDatosPersonales : System.Web.UI.Page
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
            if (Request.QueryString["IdDato"] == null)
                fvwDatos.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwDatos.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwDatos.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(numTipoAcceso))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando dato personal. Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void ddlEstados_DataBound(object sender, EventArgs e)
    {
        if (fvwDatos.CurrentMode == FormViewMode.Insert)
            ((TextBox)fvwDatos.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
        else
            ((DropDownList)sender).SelectedValue = ((TextBox)fvwDatos.FindControl("idEstadoTextBox")).Text;
    }
    protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((TextBox)fvwDatos.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstDatosPersonales.aspx");
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        ((Label)fvwDatos.FindControl("dtmFechaLabel")).Text= DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstDatosPersonales.aspx");
    }
    protected void fvwDatos_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Creando dato personal [" + ((TextBox)fvwDatos.FindControl("varNombreTextBox")).Text + "]", 1);
        Response.Redirect("lstDatosPersonales.aspx");
    }
    protected void varNombreTextBox_Init(object sender, EventArgs e)
    {
        ((Label)fvwDatos.FindControl("lblDatoOriginal")).Text = ((TextBox)sender).Text;
    }
    protected void fvwDatos_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Cancel = validarDato();
    }
    protected void fvwDatos_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        if (((Label)fvwDatos.FindControl("lblDatoOriginal")).Text != ((TextBox)fvwDatos.FindControl("varNombreTextBox")).Text)
            e.Cancel = validarDato();
    }
    protected bool validarDato()
    {
        //Validar que el cualificador a crear ya no esté el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtDato = (TextBox)fvwDatos.FindControl("varNombreTextBox");
        CustomValidator cvlTemporal = (CustomValidator)fvwDatos.FindControl("cvlExistencia");
        if (objProcesos.validarDatoPersonal(objTxtDato.Text))
            cvlTemporal.IsValid = true;
        else
            cvlTemporal.IsValid = false;
        if (!cvlTemporal.IsValid)
            return true;
        else
            return false;
    }
    protected void fvwDatos_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Modificando dato personal [" + ((TextBox)fvwDatos.FindControl("varNombreTextBox")).Text + "]", 1);
    }
}
