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
    
    //������ ��� �����Ѵ�.
    //��� 1 :  1:1 ä��
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
    
    //��� 2 : ��ü ä��
    private List<WebSocketSession> connectedUsers = new ArrayList<WebSocketSession>();
    
    @Inject
    private MessageService service;
    
    /**
     * Ŭ���̾�Ʈ ���� ���Ŀ� ����Ǵ� �޼ҵ�
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
    	log(session.getId()+" �����"); 
    	
    	connectedUsers.add(session);
    	//���� ���� ���
    	users.put(session.getId(), session);
    }
    
    /**
     * Ŭ���̾�Ʈ ������ ������ �� ����Ǵ� �޼ҵ�
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        //List ����
    	connectedUsers.remove(session);
        //Map ����
    	users.remove(session.getId());
        log(session.getId()+"���� ����");
    }
    
    
    /**
     * Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����Ǵ� �޼ҵ�
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
    	Map<String, Object> map = session.getAttributes();
        log(session.getId()+"�κ���  "+message.getPayload()+"����");
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
	         //�޴»��
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
	        		 System.out.println(to_id+"�� "+login_id+"�� ���� �޽����� ����");
	        	 }
	         }
	     }
    }
    
	@Override

	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " �ͼ��� �߻�: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
 
}
