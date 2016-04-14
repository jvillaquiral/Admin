<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspPagos.aspx.cs" Inherits="dspPagos" Title="Modulo Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_EstadoCuenta.jpg" /><br />
    <asp:FormView ID="fvwPagos" runat="server" DataKeyNames="idPago" DataSourceID="sdsPagos">
        <EditItemTemplate>
            idPago:
            <asp:Label ID="idPagoLabel1" runat="server" Text='<%# Eval("idPago") %>'></asp:Label><br />
            varPago:
            <asp:TextBox ID="varPagoTextBox" runat="server" Text='<%# Bind("varPago") %>'>
            </asp:TextBox><br />
            dtmGeneracion:
            <asp:TextBox ID="dtmGeneracionTextBox" runat="server" Text='<%# Bind("dtmGeneracion") %>'>
            </asp:TextBox><br />
            numValor:
            <asp:TextBox ID="numValorTextBox" runat="server" Text='<%# Bind("numValor") %>'>
            </asp:TextBox><br />
            dtmVencimiento:
            <asp:TextBox ID="dtmVencimientoTextBox" runat="server" Text='<%# Bind("dtmVencimiento") %>'>
            </asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'>
            </asp:TextBox><br />
            numSubtotal:
            <asp:TextBox ID="numSubtotalTextBox" runat="server" Text='<%# Bind("numSubtotal") %>'>
            </asp:TextBox><br />
            numIVA:
            <asp:TextBox ID="numIVATextBox" runat="server" Text='<%# Bind("numIVA") %>'>
            </asp:TextBox><br />
            varInstrucciones:
            <asp:TextBox ID="varInstruccionesTextBox" runat="server" Text='<%# Bind("varInstrucciones") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            varPago:
            <asp:TextBox ID="varPagoTextBox" runat="server" Text='<%# Bind("varPago") %>'>
            </asp:TextBox><br />
            dtmGeneracion:
            <asp:TextBox ID="dtmGeneracionTextBox" runat="server" Text='<%# Bind("dtmGeneracion") %>'>
            </asp:TextBox><br />
            numValor:
            <asp:TextBox ID="numValorTextBox" runat="server" Text='<%# Bind("numValor") %>'>
            </asp:TextBox><br />
            dtmVencimiento:
            <asp:TextBox ID="dtmVencimientoTextBox" runat="server" Text='<%# Bind("dtmVencimiento") %>'>
            </asp:TextBox><br />
            varDescripcion:
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>'>
            </asp:TextBox><br />
            numSubtotal:
            <asp:TextBox ID="numSubtotalTextBox" runat="server" Text='<%# Bind("numSubtotal") %>'>
            </asp:TextBox><br />
            numIVA:
            <asp:TextBox ID="numIVATextBox" runat="server" Text='<%# Bind("numIVA") %>'>
            </asp:TextBox><br />
            varInstrucciones:
            <asp:TextBox ID="varInstruccionesTextBox" runat="server" Text='<%# Bind("varInstrucciones") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="4">
                        Datos Generales<asp:Label ID="idPagoLabel" runat="server" Text='<%# Eval("idPago") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        No. Pago</td>
                    <td class="valores">
                        <asp:Label ID="varPagoLabel" runat="server" Text='<%# Bind("varPago") %>'></asp:Label></td>
                    <td class="campos">
                        Fecha Generación</td>
                    <td class="valores">
                        <asp:Label ID="dtmGeneracionLabel" runat="server" Text='<%# Bind("dtmGeneracion", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Valor</td>
                    <td class="valores">
                        <asp:Label ID="numValorLabel" runat="server" Text='<%# Bind("numValor", "{0:C}") %>'></asp:Label></td>
                    <td class="campos">
                        Fecha Vencimiento</td>
                    <td class="valores">
                        <asp:Label ID="dtmVencimientoLabel" runat="server" Text='<%# Bind("dtmVencimiento", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:Label ID="varDescripcionLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                    <td class="campos">
                    </td>
                    <td class="valores">
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gdvPagos" runat="server" AutoGenerateColumns="False" DataSourceID="sdsDetallePagos"
                Width="400px">
                <Columns>
                    <asp:BoundField DataField="idDetallePago" HeaderText="idDetallePago" SortExpression="idDetallePago"
                        Visible="False" />
                    <asp:BoundField DataField="varDescripcion" HeaderText="Detalle" SortExpression="varDescripcion" />
                    <asp:BoundField DataField="numCantidad" HeaderText="Cantidad" SortExpression="numCantidad" />
                    <asp:BoundField DataField="numValorU" DataFormatString="{0:c}" HeaderText="Valor Uni."
                        HtmlEncode="False" SortExpression="numValorU" />
                    <asp:BoundField DataField="numValorT" DataFormatString="{0:c}" HeaderText="Valor Tot."
                        HtmlEncode="False" SortExpression="numValorT" />
                </Columns>
                <RowStyle CssClass="valores" />
                <PagerStyle CssClass="campos" />
                <HeaderStyle CssClass="titulos" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsDetallePagos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                SelectCommand="SELECT [idDetallePago], [varDescripcion], [numCantidad], [numValorU], [numValorT] FROM [DetallesPagos] WHERE ([idPago] = @idPago)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="idPago" QueryStringField="IdPago" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="campos">
                        SubTotal</td>
                    <td class="valores">
                        <asp:Label ID="numSubtotalLabel" runat="server" Text='<%# Bind("numSubtotal", "{0:C}") %>'></asp:Label></td>
                    <td class="campos">
                        IVA</td>
                    <td class="valores">
                        <asp:Label ID="numIVALabel" runat="server" Text='<%# Bind("numIVA", "{0:C}") %>'></asp:Label></td>
                    <td class="campos">
                        Total</td>
                    <td class="valores">
                        <asp:Label ID="lblValor" runat="server" Text='<%# Bind("numValor", "{0:C}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="valores" colspan="6">
                        <asp:Label ID="varInstruccionesLabel" runat="server" Text='<%# Bind("varInstrucciones") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsPagos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Pagos.idPago, Pagos.varPago, Pagos.dtmGeneracion, Pagos.numValor, Pagos.dtmVencimiento, Estados.varDescripcion, Pagos.numSubtotal, Pagos.numIVA, Pagos.varInstrucciones FROM Pagos INNER JOIN Estados ON Pagos.idEstado = Estados.idEstado WHERE (Pagos.idPago = @IdPago)">
        <SelectParameters>
            <asp:QueryStringParameter Name="IdPago" QueryStringField="IdPago" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;
    <br />
    <asp:Button ID="btnListado" runat="server" CssClass="botones" Text="Listado" OnClick="btnListado_Click" />
</asp:Content>

