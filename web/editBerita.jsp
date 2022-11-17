<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="BeritaService" method="POST">
            <%
                String id = request.getParameter("id");
                String crud = request.getParameter("crud");
                String judul = request.getParameter("judul");
                String penulis = request.getParameter("penulis");
                String tanggal = request.getParameter("tanggal");
                String isi = request.getParameter("isi");
                String created_at = request.getParameter("created_at");
                String updated_at = request.getParameter("updated_at");
                String judulOut,penulisOut,tanggalOut,isiOut;
                
                judulOut=(judul==null)? " " : judul;
                penulisOut=(penulis==null)? " " : penulis;
                tanggalOut=(tanggal==null)? " " : tanggal;
                isiOut=(isi==null)? " " : isi;
            %>
            <ul>
                <li>Judul : <input type="text" name="judul" value="<%= judulOut %>"></li>
                <li>Penulis : <input type="text" name="penulis" value="<%= penulisOut  %>" ></li>
                <li>Tanggal : <input type="date" name="tanggal" value="<%= tanggalOut%>"></li>
                <li>Isi : <textarea name="isi" rows="20" cols="50"><%= isiOut %></textarea></li>
                <input type="hidden" name="created_at" value="<%= created_at %>">
                <input type="hidden" name="updated_at" value="<%= updated_at %>">
                <input type="hidden" name="id" value="<%= id %>">
                <li><input type="submit" name="crud" value="<%= crud %>"></li>
            </ul>

        </form>
    </body>
</html>
