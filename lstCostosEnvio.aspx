<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="lstCostosEnvio.aspx.cs" Inherits="Admin_lstCostosEnvio" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_CostosEnvio.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="4">
                Configure un nuevo costo de envío</td>
        </tr>
        <tr>
            <td class="campos">
                Departamento</td>
            <td class="valores">
                <asp:DropDownList ID="ddlDepartamentos" runat="server" AutoPostBack="True" CssClass="textos"
                    DataSourceID="sdsDepartamentos" DataTextField="varDescripcion" DataValueField="idDepartamento">
                </asp:DropDownList><asp:SqlDataSource ID="sdsDepartamentos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idDepartamento], [varDescripcion] FROM [Departamentos] ORDER BY [varDescripcion]">
                </asp:SqlDataSource>
            </td>
            <td class="campos" rowspan="2">
                Costo</td>
            <td class="valores" rowspan="2">
                <asp:TextBox ID="txtCostoEnvio" runat="server" CssClass="textos" Width="50px"></asp:TextBox>&nbsp;&nbsp;<br />
                <asp:Button
                    ID="btnAgregar" runat="server" CssClass="botones" Text="Agregar" OnClick="btnAgregar_Click" ValidationGroup="2" /><asp:CompareValidator ID="cvlValor" runat="server"
                        ControlToValidate="txtCostoEnvio" Display="None" ErrorMessage="Ingrese un costo válido"
                        Operator="DataTypeCheck" Type="Currency" ValidationGroup="2"></asp:CompareValidator><asp:RequiredFieldValidator
                            ID="rfvCosto" runat="server" ControlToValidate="txtCostoEnvio" Display="None"
                            ErrorMessage="El campo costo no puede estar vacío" ValidationGroup="2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="campos">
                Ciudad</td>
            <td class="valores">
                <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="textos" DataSourceID="sdsCiudades"
                    DataTextField="varDescripcion" DataValueField="idCiudad">
                </asp:DropDownList><asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ControlToValidate="ddlCiudades"
                    Display="None" ErrorMessage="Primero debe seleccionar una de las ciudades" ValidationGroup="2"></asp:RequiredFieldValidator><asp:SqlDataSource ID="sdsCiudades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idCiudad], [varDescripcion] FROM [Ciudades] WHERE (([idDepartamento] = @idDepartamento) AND ([numValorEnvio] IS NULL)) ORDER BY [varDescripcion]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlDepartamentos" Name="idDepartamento" PropertyName="SelectedValue"
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table><asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="2" />
    <br />
    <br />
    <asp:GridView ID="gdvCostosEnvio" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="idCiudad" DataSourceID="sdsCostosEnvio"
        PageSize="15" Width="450px" OnRowDeleted="gdvCostosEnvio_RowDeleted">
        <RowStyle CssClass="valores" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Modificar"
                ShowDeleteButton="True" ShowEditButton="True" UpdateText="Aceptar" />
            <asp:BoundField DataField="idCiudad" HeaderText="idCiudad" InsertVisible="False"
                ReadOnly="True" SortExpression="idCiudad" Visible="False" />
            <asp:TemplateField HeaderText="Departamento" SortExpression="Departamento">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Departamento") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Departamento") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ciudad" SortExpression="Ciudad">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ciudad") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ciudad") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="$ Envio" SortExpression="numValorEnvio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="textos" Text='<%# Bind("numValorEnvio", "{0:F}") %>'
                        Width="50px"></asp:TextBox><asp:CompareValidator ID="cvlValor" runat="server" ControlToValidate="TextBox1"
                            Display="None" ErrorMessage="Ingrese un costo válido" Operator="DataTypeCheck"
                            Type="Currency"></asp:CompareValidator><asp:RequiredFieldValidator ID="rfvValor"
                                runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="El campo costo no puede estar vacío"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("numValorEnvio", "{0:C}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsCostosEnvio" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        DeleteCommand="UPDATE [Ciudades] SET [numValorEnvio] = NULL WHERE [idCiudad] = @idCiudad"
        SelectCommand="SELECT Ciudades.idCiudad, Departamentos.varDescripcion AS Departamento, Ciudades.varDescripcion AS Ciudad, Ciudades.numValorEnvio FROM Ciudades INNER JOIN Departamentos ON Ciudades.idDepartamento = Departamentos.idDepartamento WHERE (Ciudades.numValorEnvio IS NOT NULL)"
        UpdateCommand="UPDATE [Ciudades] SET [numValorEnvio] = @numValorEnvio WHERE [idCiudad] = @idCiudad">
        <DeleteParameters>
            <asp:Parameter Name="idCiudad" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="numValorEnvio" Type="Decimal" />
            <asp:Parameter Name="idCiudad" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
        ShowSummary="False" />
    <br />
    <br />
    <table>
        <tr>
            <td class="titulos" style="text-align: left">
                Configuración de envío</td>
        </tr>
        <tr>
            <td class="valores">
                <asp:DetailsView ID="dvwConfiguracionEnvio" runat="server" AutoGenerateRows="False"
                    CellPadding="0" DataKeyNames="idEmpresa" DataSourceID="sdsConfiguracionEnvio" HorizontalAlign="Left" Width="350px">
                    <FooterStyle HorizontalAlign="Center" />
                    <RowStyle CssClass="valores" HorizontalAlign="Left" />
                    <FieldHeaderStyle CssClass="campos" HorizontalAlign="Left" />
                    <PagerStyle HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="idEmpresa" HeaderText="idEmpresa" ReadOnly="True" SortExpression="idEmpresa"
                            Visible="False" />
                        <asp:BoundField DataField="idCobroEnvio" HeaderText="idCobroEnvio" SortExpression="idCobroEnvio"
                            Visible="False" />
                        <asp:TemplateField HeaderText="Tipo de cobro" SortExpression="varDescripcion">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Costo general" SortExpression="varValorEnvioGeneral">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="textos" Text='<%# Bind("varValorEnvioGeneral", "{0:F}") %>'
                                    Width="50px"></asp:TextBox><asp:CompareValidator ID="cvlValor" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Ingrese un costo válido" Operator="DataTypeCheck"
                                        Type="Currency" ValidationGroup="3"></asp:CompareValidator><asp:RequiredFieldValidator
                                            ID="rfvCosto" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="El campo costo no puede estar vacío"
                                            ValidationGroup="3"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varValorEnvioGeneral", "{0:c}") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("varValorEnvioGeneral", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" CancelText="Cancelar" EditText="Modificar costo general" UpdateText="Aceptar" ValidationGroup="3" >
                            <ControlStyle CssClass="botones" />
                            <FooterStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Fields>
                    <HeaderStyle CssClass="campos" />
                </asp:DetailsView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sdsConfiguracionEnvio" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Configuraciones.idEmpresa, Configuraciones.idCobroEnvio, Configuraciones.varValorEnvioGeneral, CobrosEnvios.varDescripcion FROM Configuraciones INNER JOIN CobrosEnvios ON Configuraciones.idCobroEnvio = CobrosEnvios.idCobroEnvio"
        UpdateCommand="UPDATE [Configuraciones] SET [varValorEnvioGeneral] = @varValorEnvioGeneral WHERE [idEmpresa] = @idEmpresa">
        <UpdateParameters>
            <asp:Parameter Name="varValorEnvioGeneral" Type="Decimal" />
            <asp:Parameter Name="idEmpresa" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource><asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="3" />
    <br />
</asp:Content>

