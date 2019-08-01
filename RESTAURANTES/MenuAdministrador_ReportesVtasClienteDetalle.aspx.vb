Partial Class MenuAdministrador_ReportesVtasClienteDetalle
    Inherits System.Web.UI.Page
    Public con As System.Data.SqlClient.SqlConnection
    Public sda As System.Data.SqlClient.SqlDataAdapter
    Public dtb As System.Data.DataTable
    Public strSQL As String

    Protected Sub Page_PreLoad(sender As Object, e As System.EventArgs) Handles Me.PreLoad
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        End If

    End Sub

    Protected Sub butCon_Click(sender As Object, e As System.EventArgs) Handles butCon.Click
        Try
            con = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
            strSQL = "Select ODE.IdOrden, ORD.Fecha,ORD.Cliente, PLA.Nombre as Plato,ODE.Cantidad, ODE.Precio, ODE.TOTAL"
            strSQL = strSQL & " from tbm_platos as PLA"
            strSQL = strSQL & " inner join tbm_orden_detalle as ODE on PLA.idPlato=ODE.idPlato"
            strSQL = strSQL & " inner join tbm_ordenes as ORD ON ORD.IdOrden=ODE.idOrden"
            strSQL = strSQL & " WHERE 1=1"
            If txtFecDes.Text <> "" And txtFecHas.Text <> "" Then
                strSQL = strSQL & " AND ORD.Fecha  between '" & Convert.ToString(txtFecDes.Text) & "' AND '" & Convert.ToString(txtFecHas.Text) & "'"
            End If
            strSQL = strSQL & " order by ORD.Fecha"
            sda = New System.Data.SqlClient.SqlDataAdapter(strSQL, con)
            dtb = New System.Data.DataTable
            sda.Fill(dtb)
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

    Private Sub cargarCategorias()

    End Sub
End Class