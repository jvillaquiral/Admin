<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspCategorias.aspx.cs" Inherits="dspCategorias" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Categorias.jpg" /><br />
    <asp:FormView ID="fvwCategorias" runat="server" DataKeyNames="idCategoria" DataSourceID="sdsCategorias" OnItemInserted="fvwCategorias_ItemInserted" OnItemInserting="fvwCategorias_ItemInserting" OnItemUpdating="fvwCategorias_ItemUpdating" OnItemUpdated="fvwCategorias_ItemUpdated">
        <EditItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Modificar Categoría<asp:Label ID="idCategoriaLabel1" runat="server" Text='<%# Eval("idCategoria") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>'></asp:TextBox>
                        <asp:Label ID="lblDatoOriginal" runat="server" Text='<%# Eval("varNombre") %>' Visible="False"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                                ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" Display="Dynamic"
                                ErrorMessage="La categoría ya existe"></asp:CustomValidator></td>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Padre</td>
                    <td class="valores">
                        <asp:TextBox ID="idPadreTextBox" runat="server" CssClass="textos" Text='<%# Bind("idPadre") %>' Visible="False"></asp:TextBox><asp:DropDownList
                            ID="ddlPadres" runat="server" CssClass="textos" DataSourceID="sdsPadres" DataTextField="varNombre"
                            DataValueField="idCategoria" OnDataBound="ddlPadres_DataBound" OnSelectedIndexChanged="ddlPadres_SelectedIndexChanged"
                            Width="137px">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsPadres" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idCategoria], [varNombre] FROM [Categorias] WHERE ([idCategoria] <> @idCategoria)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCategoriaLabel1" Name="idCategoria" PropertyName="Text"
                                    Type="Decimal" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:TextBox ID="idEstadoTextBox" runat="server" CssClass="textos" Text='<%# Bind("idEstado") %>' Visible="False"></asp:TextBox><asp:DropDownList
                            ID="ddlEstados" runat="server" CssClass="textos" DataSourceID="sdsEstados" DataTextField="varDescripcion"
                            DataValueField="idEstado" OnDataBound="ddlEstados_DataBound" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged"
                            Width="137px">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="idTipo" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                            CommandName="Update" ForeColor="White" Text="Modificar"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" Text="Cancelar"></asp:LinkButton>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                            ShowSummary="False" /></td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Nueva Categoría</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox"
                            Display="Dynamic" ErrorMessage="La categoría ya existe"></asp:CustomValidator></td>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaTextBox" runat="server" OnInit="dtmFechaTextBox_Init" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Padre</td>
                    <td class="valores">
                        <asp:TextBox ID="idPadreTextBox" runat="server" CssClass="textos" Text='<%# Bind("idPadre") %>' Visible="False"></asp:TextBox><asp:DropDownList
                            ID="ddlPadres" runat="server" CssClass="textos" DataSourceID="sdsPadres" DataTextField="varNombre"
                            DataValueField="idCategoria" OnDataBound="ddlPadres_DataBound" OnSelectedIndexChanged="ddlPadres_SelectedIndexChanged"
                            Width="137px">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsPadres" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idCategoria], [varNombre] FROM [Categorias]">
                        </asp:SqlDataSource>
                    </td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:TextBox ID="idEstadoTextBox" runat="server" CssClass="textos" Text='<%# Bind("idEstado") %>' Visible="False"></asp:TextBox><asp:DropDownList
                            ID="ddlEstados" runat="server" CssClass="textos" DataSourceID="sdsEstados" DataTextField="varDescripcion"
                            DataValueField="idEstado" OnDataBound="ddlEstados_DataBound" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged"
                            Width="137px">
                        </asp:DropDownList><asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="idTipo" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                            CommandName="Insert" ForeColor="White" Text="Grabar"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" Text="Cancelar" OnClick="InsertCancelButton_Click"></asp:LinkButton>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                            ShowSummary="False" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales<asp:Label ID="idCategoriaLabel" runat="server" Text='<%# Eval("idCategoria") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Padre</td>
                    <td class="valores">
                        <asp:Label ID="idPadreLabel" runat="server" Text='<%# Bind("NombrePadre") %>'></asp:Label></td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:Label ID="idEstadoLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                            CommandName="Edit" ForeColor="White" Text="Modificar"></asp:LinkButton></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [Categorias] WHERE [idCategoria] = @idCategoria" InsertCommand="INSERT INTO [Categorias] ([varNombre], [idPadre], [dtmFecha], [idEstado]) VALUES (@varNombre, @idPadre, @dtmFecha, @idEstado)"
        SelectCommand="SELECT Categorias.idCategoria, Categorias.varNombre, Categorias.idPadre, Categorias.dtmFecha, Categorias.idEstado, Categorias_1.varNombre AS NombrePadre, Estados.varDescripcion FROM Categorias LEFT OUTER JOIN Categorias AS Categorias_1 ON Categorias.idPadre = Categorias_1.idCategoria INNER JOIN Estados ON Categorias.idEstado = Estados.idEstado WHERE (Categorias.idCategoria = @idCategoria)"
        UpdateCommand="UPDATE [Categorias] SET [varNombre] = @varNombre, [idPadre] = @idPadre, [dtmFecha] = @dtmFecha, [idEstado] = @idEstado WHERE [idCategoria] = @idCategoria">
        <DeleteParameters>
            <asp:Parameter Name="idCategoria" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idPadre" Type="Decimal" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="idCategoria" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idCategoria" QueryStringField="IdCategoria" Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idPadre" Type="Decimal" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="idEstado" Type="Int16" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Listado" OnClick="btnListado_Click" CausesValidation="False" />
</asp:Content>

