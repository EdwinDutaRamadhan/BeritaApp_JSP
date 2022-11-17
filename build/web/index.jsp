<%@page import="java.util.ArrayList"%>
<%@page import="Model.BeritaModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.html" %>
<div class="container">
    <form action="editBerita.jsp" method="post">
        <input class="btn btn-primary" type="submit" name="crud" value="tambah">
    </form>

    <form action="" method="GET">
        <select name="sort" class="form-select" id="sort1">
            <option value="create-asc">Create Asceding</option>
            <option value="create-desc">Create Desceding</option>
            <option value="update-asc">Update Asceding</option>
            <option value="update-desc">Update Desceding</option>
            <option value="judul-asc">Judul Asceding</option>
            <option value="judul-desc">Judul Desceding</option>
            <option value="penulis-asc">Penulis Asceding</option>
            <option value="penulis-desc">Penulis Desceding</option>

        </select>
        <input type="submit" value="lihat hasil">
    </form>
    <%
        String sorting = request.getParameter("sort");
        DAO.BeritaController dao = new DAO.BeritaController();
        List<BeritaModel> listBerita;
        if(sorting == null){
            listBerita = dao.getAllBerita();
        }else{
            listBerita = dao.sortOne(sorting);
        }
        try {   
            for (BeritaModel berita : listBerita) {
                String id = berita.getId();
                String judul = berita.getJudul();
                String penulis = berita.getPenulis();
                String tanggal = berita.getTanggal();
                String isi = berita.getIsi();
                String updated_at = berita.getUpdated_at();
                String created_at = berita.getCreated_at();
    %>
    <div class="card m-2">
        <div class="card-header">
            Penulis : <%= penulis%>
        </div>
        <div class="card-body">
            <h5 class="card-title"><%= judul%></h5>
            <p class="card-text"><%= isi%></p>
            <p class="card-text">Last update : <%= updated_at%></p>
            <div class="d-flex flex-row-reverse">
                <div class="p-1">
                    <form action="editBerita.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= id%>">
                        <input onclick="return confirm('apakah anda yakin ingin menghapus?');" class="btn btn-danger" type="submit" name="crud" value="hapus">
                    </form>
                </div>
                <div class="p-1">
                    <form action="editBerita.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= id%>">
                        <input type="hidden" name="judul" value="<%= judul%>">
                        <input type="hidden" name="penulis" value="<%= penulis%>">
                        <input type="hidden" name="tanggal" value="<%= tanggal%>">
                        <input type="hidden" name="isi" value="<%= isi%>">
                        <input type="hidden" name="updated_at" value="<%= updated_at%>">
                        <input type="hidden" name="created_at" value="<%= created_at%>">
                        <input class="btn btn-primary" type="submit" name="crud" value="update">
                    </form>
                </div>                

            </div>
        </div>
    </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace(new java.io.PrintWriter(out));
        }

    %>
</div>
<%@include file="template/footer.html" %>
