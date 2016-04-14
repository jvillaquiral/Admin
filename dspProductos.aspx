<%@ Page Language="C#" MasterPageFile="~/Admin/mpPlantillaInterna.master" AutoEventWireup="true" CodeFile="dspProductos.aspx.cs" Inherits="dspProductos" Title="Modulo Administrativo" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="Imagenes/Titulos/tit_Productos.jpg" /><br />
    <asp:FormView ID="fvwProductos" runat="server" DataKeyNames="idProducto" DataSourceID="sdsProductos" OnItemInserted="fvwProductos_ItemInserted" OnItemInserting="fvwProductos_ItemInserting" OnItemUpdated="fvwProductos_ItemUpdated" OnItemUpdating="fvwProductos_ItemUpdating" OnDataBound="fvwProductos_DataBound">
        <EditItemTemplate>
    <table style="width: 500px; text-align: left">
        <tr>
            <td class="titulos" colspan="6">
                Datos Generales<asp:Label ID="idProductoLabel1" runat="server" Text='<%# Eval("idProducto") %>' Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td class="campos">
                Referencia</td>
            <td class="valores">
            <asp:TextBox ID="varReferenciaTextBox" runat="server" Text='<%# Bind("varReferencia") %>' CssClass="textos"></asp:TextBox><asp:Label
                ID="lblDatoOriginal" runat="server" Text='<%# Eval("varReferencia") %>' Visible="False"></asp:Label>
                <asp:RequiredFieldValidator
                ID="rfvReferencia" runat="server" ControlToValidate="varReferenciaTextBox" Display="None"
                ErrorMessage="El campo referencia no puede ser vacío"></asp:RequiredFieldValidator><asp:CustomValidator
                    ID="cvlExistencia" runat="server" ControlToValidate="varReferenciaTextBox" Display="Dynamic"
                    ErrorMessage="La referencia ya existe"></asp:CustomValidator></td>
            <td class="campos">
                Nombre</td>
            <td class="valores" colspan="3">
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>' CssClass="textos" Width="230px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="varNombreTextBox"
                    Display="None" ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="campos">
                Categoría</td>
            <td class="valores"><asp:DropDownList ID="ddlCategorias" runat="server" CssClass="textos" DataSourceID="sdsCategorias"
                        DataTextField="varNombre" DataValueField="idCategoria" SelectedValue='<%# Bind("idCategoria") %>'>
            </asp:DropDownList><asp:SqlDataSource ID="sdsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                        SelectCommand="SELECT [idCategoria], [varNombre] FROM [Categorias] WHERE ([idEstado] = @idEstado)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="idEstado" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td>
            <td class="campos">
                Valor</td>
            <td class="valores">
            <asp:TextBox ID="numValorTextBox" runat="server" Text='<%# Bind("numValor", "{0:F}") %>' CssClass="textos" Width="60px" Enabled="False"></asp:TextBox></td>
            <td class="campos">
                Estado</td>
            <td class="valores">
            <asp:DropDownList ID="ddlEstados" runat="server" CssClass="textos" SelectedValue='<%# Bind("idEstado") %>' DataSourceID="sdsEstados" DataTextField="varDescripcion" DataValueField="idEstado">
            </asp:DropDownList><asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                        SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="idTipo" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="campos">
                Imagen</td>
            <td class="valores" colspan="3" style="vertical-align: middle; text-align: left"><asp:FileUpload ID="fupImagen" runat="server" CssClass="textos" Width="300px" /><asp:TextBox
                    ID="varImagenTextBox" runat="server" CssClass="textos" Text='<%# Bind("varImagen") %>'
                    Visible="False"></asp:TextBox></td>
            <td class="campos">
                Fecha</td>
            <td class="valores">
                <asp:Label ID="dtmFechaTextBox" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
        </tr>
        <tr>
            <td class="campos">
                Archivo Adjunto</td>
            <td class="valores" colspan="5" style="vertical-align: middle; text-align: left">
                <asp:FileUpload ID="fupAdjunto" runat="server" CssClass="textos" Width="300px" /><asp:TextBox
                    ID="varArchivoAdjuntoTextBox" runat="server" CssClass="textos" Text='<%# Bind("varArchivoAdjunto") %>'
                    Visible="False"></asp:TextBox><asp:TextBox ID="numCantidadTextBox" runat="server" Text='<%# Bind("numCantidad") %>' CssClass="textos" Width="60px" Visible="False"></asp:TextBox><asp:TextBox ID="numIVATextBox" runat="server" Text='<%# Bind("numIVA", "{0:F}") %>' CssClass="textos" Width="60px" Visible="False"></asp:TextBox><asp:CheckBox ID="blnAgotadoCheckBox" runat="server" Checked='<%# Bind("blnAgotado") %>' Visible="False" /></td>
        </tr>
        <tr>
            <td class="campos">
                Descripción</td>
            <td class="valores" colspan="5">
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>' CssClass="textos" Height="40px" TextMode="MultiLine" Width="450px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <asp:GridView ID="gdvPropiedades" runat="server" AutoGenerateColumns="False" DataSourceID="sdsPropiedades" Width="300px" DataKeyNames="idPropiedad">
                    <RowStyle CssClass="valores" />
                    <Columns>
                        <asp:BoundField DataField="idPropiedad" HeaderText="idPropiedad" InsertVisible="False"
                            ReadOnly="True" SortExpression="idPropiedad" Visible="False" />
                        <asp:BoundField DataField="varNombre" HeaderText="Propiedad Adicional" SortExpression="varNombre" />
                        <asp:TemplateField HeaderText="Valor" SortExpression="varValor">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("varValor") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="txtValorPropiedad" runat="server" CssClass="textos" Text='<%# Eval("varValor") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="campos" />
                    <HeaderStyle CssClass="titulos" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsPropiedades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT Propiedades.idPropiedad, Propiedades.varNombre, PropiedadesProductos.varValor FROM Propiedades INNER JOIN PropiedadesProductos ON Propiedades.idPropiedad = PropiedadesProductos.idPropiedad WHERE (PropiedadesProductos.idProducto = @IdProducto)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="IdProducto" QueryStringField="IdProducto" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="campos" colspan="6" style="text-align: center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Modificar" ForeColor="White" OnClick="UpdateButton_Click"></asp:LinkButton>
                &nbsp; &nbsp;
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar" ForeColor="White"></asp:LinkButton>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" /></td>
        </tr>
    </table>
            <br />
            <asp:Button ID="btnListado" runat="server" CssClass="botones" 
        Text="Listado" OnClick="btnListado_Click" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate><table style="width: 500px; text-align: left">
            <tr>
                <td class="titulos" colspan="6">
                    Datos Generales</td>
            </tr>
            <tr>
                <td class="campos">
                    Referencia</td>
                <td class="valores">
            <asp:TextBox ID="varReferenciaTextBox" runat="server" Text='<%# Bind("varReferencia") %>' CssClass="textos"></asp:TextBox><asp:RequiredFieldValidator ID="rfvReferencia" runat="server" ControlToValidate="varReferenciaTextBox"
                        Display="None" ErrorMessage="El campo referencia no puede ser vacío"></asp:RequiredFieldValidator><br />
                    <asp:CustomValidator ID="cvlExistencia" runat="server" ControlToValidate="varReferenciaTextBox"
                        Display="Dynamic" ErrorMessage="La referencia ya existe"></asp:CustomValidator></td>
                <td class="campos">
                    Nombre</td>
                <td class="valores" colspan="3">
            <asp:TextBox ID="varNombreTextBox" runat="server" Text='<%# Bind("varNombre") %>' CssClass="textos" Width="230px"></asp:TextBox><asp:RequiredFieldValidator
                ID="rfvNombre" runat="server" ControlToValidate="varNombreTextBox" Display="None"
                ErrorMessage="El campo nombre no puede ser vacío"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="campos">
                    Categoría</td>
                <td class="valores">
                    <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="textos" DataSourceID="sdsCategorias"
                        DataTextField="varNombre" DataValueField="idCategoria" SelectedValue='<%# Bind("idCategoria") %>'>
                    </asp:DropDownList><asp:SqlDataSource ID="sdsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                        SelectCommand="SELECT [idCategoria], [varNombre] FROM [Categorias] WHERE ([idEstado] = @idEstado)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="idEstado" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="campos">
                    Valor</td>
                <td class="valores">
            <asp:TextBox ID="numValorTextBox" runat="server" Text='<%# Bind("numValor") %>' CssClass="textos" Width="60px" Enabled="False" OnInit="numValorTextBox_Init"></asp:TextBox></td>
                <td class="campos">
                    Estado</td>
                <td class="valores">
                    <asp:DropDownList ID="ddlEstados" runat="server" CssClass="textos" SelectedValue='<%# Bind("idEstado") %>' DataSourceID="sdsEstados" DataTextField="varDescripcion" DataValueField="idEstado">
                    </asp:DropDownList><asp:SqlDataSource ID="sdsEstados" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                        SelectCommand="SELECT [idEstado], [varDescripcion] FROM [Estados] WHERE ([idTipo] = @idTipo)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="idTipo" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="campos">
                    Imagen</td>
                <td class="valores" colspan="3" style="vertical-align: middle; text-align: left">
                    <asp:FileUpload ID="fupImagen" runat="server" CssClass="textos" Width="300px" /><asp:TextBox ID="varImagenTextBox" runat="server" Text='<%# Bind("varImagen") %>' CssClass="textos" Visible="False"></asp:TextBox>&nbsp;</td>
                <td class="campos">
                    Fecha</td>
                <td class="valores">
                    <asp:Label ID="dtmFechaTextBox" runat="server" OnInit="dtmFechaTextBox_Init" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
            </tr>
            <tr>
                <td class="campos">
                    Archivo Adjunto</td>
                <td class="valores" colspan="5" style="vertical-align: middle; text-align: left">
                    <asp:FileUpload ID="fupAdjunto" runat="server" CssClass="textos" Width="300px" /><asp:TextBox
                        ID="varArchivoAdjuntoTextBox" runat="server" CssClass="textos" Text='<%# Bind("varArchivoAdjunto") %>'
                        Visible="False"></asp:TextBox><asp:TextBox ID="numCantidadTextBox" runat="server" Text='<%# Bind("numCantidad") %>' CssClass="textos" Width="60px" OnInit="numCantidadTextBox_Init" Visible="False"></asp:TextBox><asp:TextBox ID="numIVATextBox" runat="server" Text='<%# Bind("numIVA") %>' CssClass="textos" Width="60px" OnInit="numIVATextBox_Init" Visible="False"></asp:TextBox><asp:CheckBox ID="blnAgotadoCheckBox" runat="server" Checked='<%# Bind("blnAgotado") %>' Visible="False" /></td>
            </tr>
            <tr>
                <td class="campos">
                    Descripción</td>
                <td class="valores" colspan="5">
            <asp:TextBox ID="varDescripcionTextBox" runat="server" Text='<%# Bind("varDescripcion") %>' CssClass="textos" Height="40px" TextMode="MultiLine" Width="450px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: center">
                    <asp:GridView ID="gdvPropiedades" runat="server" AutoGenerateColumns="False" DataSourceID="sdsPropiedades" Width="300px" DataKeyNames="idPropiedad">
                        <RowStyle CssClass="valores" />
                        <Columns>
                            <asp:BoundField DataField="idPropiedad" HeaderText="idPropiedad" InsertVisible="False"
                                ReadOnly="True" SortExpression="idPropiedad" Visible="False" />
                            <asp:BoundField DataField="varNombre" HeaderText="Propiedad Adicional" SortExpression="varNombre" />
                            <asp:TemplateField HeaderText="Valor">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtValorPropiedad" runat="server" CssClass="textos"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="campos" />
                        <HeaderStyle CssClass="titulos" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsPropiedades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT [idPropiedad], [varNombre] FROM [Propiedades]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="campos" colspan="6" style="text-align: center">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Crear" ForeColor="White" OnClick="InsertButton_Click"></asp:LinkButton>
                    &nbsp; &nbsp;
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar" ForeColor="White" OnClick="InsertCancelButton_Click"></asp:LinkButton>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" />
                </td>
            </tr>
        </table>
            <br />
            <asp:Button ID="btnListado" runat="server" CssClass="botones" 
        Text="Listado" OnClick="btnListado_Click" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width: 500px; text-align: left">
                <tr>
                    <td class="titulos" colspan="6">
                        Datos Generales<asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>' Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Referencia</td>
                    <td class="valores">
                        <asp:Label ID="varReferenciaLabel" runat="server" Text='<%# Bind("varReferencia") %>'></asp:Label></td>
                    <td class="campos">
                        Nombre</td>
                    <td class="valores" colspan="3">
                        <asp:Label ID="varNombreLabel" runat="server" Text='<%# Bind("varNombre") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Categoría</td>
                    <td class="valores">
                        <asp:Label ID="idCategoriaLabel" runat="server" Text='<%# Eval("Categoria") %>'></asp:Label></td>
                    <td class="campos">
                        Valor</td>
                    <td class="valores">
                        <asp:Label ID="numValorLabel" runat="server" Text='<%# Bind("numValor", "{0:C}") %>'></asp:Label></td>
                    <td class="campos">
                        Estado</td>
                    <td class="valores">
                        <asp:Label ID="idEstadoLabel" runat="server" Text='<%# Eval("Estado") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Imagen</td>
                    <td class="valores" colspan="3" style="vertical-align: middle; text-align: center">
                        &nbsp;<asp:Image ID="imgProducto" runat="server" Height="60px" ImageUrl='<%# ConfigurationManager.AppSettings["vdImgProductos"]+Eval("varImagen") %>'
                            Width="80px" /></td>
                    <td class="campos">
                        Fecha</td>
                    <td class="valores">
                        <asp:Label ID="dtmFechaLabel" runat="server" Text='<%# Bind("dtmFecha", "{0:d}") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td class="campos">
                        Archivo Adjunto</td>
                    <td class="valores" colspan="5">
                        <asp:HyperLink ID="varArchivoAdjunto" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings["vdAdjProductos"]+Eval("varArchivoAdjunto") %>' Target="_blank">ver archivo adjunto</asp:HyperLink><asp:Label ID="numCantidadLabel" runat="server" Text='<%# Bind("numCantidad") %>' Visible="False"></asp:Label><asp:Label ID="numIVALabel" runat="server" Text='<%# Bind("numIVA", "{0:C}") %>' Visible="False"></asp:Label><asp:CheckBox ID="blnAgotadoCheckBox" runat="server" Checked='<%# Bind("blnAgotado") %>'
                            Enabled="false" Visible="False" /></td>
                </tr>
                <tr>
                    <td class="campos">
                        Descripción</td>
                    <td class="valores" colspan="5">
                        <asp:Label ID="varDescripcionLabel" runat="server" Text='<%# Bind("varDescripcion") %>'></asp:Label></td>
                </tr><tr>
                    <td colspan="6" style="text-align: center">
                        <asp:GridView ID="gdvPropiedades" runat="server" AutoGenerateColumns="False" DataSourceID="sdsPropiedades" Width="300px">
                            <RowStyle CssClass="valores" />
                            <Columns>
                                <asp:BoundField DataField="varNombre" HeaderText="Propiedad Adicional" SortExpression="varNombre" />
                                <asp:BoundField DataField="varValor" HeaderText="Valor" SortExpression="varValor" />
                            </Columns>
                            <PagerStyle CssClass="campos" />
                            <HeaderStyle CssClass="titulos" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsPropiedades" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
                            SelectCommand="SELECT Propiedades.varNombre, PropiedadesProductos.varValor FROM Propiedades INNER JOIN PropiedadesProductos ON Propiedades.idPropiedad = PropiedadesProductos.idPropiedad WHERE (PropiedadesProductos.idProducto = @IdProducto) AND (Propiedades.idEstado = 1)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="IdProducto" QueryStringField="IdProducto" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="campos" colspan="6" style="text-align: center">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            ForeColor="White" Text="Modificar"></asp:LinkButton></td>
                </tr>
            </table>
            <br />
                        <asp:Button ID="btnFotos" runat="server" CssClass="botones" Text="Fotos" OnClick="btnFotos_Click" CausesValidation="False" />
            &nbsp;
            <asp:Button ID="btnListado" runat="server" CssClass="botones" 
        Text="Listado" OnClick="btnListado_Click" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sdsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:cnxBDPrincipal %>"
        SelectCommand="SELECT Productos.idProducto, Productos.varReferencia, Productos.varNombre, Productos.idCategoria, Productos.numValor, Productos.numIVA, Productos.numCantidad, Productos.idEstado, Productos.blnAgotado, Productos.varImagen, Productos.dtmFecha, Productos.varDescripcion, Categorias.varNombre AS Categoria, Estados.varDescripcion AS Estado, Productos.varArchivoAdjunto FROM Productos INNER JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria INNER JOIN Estados ON Productos.idEstado = Estados.idEstado WHERE (Productos.idProducto = @idProducto)" DeleteCommand="DELETE FROM [Productos] WHERE [idProducto] = @idProducto" InsertCommand="INSERT INTO Productos(varReferencia, varNombre, idCategoria, numValor, numIVA, numCantidad, idEstado, blnAgotado, varImagen, dtmFecha, varDescripcion, varArchivoAdjunto) VALUES (@varReferencia, @varNombre, @idCategoria, @numValor, @numIVA, @numCantidad, @idEstado, @blnAgotado, @varImagen, @dtmFecha, @varDescripcion, @varArchivoAdjunto)" UpdateCommand="UPDATE Productos SET varReferencia = @varReferencia, varNombre = @varNombre, idCategoria = @idCategoria, numValor = @numValor, numIVA = @numIVA, numCantidad = @numCantidad, idEstado = @idEstado, blnAgotado = @blnAgotado, varImagen = @varImagen, dtmFecha = @dtmFecha, varDescripcion = @varDescripcion, varArchivoAdjunto = @varArchivoAdjunto WHERE (idProducto = @idProducto)">
        <DeleteParameters>
            <asp:Parameter Name="idProducto" Type="Decimal" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="varReferencia" Type="String" />
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idCategoria" Type="Decimal" />
            <asp:Parameter Name="numValor" Type="Decimal" />
            <asp:Parameter Name="numIVA" Type="Decimal" />
            <asp:Parameter Name="numCantidad" Type="Decimal" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="blnAgotado" Type="Boolean" />
            <asp:Parameter Name="varImagen" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="varDescripcion" Type="String" />
            <asp:Parameter Name="varArchivoAdjunto" />
            <asp:Parameter Name="idProducto" Type="Decimal" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="idProducto" QueryStringField="IdProducto" Type="Decimal" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varReferencia" Type="String" />
            <asp:Parameter Name="varNombre" Type="String" />
            <asp:Parameter Name="idCategoria" Type="Decimal" />
            <asp:Parameter Name="numValor" Type="Decimal" />
            <asp:Parameter Name="numIVA" Type="Decimal" />
            <asp:Parameter Name="numCantidad" Type="Decimal" />
            <asp:Parameter Name="idEstado" Type="Int16" />
            <asp:Parameter Name="blnAgotado" Type="Boolean" />
            <asp:Parameter Name="varImagen" Type="String" />
            <asp:Parameter Name="dtmFecha" Type="DateTime" />
            <asp:Parameter Name="varDescripcion" Type="String" />
            <asp:Parameter Name="varArchivoAdjunto" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

