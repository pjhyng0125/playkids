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
    	
    	//���� ���� ���
    	users.put(session.getId(), session);
    	System.out.println(session.getAttributes());
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
        log(session.getId()+"�κ���  "+message.getPayload()+"����");
        MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
        System.out.println(messageVO);
        if(service.insertMessage(messageVO)) {
        	Gson gson = new Gson();
        	String msgJson = gson.toJson(messageVO);
        	session.sendMessage(new TextMessage(msgJson));
        };
        /*//����� ��� Ŭ���̾�Ʈ���� �޽��� ���� : ����Ʈ ���
        for(WebSocketSession sess : connectedUsers){
            sess.sendMessage(new TextMessage("echo:" + message.getPayload()));
        }*/
        
        // �� ���.
        /*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //����Ǿ� �ִ� ��� Ŭ���̾�Ʈ�鿡�� �޽����� �����Ѵ�.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
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
