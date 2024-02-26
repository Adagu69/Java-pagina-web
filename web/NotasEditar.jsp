<%-- 
    Document   : NotasEditar
    Created on : 2 jul. 2023, 21:30:39
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
<%@page import="BusinessEntity.  NotasBean"%>
<%@page import="BusinessLogic. NotasController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NotasController ABL = new  NotasController();
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
    
    
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    NotasBean aBE = new   NotasBean ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         aBE = ABL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
           aBE.setId_notas("");
           aBE.setId_matricula("");
           aBE.setId_alumno("");
           aBE.setId_seccion("");
           aBE.setId_aula("");
           aBE.setCur_codigo("");
           aBE.setNot_observ("");
           aBE.setNot_estcod(Integer.parseInt(""));
           aBE.setNot_valor(Double.parseDouble(""));

        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id") != null ){
        
        
            aBE.setId_notas(request.getParameter("txt_id_notas"));
            aBE.setId_matricula(request.getParameter("txt_id_matricula"));
            aBE.setId_alumno(request.getParameter("txt_id_alumno"));
            aBE.setId_seccion(request.getParameter("txt_id_seccion"));
            aBE.setId_aula(request.getParameter("txt_id_aula"));
            aBE.setCur_codigo(request.getParameter("txt_cur_codigo"));
            aBE.setNot_observ(request.getParameter("txt_not_observ"));
            aBE.setNot_estcod(Integer.parseInt(request.getParameter("txt_not_estcod")));
            aBE.setNot_valor(Double.parseDouble(request.getParameter("txt_not_valor")));
             
            ABL.Update(aBE);
            
            response.sendRedirect("NotasListar.jsp");
            
            
             
        }
        
        
    } 
%>
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
        <h1>Notas <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
            <form action="NotasEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            
            ID Notas:<br>
            <input class="form-control" type="text" name="txt_id_notas" 
                   <%=("".equalsIgnoreCase((aBE.getId_notas()))? "" :"readonly")%>
                   value="<%=aBE.getId_notas()%>">
            Matricula:<br>
            <select name="txt_id_matricula" class="form-control">
                <%
                    for (int i = 0; i < lstMatricula.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getId_matricula().equalsIgnoreCase(lstMatricula.get(i).getId_matricula())? "Selected":"") %> value="<%=lstMatricula.get(i).getId_matricula()%>"><%=lstMatricula.get(i).getId_matricula() +" "+ lstMatricula.get(i).getId_matricula()%></option> 
                        <%}
                %>
            </select> 
            Alumno:<br>
            <select name="txt_id_alumno" class="form-control">
                <%
                    for (int i = 0; i < lstAlumno.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getId_alumno().equalsIgnoreCase(lstAlumno.get(i).getAlu_nombres())? "Selected":"") %> value="<%=lstAlumno.get(i).getAlu_nombres()%>"><%=lstAlumno.get(i).getAlu_nombres() +" "+ lstAlumno.get(i).getAlu_nombres()%></option> 
                        <%}
                %>
            </select> 
            Seccion:<br>
            <select name="txt_id_seccion" class="form-control">
                <%
                    for (int i = 0; i < lstSeccion.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getId_seccion().equalsIgnoreCase(lstSeccion.get(i).getId_seccion())? "Selected":"") %> value="<%=lstSeccion.get(i).getId_seccion()%>"><%=lstSeccion.get(i).getId_seccion() +" "+ lstSeccion.get(i).getSec_descri()%></option> 
                        <%}
                %>
            </select> 
            Aula:<br>
            <select name="txt_id_aula" class="form-control">
                <%
                    for (int i = 0; i < lstAula.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getId_aula().equalsIgnoreCase(lstAula.get(i).getId_aula())? "Selected":"") %> value="<%=lstAula.get(i).getId_aula()%>"><%=lstAula.get(i).getId_aula() +" "+ lstAula.get(i).getAul_descri()%></option> 
                        <%}
                %>
            </select>  
            Curso:<br>
           <select name="txt_cur_codigo" class="form-control">
                <%
                    for (int i = 0; i < lstCurso2.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getCur_codigo().equalsIgnoreCase(lstCurso2.get(i).getDescripcion_curso())? "Selected":"") %> value="<%=lstCurso2.get(i).getDescripcion_curso()%>"><%=lstCurso2.get(i).getDescripcion_curso() +" "+ lstCurso2.get(i).getDescripcion_curso()%></option> 
                        <%}
                %>
            </select> 

            Descripcion:<br>
            <input class="form-control" type="text" name="txt_not_observ"
                   value="<%=aBE.getNot_observ() %>">

            Valor:<br>
            <input class="form-control" type="text" name="txt_not_valor" 
                   value="<%= aBE.getNot_valor() != null ? Double.valueOf(aBE.getNot_valor()).toString() : "" %>">
                   
            Estado:<br>
            <select name="txt_not_estcod"  class="form-control mb-4" >
                 <option value="0" <%=(aBE.getNot_estcod()== 0? "Selected":"") %> >Inactivo</option>
                 <option value="1" <%=(aBE.getNot_estcod()== 1? "Selected":"") %>>Activo</option>
            </select> 

            
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="NotasListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
       
        </div>
    </body>
</html>
