<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="reportePlatosCategoria.aspx.vb" Inherits="reportePlatosCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-12 col-s-12">
       <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ScriptManager>
    <div class="row">
        <div class="col-sm-6">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Categoria"></asp:Label>
                <asp:DropDownList ID="cboCategoria" runat="server">
                <asp:ListItem Enabled="true" Text="Seleccione categoria" Value="-1"></asp:ListItem>                
            </asp:DropDownList>
            </div>
            <div>     
                <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
            
            </div>
        </div>
        <div class="col-sm-6">     
            <asp:GridView ID="gridPlatosCat" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"   
            CellPadding="4" ForeColor="Black" GridLines="Vertical">  
            <AlternatingRowStyle BackColor="White" />  
            <Columns>  
                <asp:BoundField DataField="IdPlato" HeaderText="IdPlato" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha_Creacion" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>                        
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>                        
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
        </div>
    </div>
  </div>
</asp:Content>

