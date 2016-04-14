<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspPropiedades.aspx.cs" Inherits="dspPropiedades" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Propiedades.jpg" /><br />
    <asp:FormView ID="fvwPropiedades" runat="server" DataKeyNames="idPropiedad" DataSourceID="sdsPropiedades" OnItemInserted="fvwPropiedades_ItemInserted" OnItemInserting="fvwPropiedades_ItemInserting" OnItemUpdating="fvwPropiedades_ItemUpdating" OnItemUpdated="fvwPropiedades_ItemUpdated">
        <EditItemTemplate><table style="width: 500px; text-align: left">
            <tr>
                <td class="titulos" colspan="4">
                    Modicar Propiedad<asp:Label ID="idPropiedadLabel1" runat="server" Text='<%# Eval("idPropiedad") %>'>
            </asp:Label></td>
            </tr>
            <tr>
                <td class="campos">
                    Nombre</td>
                <td class="valores">
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>' CssClass="textos" OnInit="varNombreTextBox_Init"></asp:TextBox><asp:Label
                ID="lblDatoOriginal" runat="server" Text='<%# Eval("varNombre") %>' Visible="False"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                        Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" ErrorMessage="La propiedad ya existe"></asp:CustomValidator></td>
                <td class="campos">
                    Fecha</td>
                <td class="valores">
                    <asp:Label ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
            </tr>
            <tr>
                <td class="campos">
                    Valor. Predet.</td>
                <td class="valores">
            <asp:TextBox ID="varPredeterminadoTextBox" runat="server" Text='<%# Bind("varPredeterminado") %>' CssClass="textos"></asp:TextBox></td>
                <td class="campos">
                    Estado</td>
                <td class="valores">
            <asp:TextBox ID="idEstadoTextBox" runat="server" Text='<%# Bind("idEstado") %>' CssClass="textos" Visible="False"></asp:TextBox><asp:DropDownList
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
                    &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Modificar" ForeColor="White"></asp:LinkButton>
                    &nbsp; &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar" ForeColor="White"></asp:LinkButton><asp:ValidationSummary ID="ValidationSummary1"
                    runat="server" ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
        </table>
        </EditItemTemplate>
        <InsertItemTemplate><table style="width: 500px; text-align: left">
            <tr>
                <td class="titulos" colspan="4">
                    Nueva Propiedad</td>
            </tr>
            <tr>
                <td class="campos">
                    Nombre</td>
                <td class="valores">
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>' CssClass="textos"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                    ID="cvlExistencia" runat="server" ControlToValidate="varNombreTextBox" ErrorMessage="La propiedad ya existe"></asp:CustomValidator></td>
                <td class="campos">
                    Fecha</td>
                <td class="valores">
                    <asp:Label ID="dtmFechaTextBox" runat="server" OnInit="dtmFechaTextBox_Init" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
            </tr>
            <tr>
                <td class="campos">
                    Valor. Predet.</td>
                <td class="valores">
            <asp:TextBox ID="varPredeterminadoTextBox" runat="server" Text='<%# Bind("varPredeterminado") %>' CssClass="textos"></asp:TextBox></td>
                <td class="campos">
                    Estado</td>
                <td class="valores">
            <asp:TextBox ID="idEstadoTextBox" runat="server" Text='<%# Bind("idEstado") %>' CssClass="textos" Visible="False"></asp:TextBox>
                    <asp:DropDownList ID="ddlEstados" runat="server" CssClass="textos" DataSourceID="sdsEstados"
                        DataTextField="varDescripcion" DataValueField="idEstado" OnDataBound="ddlEstados_DataBound"
                        OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged" Width="137px">
                    </asp:DropDownList>
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
                    &nbsp; &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Crear" ForeColor="White"></asp:LinkButton>
                    &nbsp; &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar" ForeColor="White" OnClick="InsertCancelButton_Click"></asp:LinkButton>
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
                        Datos Generales<asp:Label ID="idPropiedadLabel" runat="server" Text='<%# Eval("idPropiedad") %>' Visible="False"></asp:Label></td>
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
                        Valor. Predet.</td>
                    <td class="valores">
            <asp:Label ID="varPredeterminadoLabel" runat="server" Text='<%# Bind("varPredeterminado") %>'></asp:Label></td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
            <asp:Label ID="idEstadoLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Modificar" ForeColor="White"></asp:LinkButton></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsPropiedades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [Propiedades] WHERE [idPropiedad] = @idPropiedad"
        InsertCommand="INSERT INTO [Propiedades] ([varNombre], [idEstado], [varPredeterminado], [dtmFecha]) VALUES (@varNombre, @idEstado, @varPredeterminado, @dtmFecha)"
        SelectCommand="SELECT Propiedades.idPropiedad, Propiedades.varNombre, Propiedades.idEstado, Propiedades.varPredeterminado, Propiedades.dtmFecha, Estados.varDescripcion FROM Propiedades INNER JOIN Estados ON Propiedades.idEstado = Estados.idEstado WHERE (Propiedades.idPropiedad = @idPropiedad)"
        UpdateCommand="UPDATE [Propiedades] SET [varNombre] = @varNombre, [idEstado] = @idEstado, [varPredeterminado] = @varPredeterminado, [dtmFecha] = @dtmFecha WHERE [idPropiedad] = @idPropiedad">
        <DeleteParameters>
            <asp:Parameter Name="idPropiedad" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="varPredeterminado" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="idPropiedad" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idPropiedad" QueryStringField="IdPropiedad" Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="varPredeterminado" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    &nbsp;
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" 
        Text="Listado" CausesValidation="False" OnClick="btnListado_Click" />
</asp:Content>

