/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chatgraph;

import Service.ServiceChat;
import Service.ServiceMessage;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import pidv.Entite.Chat;
import javafx.scene.control.TableRow;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import pidv.Entite.Message;

/**
 *
 * @author Med Ch
 */
public class FXMLDocumentController implements Initializable {
    
    @FXML private TableView<Chat> table;
    @FXML private TableColumn<Chat,Integer> chatid;
    @FXML private TableColumn<Chat,Integer> u1;
    @FXML private TableColumn<Chat,Integer> u2;
    @FXML private TableView<Message> tablem;
    @FXML private TableColumn<Message,Integer> u;
    @FXML private TableColumn<Message,String>m;
    @FXML private Button Add;
    @FXML private TextArea vv;
    @FXML private Button rr;
    @FXML private Button ss;
     Chat temp;
    Message temps;

  /*  @FXML
    private void handleButtonAction(ActionEvent event) {
        System.out.println("You clicked me!");
        label.setText("Hello World!");
    }*/
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        chatid.setCellValueFactory(new PropertyValueFactory<>("chid"));
        u1.setCellValueFactory(new PropertyValueFactory<>("user1"));
        u2.setCellValueFactory(new PropertyValueFactory<>("user2"));
        u.setCellValueFactory(new PropertyValueFactory<>("userid"));
        m.setCellValueFactory(new PropertyValueFactory<>("msg"));
        
        

        table.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
    if (newSelection != null) {
        temp= newSelection;
         
        try {

        tablem.setItems(getMSG());

    } catch (SQLException ex) {
        Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    }
});
       

                 tablem.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
    if (newSelection != null) {
        temps= newSelection;
        System.out.println(temps);
         
       
        
    }
});
                
       
        try {
         
        table.setItems(getChat());

    } catch (SQLException ex) {
        Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
    }
        
    }    
   
    
    public ObservableList<Chat> getChat() throws SQLException{
        ObservableList<Chat> chats = FXCollections.observableArrayList();
        ServiceChat sc = new ServiceChat();
        for(Chat ch: sc.readAll()){
            Chat chh=new Chat(ch.getChid(), ch.getUser1(),ch.getUser2());
            chats.add(chh);
        }
          return chats;
          
      }
   
    
/*
@FXML
private void handleRowSelect() {
    Chat row = table.getSelectionModel().getSelectedItem();
    if (row == null) return;
    if(row != temp){
        temp = row;
       
       System.out.println(temp);
   
       
        
  
}
    
   }

@FXML
private void handleRowSelect2() {
    Message row = tablem.getSelectionModel().getSelectedItem();
    if (row == null) return;
    if(row != temps){
        temps = row;
        
}
   }
*/
public ObservableList<Message> getMSG() throws SQLException{
        ObservableList<Message> messages = FXCollections.observableArrayList();
        ServiceMessage sm = new ServiceMessage();
        for(Message ms: sm.Findmsg(temp)){
            Message mss=new Message(ms.getChid(), ms.getUserid(),ms.getMsg());
            messages.add(mss);
        }
          return messages;
          
      }
 public void ajout(ActionEvent event) throws IOException, SQLException {
  
    String oo = vv.getText();
    

        ServiceMessage sp = new ServiceMessage();
            Message p = new Message(temp.getChid() ,temp.getUser1(), oo);
            sp.ajouter(p);
try {
         
        tablem.setItems(getMSG());

    } catch (SQLException ex) {
        Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
    }        
    }
  public void supp(ActionEvent event) throws IOException, SQLException {
      

        ServiceMessage sp = new ServiceMessage();
            sp.delete(temps);
            try {
         
        tablem.setItems(getMSG());

    } catch (SQLException ex) {
        Logger.getLogger(FXMLDocumentController.class.getName()).log(Level.SEVERE, null, ex);
    }     
        
    }




}
        // TODO
