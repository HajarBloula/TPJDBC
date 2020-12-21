<%-- 
    Document   : ListeEmployes
    Created on : Dec 19, 2020, 9:57:11 PM
    Author     : HAJAR
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TP JDBC</title>
    </head>
    
    <center>
        <h1> Affichage des employés </h1>
    
        <%@page import ="java.sql.*" %>
     
        <table width="100%" border="2" >
            <tr>
                <th width="25%" bgcolor="#DFE8F1"> Matricule </th>
                <th width="25%" bgcolor="#DFE8F1"> Nom </th>
                <th width="25%" bgcolor="#DFE8F1"> Prenom </th>
                <th width="25%" bgcolor="#DFE8F1"> Service </th>
            </tr>
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Etablissement", "root","azerty");
                    Statement stmt = conn.createStatement();
                    String sql = "select * from employé";
                    ResultSet rs = stmt.executeQuery(sql);
                    while( rs.next()){%>
                    <tr>
                        <td bgcolor="#FBE6EF">
                         <%= rs.getString("matricule")%>
                        </td>
                         <td bgcolor="#FBE6EF">
                         <%= rs.getString("nom")%>
                        </td>
                         <td bgcolor="#FBE6EF">
                         <%= rs.getString("prenom")%>
                        </td>
                         <td bgcolor="#FBE6EF">
                             <%= rs.getString("service")%>
                         </td> 
                    </tr>
                    
                <%}%>
        </table>
                   <% if( stmt != null) {
                       stmt.close();    
                   } 
                   if( conn != null) {
                       conn.close();    
                   }
                }
catch ( Exception e){
out.print(e);
}
                    %>
        </center>    
        </table>
    
</html>