﻿Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Partial Class reportePlatosVendidos
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dt As DataTable
    Public dt2 As DataTable
    Public dt3 As DataTable
    Public dtbA, dtbB, dtbciu, dtbpai As DataTable
    Public strSQL As String
    Public strSQL2 As String
    Public strSQL3 As String
    Public Usuario As String
    Public sds As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.txtFechaDesde.Text = DateTime.Now.ToString("dd-MM-yyyy")
            Me.txtFechaHasta.Text = DateTime.Now.ToString("dd-MM-yyyy")
        End If
    End Sub

    Private Sub cargaDatos()
        If Not cboTipo.SelectedValue = "-1" Then
            Dim valor As String = String.Empty
            If cboTipo.SelectedValue = "1" Then
                valor = "> 1"
            Else
                valor = "<= 1"
            End If
            gridPlatos.DataSource = Nothing
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Usuario = Session("CodigoMesero")
            con.Open()
            strSQL = "select CONVERT(DATE, ordCab.Fecha) as Fecha, plat.Nombre as Plato, ordCab.Total "
            strSQL = strSQL & " from tbm_Ordenes ordCab "
            strSQL = strSQL & " inner join tbm_Orden_Detalle ordDet on ordCab.IdOrden = ordDet.IdOrden"
            strSQL = strSQL & " inner join tbm_Platos plat on ordDet.IdPlato = plat.IdPlato"
            strSQL = strSQL & " where ordCab.Fecha between '" & Convert.ToDateTime(txtFechaDesde.Text).ToString("yyyy-MM-dd") & "' and '" & Convert.ToDateTime(txtFechaHasta.Text).ToString("yyyy-MM-dd") & "'"
            strSQL = strSQL & " group by  ordCab.Fecha, plat.Nombre, ordCab.Total "
            strSQL = strSQL & " having count(ordDet.Cantidad) " & valor
            sda = New SqlDataAdapter(strSQL, con)
            dt = New DataTable
            sda.Fill(dt)
            con.Close()

            gridPlatos.DataSource = dt
            gridPlatos.DataBind()
        End If
    End Sub
    Protected Sub btnConsultar_Click(sender As Object, e As EventArgs) Handles btnConsultar.Click
        cargaDatos()
    End Sub
End Class
