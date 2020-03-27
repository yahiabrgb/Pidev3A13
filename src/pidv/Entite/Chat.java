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
public class Chat {
    private int chid;
    private int user1;
    private int user2;
    
    public Chat( int chid, int user1, int user2)
    {
        this.chid=chid;
        this.user1= user1;
        this.user2=user2;
    }
        public int getChid()
    {
        return chid;
    }
    public int getUser1()
    {
        return user1;
    }
    public int getUser2()
    {
        return user2;
    }
    
    public void setchid(int x)
     {
         chid=x;
     }
    public void setuser1id(int x)
     {
         user1=x;
     }
    public void setuser2id(int x)
     {
         user2=x;
     }
    
    public String toString() {
        return "Chat{" + "chid=" + chid + ", user1=" + user1 + ", user2=" + user2 + '}';
    }
    
    
}
