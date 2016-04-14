<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspCualificadores.aspx.cs" Inherits="dspCualificadores" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Cualificadores.jpg" /><br />
    <asp:FormView ID="fvwCualificadores" runat="server" DataKeyNames="idCualificador"
        DataSourceID="sdsCualificadores" OnItemInserted="fvwCualificadores_ItemInserted" OnItemInserting="fvwCualificadores_ItemInserting" OnItemUpdating="fvwCualificadores_ItemUpdating" OnItemUpdated="fvwCualificadores_ItemUpdated">
        <EditItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales<asp:Label ID="idCualificadorLabel1" runat="server" Text='<%# Eval("idCualificador") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="230px" OnInit="varNombreTextBox_Init"></asp:TextBox><asp:Label
                            ID="lblDatoOriginal" runat="server" Text='<%# Eval("varNombre") %>' Visible="False"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                                ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" ErrorMessage="El cualificador ya existe"></asp:CustomValidator></td>
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
                        <asp:Label ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="height: 18px; text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            ForeColor="White" Text="Modificar"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            ForeColor="White" Text="Cancelar"></asp:LinkButton>&nbsp;<asp:ValidationSummary ID="ValidationSummary1"
                                runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="230px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                                ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" ErrorMessage="El cualificador ya existe"></asp:CustomValidator></td>
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
                        <asp:Label ID="dtmFechaTextBox" runat="server" OnInit="dtmFechaTextBox_Init" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            ForeColor="White" Text="Grabar"></asp:LinkButton>
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
                        Datos Generales<asp:Label ID="idCualificadorLabel" runat="server" Text='<%# Eval("idCualificador") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" style="height: 18px">
                        Estado</td>
                    <td class="valores" style="height: 18px">
                        <asp:Label ID="idEstadoLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                    <td class="campos" style="height: 18px">
                        Fecha</td>
                    <td class="valores" style="height: 18px">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                            CommandName="Edit" ForeColor="White" Text="Modificar"></asp:LinkButton></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsCualificadores" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [Cualificadores] WHERE [idCualificador] = @idCualificador"
        InsertCommand="INSERT INTO [Cualificadores] ([varNombre], [idEstado], [dtmFecha]) VALUES (@varNombre, @idEstado, @dtmFecha)"
        SelectCommand="SELECT Cualificadores.idCualificador, Cualificadores.varNombre, Cualificadores.idEstado, Cualificadores.dtmFecha, Estados.varDescripcion FROM Cualificadores INNER JOIN Estados ON Cualificadores.idEstado = Estados.idEstado WHERE (Cualificadores.idCualificador = @idCualificador)"
        UpdateCommand="UPDATE [Cualificadores] SET [varNombre] = @varNombre, [idEstado] = @idEstado, [dtmFecha] = @dtmFecha WHERE [idCualificador] = @idCualificador">
        <DeleteParameters>
            <asp:Parameter Name="idCualificador" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="idCualificador" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idCualificador" QueryStringField="IdCualificador"
                Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Listado" OnClick="btnListado_Click" />
</asp:Content>

