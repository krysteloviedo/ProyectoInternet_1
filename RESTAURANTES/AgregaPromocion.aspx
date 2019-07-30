<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AgregaPromocion.aspx.vb" Inherits="AgregaPromocion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="col-12 col-s-12">
       <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ScriptManager>
    <div class="aside">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Nombre de la promoción"></asp:Label>
            <asp:TextBox ID="txtNombreP" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Fecha Desde"></asp:Label>
            <asp:TextBox ID="txtFechaDesde" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txtFechaDesde_CalendarExtender" runat="server" BehaviorID="txtFechaDesde_CalendarExtender" TargetControlID="txtFechaDesde" Format="dd-MM-yyyy" />
            <asp:Label ID="Label3" runat="server" Text="Fecha Hasta"></asp:Label>
            <asp:TextBox ID="txtFechaHasta" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txtFechaHasta_CalendarExtender" runat="server" BehaviorID="txtFechaHasta_CalendarExtender" TargetControlID="txtFechaHasta" Format="dd-MM-yyyy" />
        </div>
        <div>            
            <asp:CheckBox ID="chkIva" runat="server" Text="Precio no incluye iva"/>
        </div>
        <div>     
            <asp:Label ID="Label4" runat="server" Text="Subir imagen"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />       
        </div>
        <div>     
            <asp:Button ID="btnAdd" runat="server" Text="Agregar promoción" />
        </div>
    </div>
  </div>

</asp:Content>

