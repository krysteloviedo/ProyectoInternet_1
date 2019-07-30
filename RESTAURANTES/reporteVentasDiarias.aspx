<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="reporteVentasDiarias.aspx.vb" Inherits="reporteVentasDiarias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-12 col-s-12">
       <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ScriptManager>
    <div class="row">
        <div class="col-sm-6">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Fecha Desde"></asp:Label>
                <asp:TextBox ID="txtFechaDesde" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtFechaDesde_CalendarExtender" runat="server" BehaviorID="txtFechaDesde_CalendarExtender" TargetControlID="txtFechaDesde" Format="dd-MM-yyyy" />
                <asp:Label ID="Label3" runat="server" Text="Fecha Hasta"></asp:Label>
                <asp:TextBox ID="txtFechaHasta" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtFechaHasta_CalendarExtender" runat="server" BehaviorID="txtFechaHasta_CalendarExtender" TargetControlID="txtFechaHasta" Format="dd-MM-yyyy" />
            </div>
            <div>     
                <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
            
            </div>
        </div>
        <div class="col-sm-6">     
            <asp:GridView ID="gridVentas" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"   
            CellPadding="4" ForeColor="Black" GridLines="Vertical">  
            <AlternatingRowStyle BackColor="White" />  
            <Columns>  
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                <asp:BoundField DataField="Plato" HeaderText="Plato" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                <asp:BoundField DataField="Total" HeaderText="Total" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>                        
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

