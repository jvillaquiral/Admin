<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspDatosEmpresa.aspx.cs" Inherits="dspDatosEmpresa" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_DatosEmpresa.jpg" /><br />
    <asp:FormView ID="fvwDatos" runat="server" DataSourceID="sdsEmpresa">
        <EditItemTemplate>
            varNombre:
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>'>
            </asp:TextBox><br />
            varIdentificacion:
            <asp:TextBox ID="varIdentificacionTextBox" runat="server" Text='<%# Bind("varIdentificacion") %>'>
            </asp:TextBox><br />
            varRepLegal:
            <asp:TextBox ID="varRepLegalTextBox" runat="server" Text='<%# Bind("varRepLegal") %>'>
            </asp:TextBox><br />
            idCiudad:
            <asp:TextBox ID="idCiudadTextBox" runat="server" Text='<%# Bind("idCiudad") %>'>
            </asp:TextBox><br />
            varDireccion:
            <asp:TextBox ID="varDireccionTextBox" runat="server" Text='<%# Bind("varDireccion") %>'>
            </asp:TextBox><br />
            varTelefono1:
            <asp:TextBox ID="varTelefono1TextBox" runat="server" Text='<%# Bind("varTelefono1") %>'>
            </asp:TextBox><br />
            varTelefono2:
            <asp:TextBox ID="varTelefono2TextBox" runat="server" Text='<%# Bind("varTelefono2") %>'>
            </asp:TextBox><br />
            varCelular:
            <asp:TextBox ID="varCelularTextBox" runat="server" Text='<%# Bind("varCelular") %>'>
            </asp:TextBox><br />
            varFax:
            <asp:TextBox ID="varFaxTextBox" runat="server" Text='<%# Bind("varFax") %>'>
            </asp:TextBox><br />
            varEmailComercial:
            <asp:TextBox ID="varEmailComercialTextBox" runat="server" Text='<%# Bind("varEmailComercial") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            varNombre:
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>'>
            </asp:TextBox><br />
            varIdentificacion:
            <asp:TextBox ID="varIdentificacionTextBox" runat="server" Text='<%# Bind("varIdentificacion") %>'>
            </asp:TextBox><br />
            varRepLegal:
            <asp:TextBox ID="varRepLegalTextBox" runat="server" Text='<%# Bind("varRepLegal") %>'>
            </asp:TextBox><br />
            idCiudad:
            <asp:TextBox ID="idCiudadTextBox" runat="server" Text='<%# Bind("idCiudad") %>'>
            </asp:TextBox><br />
            varDireccion:
            <asp:TextBox ID="varDireccionTextBox" runat="server" Text='<%# Bind("varDireccion") %>'>
            </asp:TextBox><br />
            varTelefono1:
            <asp:TextBox ID="varTelefono1TextBox" runat="server" Text='<%# Bind("varTelefono1") %>'>
            </asp:TextBox><br />
            varTelefono2:
            <asp:TextBox ID="varTelefono2TextBox" runat="server" Text='<%# Bind("varTelefono2") %>'>
            </asp:TextBox><br />
            varCelular:
            <asp:TextBox ID="varCelularTextBox" runat="server" Text='<%# Bind("varCelular") %>'>
            </asp:TextBox><br />
            varFax:
            <asp:TextBox ID="varFaxTextBox" runat="server" Text='<%# Bind("varFax") %>'>
            </asp:TextBox><br />
            varEmailComercial:
            <asp:TextBox ID="varEmailComercialTextBox" runat="server" Text='<%# Bind("varEmailComercial") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td colspan="6" class="titulos">
                        Datos Generales</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td colspan="3" class="valores">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                    <td class="campos">
                        Nit</td>
                    <td class="valores">
                        <asp:Label ID="varIdentificacionLabel" runat="server" Text='<%# Bind("varIdentificacion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Rep. Legal</td>
                    <td colspan="3" class="valores">
                        <asp:Label ID="varRepLegalLabel" runat="server" Text='<%# Bind("varRepLegal") %>'></asp:Label></td>
                    <td class="campos">
                        Ciudad</td>
                    <td class="valores">
                        <asp:Label ID="idCiudadLabel" runat="server" Text='<%# Eval("varDescripcion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td colspan="3" class="valores">
                        <asp:Label ID="varDireccionLabel" runat="server" Text='<%# Bind("varDireccion") %>'></asp:Label></td>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:Label ID="varTelefono1Label" runat="server" Text='<%# Bind("varTelefono1") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Teléfono 2</td>
                    <td class="valores">
                        <asp:Label ID="varTelefono2Label" runat="server" Text='<%# Bind("varTelefono2") %>'></asp:Label></td>
                    <td class="campos">
                        Celular</td>
                    <td class="valores">
                        <asp:Label ID="varCelularLabel" runat="server" Text='<%# Bind("varCelular") %>'></asp:Label></td>
                    <td class="campos">
                        Fax</td>
                    <td class="valores">
                        <asp:Label ID="varFaxLabel" runat="server" Text='<%# Bind("varFax") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        E-Mail</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varEmailComercialLabel" runat="server" Text='<%# Bind("varEmailComercial") %>'></asp:Label></td>
                    <td class="campos">
                        </td>
                    <td class="valores">
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Empresas.varNombre, Empresas.varIdentificacion, Empresas.varRepLegal, Ciudades.varDescripcion, Empresas.varDireccion, Empresas.varTelefono1, Empresas.varTelefono2, Empresas.varCelular, Empresas.varFax, Empresas.varEmailComercial FROM Empresas INNER JOIN Ciudades ON Empresas.idCiudad = Ciudades.idCiudad WHERE (Empresas.idEmpresa = @idEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idEmpresa" SessionField="IdEmpresaACWEB" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="fvwContactenos" runat="server" DataSourceID="sdsContactos">
        <EditItemTemplate>
            varEmailPedidos:
            <asp:TextBox ID="varEmailPedidosTextBox" runat="server" Text='<%# Bind("varEmailPedidos") %>'>
            </asp:TextBox><br />
            varEmailContactenos:
            <asp:TextBox ID="varEmailContactenosTextBox" runat="server" Text='<%# Bind("varEmailContactenos") %>'>
            </asp:TextBox><br />
            varTelefonoContactenos:
            <asp:TextBox ID="varTelefonoContactenosTextBox" runat="server" Text='<%# Bind("varTelefonoContactenos") %>'>
            </asp:TextBox><br />
            varDireccionContactenos:
            <asp:TextBox ID="varDireccionContactenosTextBox" runat="server" Text='<%# Bind("varDireccionContactenos") %>'>
            </asp:TextBox><br />
            varCelularContactenos:
            <asp:TextBox ID="varCelularContactenosTextBox" runat="server" Text='<%# Bind("varCelularContactenos") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            varEmailPedidos:
            <asp:TextBox ID="varEmailPedidosTextBox" runat="server" Text='<%# Bind("varEmailPedidos") %>'>
            </asp:TextBox><br />
            varEmailContactenos:
            <asp:TextBox ID="varEmailContactenosTextBox" runat="server" Text='<%# Bind("varEmailContactenos") %>'>
            </asp:TextBox><br />
            varTelefonoContactenos:
            <asp:TextBox ID="varTelefonoContactenosTextBox" runat="server" Text='<%# Bind("varTelefonoContactenos") %>'>
            </asp:TextBox><br />
            varDireccionContactenos:
            <asp:TextBox ID="varDireccionContactenosTextBox" runat="server" Text='<%# Bind("varDireccionContactenos") %>'>
            </asp:TextBox><br />
            varCelularContactenos:
            <asp:TextBox ID="varCelularContactenosTextBox" runat="server" Text='<%# Bind("varCelularContactenos") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td colspan="4" class="titulos">
                        Información de Contáctenos</td>
                </tr>
                <tr>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:Label ID="varTelefonoContactenosLabel" runat="server" Text='<%# Bind("varTelefonoContactenos") %>'></asp:Label></td>
                    <td class="campos">
                        Celular</td>
                    <td class="valores">
                        <asp:Label ID="varCelularContactenosLabel" runat="server" Text='<%# Bind("varCelularContactenos") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varDireccionContactenosLabel" runat="server" Text='<%# Bind("varDireccionContactenos") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        E-Mail</td>
                    <td class="valores">
                        <asp:Label ID="varEmailContactenosLabel" runat="server" Text='<%# Bind("varEmailContactenos") %>'></asp:Label></td>
                    <td class="campos">
                        Pedidos</td>
                    <td class="valores">
                        &nbsp;<asp:Label ID="varEmailPedidosLabel" runat="server" Text='<%# Bind("varEmailPedidos") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsContactos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT [varEmailPedidos], [varEmailContactenos], [varTelefonoContactenos], [varDireccionContactenos], [varCelularContactenos] FROM [Configuraciones] WHERE ([idEmpresa] = @idEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idEmpresa" SessionField="IdEmpresaACWEB" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="fvwSitios" runat="server" DataSourceID="sdsSitios">
        <EditItemTemplate>
            varURL:
            <asp:TextBox ID="varURLTextBox" runat="server" Text='<%# Bind("varURL") %>'>
            </asp:TextBox><br />
            varLogo:
            <asp:TextBox ID="varLogoTextBox" runat="server" Text='<%# Bind("varLogo") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            varURL:
            <asp:TextBox ID="varURLTextBox" runat="server" Text='<%# Bind("varURL") %>'>
            </asp:TextBox><br />
            varLogo:
            <asp:TextBox ID="varLogoTextBox" runat="server" Text='<%# Bind("varLogo") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td colspan="4" class="titulos" style="height: 21px">
                        Configuración del Sitio</td>
                </tr>
                <tr>
                    <td class="campos">
                        URL</td>
                    <td class="valores">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("varURL") %>'
                            Target="_blank" Text='<%# Bind("varURL") %>'></asp:HyperLink></td>
                    <td class="campos">
                        Logo</td>
                    <td class="valores" style="text-align: center">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "Imagenes/"+Eval("varLogo") %>' /></td>
                </tr>
                <tr>
                    <td class="campos">
                        Tipo de Envío</td>
                    <td class="valores">
                        <asp:Label ID="lblTipoEnvio" runat="server" Text='<%# Eval("TipoEnvio") %>'></asp:Label></td>
                    <td class="campos">
                        Costo General<br /> de Envío</td>
                    <td class="valores">
                        <asp:Label ID="lblCostoEnvio" runat="server" Text='<%# Eval("varValorEnvioGeneral", "{0:C}") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsSitios" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Sitios.varURL, Sitios.varLogo, CobrosEnvios.varDescripcion AS TipoEnvio, Configuraciones.varValorEnvioGeneral FROM Configuraciones INNER JOIN CobrosEnvios ON Configuraciones.idCobroEnvio = CobrosEnvios.idCobroEnvio INNER JOIN Sitios ON Configuraciones.idEmpresa = Sitios.idEmpresa WHERE (Sitios.idEmpresa = @idEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idEmpresa" SessionField="IdEmpresaACWEB" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnUbicaciones" runat="server" Text="Ubicaciones" CssClass="botones" OnClick="btnUbicaciones_Click" />
    &nbsp;
    <asp:Button ID="btnTextos" runat="server" Text="Textos" CssClass="botones" OnClick="btnTextos_Click" /><br />
</asp:Content>

