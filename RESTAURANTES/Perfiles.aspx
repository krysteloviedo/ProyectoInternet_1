<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Perfiles.aspx.vb" Inherits="_Default" %>

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
         .auto-style10 {width: 100%;overflow: hidden;text-align: center;}
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
                	<h2>Perfiles</h2>
                </div>
            </div>
        </div>
        <section id="content"><div class="ic"></div>
        <div class="main">
            <div class="auto-style10">
          

                <div class="text-left">
               
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Permiso" DataValueField="Permiso">
                    </asp:DropDownList>
                    <asp:Button ID="Button2" runat="server" Text="Button" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Permiso] FROM [Table]"></asp:SqlDataSource>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource2" ForeColor="Black" Width="410px">
                        <Columns>
                            <asp:BoundField DataField="Permiso" HeaderText="Permiso" SortExpression="Permiso" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:ButtonField ButtonType="Button" HeaderText="Pagina" Text="Ir" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Table] WHERE ([Permiso] = @Permiso)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Permiso" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button1" runat="server" Height="25px" PostBackUrl="~/Administrar_PERMISO.aspx" Text="Administar permisos" />
               
                </div>  
                        
            </div>
        </div>   
        </section>
    </div>
    

</asp:Content>

