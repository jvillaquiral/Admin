<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstPedidos.aspx.cs" Inherits="lstPedidos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Pedidos.jpg" /><br />
    <asp:GridView ID="gdvPedidos" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idPedido" DataSourceID="sdsPedidos"
        Width="500px">
        <Columns>
            <asp:BoundField DataField="idPedido" HeaderText="idPedido" InsertVisible="False"
                ReadOnly="True" SortExpression="idPedido" Visible="False" />
            <asp:TemplateField HeaderText="No Pedido" SortExpression="varNoPedido">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varNoPedido") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspPedidos.aspx?IdPedido="+Eval("idPedido") %>'
                        Text='<%# Eval("varNoPedido") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dtmFecha" HeaderText="Fecha" SortExpression="dtmFecha" DataFormatString="{0:d}" HtmlEncode="False" />
            <asp:BoundField DataField="varNombre" HeaderText="Cliente" SortExpression="varNombre" />
            <asp:BoundField DataField="varIdentificacion" HeaderText="C.C./NIT" SortExpression="varIdentificacion" />
            <asp:BoundField DataField="numValor" HeaderText="Valor T" SortExpression="numValor" DataFormatString="{0:c}" HtmlEncode="False" />
            <asp:BoundField DataField="varDescripcion" HeaderText="Estado" SortExpression="varDescripcion" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsPedidos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Pedidos.idPedido, Pedidos.varNoPedido, Pedidos.dtmFecha, Clientes.varNombre + ' ' + Clientes.varApellido AS varNombre, Clientes.varIdentificacion, Pedidos.numValor, Estados.varDescripcion FROM Clientes INNER JOIN Pedidos ON Clientes.idCliente = Pedidos.idCliente INNER JOIN Estados ON Pedidos.idEstado = Estados.idEstado">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnConsultar" runat="server" CssClass="botones" Text="Consultar" OnClick="btnConsultar_Click" />
    &nbsp; &nbsp;
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Exportar Listado" OnClick="btnListado_Click" />
    &nbsp;&nbsp;<asp:HiddenField ID="hdfFiltro" runat="server" />
</asp:Content>

