Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
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
    Public pruebas As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim pruebas As String
        If Not Me.IsPostBack Then
            CargaRoles()
            CargaDatos()
            Dim valor As String = cboRol.SelectedValue
            If Not String.IsNullOrEmpty(valor) Then
                establecePermisos(valor)
            End If
        End If
    End Sub
    Private Sub CargaRoles()
        Try
            Dim pruebas As String
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "select idRol, description from tbm_Rol"
            sda = New SqlDataAdapter(strSQL, con)
            dt = New DataTable()
            sda.Fill(dt)
            cboRol.Items.Clear()
            For i = 0 To dt.Rows.Count - 1
                cboRol.Items.Add(New ListItem(dt.Rows(i).Item(1), dt.Rows(i).Item(0)))
            Next
        Catch ex As Exception

        Finally
            con.Close()
        End Try


    End Sub
    Private Sub CargaDatos()
        Try
            Dim pruebas As String
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "select MenuId, case when Id_rol = 1 then 'Administrador' when Id_rol = 2 then 'Chef' when Id_rol = 3 then 'Mesero' else 'Cliente' end as Rol, Titulo, Pagina from tbm_Menus where Titulo not in ('Ingresar', 'Modificar', 'Eliminar', 'Consultas')"
            sda = New SqlDataAdapter(strSQL, con)
            dt = New DataTable()
            sda.Fill(dt)
            gridPerfiles.DataSource = dt
            gridPerfiles.DataBind()
        Catch ex As Exception

        Finally
            con.Close()
        End Try


    End Sub
    Private Sub establecePermisos(valor As String)
        Try
            Dim pruebas As String
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            For Each gvrow As GridViewRow In gridPerfiles.Rows
                Dim lblMenudId = TryCast(gvrow.FindControl("Label1"), Label)
                strSQL = "select * from tbm_Menus where Titulo not in ('Ingresar', 'Modificar', 'Eliminar', 'Consultas') and MenuId = " & lblMenudId.Text & " and Id_rol= " & valor & " and estado=1"
                sda = New SqlDataAdapter(strSQL, con)
                dt = New DataTable()
                sda.Fill(dt)
                Dim checkboxP = TryCast(gvrow.FindControl("chkPermiso"), CheckBox)
                If dt.Rows.Count > 0 Then
                    checkboxP.Checked = True
                Else
                    checkboxP.Checked = False
                End If

            Next
        Catch ex As Exception

        Finally
            con.Close()
        End Try


    End Sub
    Protected Sub cboRol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboRol.SelectedIndexChanged
        Dim pruebas As String
        Dim valor As String = cboRol.SelectedValue
        If Not String.IsNullOrEmpty(valor) Then
            establecePermisos(valor)
        End If
    End Sub
    Protected Sub btnEstablecer_Click(sender As Object, e As EventArgs) Handles btnEstablecer.Click

        Try
            Dim count As Integer = 0
            Dim valor As String = cboRol.SelectedValue
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            For Each gvrow As GridViewRow In gridPerfiles.Rows
                Dim checkboxP = TryCast(gvrow.FindControl("chkPermiso"), CheckBox)
                If checkboxP.Checked Then
                    Dim lblMenudId = TryCast(gvrow.FindControl("Label1"), Label)
                    Dim parentId As String = "0"
                    Dim titulo = TryCast(gvrow.FindControl("Label2"), Label)
                    Dim pagina = TryCast(gvrow.FindControl("Label3"), Label)
                    Dim idrol As String = cboRol.SelectedValue
                    strSQL2 = "select * from tbm_Menus where Titulo Not in ('Ingresar', 'Modificar', 'Eliminar', 'Consultas') and MenuId = " & lblMenudId.Text & " and Id_rol= " & valor
                    Dim consulta As New SqlCommand(strSQL2, con)
                    sda = New SqlDataAdapter(strSQL2, con)
                    dt = New DataTable()
                    sda.Fill(dt)
                    If dt.Rows.Count > 0 Then
                        strSQL = "UPDATE tbm_Menus set estado=1 where Titulo not in ('Ingresar', 'Modificar', 'Eliminar', 'Consultas') and MenuId = " & lblMenudId.Text & " and Id_rol= " & valor
                        Dim establece As New SqlCommand(strSQL, con)
                        count = establece.ExecuteNonQuery()
                        'If count > 0 Then
                        '    Dim mensaje As String = "Los permisos fueron asignados correctamente."
                        '    Dim Script As String = String.Format("alert('{0}');", mensaje)
                        '    Me.Page.ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "alert", Script, True)
                        'End If
                    Else
                        strSQL3 = "INSERT INTO tbm_Menus(ParentMenuId, Titulo, Pagina, Id_rol, estado) VALUES(" & parentId & ",'" & titulo.Text & "','" & pagina.Text & "'," & idrol & ", 1)"
                        Dim inserta As New SqlCommand(strSQL3, con)
                        count = inserta.ExecuteNonQuery()
                        'If count > 0 Then
                        '    Dim mensaje As String = "Los permisos fueron asignados correctamente."
                        '    Dim Script As String = String.Format("alert('{0}');", mensaje)
                        '    Me.Page.ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "alert", Script, True)
                        'End If
                    End If
                End If
            Next
            If count > 0 Then
                Dim mensaje As String = "Los permisos fueron asignados correctamente."
                Dim Script As String = String.Format("alert('{0}');", mensaje)
                Me.Page.ClientScript.RegisterClientScriptBlock(Me.Page.GetType(), "alert", Script, True)
                gridPerfiles.DataSource = Nothing
                CargaDatos()
                Dim valorR As String = cboRol.SelectedValue
                If Not String.IsNullOrEmpty(valor) Then
                    establecePermisos(valorR)
                End If
            End If
        Catch ex As Exception

        Finally
            con.Close()
        End Try

    End Sub
End Class
