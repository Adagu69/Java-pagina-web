<%-- 
    Document   : SeccionListar
    Created on : 2 jul. 2023, 20:31:19
    Author     : User
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="BusinessLogic.SeccionController"%>
<%@page import="BusinessEntity.SeccionBean"%>
<%@page import="java.util.Iterator"%>   
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SeccionController UBL = new SeccionController();
    
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("DELETE".equalsIgnoreCase(request.getParameter("accion"))  && request.getParameter("id") != null ){            
            //TOKEN -> CODIGO USUARIO
            UBL.Delete(request.getParameter("id"));
            response.sendRedirect("SeccionListar.jsp");
        }
       
    }
    
    ArrayList<SeccionBean> ldata = UBL.SelectAll();
%>
<%
if (session.getAttribute("codigo_usuario") !=null) {

%>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap4/js/bootstrap.min.js" type="text/javascript"></script>
        
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">
              <div class="row pb-3">                
          <a class="btn btn-sm btn-outline-primary" href="SeccionAgregar.jsp"><i class="fa fa-plus"></i> Nuevo</a>
                <a class="btn btn-sm btn-outline-success ml-1" href="SeccionListar.jsp"><i class="fa fa-refresh"></i> Actualizar</a>
                <a class="btn btn-sm btn-outline-secondary ml-1"><i class="fa fa-print"></i> Imprimir</a>
                <a class="btn btn-sm btn-outline-danger ml-1"><i class="fas fa-file-pdf"></i> Exportar</a>
            </div>

        
         
        <div class="row pb-3">
              <div class="table-responsive">
       <table class="footable table table-hover table-striped table-bordered table-responsive-sm"  data-paging="true">            <thead>
           <thead>
              <th>ID Seccion</th>
            <th>Descripcion</th>  
            <th>Aula</th>
            <th>Nivel</th>
            <th>Estado</th>
             <th></th>
            
            </thead>   
            <%
            
            SeccionBean item = null;
                                Iterator<SeccionBean> iter = ldata.iterator();
                                while (iter.hasNext()) {
                                    item = iter.next();
               
                   
            %>
            <tbody>
                <tr>
                    <td><%=item.getId_seccion()%></td>
                      <td><%=item.getSec_descri() %></td>           
                          <td><%=item.getDescri_aula() %></td>
                            <td><%=item.getDescri_nivel() %></td>
                            <td><%=(item.getSec_estcod()==1?"Disponible":"No disponible") %></td>
                            
                             <td>      
            <a class="btn btn-sm btn-warning" href="SeccionEditar.jsp?accion=EDIT&id=<%=item.getId_seccion()%>"><i class="fas fa-pencil fa-xs"> </i></a>
            
              <a class="btn btn-sm btn-danger" href="SeccionListar.jsp?accion=DELETE&id=<%=item.getId_seccion()%>"><i class="fas fa-trash fa-xs"> </i></a>  
              <a class="btn btn-sm btn-success" href="SeccionCursoListar.jsp?id=<%=item.getId_seccion()%>"><i class="fas fa-book fa-xs"> </i></a>
        </td>  
                </tr>
            </tbody>
              <%   }  %>
            
            
        </table>
</div>
    </body>
</html>
<%
    }else  {

response.sendRedirect("index.jsp");
}
%>