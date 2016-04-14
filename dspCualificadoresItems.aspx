<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dspCualificadoresItems.aspx.cs" Inherits="dspCualificadoresItems" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Cualificadores</title>
    <link href="cssPrincipal.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="font-weight: bold; font-size: 14px; color: black; font-family: 'Tw Cen MT Condensed', Verdana">
            <tr>
                <td>
        <asp:GridView ID="gdvCualificadores" runat="server" AutoGenerateColumns="False" DataKeyNames="idItem,idCualificador"
            DataSourceID="sdsCualificadores" Width="200px" EmptyDataText="No existen cualificadores pare este item">
            <RowStyle CssClass="valores" />
            <Columns>
                <asp:BoundField DataField="idItem" HeaderText="idItem" ReadOnly="True" SortExpression="idItem"
                    Visible="False" />
                <asp:BoundField DataField="idCualificador" HeaderText="idCualificador" ReadOnly="True"
                    SortExpression="idCualificador" Visible="False" />
                <asp:BoundField DataField="varNombre" HeaderText="Cualificador" SortExpression="varNombre" />
                <asp:BoundField DataField="varValor" HeaderText="Valor" SortExpression="varValor" />
            </Columns>
            <PagerStyle CssClass="campos" />
            <HeaderStyle CssClass="titulos" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsCualificadores" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
            SelectCommand="SELECT CualificadoresItems.idItem, CualificadoresItems.idCualificador, Cualificadores.varNombre, CualificadoresItems.varValor FROM CualificadoresItems INNER JOIN Cualificadores ON CualificadoresItems.idCualificador = Cualificadores.idCualificador WHERE (Cualificadores.idEstado = 1) AND (CualificadoresItems.idItem = @IdItem)">
            <SelectParameters>
                <asp:QueryStringParameter Name="IdItem" QueryStringField="IdItem" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
