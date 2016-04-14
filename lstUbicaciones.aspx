<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstUbicaciones.aspx.cs" Inherits="lstUbicaciones" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Ubicaciones.jpg" /><br />
    <asp:GridView ID="gdvUbicaciones" runat="server" AutoGenerateColumns="False" DataKeyNames="idUbicacion"
        DataSourceID="sdsUbicaciones" AllowPaging="True" AllowSorting="True" Width="500px">
        <Columns>
            <asp:BoundField DataField="idUbicacion" HeaderText="idUbicacion" InsertVisible="False"
                ReadOnly="True" SortExpression="idUbicacion" Visible="False" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="varNombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varNombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspUbicaciones.aspx?IdUbicacion="+Eval("idUbicacion") %>'
                        Text='<%# Eval("varNombre") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="varDireccion" HeaderText="Direcci&#243;n" SortExpression="varDireccion" />
            <asp:BoundField DataField="varDescripcion" HeaderText="Ciudad" SortExpression="varDescripcion" />
        </Columns>
        <RowStyle CssClass="valores" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <PagerStyle CssClass="campos" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsUbicaciones" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Ubicaciones.idUbicacion, Ubicaciones.varNombre, Ubicaciones.varDireccion, Ciudades.varDescripcion FROM Ciudades INNER JOIN Ubicaciones ON Ciudades.idCiudad = Ubicaciones.idCiudad WHERE (Ubicaciones.idEmpresa = @IdEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="IdEmpresa" SessionField="IdEmpresaACWEB" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" Text="Nuevo" OnClick="btnNuevo_Click" />
</asp:Content>

