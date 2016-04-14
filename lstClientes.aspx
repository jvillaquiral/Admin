<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstClientes.aspx.cs" Inherits="lstClientes" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Clientes.jpg" /><br />
    <asp:GridView ID="gdvClientes" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idCliente" DataSourceID="sdsClientes"
        Width="500px">
        <Columns>
            <asp:BoundField DataField="idCliente" HeaderText="idCliente" InsertVisible="False"
                ReadOnly="True" SortExpression="idCliente" Visible="False" />
            <asp:BoundField DataField="varNombre" HeaderText="Cliente" SortExpression="varNombre" />
            <asp:BoundField DataField="varCiudad" HeaderText="Ciudad" SortExpression="varCiudad" />
            <asp:BoundField DataField="varTelefono" HeaderText="Telefono" SortExpression="varTelefono" />
            <asp:BoundField DataField="varEMail" HeaderText="EMail" SortExpression="varEMail" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT idCliente, varIdentificacion, varNombre + ' ' + varApellido AS varNombre, varUsuario, varTelefono, varCiudad, varEMail FROM Clientes">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnConsultar" runat="server" CssClass="botones" Text="Consultar" OnClick="btnConsultar_Click" /><br />
    <asp:HiddenField ID="hdfFiltro" runat="server" />
</asp:Content>

