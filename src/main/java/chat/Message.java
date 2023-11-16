package chat;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Clase Message.
 */
public class Message {
    /** Nombre del usuario del mensaje. */
    private String username;

    /** El contenido del mensaje. */
    private String content;

    /** La fecha del mensaje. */
    private LocalDateTime date;

    /**
     * Constructor de la clase Message.
     * 
     * @param username El usuario propietario del mensaje.
     * @param content El contenido del mensaje.
     */
    public Message(String username, String content) {
        this.username = username;
        this.content = content;
        this.date = LocalDateTime.now();
    }
    /**
     * Constructor que se utiliza cuando el usuario no manda ningun mensaje, es decir, al entrar al chat por primera vez.
     * @param userEnter
     */
    public Message(String userEnter) {
        this.username = "server";
        this.content = "El usuario "+ userEnter+ " ha entrado al chat";
        this.date = LocalDateTime.now();
    }
    /**
     * Devuelve el Username.
     * 
     * @return El Username.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Establece el nombre de usuario.
     * 
     * @param username El nuevo nombre de usuario.
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Devuelve el contenido del mensaje.
     * 
     * @return El contenido del mensaje.
     */
    public String getContent() {
        return content;
    }

    /**
     * Establece el contenido del mensaje.
     * 
     * @param content El nuevo contenido del mensaje.
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Devuelve la fecha del mensaje como un string formateado.
     * 
     * @return La fecha del mensaje como un string formateado.
     */
    public String getDateToString() {        
    	return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }

    /**
     * Establece la fecha.
     * 
     * @param date La nueva fecha.
     */
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}
