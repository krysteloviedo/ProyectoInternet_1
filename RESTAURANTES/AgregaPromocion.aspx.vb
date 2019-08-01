Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Partial Class AgregaPromocion
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
    Protected Sub txtFechaDesde_TextChanged(sender As Object, e As EventArgs) Handles txtFechaDesde.TextChanged

    End Sub
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If FileUpload1.PostedFile IsNot Nothing Then
            Dim nombre As String = txtNombreP.Text
            Dim fechaDesde As String = txtFechaDesde.Text
            Dim fechaHasta As String = txtFechaHasta.Text
            Dim iva As Boolean = chkIva.Checked
            Dim imagenFile As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            Dim count As Integer = 0
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "INSERT INTO tbm_Promociones(Nombre, Fecha_desde, Fecha_hasta, iva, imagen) VALUES ('" & nombre & "','" & Convert.ToDateTime(fechaDesde).ToString("yyyyMMdd") & "','" & Convert.ToDateTime(fechaHasta).ToString("yyyyMMdd") & "','" & iva & "','" & imagenFile & "')"
            Dim insert As New SqlCommand(strSQL, con)
            count = insert.ExecuteNonQuery()
            If count > 0 Then
                If Not File.Exists(Server.MapPath("~/images/" & imagenFile)) Then
                    FileUpload1.SaveAs(Server.MapPath("~/images/" & imagenFile))
                End If
                Dim mensaje As String = "La promoción fue creada correctamente!!!"
                Dim Script As String = String.Format("alert('{0}');", mensaje)
                Me.Page.ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "alert", Script, True)
                End If

            End If
    End Sub
End Class
