/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import java.sql.Connection;
import java.sql.Statement;
import Utils.DataBase;
import java.sql.SQLException;
import IService.IService;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pidv.Entite.Chat;
import pidv.Entite.Message;

/**
 *
 * @author Med Ch
 */
public class ServiceMessage implements IService<Message> {
    
    private Connection con;
    private Statement ste;
    /* */
   
    public ServiceMessage() {
        con = DataBase.getInstance().getConnection();

    }
    public void ajouter(Message t ) throws SQLException {
        String url = "jdbc:mysql://localhost:3306/mysql";
        ste = con.createStatement();
        String requeteInsert = "INSERT INTO `test`.`message` (`chid`, `userid`, `msg`) VALUES ('" + t.getChid() + "', '" + t.getUserid() + "', '" + t.getMsg() + "');";
        ste.executeUpdate(requeteInsert);
    }
    
    @Override
     public boolean delete(Message t) throws SQLException {
          String sql = "DELETE FROM message WHERE msg=?";
 
PreparedStatement statement = con.prepareStatement(sql);
statement.setString(1, t.getMsg());

 
int rowsUpdated = statement.executeUpdate();
if (rowsUpdated > 0) {
    System.out.println("c bon!");
}
        return true;
     }

    @Override
    public boolean update(Message u) throws SQLException {
       String sql = "UPDATE message SET chid=?, userid=?, msg=? WHERE chid=?";
 
PreparedStatement statement = con.prepareStatement(sql);
statement.setInt(1, u.getChid());
statement.setInt(2, u.getUserid());
statement.setString(3, u.getMsg());
statement.setInt(4, u.getChid());
 
int rowsUpdated = statement.executeUpdate();
if (rowsUpdated > 0) {
    System.out.println("c bon!");
}
        return true;
    }

    @Override
    public List<Message> readAll() throws SQLException {
    List<Message> arr=new ArrayList<>();
    ste=con.createStatement();
    ResultSet rs=ste.executeQuery("select * from message");
     while (rs.next()) {                
               int chid=rs.getInt(1);
               int userid=rs.getInt("userid");
               String msg=rs.getString("msg");
               Message p=new Message(chid, userid, msg);
     arr.add(p);
     }
    return arr;
    }
    public List<Message> Findmsg(Chat t) throws SQLException {
    List<Message> arr=new ArrayList<>();
    ste=con.createStatement();
    ResultSet rs=ste.executeQuery("select * from message WHERE chid= "+t.getChid()+";");
     while (rs.next()) {                
               int chid=rs.getInt(1);
               int userid=rs.getInt("userid");
               String msg=rs.getString("msg");
               Message p=new Message(chid, userid, msg);
     arr.add(p);
     }
    return arr;
    }
    
    
    
}
