Imports System.Data
Imports System.Data.SqlClient
Imports AjaxControlToolkit
Partial Class muestraPedidos
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbbusA, dtbbusB, dtbbusC, dtbape, dtbins, dtbpla, dtbcat As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public intCodPer As Integer
    Public idPedido As String
    Dim count As Integer = 0
    Dim Usuario As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Usuario = Session("CodigoMesero")
            idPedido = Request.QueryString("pedido")
            cargarPedidos(idPedido)
            count = 0
        End If
    End Sub
    Private Sub cargarPedidos(ByVal pedido As String)
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Usuario = Session("CodigoMesero")
            con.Open()
            strSQL = "select ordenCab.IdOrden, ordenCab.Cliente, platos.IdPlato, platos.Nombre as Plato, platos.Precio, 0 as Rating"
            strSQL = strSQL & " from tbm_Ordenes ordenCab"
            strSQL = strSQL & " inner join tbm_Orden_Detalle ordenDet on ordenCab.IdOrden = ordenDet.IdOrden"
            strSQL = strSQL & " inner join tbm_Platos platos on ordenDet.IdPlato = platos.IdPlato and platos.Estado = 'A'"
            strSQL = strSQL & " where ordenCab.IdOrden = " & pedido
            sda = New SqlDataAdapter(strSQL, con)
            dtbbusA = New DataTable
            sda.Fill(dtbbusA)
            con.Close()
            gridPedidos.HeaderStyle.CssClass = "lnknew"
            gridPedidos.RowStyle.CssClass = "lnknew"
            gridPedidos.DataSource = dtbbusA
            gridPedidos.DataBind()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            Usuario = Session("CodigoMesero")
            If count = 0 Then
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()
                For Each gvrow As GridViewRow In gridPedidos.Rows
                    Dim ratingControl As Rating
                    Dim rating As Integer
                    ratingControl = CType((gvrow.FindControl("Rating1")), Rating)
                    Dim rowIndex As Integer = gvrow.RowIndex
                    Dim idOrden As Integer = Convert.ToInt32(gridPedidos.DataKeys(rowIndex).Value)
                    Dim idPlato = gvrow.Cells(1).Text
                    Dim user = Usuario
                    rating = ratingControl.CurrentRating
                    strSQL = "INSERT INTO tbm_PedidosClientes(IdOrden, IdPlato, IdEmpleado, Rating) VALUES(" & idOrden & "," & idPlato & "," & user & "," & rating & ")"
                    Dim inserta As New SqlCommand(strSQL, con)
                    count = inserta.ExecuteNonQuery()
                Next
                If count > 0 Then
                    Dim message As String = "Datos ingresados exitosamente."
                    Dim url As String = "/Reservaciones.aspx?v1=" & Usuario
                    Dim Script As String = "{ alert('"
                    Script += message
                    Script += "');"
                    Script += "window.location = '"
                    Script += url
                    Script += "'; }"
                    ScriptManager.RegisterStartupScript(Me.Page, Page.GetType(), "alert", Script, True)
                End If
            End If
        Catch ex As Exception

        Finally
            con.Close()
        End Try
    End Sub
End Class
