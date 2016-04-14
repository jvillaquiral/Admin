<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspTextosEmpresa.aspx.cs" Inherits="dspTextosEmpresa" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_TextosSitio.jpg" /><br />
    <asp:FormView ID="fvwTextos" runat="server" DataSourceID="sdsTextos">
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="2">
                        Textos</td>
                </tr>
                <tr>
                    <td class="campos">
                        Historia</td>
                    <td class="valores">
                        <asp:TextBox ID="txtHistoria" runat="server" CssClass="textos" Enabled="False" Height="40px"
                            Text='<%# Bind("varHistoria") %>' TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Misión</td>
                    <td class="valores">
                        <asp:TextBox ID="txtMision" runat="server" CssClass="textos" Enabled="False" Height="40px"
                            Text='<%# Bind("varMision") %>' TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Visión</td>
                    <td class="valores">
                        <asp:TextBox ID="txtVision" runat="server" CssClass="textos" Enabled="False" Height="40px"
                            Text='<%# Bind("varVision") %>' TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Forma de
                        <br />
                        Pago</td>
                    <td class="valores">
                        <asp:TextBox ID="txtPago" runat="server" CssClass="textos" Enabled="False" Height="40px"
                            Text='<%# Bind("varPago") %>' TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Forma de<br />
                        Envío</td>
                    <td class="valores">
                        <asp:TextBox ID="txtEnvio" runat="server" CssClass="textos" Enabled="False" Height="40px"
                            Text='<%# Bind("varEnvio") %>' TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsTextos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT varHistoria, varMision, varVision, varPago, varEnvio FROM Configuraciones WHERE (idEmpresa = @idEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idEmpresa" SessionField="IdEmpresaACWEB" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnVolver" runat="server" CssClass="botones" OnClick="btnVolver_Click"
        Text="Volver" /><br />
</asp:Content>

