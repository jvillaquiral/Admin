<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspSugerencias.aspx.cs" Inherits="Admin_dspSugerencias" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Sugerencias.jpg" />
    <asp:FormView ID="fvwSugerencias" runat="server" DataSourceID="sdsSugerencias">
        <EditItemTemplate>
            idSugerencia:
            <asp:Label ID="idSugerenciaLabel1" runat="server" Text='<%# Eval("idSugerencia") %>'>
            </asp:Label><br />
            varNombre:
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>'>
            </asp:TextBox><br />
            varDireccion:
            <asp:TextBox ID="varDireccionTextBox" runat="server" Text='<%# Bind("varDireccion") %>'>
            </asp:TextBox><br />
            varTelefono:
            <asp:TextBox ID="varTelefonoTextBox" runat="server" Text='<%# Bind("varTelefono") %>'>
            </asp:TextBox><br />
            varEmail:
            <asp:TextBox ID="varEmailTextBox" runat="server" Text='<%# Bind("varEmail") %>'>
            </asp:TextBox><br />
            varProducto:
            <asp:TextBox ID="varProductoTextBox" runat="server" Text='<%# Bind("varProducto") %>'>
            </asp:TextBox><br />
            varSugerencia:
            <asp:TextBox ID="varSugerenciaTextBox" runat="server" Text='<%# Bind("varSugerencia") %>'>
            </asp:TextBox><br />
            idEstado:
            <asp:TextBox ID="idEstadoTextBox" runat="server" Text='<%# Bind("idEstado") %>'>
            </asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'>
            </asp:TextBox><br />
            dtmFecha:
            <asp:TextBox ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha") %>'>
            </asp:TextBox><br />
            Ciudad:
            <asp:TextBox ID="CiudadTextBox" runat="server" Text='<%# Bind("Ciudad") %>'>
            </asp:TextBox><br />
            Departamento:
            <asp:TextBox ID="DepartamentoTextBox" runat="server" Text='<%# Bind("Departamento") %>'>
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
            varDireccion:
            <asp:TextBox ID="varDireccionTextBox" runat="server" Text='<%# Bind("varDireccion") %>'>
            </asp:TextBox><br />
            varTelefono:
            <asp:TextBox ID="varTelefonoTextBox" runat="server" Text='<%# Bind("varTelefono") %>'>
            </asp:TextBox><br />
            varEmail:
            <asp:TextBox ID="varEmailTextBox" runat="server" Text='<%# Bind("varEmail") %>'>
            </asp:TextBox><br />
            varProducto:
            <asp:TextBox ID="varProductoTextBox" runat="server" Text='<%# Bind("varProducto") %>'>
            </asp:TextBox><br />
            varSugerencia:
            <asp:TextBox ID="varSugerenciaTextBox" runat="server" Text='<%# Bind("varSugerencia") %>'>
            </asp:TextBox><br />
            idEstado:
            <asp:TextBox ID="idEstadoTextBox" runat="server" Text='<%# Bind("idEstado") %>'>
            </asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'>
            </asp:TextBox><br />
            dtmFecha:
            <asp:TextBox ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha") %>'>
            </asp:TextBox><br />
            Ciudad:
            <asp:TextBox ID="CiudadTextBox" runat="server" Text='<%# Bind("Ciudad") %>'>
            </asp:TextBox><br />
            Departamento:
            <asp:TextBox ID="DepartamentoTextBox" runat="server" Text='<%# Bind("Departamento") %>'>
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
                    <td class="titulos" colspan="6">
                        Datos Generales<asp:Label ID="idEstadoLabel" runat="server" Text='<%# Bind("idEstado") %>'
                            Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        No.</td>
                    <td class="valores">
                        <asp:Label ID="idSugerenciaLabel" runat="server" Text='<%# Eval("idSugerencia") %>'></asp:Label></td>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Ciudad/Dep.</td>
                    <td class="valores">
                        <asp:Label ID="CiudadLabel" runat="server" Text='<%# Bind("Ciudad") %>'></asp:Label>/<asp:Label
                            ID="DepartamentoLabel" runat="server" Text='<%# Bind("Departamento") %>'></asp:Label></td>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varDireccionLabel" runat="server" Text='<%# Bind("varDireccion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Telefono</td>
                    <td class="valores">
                        <asp:Label ID="varTelefonoLabel" runat="server" Text='<%# Bind("varTelefono") %>'></asp:Label></td>
                    <td class="campos">
                        E-mail</td>
                    <td class="valores" colspan="3">
                        <asp:HyperLink ID="hlkEmail" runat="server" NavigateUrl='<%# "mailto:"+Eval("varEmail") %>'
                            Text='<%# Eval("varEmail") %>'></asp:HyperLink></td>
                </tr>
                <tr>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Eval("dtmFecha", "{0:d}") %>'></asp:Label></td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varDescripcionLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label>
                        <asp:Button ID="btnAtendida" runat="server" CssClass="botones" OnClick="btnAtendida_Click"
                            Text="Atendida" Visible="False" /></td>
                </tr>
                <tr>
                    <td class="campos">
                        Producto</td>
                    <td class="valores" colspan="5">
                        <asp:Label ID="varProductoLabel" runat="server" Text='<%# Bind("varProducto") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Sugerencia</td>
                    <td class="valores" colspan="5">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="textos" Enabled="False" Height="80px"
                            Text='<%# Eval("varSugerencia") %>' Width="350px"></asp:TextBox></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsSugerencias" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Sugerencias.idSugerencia, Sugerencias.varNombre, Sugerencias.varDireccion, Sugerencias.varTelefono, Sugerencias.varEmail, Sugerencias.varProducto, Sugerencias.varSugerencia, Estados.idEstado, Estados.varDescripcion, Sugerencias.dtmFecha, Ciudades.varDescripcion AS Ciudad, Departamentos.varDescripcion AS Departamento FROM Estados INNER JOIN Sugerencias ON Estados.idEstado = Sugerencias.idEstado LEFT OUTER JOIN Departamentos INNER JOIN Ciudades ON Departamentos.idDepartamento = Ciudades.idDepartamento ON Sugerencias.idCiudad = Ciudades.idCiudad WHERE (Sugerencias.idSugerencia = @IdSugerencia)">
        <SelectParameters>
            <asp:QueryStringParameter Name="idSugerencia" QueryStringField="IdSugerencia" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" OnClick="btnListado_Click"
        Text="Listado" /><br />
</asp:Content>

