<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_ReportesVtasClienteResumen.aspx.vb" Inherits="MenuAdministrador_ReportesVtasClienteResumen" %>

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
        width: 1281px;
        height: 39px;
            text-align: center;
        }
    .auto-style3 {
        text-align: center;
        width: 1276px;
    }
        .auto-style4 {
            width: 1275px;
            height: 36px;
        }
        .auto-style5 {
            width: 1275px;
            height: 44px;
        }
        .auto-style6 {
            width: 1281px;
        }
        .auto-style7 {
            width: 679px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style3">
        <br />
        <strong>CONSULTAR RESUMEN VENTAS POR CLIENTE</strong>
    </p>
    <p class="auto-style6">      
    &nbsp;Fecha desde:&nbsp;<asp:TextBox ID="txtFecDes" runat="server" TextMode="Date"></asp:TextBox>
    &nbsp;Fecha hasta:&nbsp;<asp:TextBox ID="txtFecHas" runat="server" TextMode="Date"></asp:TextBox>
    </p>   
    
    <p class="auto-style4">
        
        <table class="w-100">
            <tr>
                <td>&nbsp;
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
                Response.Write("<td><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNombre Cliente &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></td>")
                Response.Write("<td><b>Ventas totales</b></td>")
                Response.Write("</tr>")
                For i = 0 To intNumTotReg - 1
                    Response.Write("<tr>")
                    Response.Write("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" & dtb.Rows(i).Item("Cliente") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Sumacliente") & "</td>")
                    Response.Write("</tr>")
                Next
                Response.Write("</table>")
                con.Close()
            End If
             %>
                </td>
                <td>&nbsp;
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="Cliente" YValueMembers="Sumacliente" ChartType="Pie">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
            </tr>
        </table>
    </p>
    <p class="auto-style5">
        <table class="w-100">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td>
                    
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RrestauranTESConnectionString %>" SelectCommand="SELECT SUM(ODE.Total) AS Sumacliente, ORD.Cliente FROM tbm_Platos_Categoria AS CAT INNER JOIN tbm_Platos AS PLA ON CAT.IdPlatCat = PLA.IdPlatCat INNER JOIN tbm_Orden_Detalle AS ODE ON PLA.IdPlato = ODE.IdPlato INNER JOIN tbm_Ordenes AS ORD ON ORD.IdOrden = ODE.IdOrden WHERE (ORD.Fecha &gt;= @fecha) AND (ORD.Fecha &lt;= @fecha2) GROUP BY ORD.Cliente">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtFecDes" Name="fecha" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtFecHas" Name="fecha2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RrestauranTESConnectionString %>" SelectCommand="SELECT SUM(ODE.Total) AS Sumacliente, ORD.Cliente FROM tbm_Platos_Categoria AS CAT INNER JOIN tbm_Platos AS PLA ON CAT.IdPlatCat = PLA.IdPlatCat INNER JOIN tbm_Orden_Detalle AS ODE ON PLA.IdPlato = ODE.IdPlato INNER JOIN tbm_Ordenes AS ORD ON ORD.IdOrden = ODE.IdOrden GROUP BY ORD.Cliente"></asp:SqlDataSource>--%>
    </p>
    <p class="auto-style2">
                    <asp:Button ID="butCon" runat="server" Text="Consultar" />
    </p>
</asp:Content>
