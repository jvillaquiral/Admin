<%@ Page Language="C#" MasterPageFile="~/Admin/mpMenuInterno.master" AutoEventWireup="true" CodeFile="dspMensajeInterior.aspx.cs" Inherits="dspMensajeInterior" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/Imagenes/avisoAyuda.jpg" /><br />
    <br />
    <table style="width: 350px; text-align: left">
        <tr>
            <td class="titulos" colspan="2">
                <strong>
                ¡ Atención !</strong></td>
        </tr>
        <tr>
            <td class="campos" colspan="2" style="text-align: justify">
                &nbsp;<br />
                Se ha generado un fallo en el sistema, por favor intente nuevamente y si el inconveniente
                persiste, comuníquese con nosotros a través de uno de los siguientes mecanismos:<br />
                &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="valores" style="text-align: justify">
                <strong>
                Teléfono Fijo</strong></td>
            <td class="valores" style="text-align: justify">
                6811804</td>
        </tr>
        <tr>
            <td class="valores" style="text-align: justify">
                <strong>
                Celular</strong></td>
            <td class="valores" style="text-align: justify">
                3164424140</td>
        </tr>
        <tr>
            <td class="valores" style="text-align: justify">
                <strong>
                Correo Electrónico</strong></td>
            <td class="valores" style="text-align: justify">
                soporte@plataformaweb.com</td>
        </tr>
        <tr>
            <td class="valores" style="text-align: justify">
                <strong>
                Soporte en línea</strong></td>
            <td class="valores" style="text-align: justify">
                <asp:HyperLink ID="lnkSoporte" runat="server" Target="_blank">Haga clic aquí para reportar su caso</asp:HyperLink></td>
        </tr>
        <tr>
            <td class="campos" colspan="2" style="text-align: center">
                <asp:Button ID="btnContinuar" runat="server" CausesValidation="False" CssClass="botones"
                    OnClick="btnVolver_Click" Text="Continuar" /></td>
        </tr>
    </table>
</asp:Content>

