Imports System.Data
Imports System.Data.SqlClient
Partial Class pedidosCabecera
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbbusA, dtbbusB, dtbbusC, dtbape, dtbins, dtbpla, dtbcat As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public intCodPer As Integer
    Dim count As Integer = 0
    Dim Usuario As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Usuario = Session("CodigoMesero")
            cargarPedidos()
            count = 0
        End If
    End Sub
    Private Sub cargarPedidos()
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Usuario = Session("CodigoMesero")
            con.Open()
            strSQL = "select IdOrden as Numero_Pedido, Fecha as Fecha_Pedido, Cliente as Cliente_Pedido from tbm_Ordenes ordenCab where IdEmpleado = " & Usuario
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
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        'Dim rowIndex As Integer = gridPedidos.SelectedIndex
        Dim btn As LinkButton = CType(sender, LinkButton)
        Dim row As GridViewRow = CType(btn.NamingContainer, GridViewRow)
        Dim i As Integer = Convert.ToInt32(row.RowIndex)
        Dim idPedido As Integer = Convert.ToInt32(gridPedidos.DataKeys(i).Value)
        Response.Redirect("muestraPedidos.aspx?pedido=" & idPedido)
    End Sub
End Class
