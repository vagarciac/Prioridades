<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Prioridades</title>
    <link rel="stylesheet" href="styles/prioridades.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="header" class="header">
        <h2>GESTIÓN DE PRIORIDADES</h2>
        Localidades:
        <asp:DropDownList ID="ddlInmuebles" runat="server" DataSourceID="SqlDataSource4" DataTextField="Inmueble" DataValueField="IpVirtual" OnSelectedIndexChanged="ddlInmuebles_SelectedIndexChanged">
        </asp:DropDownList><br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Cat_Servidores] ORDER BY [Inmueble]"></asp:SqlDataSource>
        <br />
    </div>
    <div id="master" class="master">
        <asp:GridView ID="gvPrioridades" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="IdFuncion" PageSize="15">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="IdFuncion" HeaderText="IdFuncion" InsertVisible="False" ReadOnly="True" SortExpression="IdFuncion" />
                <asp:BoundField DataField="Funcion" HeaderText="Funcion" SortExpression="Funcion" />
                <asp:BoundField DataField="textoPlano" HeaderText="textoPlano" SortExpression="textoPlano" />
                <asp:BoundField DataField="IdLocalidad" HeaderText="IdLocalidad" SortExpression="IdLocalidad" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <EmptyDataTemplate>
                No hay datos para esta localidad.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" DeleteCommand="DELETE FROM [Cat_Funciones] WHERE [IdFuncion] = @original_IdFuncion AND [Funcion] = @original_Funcion AND [textoPlano] = @original_textoPlano AND [IdLocalidad] = @original_IdLocalidad AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND [Activo] = @original_Activo" InsertCommand="INSERT INTO [Cat_Funciones] ([Funcion], [textoPlano], [IdLocalidad], [Descripcion], [Activo]) VALUES (@Funcion, @textoPlano, @IdLocalidad, @Descripcion, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cat_Funciones]" UpdateCommand="UPDATE [Cat_Funciones] SET [Funcion] = @Funcion, [textoPlano] = @textoPlano, [IdLocalidad] = @IdLocalidad, [Descripcion] = @Descripcion, [Activo] = @Activo WHERE [IdFuncion] = @original_IdFuncion AND [Funcion] = @original_Funcion AND [textoPlano] = @original_textoPlano AND [IdLocalidad] = @original_IdLocalidad AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND [Activo] = @original_Activo">
            <DeleteParameters>
                <asp:Parameter Name="original_IdFuncion" Type="Int32" />
                <asp:Parameter Name="original_Funcion" Type="String" />
                <asp:Parameter Name="original_textoPlano" Type="String" />
                <asp:Parameter Name="original_IdLocalidad" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
                <asp:Parameter Name="original_Activo" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Funcion" Type="String" />
                <asp:Parameter Name="textoPlano" Type="String" />
                <asp:Parameter Name="IdLocalidad" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Funcion" Type="String" />
                <asp:Parameter Name="textoPlano" Type="String" />
                <asp:Parameter Name="IdLocalidad" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
                <asp:Parameter Name="original_IdFuncion" Type="Int32" />
                <asp:Parameter Name="original_Funcion" Type="String" />
                <asp:Parameter Name="original_textoPlano" Type="String" />
                <asp:Parameter Name="original_IdLocalidad" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
                <asp:Parameter Name="original_Activo" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div id="detail" class="detail">
        <asp:DetailsView ID="dvPrioridades" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="IdFuncion" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="IdFuncion" InsertVisible="False" SortExpression="IdFuncion">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("IdFuncion") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("IdFuncion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Funcion" HeaderText="Funcion" SortExpression="Funcion" />
                <asp:BoundField DataField="textoPlano" HeaderText="textoPlano" SortExpression="textoPlano" />
                <asp:BoundField DataField="IdLocalidad" HeaderText="IdLocalidad" SortExpression="IdLocalidad" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" ButtonType="Button" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" DeleteCommand="DELETE FROM [Cat_Funciones] WHERE [IdFuncion] = @original_IdFuncion AND [Funcion] = @original_Funcion AND [textoPlano] = @original_textoPlano AND [IdLocalidad] = @original_IdLocalidad AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND [Activo] = @original_Activo" InsertCommand="INSERT INTO [Cat_Funciones] ([Funcion], [textoPlano], [IdLocalidad], [Descripcion], [Activo]) VALUES (@Funcion, @textoPlano, @IdLocalidad, @Descripcion, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cat_Funciones] WHERE ([IdFuncion] = @IdFuncion)" UpdateCommand="UPDATE [Cat_Funciones] SET [Funcion] = @Funcion, [textoPlano] = @textoPlano, [IdLocalidad] = @IdLocalidad, [Descripcion] = @Descripcion, [Activo] = @Activo WHERE [IdFuncion] = @original_IdFuncion AND [Funcion] = @original_Funcion AND [textoPlano] = @original_textoPlano AND [IdLocalidad] = @original_IdLocalidad AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND [Activo] = @original_Activo">
            <DeleteParameters>
                <asp:Parameter Name="original_IdFuncion" Type="Int32" />
                <asp:Parameter Name="original_Funcion" Type="String" />
                <asp:Parameter Name="original_textoPlano" Type="String" />
                <asp:Parameter Name="original_IdLocalidad" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
                <asp:Parameter Name="original_Activo" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Funcion" Type="String" />
                <asp:Parameter Name="textoPlano" Type="String" />
                <asp:Parameter Name="IdLocalidad" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvPrioridades" Name="IdFuncion" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Funcion" Type="String" />
                <asp:Parameter Name="textoPlano" Type="String" />
                <asp:Parameter Name="IdLocalidad" Type="Int32" />
                <asp:Parameter Name="Descripcion" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
                <asp:Parameter Name="original_IdFuncion" Type="Int32" />
                <asp:Parameter Name="original_Funcion" Type="String" />
                <asp:Parameter Name="original_textoPlano" Type="String" />
                <asp:Parameter Name="original_IdLocalidad" Type="Int32" />
                <asp:Parameter Name="original_Descripcion" Type="String" />
                <asp:Parameter Name="original_Activo" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
    </form>
</body>
</html>
