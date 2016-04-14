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

public partial class dspCualificadores : System.Web.UI.Page
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
            if (Request.QueryString["IdCualificador"] == null)
                fvwCualificadores.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwCualificadores.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwCualificadores.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(numTipoAcceso))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando cualificador. Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstCualificadores.aspx");
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstCualificadores.aspx");
    }
    protected void dtmFechaTextBox_Init(object sender, EventArgs e)
    {
        ((Label)sender).Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
    }
    protected void ddlEstados_DataBound(object sender, EventArgs e)
    {
        if (fvwCualificadores.CurrentMode == FormViewMode.Insert)
            ((TextBox)fvwCualificadores.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
        else
            ((DropDownList)sender).SelectedValue = ((TextBox)fvwCualificadores.FindControl("idEstadoTextBox")).Text;
    }
    protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((TextBox)fvwCualificadores.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
    }
    protected void fvwCualificadores_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Creando cualificador [" + ((TextBox)fvwCualificadores.FindControl("varNombreTextBox")).Text + "]", 1);
        Response.Redirect("lstCualificadores.aspx");
    }
    protected void varNombreTextBox_Init(object sender, EventArgs e)
    {
        ((Label)fvwCualificadores.FindControl("lblDatoOriginal")).Text = ((TextBox)sender).Text;
    }
    protected void fvwCualificadores_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Cancel = validarDato();
    }
    protected void fvwCualificadores_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        if (((Label)fvwCualificadores.FindControl("lblDatoOriginal")).Text != ((TextBox)fvwCualificadores.FindControl("varNombreTextBox")).Text)
            e.Cancel = validarDato();
    }
    protected bool validarDato()
    {
        //Validar que el cualificador a crear ya no esté el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtDato = (TextBox)fvwCualificadores.FindControl("varNombreTextBox");
        CustomValidator cvlTemporal = (CustomValidator)fvwCualificadores.FindControl("cvlExistencia");
        if (objProcesos.validarCualificador(objTxtDato.Text))
            cvlTemporal.IsValid = true;
        else
            cvlTemporal.IsValid = false;
        if (!cvlTemporal.IsValid)
            return true;
        else
            return false;
    }
    protected void fvwCualificadores_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Modificando cualificador [" + ((TextBox)fvwCualificadores.FindControl("varNombreTextBox")).Text + "]", 1);
    }
}
