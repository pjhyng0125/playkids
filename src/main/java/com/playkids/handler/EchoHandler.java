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
//import com.google.gson.Gson;
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
    	
    	connectedUsers.add(session);
    	//맵을 쓸때 방법
    	users.put(session.getId(), session);
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
    	Map<String, Object> map = session.getAttributes();
        log(session.getId()+"로부터  "+message.getPayload()+"받음");
        MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
 
        String login_id = (String) map.get("login_id");
        if(login_id!=null && login_id.equals(messageVO.getFrom_id())) {
        	if(service.insertMessage(messageVO)) {
        		messageVO.setMessage_sendTime(service.selectSendTime(login_id));
        		Gson gson = new Gson();
        		String msgJson = gson.toJson(messageVO);
        		session.sendMessage(new TextMessage(msgJson));        		
        	}
        }
        
        for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         String to_id =  (String) map.get("login_id");
	         //받는사람
	         if (to_id !=null && to_id.equals(messageVO.getTo_id())) {
	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	            
	            
	         }
	         
	         if(to_id !=null && to_id.equals("manager") && (!login_id.equals("manager"))) {
	        	 Map<String , Object> mapforReadTime = new HashMap<>();
	        	 mapforReadTime.put("to_id", to_id);
	        	 mapforReadTime.put("from_id",login_id);
	        	 if(service.updateReadTime(mapforReadTime)) {
	        		 System.out.println(to_id+"가 "+login_id+"가 보낸 메시지를 읽음");
	        	 }
	         }
	     }
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
