<%@page import="BusinessLogic.CursoController2"%>
<%@page import="BusinessEntity.CursoBean2"%>
<%@page import="BusinessLogic.CursoController"%>
<%@page import="java.util.Iterator"%>
<%@page import="BusinessEntity.CursoBean"%>
<%@page import="BusinessEntity.CursoBean"%>
<%@page import="BusinessEntity.CursoBean"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%
    String parametro=request.getParameter("filtro");
    CursoController2 UBL = new CursoController2();
    
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("DELETE".equalsIgnoreCase(request.getParameter("accion"))  && request.getParameter("id") != null ){            
            //TOKEN -> CODIGO USUARIO
            UBL.Delete(request.getParameter("id"));
            response.sendRedirect("CursoListar2.jsp");
        }
       
    }
    
    ArrayList<CursoBean2> ldata = UBL.SelectAll();
%>
<%
if (session.getAttribute("codigo_usuario") !=null) {

%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>         
        <script src="bootstrap4/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="footable/css/footable.core.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/navbar-top.css" rel="stylesheet" type="text/css"/>       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>
     <body>
        
        <div class="container">
              <div class="row pb-3">                
          <a class="btn btn-sm btn-outline-primary" href="CursoAgregar2.jsp?accion=CREATE"><i class="fa fa-plus"></i> Nuevo</a>
                <a class="btn btn-sm btn-outline-success ml-1" href="CursoListar2.jsp"><i class="fa fa-refresh"></i> Actualizar</a>
                <a class="btn btn-sm btn-outline-secondary ml-1"><i class="fa fa-print"></i> Imprimir</a>
                <a class="btn btn-sm btn-outline-danger ml-1" href="/Web09/pdf?btnver=VisualizarPdf&filtro=<%=parametro%>"><i class="fas fa-file-pdf"></i> Exportar</a>
            </div>

        
         
        <div class="row pb-3">
              <div class="table-responsive">
       <table class="table demo default footable" data-page-size="3">          
           <thead>
               <tr>
                        
              <th data-toggle="true" class="footable-first-column">ID Curso</th>
            <th>Nombre del Curso</th> 
            <th>Descripcion del curso</th>
            <th>Estado Del Curso</th>
              <th class="footable-last-column"></th>
                    </tr>
            </thead>   
            <%
            
            CursoBean2 item = null;
                               Iterator<CursoBean2> iter = ldata.iterator();
                                while (iter.hasNext()) {
                                    item = iter.next();
               
                   
            %>
            <tbody>
            
                <tr>
                    <%   String estado="";
                     if (item.getEstado_curso()==1 ) {
                             estado="Activo";
                         }else {
                        estado="Inactivo";
                        }
                    
                    
                    %>
                      <td><%=item.getId_curso()%></td>
                     <td><%=item.getNombre_curso()%></td>
                     <td><%=item.getDescripcion_curso()%></td>
                          <td><%=estado%></td>
                            
                             <td>      
            <a class="btn btn-sm btn-warning" href="CursoEditar2.jsp?accion=EDIT&id=<%=item.getId_curso()%>"><i class="fas fa-pencil fa-xs"> </i></a>
            
              <a class="btn btn-sm btn-danger" href="CursoListar2.jsp?accion=DELETE&id=<%=item.getId_curso()%>"><i class="fas fa-trash fa-xs"> </i></a>      
        </td>  
                </tr>
                 <%   }  %>
            </tbody>
             <tfoot class="hide-if-no-paging">
             <tr>
                        <td colspan="7" class="text-center">
                            <ul class="pagination"></ul>
                        </td>
                    </tr>
                </tfoot>
            
        </table>
</div>
            
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>        
            <script src="footable/js/footable.filter.js" type="text/javascript"></script>
             <script src="footable/js/footable.paginate.js" type="text/javascript"></script>
             <script src="footable/js/footable.js" type="text/javascript"></script>
             <script src="footable/js/footable.all.min.js" type="text/javascript"></script>
            <script>
        $(function () {
            $('.table').footable();
        });
    </script>
    </div>
    </body>
</html>


<%
    }else  {

response.sendRedirect("index.jsp");
}
%>