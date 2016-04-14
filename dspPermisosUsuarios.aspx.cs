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

public partial class dspPermisosUsuarios : System.Web.UI.Page
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
        //Validar acceso a la opción
        csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
        if (!objProcesos.validarAccesoAdmin())
            Response.Redirect("dspAccesoInvalido.aspx");
        else
            objProcesos.registrarAuditoria("Modificando permisos de usuarios", 1);

    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        validarConsultar();
    }
    protected void validarConsultar()
    {
        //Proceso para validar que si los check de modificar o crear
        //están activos, que también lo este el de consultar y que
        //si consultar esta inactivo también lo esten los otros dos
        GridViewRow objFila = gdvPermisos.SelectedRow;
        CheckBox chkModificar = (CheckBox)objFila.Cells[5].FindControl("CheckBox2");
        CheckBox chkCrear = (CheckBox)objFila.Cells[6].FindControl("CheckBox3");
        if ((chkModificar.Checked)||(chkCrear.Checked))
            ((CheckBox)objFila.Cells[4].FindControl("CheckBox1")).Checked=true;
    }
    protected void gdvPermisos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvPermisos.SelectedIndex = e.NewEditIndex;
        DropDownList1.Enabled = false;
    }
    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        validarConsultar();
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow objFila = gdvPermisos.SelectedRow;
        if (((CheckBox)objFila.Cells[4].FindControl("CheckBox1")).Checked==false)
        {
            ((CheckBox)objFila.Cells[5].FindControl("CheckBox2")).Checked=false;
            ((CheckBox)objFila.Cells[6].FindControl("CheckBox3")).Checked=false;
        }
    }
    protected void gdvPermisos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DropDownList1.Enabled = true;
    }
    protected void gdvPermisos_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        DropDownList1.Enabled = true;
    }
}
