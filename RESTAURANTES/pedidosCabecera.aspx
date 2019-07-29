<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="pedidosCabecera.aspx.vb" Inherits="pedidosCabecera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="content" class="auto-style8"><div class="ic"></div> 
        <div>
            <div>
                <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:GridView ID="gridPedidos" runat="server" AutoGenerateColumns="false" DataKeyNames = "Numero_Pedido">
                    <Columns>
                        <asp:BoundField DataField="Numero_Pedido" HeaderText="Numero_Pedido"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                        <asp:BoundField DataField="Fecha_Pedido" HeaderText="Fecha_Pedido"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                        <asp:TemplateField HeaderText="Pedido" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkCat1" CssClass="linkCat" runat="server" ClientIDMode="Static" Text="Ver pedido" OnClick="LinkButton1_Click" CommandArgument="Pedido"></asp:LinkButton>  
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <editrowstyle BackColor="#999999"></editrowstyle>
                    <footerstyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></footerstyle>
                    <pagerstyle BackColor="#284775" ForeColor="White"  HorizontalAlign="Center"></pagerstyle>
                    <rowstyle BackColor="#F7F6F3" ForeColor="#333333"></rowstyle>
                    <selectedrowstyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></selectedrowstyle>
                    <sortedascendingcellstyle BackColor="#E9E7E2"></sortedascendingcellstyle>
                    <sortedascendingheaderstyle BackColor="#506C8C"></sortedascendingheaderstyle>
                    <sorteddescendingcellstyle BackColor="#FFFDF8"></sorteddescendingcellstyle>
                    <sorteddescendingheaderstyle BackColor="#6F8DAE"></sorteddescendingheaderstyle>
                </asp:GridView>
            </div>
        </div>       
        </section>
</asp:Content>

