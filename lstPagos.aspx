<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstPagos.aspx.cs" Inherits="lstPagos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_EstadoCuenta.jpg" /><br />
    <asp:GridView ID="gdvPagos" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idPago" DataSourceID="sdsPagos" Width="500px">
        <Columns>
            <asp:BoundField DataField="idPago" HeaderText="idPago" InsertVisible="False" ReadOnly="True"
                SortExpression="idPago" Visible="False" />
            <asp:TemplateField HeaderText="No. Pago" SortExpression="varPago">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varPago") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspPagos.aspx?IdPago="+Eval("idPago") %>'
                        Text='<%# Eval("varPago") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="numValor" HeaderText="Valor" SortExpression="numValor" DataFormatString="{0:c}" HtmlEncode="False" />
            <asp:BoundField DataField="dtmVencimiento" HeaderText="Vence" SortExpression="dtmVencimiento" DataFormatString="{0:d}" HtmlEncode="False" />
            <asp:BoundField DataField="varDescripcion" HeaderText="Estado" SortExpression="varDescripcion" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsPagos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Pagos.idPago, Pagos.varPago, Pagos.numValor, Pagos.dtmVencimiento, Estados.varDescripcion FROM Estados INNER JOIN Pagos ON Estados.idEstado = Pagos.idEstado">
    </asp:SqlDataSource>
</asp:Content>

