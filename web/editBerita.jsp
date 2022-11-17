<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.html" %>
<form action="BeritaService" method="POST">
    <%
        String id = request.getParameter("id");
        String crud = request.getParameter("crud");
        String judul = request.getParameter("judul");
        String penulis = request.getParameter("penulis");
        String tanggal = request.getParameter("tanggal");
        String isi = request.getParameter("isi");
        String created_at = request.getParameter("created_at");
        String judulOut, penulisOut, tanggalOut, isiOut;

        judulOut = (judul == null) ? " " : judul;
        penulisOut = (penulis == null) ? " " : penulis;
        tanggalOut = (tanggal == null) ? " " : tanggal;
        isiOut = (isi == null) ? " " : isi;
    %>
    <div class="container">
        <div class="container m-2">
            <form action="BeritaService" method="POST" class="row g-3">
            <div class="col-md-12 mt-5">
<!--                HIDDEN-->
                
                <input type="hidden" name="created_at" value="<%=created_at%>">
                <input type="hidden" name="id" value="<%=id%>">
                <label for="form1" class="form-label">Judul</label>
                <input name="judul" type="text" class="form-control" placeholder="Isi judul disini..." id="form1" value="<%= judulOut %>">
            </div>
            <div class="col-md-12 mt-2">
                <label for="form2" class="form-label">Penulis</label>
                <input name="penulis" type="text" class="form-control" placeholder="Isi judul penulis..." id="form2" value="<%= penulisOut %>">
            </div>
            <div class="col-12 mt-2">
                <label for="form4" class="form-label">Tanggal</label>
                <input name="tanggal" type="date" class="form-control" id="form4" value="<%= tanggalOut %>">
            </div>
            <div class="col-12 mt-2">
                <label for="form3" class="form-label">Isi Berita </label>
                <textarea id="form3" class="form-control" name="isi" rows="5" cols="10"><%= isiOut %></textarea>
            </div>
            <div class="col-12 mt-2">
                <input name="crud" type="submit" class="btn btn-primary" value="<%= crud %>" ></input>
            </div>
        </form>
        </div>
    </div>
    <%@include file="template/footer.html" %>