Partial Class MenuAdministrador_ReportesVtasClienteResumen
    Inherits System.Web.UI.Page
    Public con As System.Data.SqlClient.SqlConnection
    Public sda As System.Data.SqlClient.SqlDataAdapter
    Public dtb As System.Data.DataTable
    Public comm As System.Data.SqlClient.SqlCommand
    Public Rder As System.Data.SqlClient.SqlDataReader
    Public strSQL As String

    Protected Sub Page_PreLoad(sender As Object, e As System.EventArgs) Handles Me.PreLoad
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        End If
        If Not Page.IsPostBack Then
            'Sólo cargar si es la primera vez que se ingresa a la página.
            'cargarCategorias()
        End If
    End Sub

    Protected Sub butCon_Click(sender As Object, e As System.EventArgs) Handles butCon.Click
        Try
            con = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
            strSQL = "Select sum(ODE.total) as Sumacliente, ORD.cliente"
            strSQL = strSQL & " from tbm_platos_categoria as CAT"
            strSQL = strSQL & " inner join tbm_platos as PLA on CAT.idPlatCat=PLA.IdPlatCat"
            strSQL = strSQL & " inner join tbm_orden_detalle as ODE on PLA.idPlato=ODE.idPlato"
            strSQL = strSQL & " inner join tbm_ordenes as ORD ON ORD.IdOrden=ODE.idOrden"
            strSQL = strSQL & " WHERE 1=1"
            If txtFecDes.Text <> "" And txtFecHas.Text <> "" Then
                strSQL = strSQL & " AND ORD.Fecha  between '" & Convert.ToString(txtFecDes.Text) & "' AND '" & Convert.ToString(txtFecHas.Text) & "'"
            End If
            strSQL = strSQL & " group by ORD.Cliente"
            sda = New System.Data.SqlClient.SqlDataAdapter(strSQL, con)
            dtb = New System.Data.DataTable
            sda.Fill(dtb)
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try


    End Sub

    Private Sub cargarCategorias()

    End Sub

    Private Sub MenuAdministrador_ReportesVtasClienteResumen_Load(sender As Object, e As EventArgs) Handles Me.Load


    End Sub
End Class