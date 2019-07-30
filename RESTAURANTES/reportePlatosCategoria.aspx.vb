Imports System.Data
Imports System.Data.SqlClient
Partial Class reportePlatosCategoria
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
            cargaCategorias()
        End If
    End Sub
    Private Sub cargaCategorias()
        gridPlatosCat.DataSource = Nothing
        con = New SqlConnection(CStr(Session("sessStrCon")))
        Usuario = Session("CodigoMesero")
        con.Open()
        strSQL = "select IdPlatCat, Nombre from tbm_Platos_Categoria where Estado = 'A' "
        sda = New SqlDataAdapter(strSQL, con)
        dt = New DataTable
        sda.Fill(dt)
        con.Close()
        If dt.Rows.Count > 0 Then
            For i = 0 To dt.Rows.Count - 1
                cboCategoria.Items.Add(New ListItem(dt.Rows(i).Item(1), dt.Rows(i).Item(0)))
            Next
        End If
    End Sub
    Private Sub cargaDatos()
        If Not cboCategoria.SelectedValue = "-1" Then
            gridPlatosCat.DataSource = Nothing
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Usuario = Session("CodigoMesero")
            con.Open()
            strSQL = "select IdPlato, Nombre, convert(date, CreadoDate) Fecha_Creacion, Tiempo as Cantidad  "
            strSQL = strSQL & " from tbm_Platos plat "
            strSQL = strSQL & " where plat.IdPlatCat = " & cboCategoria.SelectedValue
            sda = New SqlDataAdapter(strSQL, con)
            dt = New DataTable
            sda.Fill(dt)
            con.Close()

            gridPlatosCat.DataSource = dt
            gridPlatosCat.DataBind()
        End If
    End Sub
    Protected Sub btnConsultar_Click(sender As Object, e As EventArgs) Handles btnConsultar.Click
        cargaDatos()
    End Sub
End Class
