<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_ReportesVtasClienteDetalle.aspx.vb" Inherits="MenuAdministrador_ReportesVtasClienteDetalle" %>

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
    .auto-style3 {
        text-align: center;
        width: 1280px;
    }
        .auto-style6 {
            width: 1274px;
        }
        .auto-style9 {
            width: 1272px;
        }
        .auto-style10 {
            width: 1274px;
            text-align: justify;
        }
        .auto-style11 {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style3">
        <br />
        <strong>CONSULTAR DETALLE DE VENTAS POR C</strong>L<span class="auto-style11">IENTE</span>
    </p>
    <p class="auto-style6">      
    &nbsp;Fecha desde:&nbsp;<asp:TextBox ID="txtFecDes" runat="server" TextMode="Date"></asp:TextBox>
    &nbsp;Fecha hasta:&nbsp;<asp:TextBox ID="txtFecHas" runat="server" TextMode="Date"></asp:TextBox>
    </p>
    <p class="auto-style9">
                    <asp:Button ID="butCon" runat="server" Text="Consultar" />
    </p>
   
    <p class="auto-style10">
        
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
                Response.Write("<table border='3'>")
                Response.Write("<tr>")
                Response.Write("<td><b><b>&nbspNumero Orden &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Fecha &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Cliente &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Plato &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Cantidad &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Precio &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Total &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("</tr>")
                For i = 0 To intNumTotReg - 1
                    Response.Write("<tr>")
                    Response.Write("<td>" & dtb.Rows(i).Item("idOrden") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Fecha") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Cliente") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Plato") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Cantidad") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Precio") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Total") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("</tr>")
                Next
                Response.Write("</table>")
                con.Close()
            End If
        %>
                </td>
                <td>
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="500px" Width="500px">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="Cliente" YValueMembers="TotalVtas">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1">
                                <CellColumns>
                                    <asp:LegendCellColumn Name="Column1">
                                        <Margins Left="15" Right="15" />
                                    </asp:LegendCellColumn>
                                </CellColumns>
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RrestauranTESConnectionString %>" SelectCommand="SELECT SUM(ODE.Total) AS TotalVtas, ORD.Cliente FROM tbm_Platos AS PLA INNER JOIN tbm_Orden_Detalle AS ODE ON PLA.IdPlato = ODE.IdPlato INNER JOIN tbm_Ordenes AS ORD ON ORD.IdOrden = ODE.IdOrden WHERE (ORD.Fecha BETWEEN @txtFecDes AND @txtFecHas) GROUP BY ORD.Cliente, ORD.Fecha ORDER BY ORD.Fecha">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtFecDes" DefaultValue="01/01/1900" Name="txtFecDes" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtFecHas" DefaultValue="01/01/3000" Name="txtFecHas" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p>                        
</asp:Content>
