<%@ Page Language="C#" MasterPageFile="~/Admin/mpMenuInterno.master" AutoEventWireup="true" CodeFile="dspMenuPrincipal.aspx.cs" Inherits="dspMenuPrincipal" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="vertical-align: middle; width: 800px; height: 430px; text-align: center">
        <tr>
            <td>
                <asp:ImageButton ID="btnProductos" runat="server" ImageUrl="~/Admin/Imagenes/btnMenuProductos.jpg"
                    OnClick="btnProductos_Click" /></td>
            <td>
                <asp:ImageButton ID="btnPedidos" runat="server" ImageUrl="~/Admin/Imagenes/btnMenuPedidos.jpg"
                    OnClick="btnPedidos_Click" /></td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ID="btnClientes" runat="server" ImageUrl="~/Admin/Imagenes/btnMenuClientes.jpg"
                    OnClick="btnClientes_Click" /></td>
            <td>
                <asp:ImageButton ID="btnSalida" runat="server" ImageUrl="~/Admin/Imagenes/btnMenuSalida.jpg" OnClick="btnSalida_Click" /></td>
        </tr>
    </table>
</asp:Content>

