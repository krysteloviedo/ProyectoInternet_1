<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="muestraPedidos.aspx.vb" Inherits="muestraPedidos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .Star
        {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
  <section id="content" class="auto-style8"><div class="ic"></div> 
        <div>
            <div>
                <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:GridView ID="gridPedidos" runat="server" AutoGenerateColumns="false" DataKeyNames = "IdOrden">
                    <Columns>
                        <asp:BoundField DataField="IdPlato" HeaderText="IdPlato" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                        <asp:BoundField DataField="Plato" HeaderText="Plato" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                        <asp:BoundField DataField="Precio" HeaderText="Precio" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Justify"/>
                        <asp:TemplateField HeaderText="Rating" >
                            <ItemTemplate>
                                <ajaxToolkit:Rating ID="Rating1" AutoPostBack="false" runat="server"
                                    StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                    FilledStarCssClass="FilledStar" CurrentRating = '<%# Eval("Rating") %>' >
                                </ajaxToolkit:Rating>
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
            <div>                
                <asp:Button ID="Button2" runat="server" Text="Votar" CssClass="auto-style22" OnClick="Button2_Click"  AutoPostBack="false"/>
                <ajaxToolkit:ConfirmButtonExtender ID="Button2_ConfirmButtonExtender" runat="server" ConfirmText="¿Está seguro que desea ingresar datos?" OnClientCancel="Operación cancelada" TargetControlID="Button2" />
            </div>
        </div>       
        </section>
</asp:Content>

