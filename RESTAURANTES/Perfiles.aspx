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
            <div>          
                <div>               
                    <asp:DropDownList ID="cboRol" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboRol_SelectedIndexChanged"></asp:DropDownList>
                </div>  
                <div>  
      
        <asp:GridView ID="gridPerfiles" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"   
            CellPadding="4" ForeColor="Black" GridLines="Vertical">  
            <AlternatingRowStyle BackColor="White" />  
            <Columns>  
                <asp:TemplateField HeaderText="MenuId">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MenuId") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("MenuId") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Rol">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Rol") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Rol") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Nombre">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Titulo") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Titulo") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Página">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Pagina") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Pagina") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Permiso">  
                    <EditItemTemplate>  
                        <asp:CheckBox ID="chkPermiso" runat="server" />  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:CheckBox ID="chkPermiso" runat="server" />  
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
            <FooterStyle BackColor="#CCCC99" />  
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />  
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />  
            <RowStyle BackColor="#F7F7DE" />  
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#FBFBF2" />  
            <SortedAscendingHeaderStyle BackColor="#848384" />  
            <SortedDescendingCellStyle BackColor="#EAEAD3" />  
            <SortedDescendingHeaderStyle BackColor="#575357" />  
        </asp:GridView>  
      
        <br />  
      
    </div>         
                    <asp:Button ID="btnEstablecer" runat="server"    
        Text="Establecer permisos" />  
            </div>
        </div>   
        </section>
    </div>
    

</asp:Content>

