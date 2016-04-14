<%@ Page Language="C#" MasterPageFile="~/Admin/mpMenuInterno.master" AutoEventWireup="true" CodeFile="dspAccesoInvalido.aspx.cs" Inherits="dspAccesoInvalido" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Image ID="imgAviso" runat="server" ImageUrl="~/Admin/Imagenes/avisoSeguridad.jpg" /><br />
    <br />
    <table style="width: 350px; text-align: left">
        <tr>
            <td class="titulos" colspan="2">
                <strong>¡ Atención !</strong></td>
        </tr>
        <tr>
            <td class="valores" colspan="2" style="text-align: justify">
                &nbsp;<br />
                Ha ingresado a una opción a la cual no tiene acceso, por favor comuníquese con el
                funcionario de su empresa que administra el sistema, para que por favor configure
                su acceso a esta opción.&nbsp; Gracias.<br />
                &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="campos" colspan="2" style="text-align: center">
                <asp:Button ID="btnContinuar" runat="server" CausesValidation="False" CssClass="botones"
                    OnClick="btnVolver_Click" Text="Continuar" /></td>
        </tr>
    </table>
</asp:Content>

