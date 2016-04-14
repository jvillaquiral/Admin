<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstProductos.aspx.cs" Inherits="lstProductos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Productos.jpg" />&nbsp;<asp:GridView ID="gdvProductos" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idProducto" DataSourceID="sdsProductos"
        Width="500px">
        <Columns>
            <asp:BoundField DataField="idProducto" HeaderText="idProducto" InsertVisible="False"
                ReadOnly="True" SortExpression="idProducto" Visible="False" />
            <asp:TemplateField HeaderText="Referencia" SortExpression="varReferencia">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varReferencia") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspProductos.aspx?IdProducto="+Eval("idProducto") %>'
                        Text='<%# Eval("varReferencia") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="varNombre" HeaderText="Nombre" SortExpression="varNombre" />
            <asp:BoundField DataField="Expr1" HeaderText="Categor&#237;a" SortExpression="Expr1" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Productos.idProducto, Productos.varReferencia, Productos.varNombre, Categorias.varNombre AS Expr1, Productos.numValor, Productos.numCantidad FROM Productos INNER JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnConsultar" runat="server" CssClass="botones" Text="Consultar" OnClick="btnConsultar_Click" />
    &nbsp; &nbsp;
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" OnClick="btnNuevo_Click"
        Text="Nuevo" /><br />
    <br />
    &nbsp;<asp:Button ID="btnListado" runat="server" CssClass="botones"
        Text="Exportar Listado" OnClick="btnListado_Click" />
    &nbsp;&nbsp; &nbsp;<asp:Button ID="btnCantPrecios" runat="server" CssClass="botones"
        Text="Cantidades y Precios" OnClick="btnCantPrecios_Click" />
    <asp:HiddenField ID="hdfFiltro" runat="server" />
</asp:Content>

