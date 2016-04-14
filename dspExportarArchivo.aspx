<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspExportarArchivo.aspx.cs" Inherits="dspExportarArchivo" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/Imagenes/avisoAyuda.jpg" /><br />
    <br />
    <table style="width: 250px; text-align: left">
        <tr>
            <td class="titulos">
                <asp:Label ID="lblTitulo" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="campos" style="text-align: justify">
                <br />
                El archivo ya fue generado con éxito por el sistema, por favor haga clic sobre el
                siguiente link para descargar el archivo en su máquina.<br />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="valores" style="text-align: center">
                <br />
                <br />
                <br />
                <asp:HyperLink ID="hlkDescarga" runat="server" Font-Bold="True" Target="_blank">Haga clic aquí</asp:HyperLink><br />
                <br />
                <br />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="campos" style="text-align: center">
                <asp:Button ID="btnVolver" runat="server" CausesValidation="False" CssClass="botones"
                    OnClick="btnVolver_Click" Text="Volver" /></td>
        </tr>
    </table>
</asp:Content>

