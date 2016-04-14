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

public partial class dspExportarArchivo : System.Web.UI.Page
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
            //Instanciar el objeto para ejecutar el proceso
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            //Obtener el filtro si lo hay
            string strFiltroListado = "";
            if (Session["FiltroArchivo"] != null)
            {
                strFiltroListado = Session["FiltroArchivo"].ToString();
                Session["FiltroArchivo"] = null;
            }
            //Obtener y validar el tipo de listado
            string strTipoListado = Request.QueryString["IdTipoListado"].ToString();
            string strArchivoGenerado;
            if (strTipoListado == "1")
            {
                //Listado de productos
                strArchivoGenerado = objProcesos.exportarProductos(ConfigurationManager.AppSettings["dirLstProductos"], "\t", ".csv", strFiltroListado);
                objProcesos.registrarAuditoria("El listado de productos fue exportado",1);
                //strArchivoGenerado = objProcesos.exportarProductos("C:\\", "\t", ".csv", strFiltroListado);
                if (strArchivoGenerado.Length == 0)
                {
                    objProcesos.registrarMensaje("Error al generar listado de productos", "Nombre del listado se encuentra vacío", 1);
                    Response.Redirect("dspMensajeInterior.aspx");
                }
                hlkDescarga.NavigateUrl = ConfigurationManager.AppSettings["vdLstProductos"] + strArchivoGenerado;
                //hlkDescarga.NavigateUrl = strArchivoGenerado;
                //Asingar foto
                Image1.ImageUrl = "Imagenes/Titulos/tit_Productos.jpg";
                //Asignar titulo
                lblTitulo.Text = "Listado de Productos";
                return;
            }
            if (strTipoListado == "2")
            {
                //Listado de pedidos
                strArchivoGenerado = objProcesos.exportarPedidos(ConfigurationManager.AppSettings["dirLstPedidos"], "\t", ".csv", strFiltroListado);
                objProcesos.registrarAuditoria("El listado de pedidos fue exportado", 1);
                //strArchivoGenerado = objProcesos.exportarPedidos("C:\\", "\t", ".csv", strFiltroListado);
                if (strArchivoGenerado.Length == 0)
                {
                    objProcesos.registrarMensaje("Error al generar listado de pedidos", "Nombre del listado se encuentra vacío", 1);
                    Response.Redirect("dspMensajeInterior.aspx");
                }
                hlkDescarga.NavigateUrl = ConfigurationManager.AppSettings["vdLstPedidos"] + strArchivoGenerado;
                //hlkDescarga.NavigateUrl = strArchivoGenerado;
                //Asingar foto
                Image1.ImageUrl = "Imagenes/Titulos/tit_Pedidos.jpg";
                //Asignar titulo
                lblTitulo.Text = "Listado de Pedidos";
                return;
            }
        }
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        //Validar el tipo de listado
        string strTipoListado = Request.QueryString["IdTipoListado"].ToString();
        if (strTipoListado == "1")
        {
            Response.Redirect("lstProductos.aspx");
        }
        if (strTipoListado == "2")
        {
            Response.Redirect("lstPedidos.aspx");
        }
    }
}
