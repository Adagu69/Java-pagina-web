<%-- 
    Document   : NotasAgregar
    Created on : 2 jul. 2023, 21:30:19
    Author     : User
--%>

<%@page import="BusinessEntity.CursoBean2"%>
<%@page import="BusinessLogic.CursoController2"%>
<%@page import="BusinessEntity.AulaBean"%>
<%@page import="BusinessLogic.AulaController"%>
<%@page import="BusinessEntity.SeccionBean"%>
<%@page import="BusinessLogic.SeccionController"%>
<%@page import="BusinessEntity.AlumnoBean"%>
<%@page import="BusinessLogic.AlumnoController"%>
<%@page import="BusinessEntity.MatriculaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BusinessLogic.MatriculaController"%>
<%@page import="BusinessLogic.NotasController"%>
<%@page import="BusinessEntity.NotasBean"%>
<%
    NotasBean aBE = new NotasBean ();
    MatriculaController OMatriculaController = new MatriculaController();
    ArrayList<MatriculaBean> lstMatricula = OMatriculaController.SelectAll();
    AlumnoController OAlumnoController = new AlumnoController();
    ArrayList<AlumnoBean> lstAlumno = OAlumnoController.SelectAll();
    SeccionController OSeccionController = new SeccionController();
    ArrayList<SeccionBean> lstSeccion = OSeccionController.SelectAll();
    AulaController OAulaController = new AulaController();
    ArrayList<AulaBean> lstAula = OAulaController.SelectAll();
    CursoController2 OCursoController2 = new CursoController2();
    ArrayList<CursoBean2> lstCurso2 = OCursoController2.SelectAll();
    
    
    NotasController AC = new NotasController ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
      ) {
                  
             
            //aBE.setId_notas(request.getParameter("txt_id_notas"));
            
            aBE.setId_matricula(request.getParameter("txt_id_matricula"));
            aBE.setId_alumno(request.getParameter("txt_id_alumno"));
            aBE.setId_seccion(request.getParameter("txt_id_seccion"));
            aBE.setId_aula(request.getParameter("txt_id_aula"));
            aBE.setCur_codigo(request.getParameter("txt_cur_codigo"));
            aBE.setNot_observ(request.getParameter("txt_not_observ"));
            aBE.setNot_estcod(Integer.parseInt(request.getParameter("txt_not_estcod")));
            aBE.setNot_valor(Double.parseDouble(request.getParameter("txt_not_valor")));
            
                         AC.Insert(aBE);
response.sendRedirect("NotasListar.jsp");  
         }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="container">
            <h1>Creación de Notas  </h1> 
        <form action="NotasAgregar.jsp" method="GET">
           
          
           <br>
            <input class="form-control" type="hidden" name="txt_id_notas">
            
            Matricula:<br>
            <select name="txt_id_matricula" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstMatricula.size(); i++) {
                    
                        %>
                        <option value="<%=lstMatricula.get(i).getId_matricula()%>"><%=lstMatricula.get(i).getId_matricula() +" "+ lstMatricula.get(i).getId_matricula()%></option> 
                        <%}
                %>
            </select> 
            
            Alumno:<br>
            <select name="txt_id_alumno" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstAlumno.size(); i++) {
                    
                        %>
                        <option value="<%=lstAlumno.get(i).getAlu_nombres()%>"><%=lstAlumno.get(i).getAlu_nombres() +" "+ lstAlumno.get(i).getAlu_nombres()%></option> 
                        <%}
                %>
            </select> 
            Seccion:<br>
            <select name="txt_id_seccion" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstSeccion.size(); i++) {
                    
                        %>
                        <option value="<%=lstSeccion.get(i).getId_seccion()%>"><%=lstSeccion.get(i).getId_seccion() +" "+ lstSeccion.get(i).getSec_descri()%></option> 
                        <%}
                %>
            </select> 
            Aula:<br>
            <select name="txt_id_aula" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstAula.size(); i++) {
                    
                        %>
                        <option value="<%=lstAula.get(i).getId_aula()%>"><%=lstAula.get(i).getId_aula() +" "+ lstAula.get(i).getAul_descri()%></option> 
                        <%}
                %>
            </select>  
            Curso:<br>
            <select name="txt_cur_codigo" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstCurso2.size(); i++) {
                    
                        %>
                        <option value="<%=lstCurso2.get(i).getId_curso()%>"><%=lstCurso2.get(i).getId_curso() +" "+ lstCurso2.get(i).getDescripcion_curso()%></option> 
                        <%}
                %>
            </select>
            
            Descripcion:<br>
            <input class="form-control" type="text" name="txt_not_observ"
                   >
            
            Valor:<br>
            <input class="form-control" type="text" name="txt_not_valor" 
                   value="<%= aBE.getNot_valor() != null ? Double.valueOf(aBE.getNot_valor()).toString() : "" %>">
                
            ESTADO:<br>
                       <select class="form-control mb-4" name="txt_not_estcod">
                <option value="1" >Disponible</option>
                <option value="0">No disponible</option>
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="NotasListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
