package com.playkids.domain;

import java.util.Date;

import com.google.gson.Gson;

public class MessageVO {
	private String message_id; //메시지를 보낸 아이디
	private String message_sender; //메시지 보낸 사람
	private String message_receiver; //메시지 받는 사람
	private String message_content; //메시지 내용
	private Date message_sendTime; //메시지 보낸 시간
	private Date message_readTime; //메시지 읽은 시간
	private String from_id;
	private String to_id;
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_receiver() {
		return message_receiver;
	}
	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_sendTime() {
		return message_sendTime;
	}
	public void setMessage_sendTime(Date message_sendTime) {
		this.message_sendTime = message_sendTime;
	}
	public Date getMessage_readTime() {
		return message_readTime;
	}
	public void setMessage_readTime(Date message_readTime) {
		this.message_readTime = message_readTime;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}

	public static MessageVO convertMessage(String source) {
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MessageVO.class);
		return message;
	}

	
	@Override
	public String toString() {
		return "MessageVO [message_id=" + message_id + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_content=" + message_content + ", message_sendTime=" + message_sendTime
				+ ", message_readTime=" + message_readTime + ", from_id=" + from_id + ", to_id=" + to_id + "]";
	}
	
	
}
