<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstCategorias.aspx.cs" Inherits="lstCategorias" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Categorias.jpg" />&nbsp;<asp:TreeView ID="tvwCategorias"
        runat="server" BackColor="#D0D9E0" BorderColor="#E52020" BorderStyle="Solid"
        BorderWidth="10px" CssClass="botoncategoria" ImageSet="Msdn" NodeIndent="10"
        Width="141px">
        <ParentNodeStyle CssClass="botoncategoria" />
        <SelectedNodeStyle CssClass="botoncategoria" />
        <RootNodeStyle BorderStyle="None" CssClass="botoncategoria" Font-Bold="True" />
        <NodeStyle CssClass="botoncategoria" />
    </asp:TreeView>
    <br />
    <br />
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" OnClick="btnNuevo_Click"
        Text="Nuevo" />
</asp:Content>

