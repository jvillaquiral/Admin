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

public partial class dspProductos : System.Web.UI.Page
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
            if (Request.QueryString["IdProducto"] == null)
                fvwProductos.ChangeMode(FormViewMode.Insert);
        }
        //Definir el tipo de acceso
        int numTipoAcceso;
        if (fvwProductos.CurrentMode == FormViewMode.ReadOnly)
            numTipoAcceso = 1;
        else if (fvwProductos.CurrentMode == FormViewMode.Edit)
            numTipoAcceso = 2;
        else
            numTipoAcceso = 3;
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(numTipoAcceso))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Visualizando producto. Tipo acceso[" + numTipoAcceso.ToString() + "]", 2);
    }
    protected void btnCualificadores_Click(object sender, EventArgs e)
    {
        Response.Redirect("dspCualificadoresProductos.aspx?IdProducto="+Request.QueryString["IdProducto"].ToString());
    }
    protected void btnFotos_Click(object sender, EventArgs e)
    {
        Response.Redirect("dspFotosProductos.aspx?IdProducto=" + Request.QueryString["IdProducto"].ToString());
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstProductos.aspx");
    }
    protected void dtmFechaTextBox_Init(object sender, EventArgs e)
    {
        ((Label)sender).Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
    }
    protected void AlmacenarArchivo()
    {
        try
        {
            if (((FileUpload)fvwProductos.FindControl("fupImagen")).HasFile)
            {
                //Obter un apuntador al objeto de carga
                FileUpload tempFileUpload = (FileUpload)fvwProductos.FindControl("fupImagen");
                //Cargar el archivo al servidor
                tempFileUpload.SaveAs(ConfigurationManager.AppSettings["dirImgProductos"] + ((TextBox)fvwProductos.FindControl("varImagenTextBox")).Text);
            }
            AlmacenarAdjunto();
        }
        catch(Exception e)
        {
            //Notificar de error
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            objProcesos.registrarMensaje("Error al almacenar la foto del producto con referencia [" + 
                ((TextBox)fvwProductos.FindControl("varReferenciaTextBox")).Text + "]", e.Message, 1);
            ((TextBox)fvwProductos.FindControl("varImagenTextBox")).Text = "";
            Response.Redirect("dspMensajeInterior.aspx");
        }
    }
    protected void AlmacenarAdjunto()
    {
        try
        {
            if (((FileUpload)fvwProductos.FindControl("fupAdjunto")).HasFile)
            {
                //Obter un apuntador al objeto de carga
                FileUpload tempFileUpload = (FileUpload)fvwProductos.FindControl("fupAdjunto");
                //Cargar el archivo al servidor
                tempFileUpload.SaveAs(ConfigurationManager.AppSettings["dirAdjProductos"] + ((TextBox)fvwProductos.FindControl("varArchivoAdjuntoTextBox")).Text);
            }
        }
        catch (Exception e)
        {
            //Notificar de error
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            objProcesos.registrarMensaje("Error al almacenar archivo adjunto del producto con referencia [" +
                ((TextBox)fvwProductos.FindControl("varReferenciaTextBox")).Text + "]", e.Message, 1);
            ((TextBox)fvwProductos.FindControl("varArchivoAdjuntoTextBox")).Text = "";
            Response.Redirect("dspMensajeInterior.aspx");
        }
    }
    protected bool validarDato()
    {
        //Validar que la referencia a crear ya no esté el la bd
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        TextBox objTxtDato = (TextBox)fvwProductos.FindControl("varReferenciaTextBox");
        CustomValidator cvlTemporal = (CustomValidator)fvwProductos.FindControl("cvlExistencia");
        if (objProcesos.validarReferenciaProducto(objTxtDato.Text))
            cvlTemporal.IsValid = true;
        else
            cvlTemporal.IsValid = false;
        if (!cvlTemporal.IsValid)
            return true;
        else
            return false;
    }
    protected void fvwProductos_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Cancel = validarDato();
        if(!e.Cancel)
            AlmacenarArchivo();
    }
    protected void grabarPropiedades()
    {
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        //Obtener la referencia
        TextBox objTxtDato = (TextBox)fvwProductos.FindControl("varReferenciaTextBox");
        //Obtener el id del producto
        string strIdProducto = objProcesos.obtenerIdProducto(objTxtDato.Text);
        //Validar si se obtuvo el id del producto
        if (strIdProducto != null)
        {
            //Validar si se está editando el producto, para borrar los valores anteriores
            if (fvwProductos.CurrentMode == FormViewMode.Edit)
                objProcesos.borrarValoresPropiedades(strIdProducto);
            //Obtener la grilla de las propiedades
            GridView gdvTemporal = (GridView)fvwProductos.FindControl("gdvPropiedades");
            foreach (GridViewRow r in gdvTemporal.Rows)
            {
                objProcesos.grabarPropiedadProducto(strIdProducto, gdvTemporal.DataKeys[r.RowIndex].Value.ToString(),
                    ((TextBox)r.Cells[2].FindControl("txtValorPropiedad")).Text);
            }
        }
    }
    protected void fvwProductos_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        grabarPropiedades();
        //Auditar creación
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Creando producto [" + ((TextBox)fvwProductos.FindControl("varReferenciaTextBox")).Text + "]", 1);
        Response.Redirect("lstProductos.aspx");
    }
    protected void fvwProductos_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        if (((Label)fvwProductos.FindControl("lblDatoOriginal")).Text != ((TextBox)fvwProductos.FindControl("varReferenciaTextBox")).Text)
            e.Cancel = validarDato();
        if (!e.Cancel)
            AlmacenarArchivo();
    }
    protected void fvwProductos_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        grabarPropiedades();
        //Auditar actualización
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        objProcesos.registrarAuditoria("Modificando producto [" + ((TextBox)fvwProductos.FindControl("varReferenciaTextBox")).Text + "]", 1);
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstProductos.aspx");
    }
    protected void GenerarNombreArchivo()
    {
        if (((FileUpload)fvwProductos.FindControl("fupImagen")).HasFile)
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
            FileUpload tempFileUpload = (FileUpload)fvwProductos.FindControl("fupImagen");
            //Agregar la ext al archivo
            strNombreArchivo = strNombreArchivo + tempFileUpload.FileName.Substring(tempFileUpload.FileName.LastIndexOf('.'));
            ((TextBox)fvwProductos.FindControl("varImagenTextBox")).Text = strNombreArchivo;
        }
        GenerarNombreAdjunto();
    }
    protected void GenerarNombreAdjunto()
    {
        if (((FileUpload)fvwProductos.FindControl("fupAdjunto")).HasFile)
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
            FileUpload tempFileUpload = (FileUpload)fvwProductos.FindControl("fupAdjunto");
            //Agregar la ext al archivo
            strNombreArchivo = strNombreArchivo + tempFileUpload.FileName.Substring(tempFileUpload.FileName.LastIndexOf('.'));
            ((TextBox)fvwProductos.FindControl("varArchivoAdjuntoTextBox")).Text = strNombreArchivo;
        }
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        GenerarNombreArchivo();
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        GenerarNombreArchivo();
    }
    protected void fvwProductos_DataBound(object sender, EventArgs e)
    {
        if (fvwProductos.CurrentMode == FormViewMode.ReadOnly)
        {
            HyperLink hlkTemp = ((HyperLink)fvwProductos.FindControl("varArchivoAdjunto"));
            if (hlkTemp.NavigateUrl == ConfigurationManager.AppSettings["vdAdjProductos"])
                hlkTemp.Visible = false;
        }
    }
    protected void numIVATextBox_Init(object sender, EventArgs e)
    {
        TextBox txtTemp = (TextBox)sender;
        txtTemp.Text = "0";
        
    }
    protected void numCantidadTextBox_Init(object sender, EventArgs e)
    {
        TextBox txtTemp = (TextBox)sender;
        txtTemp.Text = "0";
    }
    protected void numValorTextBox_Init(object sender, EventArgs e)
    {
        TextBox txtTemp = (TextBox)sender;
        txtTemp.Text = "0";
    }
}
