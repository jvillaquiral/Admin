<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="bsqProductos.aspx.cs" Inherits="bsqProductos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Productos.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="4">
                Ingrese los datos para la consulta</td>
        </tr>
        <tr>
            <td class="campos">
                Referencia</td>
            <td class="valores">
                <asp:TextBox ID="txtReferencia" runat="server" CssClass="textos"></asp:TextBox></td>
            <td class="campos">
                Nombre</td>
            <td class="valores">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="textos" Width="220px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Categor�a</td>
            <td class="valores">
                <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="textos" DataSourceID="sdsCategorias" DataTextField="varNombre" DataValueField="idCategoria" OnDataBound="ddlCategorias_DataBound">
                </asp:DropDownList><asp:SqlDataSource ID="sdsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idCategoria], [varNombre] FROM [Categorias]"></asp:SqlDataSource>
            </td>
            <td class="campos">
                Estado</td>
            <td class="valores">
                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="textos" DataSourceID="sdsEstados" DataTextField="varDescripcion" DataValueField="idEstado" OnDataBound="ddlEstados_DataBound">
                </asp:DropDownList><asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="idTipo" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="campos">
                Valor M�n.</td>
            <td class="valores" colspan="1">
                <asp:TextBox ID="txtVMin" runat="server" CssClass="textos" Enabled="False"></asp:TextBox>
                <asp:CompareValidator ID="cvlValorMin" runat="server" ControlToValidate="txtVMin"
                    Display="None" ErrorMessage="El campo valor m�nimo no contiene un n�mero v�lido"
                    Operator="DataTypeCheck" Type="Double"></asp:CompareValidator></td>
            <td class="campos">
                Valor M�x.</td>
            <td class="valores">
                <asp:TextBox ID="txtVMax" runat="server" CssClass="textos" Enabled="False"></asp:TextBox><asp:CompareValidator
                    ID="cvlValorMax" runat="server" ControlToValidate="txtVMax" Display="None" ErrorMessage="El campo valor m�ximo no contiene un n�mero v�lido"
                    Operator="DataTypeCheck" Type="Double"></asp:CompareValidator></td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
        ShowSummary="False" />
    <br />
    <asp:Button ID="btnConsultar" runat="server" CssClass="botones" Text="Consultar" OnClick="btnConsultar_Click" />
</asp:Content>

