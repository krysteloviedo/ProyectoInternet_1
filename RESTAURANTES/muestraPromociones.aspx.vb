Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Partial Class muestraPromociones
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dt As DataTable
    Public dt2 As DataTable
    Public dt3 As DataTable
    Public dtbA, dtbB, dtbciu, dtbpai As DataTable
    Public strSQL As String
    Public htmlImages As String
    Public strSQL3 As String
    Public Usuario As String
    Public sds As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            cargaPromociones()
        End If
    End Sub

    Private Sub cargaPromociones()
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Usuario = Session("CodigoMesero")
            con.Open()
            strSQL = "select * from tbm_Promociones where fecha_Hasta >= convert(date, getdate())"
            sda = New SqlDataAdapter(strSQL, con)
            dt = New DataTable
            sda.Fill(dt)
            con.Close()
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    htmlImages += "<div><h4>" & dt.Rows(i)(1).ToString() & "</h4><h6>VIGENTE HASTA: " & Convert.ToDateTime(dt.Rows(i)(3)).ToString("dd/MM/yyyy") & "</h6><h6>PRECIO INCLUYE IVA:  " & IIf(dt.Rows(i)(4).ToString() = "True", "SI", "NO") & "</h6><img id=""" & i & """ src=""" & "images/" & dt.Rows(i)(5).ToString() & """ width=""300px""/></div><br><br>"
                Next
                ImagesDiv.InnerHtml = htmlImages
            End If
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

End Class
