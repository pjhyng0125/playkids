package com.playkids.domain;

import java.util.Date;

public class MessageVO {
	private String message_id; //메시지를 보낸 아이디
	private String message_sender; //메시지 보낸 사람
	private String message_receiver; //메시지 받는 사람
	private String message_content; //메시지 내용
	private Date message_sendTime; //메시지 보낸 시간
	private Date message_readTime; //메시지 읽은 시간
	private String chatroom_id;
	private String USER_user_id;
	private String TUTOR_USER_user_id;
	private int CLASS_class_id;
	private String user_profileImagePath;
	private String receiver_user_profileImagePath;
	private String user_name;
	private String receiver_user_name;
	private String class_name;
	private int class_id;
	private String TUTOR_tutor_id;
	private String tutor_name;
	private String tuti_id;
	private int unReadCount;

}
