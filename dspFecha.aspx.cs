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

public partial class dspFecha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            txtFecha.Text = DateTime.Today.ToString("yyyy-MM-dd");
    }
    protected void cldFechas_SelectionChanged(object sender, EventArgs e)
    {
        txtFecha.Text = cldFechas.SelectedDate.ToString("yyyy-MM-dd");
    }
}
