<%-- 
    Document   : index
    Created on : Oct 4, 2022, 5:25:47 PM
    Author     : SistemasU
--%>
<%@page import="modelo.tipo_sangre"%>
<%@page import="modelo.estudiante"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <!-- Brand -->
        <a class="navbar-brand" href="#">Cologio Renacer</a>

        <!-- Links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Nosotros</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contacto</a>
            </li>
            <!-- Dropdown -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                Sub Menu
                </a>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Estudiantes</a>
            <a class="dropdown-item" href="#">Maestros</a>
            <a class="dropdown-item" href="#">Pensum</a>
        </div>
    </li>
  </ul>
</nav>

        <h1>Formulario Estudiantes</h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo</button>
        
        <div class="container">
            <div class="modal" id="modal_estudiante">
            <div class="modal-dialog">
            <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Formulario Estudiante</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                 <form action="sr_estudiante" method="post" class="form-group">
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0 " readonly>
                <label for="lbl_carne"><b>Carne:</b></label>
                <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo E001" pattern="E[0-9]{3}" required>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo Jose Manuel" required>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo Perez Martino" required>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo 6ta. Avenida 5.67" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo 8888-3333" required>
                <label for="lbl_email"><b>Correo Electronico:</b></label>
                <input type="text" name="txt_email" id="txt_email" class="form-control" placeholder="Ejemplo jose@gmail.com" required>
                <label for="lbl_fecha_nac"><b>Fecha de Nacimiento:</b></label>
                <input type="date" name="txt_fecha_nac" id="txt_fecha_nac" class="form-control" placeholder="Ejemplo 12-12-1999" required>
                <label for="lbl_drop_sangre"><b>Tipo Sangre:</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <%
                       tipo_sangre Tipo_sangre = new tipo_sangre();
                       HashMap<String,String> drop = Tipo_sangre.drop_sangre();
                       for (String i: drop.keySet()){
                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                        }
                       
                     %>
                    
                </select>
                     <br>
                     <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Guardar</button>
                     <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                     <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
            </form>
                </div>
        
      </div>
    </div>
  </div>

            

    <table class="table table-striped">
    <thead>
      <tr>
        <th>carne</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Email</th>
        <th>Fecha Nac</th>
        <th>Tipo Sangre</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiante">
        <%
            estudiante Estudiante = new estudiante();
            DefaultTableModel tabla = new DefaultTableModel();
            tabla = Estudiante.leer();
            for (int t=0;t<tabla.getRowCount();t++){
                out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_s=" + tabla.getValueAt(t,8) + " >");
                out.println("<td>" + tabla.getValueAt(t,1) + "</td>");//Carne
                out.println("<td>" + tabla.getValueAt(t,2) + "</td>");//Nombres
                out.println("<td>" + tabla.getValueAt(t,3) + "</td>");//apellidos
                out.println("<td>" + tabla.getValueAt(t,4) + "</td>");//direccion
                out.println("<td>" + tabla.getValueAt(t,5) + "</td>");//telefnos
                out.println("<td>" + tabla.getValueAt(t,6) + "</td>");//Email
                out.println("<td>" + tabla.getValueAt(t,7) + "</td>");//Fecha nac
                out.println("<td>" + tabla.getValueAt(t,8) + "</td>");//tipo sangre       
                out.println("</tr>");
            }
        %>

    </tbody>
  </table>
                     
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_carne").val('');
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
                $("#txt_email").val('');
                $("#txt_fecha_nac").val('');
                $("#txt_drop_sangre").val('1');
            }
            
            $('#tbl_estudiante').on('click','tr td',function(evt){
                var target,id,id_s,carne,nombres,apellidos,direccion,telefono,email,fecha_nac;
                target = $(event.target);
                id = target.parent().data('id');
                id_s = target.parent().data('id_s');
                carne = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                email = target.parent("tr").find("td").eq(5).html();
                fecha_nac = target.parent("tr").find("td").eq(6).html();
                $("#txt_id").val(id);
                $("#txt_carne").val(carne);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_email").val(email);
                $("#txt_fecha_nac").val(fecha_nac);
                $("#txt_drop_sangre").val(id_s);
                $("#modal_estudiante").modal('show');
            });
            
        </script>
    <footer class="bg-light text-center text-lg-start">
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0);">
    © 2022 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/">© 2022 Copyright: Samuel Alejandro Saquic toj</a>
  </div>
  <!-- Copyright -->
</footer>
    </body>
</html>
