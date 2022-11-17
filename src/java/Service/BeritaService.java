/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Service;

import DAO.BeritaController;
import Model.BeritaModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class BeritaService extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BeritaController berita = new BeritaController();
        BeritaModel model = new BeritaModel();
        //UNBOXING DATA
        String id = request.getParameter("id");
        String judul = request.getParameter("judul");
        String penulis = request.getParameter("penulis");
        String tanggal = request.getParameter("tanggal");
        String isi = request.getParameter("isi");
        String crud = request.getParameter("crud");
        String createAt = request.getParameter("created_at");
        PrintWriter out = response.getWriter();
        //DATE FORMATTING
        LocalDateTime dateObj = LocalDateTime.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String timeNow = dateObj.format(dateFormat);
        //RESPON
        String respon = "";
        switch (crud) {
            case "tambah":
                berita = new BeritaController();
                model = new BeritaModel();
                model.setJudul(judul);//JUDUL
                model.setPenulis(penulis);//PENULIS
                model.setTanggal(tanggal);//TANGGAL
                model.setIsi(isi);//ISI
                model.setCreated_at(timeNow);
                model.setUpdated_at(timeNow);
                if (berita.insertOne(model)) {
                    respon = "Berhasil Tambah Data";
                } else {
                    respon = "Gagal Tambah Data";
                }
                break;
            case "hapus":
                berita = new BeritaController();
                model = new BeritaModel();
                model.setId(id);
                if (berita.deleteOne(model)) {
                    respon = "Berhasil Hapus Data";
                } else{
                    respon = "Gagal Hapus Data";
                }               
                break;
            case "update":
                berita = new BeritaController();
                model = new BeritaModel();
                model.setId(id);//ID SELECTED
                model.setJudul(judul);//JUDUL
                model.setPenulis(penulis);//PENULIS
                model.setTanggal(tanggal);//TANGGAL
                model.setIsi(isi);//ISI
                model.setCreated_at(createAt);//OLD TIME
                model.setUpdated_at(timeNow);//NOW TIME
                if(berita.updateOne(model)){
                    respon = "Berhasil Update Data";
                }else{
                    respon = "Gagal Update Data";
                }
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("index.jsp?res=" + respon);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet Created By: Edwin Duta Ramadhan";
    }// </editor-fold>

}
