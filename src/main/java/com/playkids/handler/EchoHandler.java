package com.playkids.handler;

import java.util.ArrayList;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.playkids.domain.MessageVO;
import com.playkids.service.MessageService;


public class EchoHandler extends TextWebSocketHandler{
    
    //세션을 모두 저장한다.
    //방법 1 :  1:1 채팅
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
    
    //방법 2 : 전체 채팅
    private List<WebSocketSession> connectedUsers = new ArrayList<WebSocketSession>();
    
    @Inject
    private MessageService service;
    
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
    	log(session.getId()+" 연결됨"); 
    	
    	//맵을 쓸때 방법
    	users.put(session.getId(), session);
    	System.out.println(session.getAttributes());
    }
    
    /**
     * 클라이언트 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        //List 삭제
    	connectedUsers.remove(session);
        //Map 삭제
    	users.remove(session.getId());
        log(session.getId()+"연결 끊김");
    }
    
    
    /**
     * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
        log(session.getId()+"로부터  "+message.getPayload()+"받음");
        MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
        System.out.println(messageVO);
        if(service.insertMessage(messageVO)) {
        	Gson gson = new Gson();
        	String msgJson = gson.toJson(messageVO);
        	session.sendMessage(new TextMessage(msgJson));
        };
        /*//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
        for(WebSocketSession sess : connectedUsers){
            sess.sendMessage(new TextMessage("echo:" + message.getPayload()));
        }*/
        
        // 맵 방법.
        /*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
    }
    
	@Override

	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
 
}
