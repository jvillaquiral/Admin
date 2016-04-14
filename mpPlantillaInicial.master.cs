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

public partial class mpPlantillaInicial : System.Web.UI.MasterPage
{
    private string strConexion;
    private string strProceso;
    protected void Page_Load(object sender, EventArgs e)
    {
        strProceso = "0";
        strConexion = ConfigurationManager.ConnectionStrings["cnxBDPrincipal"].ConnectionString;
        cvlClaveInvalida.IsValid = true;
        cvlDatosInvalidos.IsValid = true;
    }
    protected void btnRegistro_Click(object sender, EventArgs e)
    {
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, txtUsuario.Text, strProceso);
        objProcesos.registrarAuditoria("Validando registro del usuario " + txtUsuario.Text, 2);
        string strRespuesta = objProcesos.validarRegistro(txtClave.Text);
        //Validar si usuario y clave no son válidos
        if (strRespuesta == "-1")
        {
            cvlDatosInvalidos.IsValid = false;
            objProcesos.registrarAuditoria("Usuario [" + txtUsuario.Text + "] y clave [" + txtClave.Text+"] no son válidos.", 2);
            return;
        }
        //Validar si la clave no es válida
        if (strRespuesta == "0")
        {
            cvlClaveInvalida.IsValid = false;
            objProcesos.registrarAuditoria("Usuario [" + txtUsuario.Text + "] no tiene clave [" + txtClave.Text + "] válida.", 2);
            return;
        }
        //Crear la variable de sesión para usuario
        Session["IdUsuarioACWEB"] = strRespuesta;
        //Obtener el id de la empresa
        Session["IdEmpresaACWEB"] = objProcesos.obtenerIdEmpresa();
        //Redireccionar a la página del menú central
        Response.Redirect("dspMenuPrincipal.aspx");
    }
}
