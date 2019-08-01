Partial Class MenuAdministrador_ReportesVtasCategoriaDetalle
    Inherits System.Web.UI.Page
    Public con As System.Data.SqlClient.SqlConnection
    Public sda As System.Data.SqlClient.SqlDataAdapter
    Public dtb As System.Data.DataTable
    Public strSQL As String

    Protected Sub Page_PreLoad(sender As Object, e As System.EventArgs) Handles Me.PreLoad
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        End If
        If Not Page.IsPostBack Then
            'Sólo cargar si es la primera vez que se ingresa a la página.
            cargarCategorias()
        End If
    End Sub

    Protected Sub butCon_Click(sender As Object, e As System.EventArgs) Handles butCon.Click
        Try
            con = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
            strSQL = "Select ODE.IdOrden, ORD.Fecha,CAT.Nombre as Categoria, PLA.Nombre as Plato, ODE.Cantidad, ODE.Precio, ODE.TOTAL"
            strSQL = strSQL & " from tbm_platos_categoria as CAT"
            strSQL = strSQL & " inner join tbm_platos as PLA on CAT.idPlatCat=PLA.IdPlatCat"
            strSQL = strSQL & " inner join tbm_orden_detalle as ODE on PLA.idPlato=ODE.idPlato"
            strSQL = strSQL & " inner join tbm_ordenes as ORD ON ORD.IdOrden=ODE.idOrden"
            strSQL = strSQL & " WHERE 3=3"
            If Not cboCat.SelectedValue = "(Todas)" Then
                strSQL = strSQL & " AND CAT.idPlatCat=" & cboCat.SelectedValue
            End If
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
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
            strSQL = "SELECT CAT.IdPlatCat, CAT.Nombre"
            strSQL = strSQL & " FROM tbm_Platos_Categoria AS CAT"
            strSQL = strSQL & " ORDER BY CAT.Nombre"
            sda = New System.Data.SqlClient.SqlDataAdapter(strSQL, con)
            dtb = New System.Data.DataTable
            sda.Fill(dtb)
            cboCat.Items.Clear()
            cboCat.Items.Add("(Todas)")
            intNumTotReg = dtb.Rows.Count
            For i = 0 To intNumTotReg - 1
                'Opción1:
                cboCat.Items.Add(New ListItem(dtb.Rows(i).Item("Nombre"), dtb.Rows(i).Item("IdPlatCat")))
                'Opción2:
                'Dim aux As New ListItem
                'aux.Value = dtb.Rows(i).Item("co_mar")
                'aux.Text = dtb.Rows(i).Item("tx_nom")
                'cboMar.Items.Add(aux)
            Next
            dtb.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
End Class