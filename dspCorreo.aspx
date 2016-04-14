<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspCorreo.aspx.cs" Inherits="dspCorreo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Correos.jpg" />&nbsp;<table style="width: 500px;
        text-align: left">
        <tr>
            <td class="titulos" colspan="2">
                Envío de correos a clientes</td>
        </tr>
        <tr>
            <td colspan="2" style="vertical-align: top; text-align: center">
                <table>
                    <tr>
                        <td class="campos" style="vertical-align: top; text-align: left">
                            Cuentas seleccionadas</td>
                        <td rowspan="2" style="vertical-align: top">
                    <asp:GridView ID="gdvClientes" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="idCliente" DataSourceID="sdsClientes"
                        OnSelectedIndexChanged="gdvClientes_SelectedIndexChanged" Width="300px">
                        <RowStyle CssClass="valores" />
                        <Columns>
                            <asp:CommandField SelectText="+" ShowSelectButton="True" />
                            <asp:BoundField DataField="idCliente" HeaderText="idCliente" InsertVisible="False"
                                ReadOnly="True" SortExpression="idCliente" Visible="False" />
                            <asp:BoundField DataField="Nombre" HeaderText="Cliente" ReadOnly="True" SortExpression="Nombre" />
                            <asp:BoundField DataField="varEMail" HeaderText="Correo" SortExpression="varEMail" />
                        </Columns>
                        <PagerStyle CssClass="campos" />
                        <HeaderStyle CssClass="titulos" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                        SelectCommand="SELECT idCliente, varNombre + ' ' + varApellido AS Nombre, varEMail FROM Clientes WHERE (idEstado = 1)">
                    </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; text-align: left">
                            <asp:ListBox ID="lstClientes" runat="server" AutoPostBack="True" CssClass="textos"
                                Height="100px" OnSelectedIndexChanged="lstClientes_SelectedIndexChanged" Width="200px">
                            </asp:ListBox>
                            <asp:Button ID="btnEliminar" runat="server" CssClass="botones" Enabled="False" OnClick="btnEliminar_Click"
                                Text="-" />&nbsp;&nbsp;<asp:Button ID="btnEliminarT" runat="server" CssClass="botones" Enabled="False" OnClick="btnEliminarT_Click"
                                Text="- Todos" />&nbsp;
                            <asp:Button ID="btnSumarT" runat="server" CssClass="botones" OnClick="btnSumarT_Click"
                                Text="+ Todos" /><br />
                            <asp:CustomValidator ID="cmvCuentas" runat="server" ControlToValidate="lstClientes"
                                Display="Dynamic" ErrorMessage="Debe seleccionar al menos una cuenta" ValidationGroup="2"></asp:CustomValidator></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="campos">
                Asunto</td>
            <td class="valores" colspan="1">
                <asp:TextBox ID="txtAsunto" runat="server" CssClass="textos" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAsunto" runat="server" ControlToValidate="txtAsunto"
                    Display="None" ErrorMessage="El campo asunto no puede estar vacío" ValidationGroup="2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="campos" colspan="2">
                Mensaje</td>
        </tr>
        <tr>
            <td class="valores" colspan="2">
                <asp:TextBox ID="txtMensaje" runat="server" CssClass="textos" Height="200px" TextMode="MultiLine"
                    Width="450px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMensaje" runat="server" ControlToValidate="txtMensaje"
                    Display="None" ErrorMessage="El campo mensaje no puede estar vacío" ValidationGroup="2"></asp:RequiredFieldValidator>
                <asp:ValidationSummary ID="vsmError" runat="server" ShowMessageBox="True" ShowSummary="False"
                    ValidationGroup="2" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnEnviar" runat="server" CssClass="botones" OnClick="btnEnviar_Click"
                                Text="Enviar" ValidationGroup="2" />&nbsp;
    <asp:Button ID="btnLimpiar" runat="server" CssClass="botones" OnClick="btnLimpiar_Click"
                                Text="Limpiar" ValidationGroup="2" /><br />
</asp:Content>

