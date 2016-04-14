<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspUbicaciones.aspx.cs" Inherits="dspUbicaciones" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Ubicaciones.jpg" /><br />
    <asp:FormView ID="fvwUbicaciones" runat="server" DataKeyNames="idUbicacion" DataSourceID="sdsUbicaciones" OnItemInserted="fvwUbicaciones_ItemInserted" OnItemUpdated="fvwUbicaciones_ItemUpdated">
        <EditItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Modificar Ubicación
                        <asp:Label ID="idUbicacionLabel1" runat="server" Text='<%# Eval("idUbicacion") %>' Visible="False"></asp:Label>
                        <asp:TextBox ID="idEmpresaTextBox" runat="server" CssClass="textos" Text='<%# Bind("idEmpresa") %>' Visible="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="170px"></asp:TextBox><asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="campos">
                        Departamento</td>
                    <td class="valores">
                        <asp:Label ID="lblIdDepartamento" runat="server" Text='<%# Eval("idDepartamento") %>'
                            Visible="False"></asp:Label>
                        <asp:DropDownList ID="ddlDepartamentos" runat="server" CssClass="textos" DataSourceID="sdsDepartamentos"
                            DataTextField="varDescripcion" DataValueField="idDepartamento" OnDataBound="ddlDepartamentos_DataBound" Width="137px" AutoPostBack="True">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsDepartamentos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idDepartamento], [varDescripcion] FROM [Departamentos] ORDER BY [varDescripcion]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="campos">
                        Ciudad</td>
                    <td class="valores">
                        <asp:TextBox ID="idCiudadTextBox" runat="server" CssClass="textos" Text='<%# Bind("idCiudad") %>' Visible="False"></asp:TextBox><asp:DropDownList ID="ddlCiudades" runat="server" CssClass="textos" DataSourceID="sdsCiudades"
                            DataTextField="varDescripcion" DataValueField="idCiudad" OnDataBound="ddlCiudades_DataBound" Width="137px">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsCiudades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idCiudad], [varDescripcion] FROM [Ciudades] WHERE ([idDepartamento] = @idDepartamento) ORDER BY [varDescripcion]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlDepartamentos" Name="idDepartamento" PropertyName="SelectedValue"
                                    Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores">
                        <asp:TextBox ID="varDireccionTextBox" runat="server" CssClass="textos" Text='<%# Bind("varDireccion") %>' Width="170px"></asp:TextBox></td>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:TextBox ID="varTelefonoTextBox" runat="server" CssClass="textos" Text='<%# Bind("varTelefono") %>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Descripción</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varDescripcionTextBox" runat="server" CssClass="textos" Text='<%# Bind("varDescripcion") %>' Height="40px" TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Imagen</td>
                    <td class="valores" colspan="3"><asp:FileUpload ID="fupImagen" runat="server" CssClass="textos" Width="300px" />
                        <asp:TextBox ID="varImagenTextBox" runat="server" CssClass="textos" Text='<%# Bind("varImagen") %>' Visible="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            ForeColor="White" OnClick="UpdateButton_Click" Text="Modificar"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" Text="Cancelar"></asp:LinkButton><asp:ValidationSummary ID="vsyUbicaciones" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        <asp:TextBox ID="dtmFechaTextBox" runat="server" CssClass="textos" Text='<%# Bind("dtmFecha") %>' Visible="False"></asp:TextBox></td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Nueva Ubicación<asp:TextBox ID="idEmpresaTextBox" runat="server" CssClass="textos"
                            OnInit="idEmpresaTextBox_Init" Text='<%# Bind("idEmpresa") %>' Visible="False"></asp:TextBox>
                        <asp:TextBox ID="dtmFechaTextBox" runat="server" CssClass="textos" Text='<%# Bind("dtmFecha") %>' Visible="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="170px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox" Display="None"
                            ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="campos">
                        Departamento</td>
                    <td class="valores">
                        <asp:DropDownList ID="ddlDepartamentos" runat="server" CssClass="textos" DataSourceID="sdsDepartamentos"
                            DataTextField="varDescripcion" DataValueField="idDepartamento" Width="137px" AutoPostBack="True">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsDepartamentos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idDepartamento], [varDescripcion] FROM [Departamentos] ORDER BY [varDescripcion]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="campos">
                        Ciudad</td>
                    <td class="valores">
                        <asp:TextBox ID="idCiudadTextBox" runat="server" CssClass="textos" Text='<%# Bind("idCiudad") %>' Visible="False"></asp:TextBox><asp:DropDownList ID="ddlCiudades" runat="server" CssClass="textos" DataSourceID="sdsCiudades"
                            DataTextField="varDescripcion" DataValueField="idCiudad" OnDataBound="ddlCiudades_DataBound" Width="137px">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsCiudades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT idCiudad, varDescripcion FROM Ciudades WHERE (idDepartamento = @idDepartamento) ORDER BY varDescripcion">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlDepartamentos" Name="idDepartamento" PropertyName="SelectedValue"
                                    Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores">
                        <asp:TextBox ID="varDireccionTextBox" runat="server" CssClass="textos" Text='<%# Bind("varDireccion") %>' Width="170px"></asp:TextBox></td>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:TextBox ID="varTelefonoTextBox" runat="server" CssClass="textos" Text='<%# Bind("varTelefono") %>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Descripción</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varDescripcionTextBox" runat="server" CssClass="textos" Text='<%# Bind("varDescripcion") %>' Height="40px" TextMode="MultiLine" Width="360px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos">
                        Imagen</td>
                    <td class="valores" colspan="3"><asp:FileUpload ID="fupImagen" runat="server" CssClass="textos" Width="300px" />
                        <asp:TextBox ID="varImagenTextBox" runat="server" CssClass="textos" Text='<%# Bind("varImagen") %>' Visible="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            ForeColor="White" OnClick="InsertButton_Click" Text="Crear"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" OnClick="InsertCancelButton_Click" Text="Cancelar"></asp:LinkButton><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                    <td class="campos">
                        Ciudad - Departamento</td>
                    <td class="valores">
                        <asp:Label ID="varCiudadLabel" runat="server" Text='<%# Eval("varDesCiudad") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores">
                        <asp:Label ID="varDireccionLabel" runat="server" Text='<%# Bind("varDireccion") %>'></asp:Label></td>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:Label ID="varTelefonoLabel" runat="server" Text='<%# Bind("varTelefono") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Descripción</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varDescripcionLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Imagen</td>
                    <td class="valores" colspan="3" style="text-align: center">
                        &nbsp;<asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# ConfigurationManager.AppSettings["vdImgUbicaciones"]+Eval("varImagen") %>'
                            Width="100px" /></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            ForeColor="White" Text="Modificar"></asp:LinkButton><asp:Label ID="dtmFechaLabel"
                                runat="server" Text='<%# Bind("dtmFecha") %>' Visible="False"></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsUbicaciones" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [Ubicaciones] WHERE [idUbicacion] = @idUbicacion"
        InsertCommand="INSERT INTO [Ubicaciones] ([idEmpresa], [varNombre], [varDireccion], [idCiudad], [varTelefono], [varImagen], [varDescripcion], [dtmFecha]) VALUES (@idEmpresa, @varNombre, @varDireccion, @idCiudad, @varTelefono, @varImagen, @varDescripcion, @dtmFecha)"
        SelectCommand="SELECT Ubicaciones.idUbicacion, Ubicaciones.idEmpresa, Ubicaciones.varNombre, Ubicaciones.varDireccion, Ubicaciones.idCiudad, Ubicaciones.varTelefono, Ubicaciones.varImagen, Ubicaciones.varDescripcion, Ubicaciones.dtmFecha, Ciudades.varDescripcion + '/' + Departamentos.varDescripcion AS varDesCiudad, Ciudades.idDepartamento FROM Ubicaciones INNER JOIN Ciudades ON Ubicaciones.idCiudad = Ciudades.idCiudad INNER JOIN Departamentos ON Ciudades.idDepartamento = Departamentos.idDepartamento WHERE (Ubicaciones.idUbicacion = @idUbicacion)"
        UpdateCommand="UPDATE [Ubicaciones] SET [idEmpresa] = @idEmpresa, [varNombre] = @varNombre, [varDireccion] = @varDireccion, [idCiudad] = @idCiudad, [varTelefono] = @varTelefono, [varImagen] = @varImagen, [varDescripcion] = @varDescripcion, [dtmFecha] = @dtmFecha WHERE [idUbicacion] = @idUbicacion">
        <SelectParameters>
            <asp:QueryStringParameter Name="idUbicacion" QueryStringField="IdUbicacion" Type="Int16" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idUbicacion" Type="Int16" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idEmpresa" Type="Decimal" />
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="varDireccion" Type="String" />
            <asp:Parameter Name="idCiudad" Type="Decimal" />
            <asp:Parameter Name="varTelefono" Type="String" />
            <asp:Parameter Name="varImagen" Type="String" />
            <asp:Parameter Name="varDescripcion" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="idUbicacion" Type="Int16" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idEmpresa" Type="Decimal" />
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="varDireccion" Type="String" />
            <asp:Parameter Name="idCiudad" Type="Decimal" />
            <asp:Parameter Name="varTelefono" Type="String" />
            <asp:Parameter Name="varImagen" Type="String" />
            <asp:Parameter Name="varDescripcion" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" 
        Text="Listado" OnClick="btnListado_Click" CausesValidation="False" />
</asp:Content>

