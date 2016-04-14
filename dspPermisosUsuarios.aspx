<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspPermisosUsuarios.aspx.cs" Inherits="dspPermisosUsuarios" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_PermisosUsuarios.jpg" /><br />
    <table style="width: 300px; text-align: left">
        <tr>
            <td class="titulos" colspan="2">
                Seleccione el usuario y configure los permisos</td>
        </tr>
        <tr>
            <td class="campos">
                Usuario</td>
            <td class="valores">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textos" AutoPostBack="True" DataSourceID="sdsUsuarios" DataTextField="varUsuario" DataValueField="idUsuario">
                </asp:DropDownList><asp:SqlDataSource ID="sdsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idUsuario], [varUsuario] FROM [Usuarios] WHERE ([blnAdministrador] <> @blnAdministrador)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="blnAdministrador" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="gdvPermisos" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idUsuario,idPermiso" DataSourceID="sdsPermisos"
        Width="500px" OnRowEditing="gdvPermisos_RowEditing" OnRowCancelingEdit="gdvPermisos_RowCancelingEdit" OnRowUpdated="gdvPermisos_RowUpdated">
        <Columns>
            <asp:CommandField EditText="Modificar" ShowEditButton="True" />
            <asp:BoundField DataField="idUsuario" HeaderText="idUsuario" ReadOnly="True" SortExpression="idUsuario"
                Visible="False" />
            <asp:BoundField DataField="idPermiso" HeaderText="idPermiso" ReadOnly="True" SortExpression="idPermiso" Visible="False" />
            <asp:TemplateField HeaderText="Permiso" SortExpression="varNombre">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Consultar" SortExpression="blnConsultar">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("blnConsultar") %>' AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("blnConsultar") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Modificar" SortExpression="blnModificar">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("blnModificar") %>'
                        OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="True" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("blnModificar") %>'
                        Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Crear" SortExpression="blnCrear">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("blnCrear") %>' AutoPostBack="True" OnCheckedChanged="CheckBox3_CheckedChanged" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("blnCrear") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsPermisos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [PermisosUsuarios] WHERE [idUsuario] = @idUsuario AND [idPermiso] = @idPermiso"
        InsertCommand="INSERT INTO [PermisosUsuarios] ([idUsuario], [idPermiso], [blnConsultar], [blnModificar], [blnCrear]) VALUES (@idUsuario, @idPermiso, @blnConsultar, @blnModificar, @blnCrear)"
        SelectCommand="SELECT PermisosUsuarios.idUsuario, PermisosUsuarios.idPermiso, PermisosUsuarios.blnConsultar, PermisosUsuarios.blnModificar, PermisosUsuarios.blnCrear, Permisos.varNombre FROM PermisosUsuarios INNER JOIN Permisos ON PermisosUsuarios.idPermiso = Permisos.idPermiso WHERE (PermisosUsuarios.idUsuario = @idUsuario)"
        UpdateCommand="UPDATE [PermisosUsuarios] SET [blnConsultar] = @blnConsultar, [blnModificar] = @blnModificar, [blnCrear] = @blnCrear WHERE [idUsuario] = @idUsuario AND [idPermiso] = @idPermiso">
        <DeleteParameters>
            <asp:Parameter Name="idUsuario" Type="Decimal" />
            <asp:Parameter Name="idPermiso" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="blnConsultar" Type="Boolean" />
            <asp:Parameter Name="blnModificar" Type="Boolean" />
            <asp:Parameter Name="blnCrear" Type="Boolean" />
            <asp:Parameter Name="idUsuario" Type="Decimal" />
            <asp:Parameter Name="idPermiso" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="idUsuario" PropertyName="SelectedValue"
                Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idUsuario" Type="Decimal" />
            <asp:Parameter Name="idPermiso" Type="Decimal" />
            <asp:Parameter Name="blnConsultar" Type="Boolean" />
            <asp:Parameter Name="blnModificar" Type="Boolean" />
            <asp:Parameter Name="blnCrear" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

