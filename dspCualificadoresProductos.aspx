<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspCualificadoresProductos.aspx.cs" Inherits="dspCualificadoresProductos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_CualificadoresProductos.jpg" /><br />
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="4">
                Valores de cualificador por producto</td>
        </tr>
        <tr>
            <td class="campos">
                Cualificador</td>
            <td class="valores" colspan="3">
                <asp:DropDownList ID="ddlCualificadores" runat="server" CssClass="textos" AutoPostBack="True" DataSourceID="sdsCualificadores" DataTextField="varNombre" DataValueField="idCualificador">
                </asp:DropDownList><asp:SqlDataSource ID="sdsCualificadores" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [idCualificador], [varNombre] FROM [Cualificadores] WHERE ([idEstado] = @idEstado)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="idEstado" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="campos">
                Valores<br />
                anteriores</td>
            <td class="valores">
                <asp:DropDownList ID="ddlValAnteriores" runat="server" CssClass="textos" AutoPostBack="True" DataSourceID="sdsValoresAnteriores" DataTextField="varValor" DataValueField="varValor" OnSelectedIndexChanged="ddlValAnteriores_SelectedIndexChanged">
                </asp:DropDownList><asp:SqlDataSource ID="sdsValoresAnteriores" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    SelectCommand="SELECT [varValor] FROM [CualificadoresProductos] WHERE ([idCualificador] = @idCualificador)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCualificadores" Name="idCualificador" PropertyName="SelectedValue"
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="valores" colspan="2" rowspan="3" style="text-align: center">
                <br />
                <asp:GridView ID="gdvCualiProductos" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    DataKeyNames="idProducto,idCualificador,varValor" DataSourceID="sdsCualificadoresProductos"
                    Width="150px" EmptyDataText="Seleccione un cualificador">
                    <Columns>
                        <asp:CommandField DeleteText="x" ShowDeleteButton="True" />
                        <asp:BoundField DataField="idProducto" HeaderText="idProducto" ReadOnly="True" SortExpression="idProducto"
                            Visible="False" />
                        <asp:BoundField DataField="idCualificador" HeaderText="idCualificador" ReadOnly="True"
                            SortExpression="idCualificador" Visible="False" />
                        <asp:BoundField DataField="varValor" HeaderText="Valores" ReadOnly="True" SortExpression="varValor" />
                    </Columns>
                    <RowStyle CssClass="valores" />
                    <PagerStyle CssClass="campos" />
                    <HeaderStyle CssClass="titulos" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsCualificadoresProductos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                    DeleteCommand="DELETE FROM [CualificadoresProductos] WHERE [idProducto] = @idProducto AND [idCualificador] = @idCualificador AND [varValor] = @varValor"
                    InsertCommand="INSERT INTO [CualificadoresProductos] ([idProducto], [idCualificador], [varValor]) VALUES (@idProducto, @idCualificador, @varValor)"
                    SelectCommand="SELECT [idProducto], [idCualificador], [varValor] FROM [CualificadoresProductos] WHERE (([idCualificador] = @idCualificador) AND ([idProducto] = @idProducto))">
                    <DeleteParameters>
                        <asp:Parameter Name="idProducto" Type="Decimal" />
                        <asp:Parameter Name="idCualificador" Type="Decimal" />
                        <asp:Parameter Name="varValor" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idProducto" Type="Decimal" />
                        <asp:Parameter Name="idCualificador" Type="Decimal" />
                        <asp:Parameter Name="varValor" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCualificadores" Name="idCualificador" PropertyName="SelectedValue"
                            Type="Decimal" />
                        <asp:QueryStringParameter Name="idProducto" QueryStringField="IdProducto" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="campos">
                Nuevo<br />
                Valor</td>
            <td class="valores">
                <asp:TextBox ID="txtNuevoValor" runat="server" CssClass="textos"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvNuevoValor" runat="server" ControlToValidate="txtNuevoValor" Display="None"
                    ErrorMessage="El campo nuevo valor no puede ser vacío"></asp:RequiredFieldValidator><br />
                <asp:CustomValidator ID="cvlNuevoValor" runat="server" Display="Dynamic" ErrorMessage="Ese valor ya existe"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td class="campos" colspan="2" style="text-align: center">
                <asp:Button ID="btnAgregar" runat="server" CssClass="botones" Text="Agregar" OnClick="btnAgregar_Click" /></td>
        </tr>
        <tr>
            <td class="campos" colspan="4" style="text-align: center">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="btnVolver" runat="server" CausesValidation="False" CssClass="botones"
                    OnClick="btnVolver_Click" Text="Volver" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>

