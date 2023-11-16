package chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
/**
 * Clase ChatBeanSingleton.
 * 
 *
 */
public class ChatBeanSingleton{
	
	private List<Message> messageList;
    /** Mapa con las sesiones y el nombre del usuario correspondiente. */
    private Map<HttpSession, String> userSessions;
	/**
	 * Constructor de ChatBeanSingleton, sirve para que solo se genere una base de datos.
	 */
	public ChatBeanSingleton() {
		this.messageList = new ArrayList<Message>();
        this.userSessions = new HashMap<HttpSession, String>();
    }
    /** 
     * Devuelve la lista de mensajes.
     * 
     * @return lista de mensajes.
     */
	public List<Message> getMessageList() {
        return messageList;
    }
    /**
     * Añade un mensaje a la lista de mensajes.
     * @param m mensaje.
     */
    public void addMessage(Message m) {
        messageList.add(m);
    }


    /**
     * Añade un usuario al mapa de sesiones, sin incluir su nombre real.
     * @param session HttpSession.
     */
    public void addUser(HttpSession session){
        this.userSessions.put(session, "tmp");
    }
    /**
     * Añade el nombre del usuario a la sesion correspondiente.
     * @param session HttpSession.
     * @param username nombre del usuario.
     */
    public void setUsernameToHTTPSession(HttpSession session, String username){
        userSessions.put(session, username);
        addMessage(new Message(username));
    }
/**
 * Comprueba si la sesion esta creada.
 * 
 * @param session HttpSession.
 * @return Si existe session.
 */
    public boolean checkSession(HttpSession session){
        if (session == null){
            return false;
        }
        try{
            if(userSessions.containsKey(session)){
                return true;
            }
            return false;
        }catch(Exception e){
            return false;
        }
    }

/**
 * Devuelve userSessions.
 * @return userSessions.
 */
    public Map<HttpSession, String> getmap(){
        return userSessions;
    }
}
