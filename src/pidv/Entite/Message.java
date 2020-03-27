/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pidv.Entite;

/**
 *
 * @author Med Ch
 */
public class Message {
    private int chid;
    private int userid;
    private String msg;
    
    public Message(int chid, int userid, String msg){
        this.chid=chid;
        this.userid=userid;
        this.msg=msg;
    
}
    public int getChid()
    {
        return chid;
    }
    public int getUserid()
    {
        return userid;
    }
    public String getMsg()
    {
        return msg;
    }
    
    public void setchid(int x)
     {
         chid=x;
     }
    public void setuserid(int x)
     {
         userid=x;
     }
    public void setmsg(String x)
     {
         msg=x;
     }
    
    public String toString() {
        return "Message{" + "chid=" + chid + ", userid=" + userid + ", message=" + msg + '}';
    }
    
}
