<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspDatosPersonales.aspx.cs" Inherits="dspDatosPersonales" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<img src="Imagenes/Titulos/tit_DatosPersonales.jpg" />
    <asp:FormView ID="fvwDatos" runat="server" DataKeyNames="idDatoPersonal" DataSourceID="sdsDatos" OnItemInserted="fvwDatos_ItemInserted" OnItemInserting="fvwDatos_ItemInserting" OnItemUpdating="fvwDatos_ItemUpdating" OnItemUpdated="fvwDatos_ItemUpdated">
        <EditItemTemplate>
            <table style="width: 350px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Modificar Dato Personal<asp:Label ID="idDatoPersonalLabel1" runat="server" Text='<%# Eval("idDatoPersonal") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="230px" OnInit="varNombreTextBox_Init"></asp:TextBox><asp:Label
                            ID="lblDatoOriginal" runat="server" Text='<%# Eval("varNombre") %>' Visible="False"></asp:Label><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                                    ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" ErrorMessage="El dato personal ya existe" Display="Dynamic"></asp:CustomValidator></td>
                </tr>
                <tr>
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
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp;
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            ForeColor="White" Text="Modificar"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" Text="Cancelar"></asp:LinkButton>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                            ShowSummary="False" />
                    </td>
                </tr>
            </table>
            &nbsp;
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 350px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Nuevo Dato Personal</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="230px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                                ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" ErrorMessage="El dato personal ya existe" Display="Dynamic"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Estado</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="idEstadoTextBox" runat="server" CssClass="textos" Text='<%# Bind("idEstado") %>' Visible="False"></asp:TextBox><asp:DropDownList
                            ID="ddlEstados" runat="server" CssClass="textos" DataSourceID="sdsEstados" DataTextField="varDescripcion"
                            DataValueField="idEstado" OnDataBound="ddlEstados_DataBound" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged"
                            Width="137px">
                        </asp:DropDownList><asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha") %>'></asp:Label>
                        <asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="idTipo" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                            CommandName="Insert" ForeColor="White" Text="Grabar" OnClick="InsertButton_Click"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" Text="Cancelar" OnClick="InsertCancelButton_Click"></asp:LinkButton>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                            ShowSummary="False" />
                    </td>
                </tr>
            </table>
            &nbsp;
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 350px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales<asp:Label ID="idDatoPersonalLabel" runat="server" Text='<%# Eval("idDatoPersonal") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:Label ID="idEstadoLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            ForeColor="White" Text="Modificar"></asp:LinkButton></td>
                </tr>
            </table>
            &nbsp;&nbsp;
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsDatos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [DatosPersonales] WHERE [idDatoPersonal] = @idDatoPersonal"
        InsertCommand="INSERT INTO [DatosPersonales] ([varNombre], [idEstado], [dtmFecha]) VALUES (@varNombre, @idEstado, @dtmFecha)"
        SelectCommand="SELECT DatosPersonales.idDatoPersonal, DatosPersonales.varNombre, DatosPersonales.idEstado, DatosPersonales.dtmFecha, Estados.varDescripcion FROM DatosPersonales INNER JOIN Estados ON DatosPersonales.idEstado = Estados.idEstado WHERE (DatosPersonales.idDatoPersonal = @idDatoPersonal)"
        UpdateCommand="UPDATE [DatosPersonales] SET [varNombre] = @varNombre, [idEstado] = @idEstado, [dtmFecha] = @dtmFecha WHERE [idDatoPersonal] = @idDatoPersonal">
        <DeleteParameters>
            <asp:Parameter Name="idDatoPersonal" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="idDatoPersonal" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idDatoPersonal" QueryStringField="IdDato" Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnListado" runat="server" CausesValidation="False" CssClass="botones"
        OnClick="btnListado_Click" Text="Listado" />
</asp:Content>

