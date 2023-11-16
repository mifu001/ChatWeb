package chat;

import java.net.URLEncoder;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
/**
 * Clase ChatBean.
 */
public class ChatBean {
    /** Nombre del usuario. */
    private String username;

    
    private static ChatBeanSingleton chat;
   
    /** Constructor de la clase ChatBean. */

    public ChatBean() {
    	if( chat == null ) {
    		chat = new ChatBeanSingleton();
        }
    	
    }
    /** 
     * Devuelve la lista de mensajes.
     * 
     * @return lista de mensajes.
     */
    public List<Message> getMessageList() {
        return chat.getMessageList();
    }
    /**
     * Añade un mensaje a la lista de mensajes.
     * @param m mensaje.
     */
    public void addMessage(Message m) {
        chat.addMessage(m);
    }

    /**
     * Llama a addMessage.
     * @param msg el mensaje.
     */
    public void setMsg(String msg) {
        addMessage(new Message(username, msg));
    }
    /**
     *  Añade el username.
     * @param username el nombre del usuario.
     */
    public void setUsername(String username) {
        this.username = username;
    }
    /**
     * Añade un usuario al mapa de sesiones, sin incluir su nombre real.
     * @param session HttpSession.
     */
    public void addUser(HttpSession session){
        chat.addUser(session);
    }
    /**
     * Añade el nombre del usuario a la sesion correspondiente.
     * @param session HttpSession.
     * @param username nombre del usuario.
     */
    public void setUsernameToHTTPSession(HttpSession session, String username){
        chat.setUsernameToHTTPSession(session, username);
    }
/**
 * Comprueba si la sesion esta creada.
 * 
 * @param session HttpSession.
 * @return Si existe session.
 */
    public boolean checkSession(HttpSession session){
        return chat.checkSession(session);
    }
/**
 * Encode URL.
 * @param s URL.
 * @return la URL codificada.
 */
    public String encodeURL(String s){
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (Exception e) {
            return null;
        }
    }
/**
 * Devuelve userSessions.
 * @return userSessions.
 */
    public Map<HttpSession, String> getmap(){
        return chat.getmap();
    }
}
