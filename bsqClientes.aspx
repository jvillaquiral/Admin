<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="bsqClientes.aspx.cs" Inherits="bsqClientes" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Clientes.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="6">
                Ingrese los datos para la consulta</td>
        </tr>
        <tr>
            <td class="campos">
                Nombre</td>
            <td class="valores" colspan="3">
                <asp:TextBox ID="txtNomCliente" runat="server" CssClass="textos" Width="200px"></asp:TextBox></td>
            <td class="campos">
                País</td>
            <td class="valores">
                <asp:TextBox ID="txtPais" runat="server" CssClass="textos" Width="70px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Ciudad</td>
            <td class="valores">
                <asp:TextBox ID="txtCiudad" runat="server" CssClass="textos" Width="70px"></asp:TextBox></td>
            <td class="campos">
                Departamento</td>
            <td class="valores">
                <asp:TextBox ID="txtDpto" runat="server" CssClass="textos" Width="70px"></asp:TextBox></td>
            <td class="campos">
                Teléfono</td>
            <td class="valores">
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="textos" Width="70px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                E-Mail</td>
            <td class="valores" colspan="5">
                <asp:TextBox ID="txtEMail" runat="server" CssClass="textos" Width="200px"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnConsultar" runat="server" CssClass="botones" Text="Consultar" OnClick="btnConsultar_Click" />
</asp:Content>

