/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import IService.IService;
import Utils.DataBase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pidv.Entite.Chat;

/**
 *
 * @author Med Ch
 */
public class ServiceChat implements IService<Chat> {
    
    private Connection con;
    private Statement ste;
    /* */
   
    public ServiceChat() {
        con = DataBase.getInstance().getConnection();

    }
    public void ajouter(Chat t ) throws SQLException {
        ste = con.createStatement();
        String requeteInsert = "INSERT INTO `test`.`chat` (`chid`, `user1`, `user2`) VALUES ('" + t.getChid() + "', '" + t.getUser1() + "', '" + t.getUser2() + "');";
        ste.executeUpdate(requeteInsert);
    }
    
     public boolean delete(Chat t) throws SQLException {
       String sql = "DELETE FROM chat WHERE chid=?";
 
PreparedStatement statement = con.prepareStatement(sql);
statement.setInt(1, t.getChid());

 
int rowsUpdated = statement.executeUpdate();
if (rowsUpdated > 0) {
    System.out.println("c bon!");
}
        return true; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Chat t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Chat> readAll() throws SQLException {
    List<Chat> arr=new ArrayList<>();
    ste=con.createStatement();
    ResultSet rs=ste.executeQuery("select * from chat");
     while (rs.next()) {                
               int chid=rs.getInt(1);
               int user1=rs.getInt("user1");
               int user2=rs.getInt("user2");
               Chat p=new Chat(chid, user1, user2);
     arr.add(p);
     }
    return arr;
    }
    public List<Chat> Findchat(int x, int y) throws SQLException {
    List<Chat> arr=new ArrayList<>();
    ste=con.createStatement();
    ResultSet rs=ste.executeQuery("select * from chat WHERE (user1= "+x+" AND user2="+y+") OR ( user1="+y+" AND user2="+x+");");
     while (rs.next()) {                
               int chid=rs.getInt(1);
               int user1=rs.getInt("user1");
               int user2=rs.getInt("user2");
               Chat p=new Chat(chid, user1, user2);
     arr.add(p);
     }
    return arr;
    }
    
    
}

