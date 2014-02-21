<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Servicios y Prioridades</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="styles/jquery-ui.css"/>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <link rel="stylesheet" href="styles/servicios.css" />
    <link rel="stylesheet" href="styles/prioridades.css" />
    <script>
        $(function () {
            $("#tabs").tabs();
            $('#tabs .ui-tabs-nav a[href="#tabs-1"], #tabs-1').addClass('status1');
            $('#tabs .ui-tabs-nav a[href="#tabs-2"], #tabs-2').addClass('status2');
            $(document).tooltip({ position: { my: "left+15 center", at: "right center" } });
            $("#detail").draggable();
            $("#detail2").draggable();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="tabs" class="servicios">
            <ul>
                <li><a href="#tabs-1">Administración de Servicios</a></li>
                <li><a href="#tabs-2">Administración de Prioridades</a></li>
            </ul>
            <div id="tabs-1">
                <div id="header2">
                    Localidad:
                    <asp:DropDownList ID="ddlLocalidades2" runat="server" DataSourceID="SqlDataSource5" DataTextField="Localidad" DataValueField="idLocalidad" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT Cat_Servidores_Localidad.IpVirtual, Cat_Servidores_Localidad.idLocalidad, CL.Localidad FROM Cat_Servidores_Localidad INNER JOIN Cat_Localidad AS CL ON Cat_Servidores_Localidad.idLocalidad = CL.Id ORDER BY CL.Localidad"></asp:SqlDataSource>
                    IP:
                    <asp:DropDownList ID="ddlIP2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="IpVirtual" DataValueField="Inmueble"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT * FROM [Cat_Servidores_Localidad] WHERE ([idLocalidad] = @idLocalidad)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlLocalidades2" Name="idLocalidad" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br /><br />
                </div>
                <div id="master2" class="master">
                    <asp:GridView ID="gvMaestro2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource7" ForeColor="#333333" GridLines="None" OnPreRender="gvMaestro2_PreRender" PageSize="15" DataKeyNames="idServicio">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/select.png" ShowSelectButton="True" />
                            <asp:BoundField DataField="IdServicio" HeaderText="ID" SortExpression="IdServicio" />
                            <asp:BoundField DataField="NombreServicio" HeaderText="Servicio" SortExpression="NombreServicio" />
                            <asp:CheckBoxField DataField="Activo" HeaderText="conCita" />
                            <asp:CheckBoxField DataField="ActivoSinCita" HeaderText="sinCita" />
                            <asp:BoundField DataField="PrefijoServicio" HeaderText="Prefijo" SortExpression="PrefijoServicio" />
                            <asp:BoundField DataField="Num_Min_Cola" HeaderText="minCola" SortExpression="Num_Min_Cola" />
                            <asp:BoundField DataField="Num_Max_Cola" HeaderText="maxCola" SortExpression="Num_Max_Cola" />
                            <asp:BoundField DataField="Ultimo_Num_Emitido" HeaderText="últNúmEmit" SortExpression="Ultimo_Num_Emitido" />
                            <asp:BoundField DataField="Ultimo_Ticket_Llamado" HeaderText="últTicketLlam" SortExpression="Ultimo_Ticket_Llamado" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
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
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT DISTINCT Cat_Localidad.Id, Servicio.IdServicio, Servicio.NombreServicio, Servicio.Activo, Servicio.ActivoSinCita, Servicio.PrefijoServicio, Servicio.Num_Min_Cola, Servicio.Num_Max_Cola, Servicio.Ultimo_Num_Emitido, Servicio.Tiempo_Ultimo_Emitido, Servicio.Ultimo_Ticket_Llamado FROM ServiciosLocalidad INNER JOIN Cat_Localidad ON ServiciosLocalidad.Localidad = Cat_Localidad.Id INNER JOIN Servicio ON ServiciosLocalidad.Servicios = Servicio.IdServicio WHERE (Cat_Localidad.Id = @idLocalidad)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlLocalidades2" Name="idLocalidad" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    Buscar por:
                    <asp:TextBox ID="tbServicio" runat="server" ToolTip="Nombre del servicio." Width="290px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:GridView ID="gvBuscar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource9" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IdServicio" HeaderText="ID" SortExpression="IdServicio" />
                            <asp:BoundField DataField="NombreServicio" HeaderText="Servicio" SortExpression="NombreServicio" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>
                            No existe el servicio.
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
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT [IdServicio], [NombreServicio] FROM ServiciosLocalidad INNER JOIN Cat_Localidad ON ServiciosLocalidad.Localidad = Cat_Localidad.Id INNER JOIN Servicio ON ServiciosLocalidad.Servicios = Servicio.IdServicio WHERE (Cat_Localidad.Id = @idLocalidad) AND (Servicio.NombreServicio = @NombreServicio)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlLocalidades2" Name="idLocalidad" PropertyName="SelectedValue" />
                            <asp:FormParameter FormField="tbServicio" Name="NombreServicio" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div id="detail2" class="detail">
                    <asp:DetailsView ID="dvDetalle2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource8" ForeColor="#333333" GridLines="None" OnItemCreated="dvDetalle2_ItemCreated" HeaderText="Detalle" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="IdServicio" HeaderText="ID:" SortExpression="IdServicio" />
                            <asp:BoundField DataField="NombreServicio" HeaderText="Servicio:" SortExpression="NombreServicio">
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Activo" HeaderText="conCita:" SortExpression="Activo" />
                            <asp:CheckBoxField DataField="ActivoSinCita" HeaderText="sinCita:" SortExpression="ActivoSinCita" />
                            <asp:BoundField DataField="PrefijoServicio" HeaderText="prefijoServicio:" SortExpression="PrefijoServicio" />
                            <asp:BoundField DataField="Num_Min_Cola" HeaderText="númMinCola:" SortExpression="Num_Min_Cola" />
                            <asp:BoundField DataField="Num_Max_Cola" HeaderText="númMaxCola:" SortExpression="Num_Max_Cola" />
                            <asp:BoundField DataField="Ultimo_Num_Emitido" HeaderText="últimoNúmEmitido:" SortExpression="Ultimo_Num_Emitido" />
                            <asp:BoundField DataField="Ultimo_Ticket_Llamado" HeaderText="últimoTicketLlamado:" SortExpression="Ultimo_Ticket_Llamado" />
                            <asp:CommandField ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelImageUrl="~/images/exit.jpg" DeleteImageUrl="~/images/delete.png" EditImageUrl="~/images/edit.png" InsertImageUrl="~/images/insert.png" NewImageUrl="~/images/insert.png" UpdateImageUrl="~/images/edit.png" CancelText="Salir" DeleteText="Borrar" EditText="Actualizar" InsertText="Insertar" NewText="Agregar" SelectText="Seleccionar" UpdateText="Actualizar">
                                <ItemStyle CssClass="centrar" Wrap="False" />
                            </asp:CommandField>
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT IdServicio, NombreServicio, Activo, ActivoSinCita, PrefijoServicio, Num_Min_Cola, Num_Max_Cola, Ultimo_Num_Emitido, Tiempo_Ultimo_Emitido, Ultimo_Ticket_Llamado FROM Servicio WHERE (IdServicio = @idServicio)" DeleteCommand="DELETE FROM [Cat_Funciones] WHERE [IdFuncion] = @IdFuncion" InsertCommand="INSERT INTO [Cat_Funciones] ([Funcion], [textoPlano], [IdLocalidad], [Descripcion], [Activo]) VALUES (@Funcion, @textoPlano, @IdLocalidad, @Descripcion, @Activo)" UpdateCommand="UPDATE [Cat_Funciones] SET [Funcion] = @Funcion, [textoPlano] = @textoPlano, [IdLocalidad] = @IdLocalidad, [Descripcion] = @Descripcion, [Activo] = @Activo WHERE [IdFuncion] = @IdFuncion">
                        <DeleteParameters>
                            <asp:Parameter Name="IdFuncion" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Funcion" Type="String" />
                            <asp:Parameter Name="textoPlano" Type="String" />
                            <asp:Parameter Name="IdLocalidad" Type="Int32" />
                            <asp:Parameter Name="Descripcion" Type="String" />
                            <asp:Parameter Name="Activo" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaestro2" Name="idServicio" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Funcion" Type="String" />
                            <asp:Parameter Name="textoPlano" Type="String" />
                            <asp:Parameter Name="IdLocalidad" Type="Int32" />
                            <asp:Parameter Name="Descripcion" Type="String" />
                            <asp:Parameter Name="Activo" Type="Boolean" />
                            <asp:Parameter Name="IdFuncion" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

            </div>
            <div id="tabs-2">
                <div id="header">
                    Localidad:
                    <asp:DropDownList ID="ddlLocalidades" runat="server" DataSourceID="SqlDataSource1" DataTextField="Localidad" DataValueField="idLocalidad" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT Cat_Servidores_Localidad.IpVirtual, Cat_Servidores_Localidad.idLocalidad, CL.Localidad FROM Cat_Servidores_Localidad INNER JOIN Cat_Localidad AS CL ON Cat_Servidores_Localidad.idLocalidad = CL.Id ORDER BY CL.Localidad"></asp:SqlDataSource>
                    IP:
                    <asp:DropDownList ID="ddlIP" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="IpVirtual" DataValueField="Inmueble"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT * FROM [Cat_Servidores_Localidad] WHERE ([idLocalidad] = @idLocalidad)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlLocalidades" Name="idLocalidad" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br /><br />
                </div>
                <div id="master" class="master">
                    <asp:GridView ID="gvMaestro" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" DataKeyNames="IdFuncion" OnPreRender="gvMaestro_PreRender" PageSize="15">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/images/select.png" SelectText="Seleccionar" />
                            <asp:BoundField DataField="IdFuncion" HeaderText="idFunción" InsertVisible="False" ReadOnly="True" SortExpression="IdFuncion" />
                            <asp:BoundField DataField="textoPlano" HeaderText="textoPlano" SortExpression="textoPlano" />
                            <asp:BoundField DataField="Funcion" HeaderText="Función" SortExpression="Funcion" />
                            <asp:BoundField DataField="IdLocalidad" HeaderText="idLocalidad" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                            <asp:CheckBoxField DataField="Activo" HeaderText="Activo" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
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
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT [IdFuncion], [Funcion], [textoPlano], [IdLocalidad], [Descripcion], [Activo] FROM [Cat_Funciones] WHERE ([IdLocalidad] = @IdLocalidad)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlLocalidades" Name="IdLocalidad" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    Buscar por:
                    <asp:TextBox ID="tbPrioridad" runat="server" Width="337px" ToolTip="Nombre de la prioridad"></asp:TextBox>
                    <br />
                    <br />
                    <asp:GridView ID="gvBuscar" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdFuncion" DataSourceID="SqlDataSource10" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IdFuncion" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IdFuncion" />
                            <asp:BoundField DataField="Funcion" HeaderText="Función" SortExpression="Funcion" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>
                            No existe la prioridad.
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
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT [IdFuncion], [Funcion] FROM [Cat_Funciones] WHERE (([textoPlano] = @Prioridad) AND ([IdLocalidad] = @IdLocalidad))">
                        <SelectParameters>
                            <asp:FormParameter FormField="tbPrioridad" Name="Prioridad" />
                            <asp:ControlParameter ControlID="ddlLocalidades" Name="IdLocalidad" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div id="detail" class="detail">
                    <asp:DetailsView ID="dvDetalle" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" OnItemCreated="dvDetalle_ItemCreated" HeaderText="Detalle">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="IdFuncion" HeaderText="idFunción:" InsertVisible="False" ReadOnly="True" SortExpression="IdFuncion" />
                            <asp:BoundField DataField="Funcion" HeaderText="Función:" SortExpression="Funcion" />
                            <asp:BoundField DataField="textoPlano" HeaderText="textoPlano" SortExpression="textoPlano">
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IdLocalidad" HeaderText="idLocalidad:" SortExpression="IdLocalidad" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción:" SortExpression="Descripcion" />
                            <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Image" CancelText="Salir" DeleteImageUrl="~/images/delete.png" DeleteText="Borrar" EditText="Actualizar" InsertText="Insertar" NewImageUrl="~/images/insert.png" NewText="Agregar" SelectText="Seleccionar" UpdateText="Actualizar" CancelImageUrl="~/images/exit.jpg" EditImageUrl="~/images/edit.png" InsertImageUrl="~/images/insert.png" UpdateImageUrl="~/images/edit.png">
                                <ItemStyle Wrap="False" CssClass="centrar" HorizontalAlign="Justify" />
                            </asp:CommandField>
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TurnosConnectionString %>" SelectCommand="SELECT [IdFuncion], [Funcion], [textoPlano], [IdLocalidad], [Descripcion], [Activo] FROM [Cat_Funciones] WHERE ([IdFuncion] = @IdFuncion)" DeleteCommand="DELETE FROM [Cat_Funciones] WHERE [IdFuncion] = @IdFuncion" InsertCommand="INSERT INTO [Cat_Funciones] ([Funcion], [textoPlano], [IdLocalidad], [Descripcion], [Activo]) VALUES (@Funcion, @textoPlano, @IdLocalidad, @Descripcion, @Activo)" UpdateCommand="UPDATE [Cat_Funciones] SET [Funcion] = @Funcion, [textoPlano] = @textoPlano, [IdLocalidad] = @IdLocalidad, [Descripcion] = @Descripcion, [Activo] = @Activo WHERE [IdFuncion] = @IdFuncion">
                        <DeleteParameters>
                            <asp:Parameter Name="IdFuncion" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Funcion" Type="String" />
                            <asp:Parameter Name="textoPlano" Type="String" />
                            <asp:Parameter Name="IdLocalidad" Type="Int32" />
                            <asp:Parameter Name="Descripcion" Type="String" />
                            <asp:Parameter Name="Activo" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaestro" Name="IdFuncion" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Funcion" Type="String" />
                            <asp:Parameter Name="textoPlano" Type="String" />
                            <asp:Parameter Name="IdLocalidad" Type="Int32" />
                            <asp:Parameter Name="Descripcion" Type="String" />
                            <asp:Parameter Name="Activo" Type="Boolean" />
                            <asp:Parameter Name="IdFuncion" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
