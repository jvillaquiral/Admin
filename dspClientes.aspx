<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspClientes.aspx.cs" Inherits="dspClientes" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Clientes.jpg" />
    <asp:FormView ID="fvwClientes" runat="server" DataKeyNames="idCliente" DataSourceID="sdsClientes" OnDataBound="fvwClientes_DataBound">
        <EditItemTemplate>
            idCliente:
            <asp:Label ID="idClienteLabel1" runat="server" Text='<%# Eval("idCliente") %>'></asp:Label><br />
            varNombre:
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>'>
            </asp:TextBox><br />
            dtmFecha:
            <asp:TextBox ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha") %>'>
            </asp:TextBox><br />
            varIdentificacion:
            <asp:TextBox ID="varIdentificacionTextBox" runat="server" Text='<%# Bind("varIdentificacion") %>'>
            </asp:TextBox><br />
            idTipoIdentificacion:
            <asp:TextBox ID="idTipoIdentificacionTextBox" runat="server" Text='<%# Bind("idTipoIdentificacion") %>'>
            </asp:TextBox><br />
            varRepLegal:
            <asp:TextBox ID="varRepLegalTextBox" runat="server" Text='<%# Bind("varRepLegal") %>'>
            </asp:TextBox><br />
            varUsuario:
            <asp:TextBox ID="varUsuarioTextBox" runat="server" Text='<%# Bind("varUsuario") %>'>
            </asp:TextBox><br />
            varClave:
            <asp:TextBox ID="varClaveTextBox" runat="server" Text='<%# Bind("varClave") %>'>
            </asp:TextBox><br />
            idEstado:
            <asp:TextBox ID="idEstadoTextBox" runat="server" Text='<%# Bind("idEstado") %>'>
            </asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'>
            </asp:TextBox><br />
            varDireccion:
            <asp:TextBox ID="varDireccionTextBox" runat="server" Text='<%# Bind("varDireccion") %>'>
            </asp:TextBox><br />
            varTelefono:
            <asp:TextBox ID="varTelefonoTextBox" runat="server" Text='<%# Bind("varTelefono") %>'>
            </asp:TextBox><br />
            varCelular:
            <asp:TextBox ID="varCelularTextBox" runat="server" Text='<%# Bind("varCelular") %>'>
            </asp:TextBox><br />
            varEMail:
            <asp:TextBox ID="varEMailTextBox" runat="server" Text='<%# Bind("varEMail") %>'>
            </asp:TextBox><br />
            idSexo:
            <asp:TextBox ID="idSexoTextBox" runat="server" Text='<%# Bind("idSexo") %>'>
            </asp:TextBox><br />
            dtmFechaNacimiento:
            <asp:TextBox ID="dtmFechaNacimientoTextBox" runat="server" Text='<%# Bind("dtmFechaNacimiento") %>'>
            </asp:TextBox><br />
            blnPublicidad:
            <asp:CheckBox ID="blnPublicidadCheckBox" runat="server" Checked='<%# Bind("blnPublicidad") %>' /><br />
            varDesEstado:
            <asp:TextBox ID="varDesEstadoTextBox" runat="server" Text='<%# Bind("varDesEstado") %>'>
            </asp:TextBox><br />
            varDesTipoID:
            <asp:TextBox ID="varDesTipoIDTextBox" runat="server" Text='<%# Bind("varDesTipoID") %>'>
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
            dtmFecha:
            <asp:TextBox ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha") %>'>
            </asp:TextBox><br />
            varIdentificacion:
            <asp:TextBox ID="varIdentificacionTextBox" runat="server" Text='<%# Bind("varIdentificacion") %>'>
            </asp:TextBox><br />
            idTipoIdentificacion:
            <asp:TextBox ID="idTipoIdentificacionTextBox" runat="server" Text='<%# Bind("idTipoIdentificacion") %>'>
            </asp:TextBox><br />
            varRepLegal:
            <asp:TextBox ID="varRepLegalTextBox" runat="server" Text='<%# Bind("varRepLegal") %>'>
            </asp:TextBox><br />
            varUsuario:
            <asp:TextBox ID="varUsuarioTextBox" runat="server" Text='<%# Bind("varUsuario") %>'>
            </asp:TextBox><br />
            varClave:
            <asp:TextBox ID="varClaveTextBox" runat="server" Text='<%# Bind("varClave") %>'>
            </asp:TextBox><br />
            idEstado:
            <asp:TextBox ID="idEstadoTextBox" runat="server" Text='<%# Bind("idEstado") %>'>
            </asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'>
            </asp:TextBox><br />
            varDireccion:
            <asp:TextBox ID="varDireccionTextBox" runat="server" Text='<%# Bind("varDireccion") %>'>
            </asp:TextBox><br />
            varTelefono:
            <asp:TextBox ID="varTelefonoTextBox" runat="server" Text='<%# Bind("varTelefono") %>'>
            </asp:TextBox><br />
            varCelular:
            <asp:TextBox ID="varCelularTextBox" runat="server" Text='<%# Bind("varCelular") %>'>
            </asp:TextBox><br />
            varEMail:
            <asp:TextBox ID="varEMailTextBox" runat="server" Text='<%# Bind("varEMail") %>'>
            </asp:TextBox><br />
            idSexo:
            <asp:TextBox ID="idSexoTextBox" runat="server" Text='<%# Bind("idSexo") %>'>
            </asp:TextBox><br />
            dtmFechaNacimiento:
            <asp:TextBox ID="dtmFechaNacimientoTextBox" runat="server" Text='<%# Bind("dtmFechaNacimiento") %>'>
            </asp:TextBox><br />
            blnPublicidad:
            <asp:CheckBox ID="blnPublicidadCheckBox" runat="server" Checked='<%# Bind("blnPublicidad") %>' /><br />
            varDesEstado:
            <asp:TextBox ID="varDesEstadoTextBox" runat="server" Text='<%# Bind("varDesEstado") %>'>
            </asp:TextBox><br />
            varDesTipoID:
            <asp:TextBox ID="varDesTipoIDTextBox" runat="server" Text='<%# Bind("varDesTipoID") %>'>
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
                        Datos Generales<asp:Label ID="idClienteLabel" runat="server" Text='<%# Eval("idCliente") %>'
                            Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label>
                        <asp:Label ID="varApellidoLabel" runat="server" Text='<%# Bind("varApellido") %>'></asp:Label></td>
                    <td class="campos">
                        Fecha Reg.</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        País</td>
                    <td class="valores">
                        <asp:Label ID="varPaisLabel" runat="server" Text='<%# Eval("varPais") %>'></asp:Label></td>
                    <td class="campos">
                        Departamento</td>
                    <td class="valores">
                        <asp:Label ID="varDepartamentoLabel" runat="server" Text='<%# Eval("varDepartamento") %>'></asp:Label></td>
                    <td class="campos">
                        Ciudad</td>
                    <td class="valores">
                        <asp:Label ID="varCiudadLabel" runat="server" Text='<%# Eval("varCiudad") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores" colspan="5">
                        <asp:Label ID="varDireccionLabel" runat="server" Text='<%# Bind("varDireccion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Tel</td>
                    <td class="valores">
                        <asp:Label ID="varTelefonoLabel" runat="server" Text='<%# Bind("varTelefono") %>'></asp:Label></td>
                    <td class="campos">
                        Celular</td>
                    <td class="valores">
                        <asp:Label ID="varCelularLabel" runat="server" Text='<%# Bind("varCelular") %>'></asp:Label></td>
                    <td class="campos">
                        E-Mail</td>
                    <td class="valores">
                        <asp:Label ID="varEMailLabel" runat="server" Text='<%# Bind("varEMail") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Clientes.idCliente, Clientes.varNombre, Clientes.dtmFecha, Clientes.varIdentificacion, Clientes.idTipoIdentificacion, Clientes.varRepLegal, Clientes.varUsuario, Clientes.varClave, Clientes.idEstado, Clientes.varDireccion, Clientes.varTelefono, Clientes.varCelular, Clientes.varEMail, Clientes.idSexo, Clientes.dtmFechaNacimiento, Clientes.blnPublicidad, TiposIdentificaciones.varDescripcion AS varDesTipoID, Clientes.varApellido, Clientes.varPais, Clientes.varCiudad, Clientes.varDepartamento FROM Clientes INNER JOIN TiposIdentificaciones ON Clientes.idTipoIdentificacion = TiposIdentificaciones.idTipoIdentificacion WHERE (Clientes.idCliente = @IdCliente)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IdCliente" QueryStringField="IdCliente" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;<br />
    <asp:GridView ID="gdvDatos" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataSourceID="sdsDatos" Width="300px">
        <Columns>
            <asp:BoundField DataField="varNombre" HeaderText="Dato Personal" SortExpression="varNombre" />
            <asp:BoundField DataField="varValor" HeaderText="Valor" SortExpression="varValor" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDatos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT DatosPersonales.varNombre, DatosPersonalesClientes.varValor FROM DatosPersonales INNER JOIN DatosPersonalesClientes ON DatosPersonales.idDatoPersonal = DatosPersonalesClientes.idDatoPersonal WHERE (DatosPersonalesClientes.idCliente = @IdCliente)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IdCliente" QueryStringField="IdCliente" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Listado" OnClick="btnListado_Click" />
</asp:Content>

