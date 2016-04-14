<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspUsuarios.aspx.cs" Inherits="dspUsuarios" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function btnCaducidad_onclick() {
    window.open('dspFecha.aspx?Campo=ctl00_ContentPlaceHolder1_fvwUsuarios_dtmCaducidadTextBox','fechacaducidad','height=250,width=350,scrollbar=yes');
}

// ]]>
</script>

    <img src="Imagenes/Titulos/tit_Usuarios.jpg" /><br />
    <asp:FormView ID="fvwUsuarios" runat="server" DataKeyNames="idUsuario" DataSourceID="sdsUsuarios" OnItemInserted="fvwUsuarios_ItemInserted" OnItemInserting="fvwUsuarios_ItemInserting" OnItemUpdated="fvwUsuarios_ItemUpdated">
        <EditItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales<asp:Label ID="idUsuarioLabel1" runat="server" Text='<%# Eval("idUsuario") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="230px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Usuario</td>
                    <td class="valores">
                        <asp:Label ID="varUsuarioTextBox" runat="server" Text='<%# Bind("varUsuario") %>'></asp:Label></td>
                    <td class="campos">
                        Clave</td>
                    <td class="valores">
                        <asp:TextBox ID="varClaveTextBox" runat="server" CssClass="textos" Text='<%# Bind("varClave") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="varClaveTextBox"
                            Display="None" ErrorMessage="El campo clave no puede ser vacío"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Email</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varEMailTextBox" runat="server" CssClass="textos" Text='<%# Bind("varEMail") %>' Width="230px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="varEMailTextBox"
                            Display="None" ErrorMessage="El campo email no puede ser vacío"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                    <td class="campos">
                        Caducidad</td>
                    <td class="valores">
                        <asp:TextBox ID="dtmCaducidadTextBox" runat="server" CssClass="textos" Text='<%# Bind("dtmCaducidad", "{0:d}") %>'></asp:TextBox><input id="Button1" class="textos" type="button"
                            value="+" onclick="return btnCaducidad_onclick()" /><asp:CompareValidator ID="cvlCaducidad"
                                runat="server" ControlToValidate="dtmCaducidadTextBox" Display="None" ErrorMessage="El campo fecha de caducidad no contiene una fecha válida"
                                Operator="DataTypeCheck" Type="Date"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            ForeColor="White" Text="Modificar"></asp:LinkButton>
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
                        Datos Generales</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varNombreTextBox" runat="server" CssClass="textos" Text='<%# Bind("varNombre") %>' Width="230px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="varNombreTextBox"
                            Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Usuario</td>
                    <td class="valores">
                        <asp:TextBox ID="varUsuarioTextBox" runat="server" CssClass="textos" Text='<%# Bind("varUsuario") %>' CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="varUsuarioTextBox"
                            Display="None" ErrorMessage="El campo usuario no puede ser vacío"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvlUsuario" runat="server" ControlToValidate="varUsuarioTextBox"
                            ErrorMessage="El usuario ya existe"></asp:CustomValidator></td>
                    <td class="campos">
                        Clave</td>
                    <td class="valores">
                        <asp:TextBox ID="varClaveTextBox" runat="server" CssClass="textos" Text='<%# Bind("varClave") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="varClaveTextBox"
                            Display="None" ErrorMessage="El campo clave no puede ser vacío"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Email</td>
                    <td class="valores" colspan="3">
                        <asp:TextBox ID="varEMailTextBox" runat="server" CssClass="textos" Text='<%# Bind("varEMail") %>' Width="230px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="varEMailTextBox"
                            Display="None" ErrorMessage="El campo email no puede ser vacío"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaTextBox" runat="server" OnInit="dtmFechaTextBox_Init" Text='<%# Bind("dtmFecha") %>'></asp:Label></td>
                    <td class="campos">
                        Caducidad</td>
                    <td class="valores">
                        <asp:TextBox ID="dtmCaducidadTextBox" runat="server" CssClass="textos" Text='<%# Bind("dtmCaducidad") %>'></asp:TextBox><input id="btnCaducidad" class="textos" type="button"
                            value="+" onclick="return btnCaducidad_onclick()" /><asp:CompareValidator ID="cvlCaducidad" runat="server" ControlToValidate="dtmCaducidadTextBox"
                                Display="None" ErrorMessage="El campo fecha de caducidad no contiene una fecha válida"
                                Operator="DataTypeCheck" Type="Date"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
                        Datos Generales<asp:Label ID="idUsuarioLabel" runat="server" Text='<%# Eval("idUsuario") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Usuario</td>
                    <td class="valores">
                        <asp:Label ID="varUsuarioLabel" runat="server" Text='<%# Bind("varUsuario") %>'></asp:Label></td>
                    <td class="campos">
                        Clave</td>
                    <td class="valores">
                        <asp:Label ID="varClaveLabel" runat="server" Text='<%# Bind("varClave") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Email</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varEMailLabel" runat="server" Text='<%# Bind("varEMail") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                    <td class="campos">
                        Caducidad</td>
                    <td class="valores">
                        <asp:Label ID="dtmCaducidadLabel" runat="server" Text='<%# Bind("dtmCaducidad", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="4" style="text-align: center">
                        &nbsp;<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            ForeColor="White" Text="Modificar"></asp:LinkButton></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [Usuarios] WHERE [idUsuario] = @idUsuario" InsertCommand="INSERT INTO [Usuarios] ([varNombre], [varUsuario], [varClave], [varEMail], [dtmFecha], [dtmCaducidad]) VALUES (@varNombre, @varUsuario, @varClave, @varEMail, @dtmFecha, @dtmCaducidad)"
        SelectCommand="SELECT [idUsuario], [varNombre], [varUsuario], [varClave], [varEMail], [dtmFecha], [dtmCaducidad] FROM [Usuarios] WHERE ([idUsuario] = @idUsuario)"
        UpdateCommand="UPDATE [Usuarios] SET [varNombre] = @varNombre, [varUsuario] = @varUsuario, [varClave] = @varClave, [varEMail] = @varEMail, [dtmFecha] = @dtmFecha, [dtmCaducidad] = @dtmCaducidad WHERE [idUsuario] = @idUsuario">
        <DeleteParameters>
            <asp:Parameter Name="idUsuario" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="varUsuario" Type="String" />
            <asp:Parameter Name="varClave" Type="String" />
            <asp:Parameter Name="varEMail" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="dtmCaducidad" Type="DateTime" />
            <asp:Parameter Name="idUsuario" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idUsuario" QueryStringField="IdUsuario" Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="varUsuario" Type="String" />
            <asp:Parameter Name="varClave" Type="String" />
            <asp:Parameter Name="varEMail" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="dtmCaducidad" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Listado" OnClick="btnListado_Click" CausesValidation="False" />
</asp:Content>

