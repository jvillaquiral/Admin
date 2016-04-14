<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspFotosProductos.aspx.cs" Inherits="dspFotosProductos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Fotos.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="3">
                Fotos por producto</td>
        </tr>
        <tr>
            <td class="campos">
                Descripción</td>
            <td class="valores" colspan="2">
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="textos" Height="40px" TextMode="MultiLine"
                    Width="350px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="campos">
                Imagen</td>
            <td class="valores">
                <asp:FileUpload ID="fupImagen" runat="server" CssClass="textos" Width="280px" />
                <asp:RequiredFieldValidator ID="rfvArhcivo" runat="server" ControlToValidate="fupImagen"
                    Display="None" ErrorMessage="Primero debe seleccionar un archivo"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvlNoFotosMax" runat="server" Display="Dynamic" ErrorMessage="No puede sobrepasar el número máximo de fotos"></asp:CustomValidator></td>
            <td class="campos" style="text-align: center">
                <asp:Button ID="btnAgregar" runat="server" CssClass="botones" Text="Agregar" OnClick="btnAgregar_Click" /></td>
        </tr>
        <tr>
            <td class="valores" colspan="3" style="text-align: center">
                <asp:GridView ID="gdvFotos" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    DataKeyNames="idFoto" DataSourceID="sdsFotos" Width="300px">
                    <Columns>
                        <asp:CommandField DeleteText="x" ShowDeleteButton="True" />
                        <asp:BoundField DataField="idFoto" HeaderText="idFoto" InsertVisible="False" ReadOnly="True"
                            SortExpression="idFoto" Visible="False" />
                        <asp:BoundField DataField="idProducto" HeaderText="idProducto" SortExpression="idProducto"
                            Visible="False" />
                        <asp:TemplateField HeaderText="Imagen" SortExpression="varImagen">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varImagen") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# ConfigurationManager.AppSettings["vdImgProductos"]+Eval("varImagen") %>'
                                    Width="40px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="varDescripcion" HeaderText="Descripci&#243;n" SortExpression="varDescripcion" />
                    </Columns>
                    <RowStyle CssClass="valores" />
                    <PagerStyle CssClass="campos" />
                    <HeaderStyle CssClass="titulos" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsFotos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    DeleteCommand="DELETE FROM [Fotos] WHERE [idFoto] = @idFoto" InsertCommand="INSERT INTO [Fotos] ([idProducto], [varImagen], [varDescripcion]) VALUES (@idProducto, @varImagen, @varDescripcion)"
                    SelectCommand="SELECT [idFoto], [idProducto], [varImagen], [varDescripcion] FROM [Fotos] WHERE ([idProducto] = @idProducto)"
                    UpdateCommand="UPDATE [Fotos] SET [idProducto] = @idProducto, [varImagen] = @varImagen, [varDescripcion] = @varDescripcion WHERE [idFoto] = @idFoto">
                    <DeleteParameters>
                        <asp:Parameter Name="idFoto" Type="Decimal" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idProducto" Type="Decimal" />
                        <asp:Parameter Name="varImagen" Type="String" />
                        <asp:Parameter Name="varDescripcion" Type="String" />
                        <asp:Parameter Name="idFoto" Type="Decimal" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idProducto" Type="Decimal" />
                        <asp:Parameter Name="varImagen" Type="String" />
                        <asp:Parameter Name="varDescripcion" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="idProducto" QueryStringField="IdProducto" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="campos" colspan="3" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="btnVolver" runat="server" CausesValidation="False" CssClass="botones"
                    OnClick="btnVolver_Click" Text="Volver" /><asp:ValidationSummary ID="ValidationSummary1"
                        runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>

