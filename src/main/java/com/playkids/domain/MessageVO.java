package com.playkids.domain;

import java.util.Date;

public class MessageVO {
	private String message_id; //�޽����� ���� ���̵�
	private String message_sender; //�޽��� ���� ���
	private String message_receiver; //�޽��� �޴� ���
	private String message_content; //�޽��� ����
	private Date message_sendTime; //�޽��� ���� �ð�
	private Date message_readTime; //�޽��� ���� �ð�
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
