<%@page import="java.util.ArrayList"%>
<%@page import="Model.BeritaModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Berita</h2>
        <form action="editBerita.jsp" method="post">
            <input type="submit" name="crud" value="tambah">
        </form>
        <%
            try {
                DAO.BeritaController dao = new DAO.BeritaController();
                List<BeritaModel> listBerita = dao.getAllBerita();

                for (BeritaModel berita : listBerita) {
                    String id = berita.getId();
                    String judul = berita.getJudul();
                    String penulis = berita.getPenulis();
                    String tanggal = berita.getTanggal();
                    String isi = berita.getIsi();
                    String updated_at = berita.getUpdated_at();
                    String created_at = berita.getCreated_at();
                    out.println("<html><head><title>Berita</title></head><body>");
                    //table
                    out.println("<table border='1' cellspacing='0' cellpadding='10'>");
                    out.println("<tr><td><strong>"+ judul +"<strong></td></tr>");
                    out.println("<tr><td> Penulis : "+ penulis +"</td></tr>");
                    out.println("<tr><td> Tanggal :  "+ tanggal +"</td></tr>");
                    out.println("<tr><td>"+ isi +"</td></tr>");
                    out.println("<tr><td> Create at : "+ created_at +"</td></tr>");
                    out.println("<tr><td> Update at : "+ updated_at +"</td></tr>");
                    //DELETE ACTION
                    out.println
                    ("<tr><td>"
                    + "<form action='BeritaService' method='POST'>"
                    + "<input type='hidden' name='id' value='"+id+"'/>"
                    + "<input type='submit' name='crud' value='hapus'/>"
                    + "</form>"
                    + "</td></tr>");
                    //UPDATE ACTION
                    out.println
                    ("<tr><td>"
                    + "<form action='editBerita.jsp' method='POST'>"
                    + "<input type='hidden' name='id' value='"+id+"'/>"
                    + "<input type='hidden' name='judul' value='"+judul+"'/>"
                    + "<input type='hidden' name='penulis' value='"+penulis+"'/>"
                    + "<input type='hidden' name='tanggal' value='"+tanggal+"'/>"
                    + "<input type='hidden' name='isi' value='"+isi+"'/>"
                    + "<input type='hidden' name='updated_at' value='"+updated_at+"'/>"
                    + "<input type='hidden' name='created_at' value='"+created_at+"'/>"
                    + "<input type='submit' name='crud' value='update'/>"
                    + "</form>"
                    + "</td></tr>");
                    out.println("</table><br>");
                    out.println("</body></html>");
                }
            } catch (Exception e){
                e.printStackTrace(new java.io.PrintWriter(out));
            } 

        %>
    </body>
</html>
