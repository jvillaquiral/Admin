<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dspFecha.aspx.cs" Inherits="dspFecha" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Seleccione la fecha</title>
    <link href="cssPrincipal.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function btnSeleccionar_onclick() {
    window.opener.aspnetForm.<%=Request.QueryString["Campo"].ToString()%>.value=form1.txtFecha.value;
    window.close();
}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="font-weight: bold; font-size: 14px; width: 330px; color: black; font-family: 'Tw Cen MT Condensed', Verdana;
            height: 150px">
            <tr>
                <td class="titulos" colspan="2" style="height: 20px; text-align: left">
                    Seleccione por favor la fecha deseada</td>
            </tr>
            <tr>
                <td rowspan="2">
                    <asp:Calendar ID="cldFechas" runat="server" BackColor="White" BorderColor="#999999"
                        CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                        ForeColor="Black" Height="180px" OnSelectionChanged="cldFechas_SelectionChanged"
                        Width="200px">
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <WeekendDayStyle BackColor="#CCCCCC" CssClass="campos" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <OtherMonthDayStyle ForeColor="Gray" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <DayHeaderStyle CssClass="campos" Font-Bold="True" Font-Size="7pt" />
                        <TitleStyle CssClass="titulos" Font-Bold="True" ForeColor="White" Wrap="True" />
                    </asp:Calendar>
                </td>
                <td style="height: 100px; text-align: center">
                    <asp:TextBox ID="txtFecha" runat="server" CssClass="textos" Width="80px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="campos" style="text-align: center">
                    <input id="btnSeleccionar" class="textos" type="button" value="Seleccionar" onclick="return btnSeleccionar_onclick()" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
