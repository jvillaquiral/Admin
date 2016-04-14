<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstPropiedades.aspx.cs" Inherits="lstPropiedades" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Propiedades.jpg" /><br />
    <asp:GridView ID="gdvPropiedades" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idPropiedad" DataSourceID="sdsPropiedades"
        Width="500px">
        <Columns>
            <asp:BoundField DataField="idPropiedad" HeaderText="idPropiedad" InsertVisible="False"
                ReadOnly="True" SortExpression="idPropiedad" Visible="False" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="varNombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varNombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspPropiedades.aspx?IdPropiedad="+Eval("idPropiedad") %>'
                        Text='<%# Eval("varNombre") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="varDescripcion" HeaderText="Estado" SortExpression="varDescripcion" />
            <asp:BoundField DataField="varPredeterminado" HeaderText="Val. Predet." SortExpression="varPredeterminado" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsPropiedades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Propiedades.idPropiedad, Propiedades.varNombre, Estados.varDescripcion, Propiedades.varPredeterminado FROM Estados INNER JOIN Propiedades ON Estados.idEstado = Propiedades.idEstado">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" OnClick="btnNuevo_Click"
        Text="Nuevo" />
</asp:Content>

