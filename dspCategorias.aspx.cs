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

public partial class dspCategorias : System.Web.UI.Page
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
            if (Request.QueryString["IdCategoria"] == null)
                fvwCategorias.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwCategorias.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwCategorias.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(numTipoAcceso))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando categoría. Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstCategorias.aspx");
    }
    protected void ddlEstados_DataBound(object sender, EventArgs e)
    {
        if (fvwCategorias.CurrentMode == FormViewMode.Insert)
            ((TextBox)fvwCategorias.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
        else
            ((DropDownList)sender).SelectedValue = ((TextBox)fvwCategorias.FindControl("idEstadoTextBox")).Text;
    }
    protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((TextBox)fvwCategorias.FindControl("idEstadoTextBox")).Text = ((DropDownList)sender).SelectedValue;
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstCategorias.aspx");
    }
    protected void dtmFechaTextBox_Init(object sender, EventArgs e)
    {
        ((Label)sender).Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
    }
    protected void ddlPadres_DataBound(object sender, EventArgs e)
    {
        DropDownList objListaPadres = (DropDownList)sender;
        //Adiciono la opción de ninguno en la lista
        ListItem objItemNinguno = new ListItem("Ninguno", "0");
        objListaPadres.Items.Add(objItemNinguno);
        TextBox objTxtPadre = (TextBox)fvwCategorias.FindControl("idPadreTextBox");
        //Valido si la caja de texto id padre esta vacía
        if ((objTxtPadre.Text == null) || (objTxtPadre.Text.Length == 0))
        {
            objListaPadres.SelectedValue = "0";
            objTxtPadre.Text = null;
        }
        else
        {
            if (fvwCategorias.CurrentMode == FormViewMode.Insert)
            {
                objListaPadres.SelectedValue = "0";
                objTxtPadre.Text = null;
            }
            else
                objListaPadres.SelectedValue = objTxtPadre.Text;
        }
    }
    protected void ddlPadres_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList objListaPadres = (DropDownList)sender;
        //Validar si seleccionó ninguno
        if (objListaPadres.SelectedValue=="0")
            ((TextBox)fvwCategorias.FindControl("idPadreTextBox")).Text = null;
        else    
            ((TextBox)fvwCategorias.FindControl("idPadreTextBox")).Text = objListaPadres.SelectedValue;
    }
    protected void fvwCategorias_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Creando categoría [" + ((TextBox)fvwCategorias.FindControl("varNombreTextBox")).Text + "]", 1);
        Response.Redirect("lstCategorias.aspx");
    }
    protected void varNombreTextBox_Init(object sender, EventArgs e)
    {
        ((Label)fvwCategorias.FindControl("lblDatoOriginal")).Text = ((TextBox)sender).Text;
    }
    protected void fvwCategorias_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Cancel = validarDato();
    }
    protected void fvwCategorias_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        if (((Label)fvwCategorias.FindControl("lblDatoOriginal")).Text != ((TextBox)fvwCategorias.FindControl("varNombreTextBox")).Text)
            e.Cancel = validarDato();
    }
    protected bool validarDato()
    {
        //Validar que la categoría a crear ya no esté el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtDato = (TextBox)fvwCategorias.FindControl("varNombreTextBox");
        CustomValidator cvlTemporal = (CustomValidator)fvwCategorias.FindControl("cvlExistencia");
        if (objProcesos.validarCategoria(objTxtDato.Text))
            cvlTemporal.IsValid = true;
        else
            cvlTemporal.IsValid = false;
        if (!cvlTemporal.IsValid)
            return true;
        else
            return false;
    }
    protected void fvwCategorias_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Modificando categoría [" + ((TextBox)fvwCategorias.FindControl("varNombreTextBox")).Text + "]", 1);
    }
}
