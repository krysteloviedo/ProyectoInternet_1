<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_ReportesVtasCategoria.aspx.vb" Inherits="MenuAdministrador_ReportesVtasCategoria" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
        .style3
        {
            width: 81px;
        }
    .auto-style2 {
        width: 500px;
        height: 39px;
            text-align: right;
        }
    .auto-style3 {
        text-align: center;
        width: 955px;
    }
        .auto-style4 {
            width: 960px;
            height: 36px;
        }
        .auto-style5 {
            width: 960px;
            height: 44px;
        }
        .auto-style6 {
            width: 954px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style3">
        <br />
        <strong>CONSULTAR VENTAS POR CATEGORIA</strong>
    </p>
    <p class="auto-style6">      
    &nbsp;Fecha desde:&nbsp;<asp:TextBox ID="txtFecDes" runat="server" TextMode="Date"></asp:TextBox>
    &nbsp;Fecha hasta:&nbsp;<asp:TextBox ID="txtFecHas" runat="server" TextMode="Date"></asp:TextBox>
    </p>   
    
    <p class="auto-style4">
        <%
            Dim intNumTotReg As Integer, i As Integer
            Try
                intNumTotReg = dtb.Rows.Count
            Catch ex As Exception
                intNumTotReg = 0
            End Try
            If intNumTotReg = 0 Then
                Response.Write("<BR>No se encontró ningún registro.</p>")
            Else
                Response.Write("<table border='1'>")
                Response.Write("<tr>")
                Response.Write("<td><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNombre Categoria &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></td>")
                Response.Write("<td><b>Ventas Categoria</b></td>")
                Response.Write("</tr>")
                For i = 0 To intNumTotReg - 1
                    Response.Write("<tr>")
                    Response.Write("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" & dtb.Rows(i).Item("nombre") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("SumaCategoria") & "</td>")
                    Response.Write("</tr>")
                Next
                Response.Write("</table>")
                con.Close()
            End If
    %>
                    Categoria:&nbsp;<asp:DropDownList ID="cboCat" runat="server">
                    </asp:DropDownList>
    </p>
    <p class="auto-style5">
        &nbsp;<asp:Chart ID="ChartCatVtas" runat="server" Height="218px" Width="278px" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series Name="VentasXCategoria" XValueMember="Nombre" YValueMembers="SumaCategoria">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RrestauranTESConnectionString %>" SelectCommand="SELECT SUM(ODE.Total) AS SumaCategoria, CAT.Nombre FROM tbm_Platos_Categoria AS CAT INNER JOIN tbm_Platos AS PLA ON CAT.IdPlatCat = PLA.IdPlatCat INNER JOIN tbm_Orden_Detalle AS ODE ON PLA.IdPlato = ODE.IdPlato INNER JOIN tbm_Ordenes AS ORD ON ODE.IdOrden = ORD.IdOrden AND ODE.IdOrden = ORD.IdOrden WHERE (CAT.Nombre = @Categoria) AND (ORD.Fecha &gt;= @fecha) AND (ORD.Fecha &lt;= @fecha2) GROUP BY CAT.Nombre, ORD.Fecha">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboCat" DefaultValue="(Todos)" Name="Categoria" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtFecDes" DefaultValue="01/01/1900" Name="fecha" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtFecHas" DefaultValue="01/01/3000" Name="fecha2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="auto-style2">
                    <asp:Button ID="butCon" runat="server" Text="Consultar" />
    </p>
</asp:Content>
