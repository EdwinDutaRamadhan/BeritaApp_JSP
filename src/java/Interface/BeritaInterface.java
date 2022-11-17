/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import Model.BeritaModel;
import java.util.List;

/**
 *
 * @author HP
 */
public interface BeritaInterface {
    public List<BeritaModel> getAllBerita();
    public boolean insertOne(BeritaModel model);
    public boolean deleteOne(BeritaModel model);
    public boolean updateOne(BeritaModel model);
}
