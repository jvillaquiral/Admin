<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstCantidadesPrecios.aspx.cs" Inherits="lstCantidadesPrecios" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_CantidadesPrecios.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="5">
                Ingrese los datos para la consulta</td>
        </tr>
        <tr>
            <td class="campos">
                Referencia</td>
            <td class="valores">
                <asp:TextBox ID="txtReferencia" runat="server" CssClass="textos"></asp:TextBox></td>
            <td class="campos">
                Nombre</td>
            <td class="valores">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="textos" Width="150px"></asp:TextBox>
            </td>
            <td class="campos" style="text-align: center">
                <asp:Button ID="btnFiltrar" runat="server" CssClass="botones" Text="Filtrar" OnClick="btnFiltrar_Click" /></td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="gdvProductos" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idProducto" DataSourceID="sdsProductos"
        Width="500px" PageSize="15">
        <Columns>
            <asp:CommandField CancelText="Cancelar" EditText="Cambiar" ShowEditButton="True"
                UpdateText="Grabar" />
            <asp:BoundField DataField="idProducto" HeaderText="idProducto" InsertVisible="False"
                ReadOnly="True" SortExpression="idProducto" Visible="False" />
            <asp:TemplateField HeaderText="Referencia" SortExpression="varReferencia">
                <EditItemTemplate>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("varReferencia") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("varReferencia") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre" SortExpression="varNombre">
                <EditItemTemplate>
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cant." SortExpression="numCantidad">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="textos" Text='<%# Bind("numCantidad") %>'
                        Width="70px"></asp:TextBox>
                    <asp:CompareValidator ID="cvlCantidad" runat="server" ControlToValidate="TextBox3"
                        Display="None" ErrorMessage="Ingrese una cantidad válida" Operator="DataTypeCheck"
                        Type="Integer"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("numCantidad") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valor" SortExpression="numValor">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="textos" Text='<%# Bind("numValor", "{0:F}") %>'
                        Width="70px"></asp:TextBox>
                    <asp:CompareValidator ID="cvlValor" runat="server" ControlToValidate="TextBox4" Display="None"
                        ErrorMessage="Ingrese un precio válido" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("numValor", "{0:C}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="DELETE FROM [Productos] WHERE [idProducto] = @idProducto" InsertCommand="INSERT INTO [Productos] ([varReferencia], [varNombre], [numCantidad], [numValor]) VALUES (@varReferencia, @varNombre, @numCantidad, @numValor)"
        SelectCommand="SELECT [idProducto], [varReferencia], [varNombre], [numCantidad], [numValor] FROM [Productos] ORDER BY [dtmFecha] DESC"
        UpdateCommand="UPDATE [Productos] SET [varReferencia] = @varReferencia, [varNombre] = @varNombre, [numCantidad] = @numCantidad, [numValor] = @numValor WHERE [idProducto] = @idProducto">
        <DeleteParameters>
            <asp:Parameter Name="idProducto" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varReferencia" Type="String" />
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="numCantidad" Type="Decimal" />
            <asp:Parameter Name="numValor" Type="Decimal" />
            <asp:Parameter Name="idProducto" Type="Decimal" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="varReferencia" Type="String" />
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="numCantidad" Type="Decimal" />
            <asp:Parameter Name="numValor" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
        ShowSummary="False" />
    <asp:HiddenField ID="hdfFiltro" runat="server" />
</asp:Content>

