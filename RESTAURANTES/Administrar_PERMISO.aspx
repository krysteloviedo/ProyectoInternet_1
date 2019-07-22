<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Administrar_PERMISO.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>RestauranTES.com</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"/> 
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script> 
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.equalheights.js" type="text/javascript"></script> 
    <style type="text/css">
         .auto-style10 {width: 100%;overflow: hidden;text-align: left;
        }
         .menu{
             padding-right:10px;
         }
         </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>Administrar Permisos</h2>
                </div>
            </div>
        </div>
        <section id="content"><div class="ic"></div>
        <div class="main">
            <div class="auto-style10">
            	
         


              
                      
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Descripcion" DataSourceID="SqlDataSource1" GridLines="None" Width="588px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:TemplateField HeaderText="Permiso" SortExpression="Permiso">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Permiso") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Permiso") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion" SortExpression="Descripcion">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Table] WHERE [Descripcion] = @Descripcion" InsertCommand="INSERT INTO [Table] ([Permiso], [Descripcion]) VALUES (@Permiso, @Descripcion)" SelectCommand="SELECT [Permiso], [Descripcion] FROM [Table]" UpdateCommand="UPDATE [Table] SET [Permiso] = @Permiso WHERE [Descripcion] = @Descripcion">
                    <DeleteParameters>
                        <asp:Parameter Name="Descripcion" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Permiso" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Permiso" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Descripcion" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                    <EditItemTemplate>
                        Permiso:
                        <asp:TextBox ID="PermisoTextBox" runat="server" Text='<%# Bind("Permiso") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel1" runat="server" Text='<%# Eval("Descripcion") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Permiso:
                        <asp:TextBox ID="PermisoTextBox" runat="server" Text='<%# Bind("Permiso") %>' />
                        <br />
                        Descripcion:
                        <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Permiso:
                        <asp:Label ID="PermisoLabel" runat="server" Text='<%# Bind("Permiso") %>' />
                        <br />
                        Descripcion:
                        <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" PostBackUrl="~/Perfiles.aspx" Text="Atras" />
                <br />
            	
         


              
                      
            </div>
        </div>
        </section>
    </div>
    

</asp:Content>

