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

public partial class dspPropiedades : System.Web.UI.Page
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
            if (Request.QueryString["IdPropiedad"] == null)
                fvwPropiedades.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwPropiedades.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwPropiedades.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(numTipoAcceso))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando propiedad. Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void ddlEstados_DataBound(object sender, EventArgs e)
    {
        if (fvwPropiedades.CurrentMode == FormViewMode.Insert)
            ((TextBox)fvwPropiedades.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
        else
            ((DropDownList)sender).SelectedValue = ((TextBox)fvwPropiedades.FindControl("idEstadoTextBox")).Text;
    }
    protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((TextBox)fvwPropiedades.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
    }
    protected void dtmFechaTextBox_Init(object sender, EventArgs e)
    {
        ((Label)sender).Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstPropiedades.aspx");
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstPropiedades.aspx");
    }
    protected void fvwPropiedades_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Creando propiedad[" + ((TextBox)fvwPropiedades.FindControl("varNombreTextBox")).Text + "]", 1);
        Response.Redirect("lstPropiedades.aspx");
    }
    protected void varNombreTextBox_Init(object sender, EventArgs e)
    {
        ((Label)fvwPropiedades.FindControl("lblDatoOriginal")).Text = ((TextBox)sender).Text;
    }
    protected void fvwPropiedades_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Cancel = validarDato();
    }
    protected void fvwPropiedades_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        if (((Label)fvwPropiedades.FindControl("lblDatoOriginal")).Text != ((TextBox)fvwPropiedades.FindControl("varNombreTextBox")).Text)
            e.Cancel = validarDato();
    }
    protected bool validarDato()
    {
        //Validar que la propiedad a crear ya no esté el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtDato = (TextBox)fvwPropiedades.FindControl("varNombreTextBox");
        CustomValidator cvlTemporal = (CustomValidator)fvwPropiedades.FindControl("cvlExistencia");
        if (objProcesos.validarPropiedad(objTxtDato.Text))
            cvlTemporal.IsValid = true;
        else
            cvlTemporal.IsValid = false;
        if (!cvlTemporal.IsValid)
            return true;
        else
            return false;
    }
    protected void fvwPropiedades_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //Auditar modificación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Modificando propiedad[" + ((TextBox)fvwPropiedades.FindControl("varNombreTextBox")).Text + "]", 1);
    }
}
