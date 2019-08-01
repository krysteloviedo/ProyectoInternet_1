<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_ReportesVtasCategoriaDetalle.aspx.vb" Inherits="MenuAdministrador_ReportesVtasCategoriaDetalle" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style3">
        <br />
        <strong>CONSULTAR RESUMEN DE VENTAS POR CATEGORIA</strong>
    </p>
    <p class="auto-style6">
      Categoria:&nbsp;<asp:DropDownList ID="cboCat" runat="server">
                    </asp:DropDownList>
    &nbsp;Fecha desde:&nbsp;<asp:TextBox ID="txtFecDes" runat="server" TextMode="Date"></asp:TextBox>
    &nbsp;Fecha hasta:&nbsp;<asp:TextBox ID="txtFecHas" runat="server" TextMode="Date"></asp:TextBox>
    </p>
    <p class="auto-style9">
                    <asp:Button ID="butCon" runat="server" Text="Consultar" />
    </p>
   
    <p class="auto-style10">
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
                Response.Write("<td><b><b> Categoria &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Plato &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Cantidad &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Precio &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("<td><b><b> Total &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></b></td>")
                Response.Write("</tr>")
                For i = 0 To intNumTotReg - 1
                    Response.Write("<tr>")
                    Response.Write("<td>" & dtb.Rows(i).Item("idOrden") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Fecha") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
                    Response.Write("<td>" & dtb.Rows(i).Item("Categoria") & "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   </td>")
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
    </p>                        
</asp:Content>
