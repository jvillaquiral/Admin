<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstCualificadores.aspx.cs" Inherits="lstCualificadores" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Cualificadores.jpg" /><br />
    <asp:GridView ID="gdvCualificadores" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idCualificador" DataSourceID="sdsCualificadores"
        Width="350px">
        <Columns>
            <asp:BoundField DataField="idCualificador" HeaderText="idCualificador" InsertVisible="False"
                ReadOnly="True" SortExpression="idCualificador" Visible="False" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="varNombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varNombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspCualificadores.aspx?IdCualificador="+Eval("idCualificador") %>'
                        Text='<%# Eval("varNombre") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="varDescripcion" HeaderText="Estado" SortExpression="varDescripcion" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsCualificadores" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Cualificadores.idCualificador, Cualificadores.varNombre, Cualificadores.idEstado, Estados.varDescripcion FROM Cualificadores INNER JOIN Estados ON Cualificadores.idEstado = Estados.idEstado">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" OnClick="btnNuevo_Click"
        Text="Nuevo" />
</asp:Content>

