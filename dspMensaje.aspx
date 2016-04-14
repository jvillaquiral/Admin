<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInicial.master" AutoEventWireup="true" CodeFile="dspMensaje.aspx.cs" Inherits="dspMensaje" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/Imagenes/avisoSeguridad.jpg" /><br />
    <br />
    <table style="width: 350px; text-align: left">
        <tr>
            <td class="titulos" colspan="2">
                <strong>¡ Atención !</strong></td>
        </tr>
        <tr>
            <td class="campos" colspan="2" style="text-align: justify">
                &nbsp;<br />
                Acceso no autorizado, ingrese nuevamente su usuario y clave para tener acceso al
                sistema. &nbsp;<br />
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

