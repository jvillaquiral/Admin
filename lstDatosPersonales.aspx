<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstDatosPersonales.aspx.cs" Inherits="lstDatosPersonales" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_DatosPersonales.jpg" /><br />
    <asp:GridView ID="gdvDatos" runat="server"
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idDatoPersonal"
        DataSourceID="sdsDatos" Width="300px">
        <Columns>
            <asp:BoundField DataField="idDatoPersonal" HeaderText="idDatoPersonal" InsertVisible="False"
                ReadOnly="True" SortExpression="idDatoPersonal" Visible="False" />
            <asp:TemplateField HeaderText="Dato Personal" SortExpression="varNombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varNombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "dspDatosPersonales.aspx?IdDato="+Eval("idDatoPersonal") %>'
                        Text='<%# Eval("varNombre") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="idEstado" HeaderText="idEstado" SortExpression="idEstado"
                Visible="False" />
            <asp:BoundField DataField="varDescripcion" HeaderText="Estado" SortExpression="varDescripcion" />
        </Columns>
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDatos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT DatosPersonales.idDatoPersonal, DatosPersonales.varNombre, DatosPersonales.idEstado, Estados.varDescripcion FROM DatosPersonales INNER JOIN Estados ON DatosPersonales.idEstado = Estados.idEstado">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnNuevo" runat="server" CssClass="botones" OnClick="btnNuevo_Click"
        Text="Nuevo" />
</asp:Content>

