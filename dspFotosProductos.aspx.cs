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

public partial class dspFotosProductos : System.Web.UI.Page
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
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAcceso(3))
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Modificando las fotos para un producto", 1);
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        //Validar que no se pase del número máximo de fotos
        if (gdvFotos.Rows.Count >= 5)
            cvlNoFotosMax.IsValid = false;
        else
        {
            cvlNoFotosMax.IsValid = true;
            string strNombreFoto = AlmacenarFoto();
            if (strNombreFoto.Length != 0)
            {
                //Almacenar registro en bd
                csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
                objProcesos.grabarFoto(Request.QueryString["IdProducto"].ToString(), strNombreFoto, txtDescripcion.Text);
                objProcesos.registrarAuditoria("Agregando foto [" + strNombreFoto + "] para producto [" + Request.QueryString["IdProducto"].ToString() + "]", 1);
                gdvFotos.DataBind();
                txtDescripcion.Text = "";
            }
        }
    }
    protected string AlmacenarFoto()
    {
        try
        {
            if (fupImagen.HasFile)
            {
                //Definir el nombre para el archivo
                System.Random objRandomico = new System.Random();
                //Obtener un número randomico entre 1 y 100 por seguridad
                int intRandomico = objRandomico.Next(1, 100);
                //Obtener fecha y hora acutual
                DateTime dtmAhora = DateTime.Now;
                //Unir fecha, hora y randomico
                string strNombreArchivo = dtmAhora.ToString("s").Replace(":", "-") + "-" + intRandomico.ToString();
                //Agregar la ext al archivo
                strNombreArchivo = strNombreArchivo + fupImagen.FileName.Substring(fupImagen.FileName.LastIndexOf('.'));
                //Cargar el archivo al servidor
                fupImagen.SaveAs(ConfigurationManager.AppSettings["dirImgProductos"] + strNombreArchivo);
                return strNombreArchivo;
            }
            return "";
        }
        catch (Exception e)
        {
            //Notificar de error
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            objProcesos.registrarMensaje("Error al almacenar una foto adicional del producto con id [" +
                Request.QueryString["IdProducto"].ToString() + "]", e.Message, 1);
            Response.Redirect("dspMensajeInterior.aspx");
            return "";
        }
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("dspProductos.aspx?IdProducto=" + Request.QueryString["IdProducto"].ToString());
    }
}
