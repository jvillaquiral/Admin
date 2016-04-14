<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstUsuarios.aspx.cs" Inherits="lstUsuarios" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Usuarios.jpg" /><br />
    <asp:GridView ID="gdvUsuarios" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idUsuario" DataSourceID="sdsUsuarios"
        Width="350px">
        <Columns>
            <asp:TemplateField HeaderText="Usuario" SortExpression="varUsuario">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varUsuario") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspUsuarios.aspx?IdUsuario="+Eval("idUsuario") %>'
                        Text='<%# Eval("varUsuario") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="idUsuario" HeaderText="idUsuario" InsertVisible="False"
                ReadOnly="True" SortExpression="idUsuario" Visible="False" />
            <asp:BoundField DataField="varNombre" HeaderText="Nombre" SortExpression="Nombre" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT [varUsuario], [idUsuario], [varNombre] FROM [Usuarios]"></asp:SqlDataSource>
    <br />
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" OnClick="btnNuevo_Click"
        Text="Nuevo" />
</asp:Content>

