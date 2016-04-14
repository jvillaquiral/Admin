<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="bsqPedidos.aspx.cs" Inherits="bsqPedidos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function btnDesde_onclick() {
    window.open('dspFecha.aspx?Campo=ctl00_ContentPlaceHolder1_txtDesde','fechadesde','height=250,width=350,scrollbar=yes');
}

function btnHasta_onclick() {
    window.open('dspFecha.aspx?Campo=ctl00_ContentPlaceHolder1_txtHasta','fechahasta','height=250,width=350,scrollbar=yes');
}

// ]]>
</script>

    <img src="Imagenes/Titulos/tit_Pedidos.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="4">
                Ingrese los datos para la consulta</td>
        </tr>
        <tr>
            <td class="campos">
                No. Pedido</td>
            <td class="valores">
                <asp:TextBox ID="txtNoPedido" runat="server" CssClass="textos" Width="100px"></asp:TextBox></td>
            <td class="campos">
                Id Cliente</td>
            <td class="valores">
                <asp:TextBox ID="txtIdCliente" runat="server" CssClass="textos" Width="100px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Nombre Cliente</td>
            <td class="valores" colspan="3">
                <asp:TextBox ID="txtNomCliente" runat="server" CssClass="textos" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Apellido Cliente</td>
            <td class="valores" colspan="3">
                <asp:TextBox ID="txtApeCliente" runat="server" CssClass="textos" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Fecha Desde</td>
            <td class="valores">
                <asp:TextBox ID="txtDesde" runat="server" CssClass="textos" Width="70px"></asp:TextBox><input
                    id="btnDesde" class="textos" type="button" value="+" onclick="return btnDesde_onclick()" /><asp:CompareValidator
                        ID="cvlDesde" runat="server" ControlToValidate="txtDesde" Display="None" ErrorMessage="El campo fecha desde no contiene una fecha válida"
                        Operator="DataTypeCheck" Type="Date"></asp:CompareValidator></td>
            <td class="campos">
                Hasta</td>
            <td class="valores">
                <asp:TextBox ID="txtHasta" runat="server" CssClass="textos" Width="70px"></asp:TextBox><input
                    id="btnHasta" class="textos" type="button" value="+" onclick="return btnHasta_onclick()" /><asp:CompareValidator ID="cvlHasta" runat="server" ControlToValidate="txtHasta" Display="None"
                    ErrorMessage="El campo fecha hasta no contiene una fecha válida" Operator="DataTypeCheck"
                    Type="Date"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td class="campos">
                Nombre Producto</td>
            <td class="valores" colspan="3">
                <asp:TextBox ID="txtProducto" runat="server" CssClass="textos" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Referencia Producto</td>
            <td class="valores">
                <asp:TextBox ID="txtReferencia" runat="server" CssClass="textos" Width="100px"></asp:TextBox></td>
            <td class="campos">
                Estado</td>
            <td class="valores">
                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="textos" DataSourceID="sdsEstados" DataTextField="varDescripcion" DataValueField="idEstado" OnDataBound="ddlEstados_DataBound">
                </asp:DropDownList><asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="idTipo" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnConsultar" runat="server" CssClass="botones" Text="Consultar" OnClick="btnConsultar_Click" />
    <asp:ValidationSummary ID="vsyPedidos" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <asp:CompareValidator ID="cvlFechas" runat="server" ControlToCompare="txtDesde" ControlToValidate="txtHasta"
        Display="None" ErrorMessage="La fecha desde debe ser menor a la fecha hasta"
        Operator="GreaterThanEqual"></asp:CompareValidator>
</asp:Content>

