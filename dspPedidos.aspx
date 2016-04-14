<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspPedidos.aspx.cs" Inherits="dspPedidos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Pedidos.jpg" /><br />
    <asp:FormView ID="fvwPedidos" runat="server" DataKeyNames="idPedido" DataSourceID="sdsPedidos" OnDataBound="fvwPedidos_DataBound">
        <EditItemTemplate>
            idPedido:
            <asp:Label ID="idPedidoLabel1" runat="server" Text='<%# Eval("idPedido") %>'></asp:Label><br />
            varNoPedido:
            <asp:TextBox ID="varNoPedidoTextBox" runat="server" Text='<%# Bind("varNoPedido") %>'></asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:TextBox><br />
            dtmFecha:
            <asp:TextBox ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha") %>'></asp:TextBox><br />
            varIdentificacion:
            <asp:TextBox ID="varIdentificacionTextBox" runat="server" Text='<%# Bind("varIdentificacion") %>'></asp:TextBox><br />
            varNombre:
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>'></asp:TextBox><br />
            numEnvio:
            <asp:TextBox ID="numEnvioTextBox" runat="server" Text='<%# Bind("numEnvio") %>'></asp:TextBox><br />
            numIVA:
            <asp:TextBox ID="numIVATextBox" runat="server" Text='<%# Bind("numIVA") %>'></asp:TextBox><br />
            numValor:
            <asp:TextBox ID="numValorTextBox" runat="server" Text='<%# Bind("numValor") %>'></asp:TextBox><br />
            dtmDespacho:
            <asp:TextBox ID="dtmDespachoTextBox" runat="server" Text='<%# Bind("dtmDespacho") %>'></asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update"></asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            varNoPedido:
            <asp:TextBox ID="varNoPedidoTextBox" runat="server" Text='<%# Bind("varNoPedido") %>'></asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:TextBox><br />
            dtmFecha:
            <asp:TextBox ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha") %>'></asp:TextBox><br />
            varIdentificacion:
            <asp:TextBox ID="varIdentificacionTextBox" runat="server" Text='<%# Bind("varIdentificacion") %>'></asp:TextBox><br />
            varNombre:
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>'></asp:TextBox><br />
            numEnvio:
            <asp:TextBox ID="numEnvioTextBox" runat="server" Text='<%# Bind("numEnvio") %>'></asp:TextBox><br />
            numIVA:
            <asp:TextBox ID="numIVATextBox" runat="server" Text='<%# Bind("numIVA") %>'></asp:TextBox><br />
            numValor:
            <asp:TextBox ID="numValorTextBox" runat="server" Text='<%# Bind("numValor") %>'></asp:TextBox><br />
            dtmDespacho:
            <asp:TextBox ID="dtmDespachoTextBox" runat="server" Text='<%# Bind("dtmDespacho") %>'></asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert"></asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="6">
                        Datos Generales y de Facturación<asp:Label ID="idPedidoLabel" runat="server" Text='<%# Eval("idPedido") %>' Visible="False"></asp:Label><asp:Label
                            ID="idEstadoLabel" runat="server" Text='<%# Eval("idEstado") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        No. Pedido</td>
                    <td class="valores">
                        <asp:Label ID="varNoPedidoLabel" runat="server" Text='<%# Bind("varNoPedido") %>'></asp:Label></td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:Label ID="varDescripcionLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Id Cliente</td>
                    <td class="valores">
                        <asp:Label ID="varIdentificacionLabel" runat="server" Text='<%# Bind("varIdentificacion") %>'></asp:Label></td>
                    <td class="campos">
                        Nombres</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Apellidos</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varApellidoLabel" runat="server" Text='<%# Eval("varApellido") %>'></asp:Label></td>
                    <td class="campos">
                        Ciudad/Departamento</td>
                    <td class="valores">
                        <asp:Label ID="descCiudad" runat="server" Text='<%# Eval("descCiudad") %>'></asp:Label>/<asp:Label
                            ID="descDepartamento" runat="server" Text='<%# Eval("descDepartamento") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varDireccionLabel" runat="server" Text='<%# Eval("varTelefono") %>'></asp:Label></td>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:Label ID="varTelefonoLabel" runat="server" Text='<%# Eval("varTelefono") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="titulos" colspan="6">
                        Datos Envio</td>
                </tr>
                <tr>
                    <td class="campos">
                        Nombres</td>
                    <td class="valores">
                        <asp:Label ID="lblNombreE" runat="server" Text='<%# Eval("varNombreEnvio") %>'></asp:Label></td>
                    <td class="campos">
                        Apellidos</td>
                    <td class="valores">
                        <asp:Label ID="lblApellidoE" runat="server" Text='<%# Eval("varApellidoEnvio") %>'></asp:Label></td>
                    <td class="campos">
                        E-Mail</td>
                    <td class="valores">
                        <asp:Label ID="lblEnvio" runat="server" Text='<%# Eval("varEmailEnvio") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Ciudad/Dep.</td>
                    <td class="valores">
                        <asp:Label ID="lblCiuE" runat="server" Text='<%# Eval("ciuEnvio") %>'></asp:Label>/<asp:Label
                            ID="lblDepE" runat="server" Text='<%# Eval("depEnvio") %>'></asp:Label></td>
                    <td class="campos">
                        Dirección</td>
                    <td class="valores">
                        <asp:Label ID="lblDireccionE" runat="server" Text='<%# Eval("varDireccionEnvio") %>'></asp:Label></td>
                    <td class="campos">
                        Teléfono</td>
                    <td class="valores">
                        <asp:Label ID="lblTelefonoE" runat="server" Text='<%# Eval("varTelefonoEnvio") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="titulos" colspan="6">
                        Items</td>
                </tr>
                <tr>
                    <td class="campos" colspan="6" style="background-color: white; text-align: center;">
                        <br />
    <asp:GridView ID="gdvItems" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataSourceID="sdsItems" Width="500px" DataKeyNames="idItem">
        <RowStyle CssClass="valores" />
        <PagerStyle CssClass="campos" />
        <HeaderStyle CssClass="titulos" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="idItem" HeaderText="idItem" InsertVisible="False" ReadOnly="True"
                SortExpression="idItem" Visible="False" />
            <asp:BoundField DataField="idPedido" HeaderText="idPedido" SortExpression="idPedido"
                Visible="False" />
            <asp:BoundField DataField="idProducto" HeaderText="idProducto" SortExpression="idProducto"
                Visible="False" />
            <asp:BoundField DataField="varReferencia" HeaderText="Referencia" SortExpression="varReferencia" />
            <asp:BoundField DataField="varNombre" HeaderText="Producto" SortExpression="varNombre" />
            <asp:BoundField DataField="numValor" DataFormatString="{0:c}" HeaderText="Precio"
                HtmlEncode="False" SortExpression="numValor" />
            <asp:BoundField DataField="numCantidad" HeaderText="Cant." SortExpression="numCantidad" />
            <asp:TemplateField HeaderText="Cualificadores">
                <ItemTemplate>
                    <a href="#" onclick="javascript: secondwindow = open('dspCualificadoresItems.aspx?IdItem=<%# Eval("idItem") %>','Cualificadores','height=150,width=210,scrollbar=yes');">Ver</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="campos">
                        Val. Envio</td>
                    <td class="valores">
                        <asp:Label ID="numEnvioLabel" runat="server" Text='<%# Bind("numEnvio", "{0:C}") %>'></asp:Label></td>
                    <td class="campos">
                        Val. IVA</td>
                    <td class="valores">
                        <asp:Label ID="numIVALabel" runat="server" Text='<%# Bind("numIVA", "{0:C}") %>'></asp:Label></td>
                    <td class="campos">
                        Val. Total</td>
                    <td class="valores">
                        <asp:Label ID="numValorLabel" runat="server" Text='<%# Bind("numValor", "{0:C}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos" colspan="2">
                        Fecha Despacho</td>
                    <td class="valores" colspan="1">
                        <asp:Label ID="dtmDespachoLabel" runat="server" Text='<%# Bind("dtmDespacho", "{0:d}") %>'></asp:Label></td>
                    <td class="campos" colspan="3" style="text-align: center" rowspan="2"><asp:Button ID="btnEnviado" runat="server" CssClass="botones" Text="Despachado" OnClick="btnEnviado_Click" />
                        &nbsp;
                        <asp:Button ID="btnCancelado" runat="server" CssClass="botones" Text="Cancelado" OnClick="btnCancelado_Click" /></td>
                </tr>
                <tr>
                    <td class="campos" colspan="2">
                        Método de Pago</td>
                    <td class="valores" colspan="1">
                        <asp:Label ID="lblTipoPago" runat="server" Text='<%# Eval("TipoPago") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsPedidos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Pedidos.idPedido, Pedidos.varNoPedido, Estados.varDescripcion, Pedidos.dtmFecha, Clientes.varIdentificacion, Clientes.varNombre, Pedidos.numEnvio, Pedidos.numIVA, Pedidos.numValor, Pedidos.dtmDespacho, Clientes.varApellido, Clientes.varDireccion, Clientes.varTelefono, Ciudades.varDescripcion AS descCiudad, Departamentos.varDescripcion AS descDepartamento, TiposPagos.varNombre AS TipoPago, Pedidos.varNombreEnvio, Pedidos.varApellidoEnvio, Pedidos.varEmailEnvio, DE.varDescripcion AS depEnvio, CE.varDescripcion AS ciuEnvio, Pedidos.varDireccionEnvio, Pedidos.varTelefonoEnvio, Pedidos.idEstado FROM Clientes INNER JOIN Pedidos ON Clientes.idCliente = Pedidos.idCliente INNER JOIN Estados ON Pedidos.idEstado = Estados.idEstado INNER JOIN Ciudades ON Clientes.idCiudad = Ciudades.idCiudad INNER JOIN Departamentos ON Ciudades.idDepartamento = Departamentos.idDepartamento INNER JOIN Ciudades AS CE ON Pedidos.idCiudadEnvio = CE.idCiudad INNER JOIN Departamentos AS DE ON CE.idDepartamento = DE.idDepartamento INNER JOIN TiposPagos ON Pedidos.idTipoPago = TiposPagos.idTipoPago WHERE (Pedidos.idPedido = @IdPedido)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IdPedido" QueryStringField="IdPedido" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsItems" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Items.idItem, Items.idPedido, Items.idProducto, Productos.varReferencia, Productos.varNombre, Items.numCantidad, Items.numValor FROM Items INNER JOIN Productos ON Items.idProducto = Productos.idProducto WHERE (Items.idPedido = @IdPedido)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IdPedido" QueryStringField="IdPedido" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Listado" OnClick="btnListado_Click" />
</asp:Content>

