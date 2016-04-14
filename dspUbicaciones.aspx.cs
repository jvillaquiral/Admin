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

public partial class dspUbicaciones : System.Web.UI.Page
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
        strProceso = "1";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["IdUbicacion"] == null)
                fvwUbicaciones.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwUbicaciones.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwUbicaciones.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(numTipoAcceso))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando ubicación. Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void idEmpresaTextBox_Init(object sender, EventArgs e)
    {
        ((TextBox)sender).Text = Session["IdEmpresaACWEB"].ToString();
    }
    protected void fvwUbicaciones_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Creando ubicación [" + ((TextBox)fvwUbicaciones.FindControl("varNombreTextBox")).Text + "]", 1);
        Response.Redirect("lstUbicaciones.aspx");
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstUbicaciones.aspx");
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        ((TextBox)fvwUbicaciones.FindControl("dtmFechaTextBox")).Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
        ((TextBox)fvwUbicaciones.FindControl("idCiudadTextBox")).Text = ((DropDownList)fvwUbicaciones.FindControl("ddlCiudades")).SelectedValue;
        AlmacenarArchivo();   
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        ((TextBox)fvwUbicaciones.FindControl("idCiudadTextBox")).Text = ((DropDownList)fvwUbicaciones.FindControl("ddlCiudades")).SelectedValue;
        AlmacenarArchivo();
    }
    protected void AlmacenarArchivo()
    {
        try
        {
            if (((FileUpload)fvwUbicaciones.FindControl("fupImagen")).HasFile)
            {
                //Definir el nombre para el archivo
                System.Random objRandomico = new System.Random();
                //Obtener un número randomico entre 1 y 100 por seguridad
                int intRandomico = objRandomico.Next(1, 100);
                //Obtener fecha y hora acutual
                DateTime dtmAhora = DateTime.Now;
                //Unir fecha, hora y randomico
                string strNombreArchivo = dtmAhora.ToString("s").Replace(":", "-") + "-" + intRandomico.ToString();
                //Obter un apuntador al objeto de carga
                FileUpload tempFileUpload = (FileUpload)fvwUbicaciones.FindControl("fupImagen");
                //Agregar la ext al archivo
                strNombreArchivo = strNombreArchivo + tempFileUpload.FileName.Substring(tempFileUpload.FileName.LastIndexOf('.'));
                //Cargar el archivo al servidor
                tempFileUpload.SaveAs(ConfigurationManager.AppSettings["dirImgUbicaciones"] + strNombreArchivo);
                ((TextBox)fvwUbicaciones.FindControl("varImagenTextBox")).Text = strNombreArchivo;
            }
        }
        catch(Exception e)
        {
            //Auditar error
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            objProcesos.registrarMensaje("Error al grabar la foto de la ubicacion [" +
                ((TextBox)fvwUbicaciones.FindControl("varNombreTextBox")).Text + "]", e.Message, 1);
            ((TextBox)fvwUbicaciones.FindControl("varImagenTextBox")).Text = "";
            Response.Redirect("dspMensajeInterior.aspx");
        }
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstUbicaciones.aspx");
    }
    protected void fvwUbicaciones_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Modificando ubicación [" + ((TextBox)fvwUbicaciones.FindControl("varNombreTextBox")).Text + "]", 1);
    }
    protected void ddlDepartamentos_DataBound(object sender, EventArgs e)
    {
        if (fvwUbicaciones.CurrentMode == FormViewMode.Insert)
            ((DropDownList)sender).SelectedIndex = 0;
        else
        {
            Label objLblTemporal = (Label) fvwUbicaciones.FindControl("lblIdDepartamento");
            ((DropDownList)sender).Items.FindByValue(objLblTemporal.Text).Selected = true;
        }
    }
    protected void ddlCiudades_DataBound(object sender, EventArgs e)
    {
        if (fvwUbicaciones.CurrentMode == FormViewMode.Edit)
            if (!Page.IsPostBack)
                ((DropDownList)sender).SelectedValue = ((TextBox)fvwUbicaciones.FindControl("idCiudadTextBox")).Text;
    }
}
