/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.BeritaInterface;
import Koneksi.Koneksi;
import Model.BeritaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class BeritaController implements BeritaInterface {

    private Connection koneksi = null;
    BeritaModel model = new BeritaModel();

    public BeritaController() {
        this.koneksi = Koneksi.getConnection();
    }

    @Override
    public List<BeritaModel> getAllBerita() {
        List<BeritaModel> listBerita = new ArrayList<BeritaModel>();

        try {
            PreparedStatement ps = koneksi.prepareStatement("select * from tb_berita");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                model = new BeritaModel();
                model.setId(rs.getString(1));
                model.setJudul(rs.getString(2));
                model.setPenulis(rs.getString(3));
                model.setTanggal(rs.getString(4));
                model.setIsi(rs.getString(5));
                model.setUpdated_at(rs.getString(6));
                model.setCreated_at(rs.getString(7));
                listBerita.add(model);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BeritaController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listBerita;
    }

    @Override
    public boolean insertOne(BeritaModel model) {
        boolean result = false;
        
        try {
            PreparedStatement ps = koneksi.prepareStatement("INSERT INTO tb_berita VALUES(?,?,?,?,?,?,?)");
            ps.setString(1, null);
            ps.setString(2, model.getJudul());
            ps.setString(3, model.getPenulis());
            ps.setString(4, model.getTanggal());
            ps.setString(5, model.getIsi());
            ps.setString(6, model.getCreated_at());
            ps.setString(7, model.getUpdated_at());
            ps.executeUpdate();
            result=true;
        } catch (SQLException ex) {
            Logger.getLogger(BeritaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }

    @Override
    public boolean deleteOne(BeritaModel model) {
        boolean result = false;
        
        try {
            PreparedStatement ps = koneksi.prepareStatement("DELETE FROM tb_berita WHERE id=?");
            ps.setString(1, model.getId());
            ps.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(BeritaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }

    @Override
    public boolean updateOne(BeritaModel model) {
        boolean result = false;
        
        try {
            PreparedStatement ps = koneksi.prepareStatement("UPDATE tb_berita SET judul=?, penulis=?, tanggal=?, isi=?, created_at=?, updated_at=? WHERE id=?");
            ps.setString(7, model.getId());
            ps.setString(1, model.getJudul());
            ps.setString(2, model.getPenulis());
            ps.setString(3, model.getTanggal());
            ps.setString(4, model.getIsi());
            ps.setString(5, model.getCreated_at());
            ps.setString(6, model.getUpdated_at());
            ps.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(BeritaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }

}
