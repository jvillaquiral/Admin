<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstSugerencias.aspx.cs" Inherits="Admin_lstSugerencias" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Sugerencias.jpg" /><br />
    <asp:GridView ID="gdvSugerencias" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idSugerencia" DataSourceID="sdsSugerencias"
        Width="500px">
        <RowStyle CssClass="valores" />
        <Columns>
            <asp:TemplateField HeaderText="No." InsertVisible="False" SortExpression="idSugerencia">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idSugerencia") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspSugerencias.aspx?IdSugerencia="+Eval("idSugerencia") %>'
                        Text='<%# Eval("idSugerencia") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dtmFecha" DataFormatString="{0:d}" HeaderText="Fecha"
                HtmlEncode="False" SortExpression="dtmFecha" />
            <asp:BoundField DataField="varNombre" HeaderText="Nombre" SortExpression="varNombre" />
            <asp:BoundField DataField="varDescripcion" HeaderText="Estado" SortExpression="varDescripcion" />
        </Columns>
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsSugerencias" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Sugerencias.idSugerencia, Sugerencias.dtmFecha, Sugerencias.varNombre, Estados.varDescripcion FROM Estados INNER JOIN Sugerencias ON Estados.idEstado = Sugerencias.idEstado ORDER BY Sugerencias.dtmFecha DESC">
    </asp:SqlDataSource>
</asp:Content>

