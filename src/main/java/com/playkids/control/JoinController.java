package com.playkids.control;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.service.JoinService;

@Controller
public class JoinController {
	
	@Inject
	private JoinService service;
	
	@Resource(name="upload_class")
	private String upload_class;

	@Resource(name="upload_teacher")
	private String upload_teacher;
	
	@RequestMapping(value="login")
	public String login() {
		return "/join/login";
	}
	
	@RequestMapping(value="joinchoice")
	public String joinChoice() {
		return "/join/joinChoice";
	}

	@RequestMapping(value="findchoice")
	public String findChoice() {
		return "/join/findChoice";
	}

	@RequestMapping(value="findid")
	public String findid(String find_id, HttpSession session, HttpServletRequest request) {
		session.setAttribute("find_id", find_id);
		if(find_id.equals("member")) {
			request.setAttribute("find_name", "�̸�");
			session.setAttribute("find_phone", "����ȣ");
			session.setAttribute("title", "����");
		}
		else {//business
			request.setAttribute("find_name", "�����");
			session.setAttribute("find_phone", "��ȭ��ȣ");
			session.setAttribute("title", "���");
		}
		return "/join/findId";
	}

	@RequestMapping(value="findcheckid")
	public @ResponseBody String findcheckid(String name, String phone, HttpSession session, HttpServletRequest request) {
		String find_id=(String)session.getAttribute("find_id");
		System.out.println(name+", "+phone);
		String result;
		String show_id;
		Map<String, String> map=new HashMap<>();
			map.put("name", name);
			map.put("phone", phone);
		
		if(find_id.equals("member")) {//member table
			show_id=service.selectmemberid(map);
		}
		else {//business table
			show_id=service.selectbusinessid(map);			
		}
		request.setAttribute("show_id", show_id);

		if(show_id!=null) {
			//���̵� ã�� * ���
			for(int i=0; i<show_id.length(); i++) {
				if(i%3==0) {
					show_id=show_id.replace(show_id.charAt(i), '*');
				}
			}
			result=show_id;	//* ���� id ������
		}
		else
			result="���̵� ã�� ����";
			
		return result;
	}
	
	@RequestMapping(value="findpw")
	public String findpw() {
		return "/join/findPw";
	}
	
	@RequestMapping(value="findcheckpw")
	public @ResponseBody String findcheckpw(String id, String phone, HttpSession session, HttpServletRequest request) {
		String find_id=(String)session.getAttribute("find_id");
		System.out.println(id+", "+phone);
		String result;
		String update_pw="";
		boolean autho_pw=false;
		Map<String, String> map=new HashMap<>();
			map.put("id", id);
			map.put("phone", phone);
		
		if(find_id.equals("member")) {//member table
			autho_pw=service.selectmemberpw(map);
		}
		else {//business table
			autho_pw=service.selectbusinesspw(map);			
		}
		if(autho_pw) {
			//�ӽ� ��� ��ȣ ���� & update �ϴ� �κ�
			request.setAttribute("update_pw", update_pw);
			System.out.println("update_pw:"+autho_pw);
			result="�ӽ� ��й�ȣ �ޱ� ����";
		}
		else
			result="�ӽ� ��й�ȣ �ޱ� ����";
			
		return result;
	}

	@RequestMapping(value="joinmember")
	public String joinMemeber() {
		return "/join/joinMember";
	}

	@RequestMapping(value="joinbusiness")
	public String joinBusiness() {
		return "/join/joinBusiness";
	}

	@RequestMapping(value="confirmbusiness")
	public String confirmBusiness() {
		return "/join/confirmBusiness";
	}

	@RequestMapping(value="loadendage")
	public @ResponseBody String loadAge(String type) throws SQLException {
		String html=null;
		List<Integer> list = new ArrayList<>();

		int startage=Integer.parseInt(type);
		if(startage!=0) {
			for(int i=startage+1; i<=13; i++) {
				list.add(i);
			}
		}
		
		html="<option value='0'>==����==</option>";
		for(int i=0; i<list.size(); i++){
			html+="<option value="+list.get(i)+">"+list.get(i)+"��"+"</option>";
		}
		return html;
	}
	@RequestMapping(value="loadaddr")
	public @ResponseBody String loadAddr(String type, String gugun) throws SQLException {
		String html=null;
		List<String> list = null;
		if(type.equals("gugun")){
			list = service.selectgugun();
		}else if(type.equals("dong")){
			list = service.selectdong(gugun);
		}
		html="<option value='0'>==����==</option>";
		for(int i=0; i<list.size(); i++){
			html+="<option value="+list.get(i)+">"+list.get(i)+"</option>";
		}
		return html;
	}
	
	@RequestMapping(value="loadplay")
	public @ResponseBody String loadPlay(String type, String playtype) throws SQLException {
		String html=null;
		List<String> list = null;
		if(type.equals("ptype")){
			list = service.selecttype();
		}else if(type.equals("act")){
			list = service.selectact(playtype);
		}
		html="<option value='0'>==����==</option>";
		for(int i=0; i<list.size(); i++){
			html+="<option value="+list.get(i)+">"+list.get(i)+"</option>";
		}
		return html;
	}
	
	@RequestMapping(value="insertjoin")
	public @ResponseBody String insertJoin(String type, MemberVO member, BusinessVO business) throws SQLException {
		String result=null;
		if(type.equals("member")) {
			if(service.createmember(member))
				result="���� ȸ�� ���� ����!!!";
			else
				result="���� ȸ�� ���� ����...";
		}else if(type.equals("business")) {
			if(service.createbusiness(business))
				result="��� ȸ�� ���� ����!!!";
			else
				result="��� ȸ�� ���� ����...";
		}
		return result;
	}
	
	@RequestMapping(value="findlogin")
	public @ResponseBody String findLogin(HttpServletRequest request, String type, String id, String pw) throws SQLException {
		String result=null;
		Map<String, String> map=new HashMap<>();
		HttpSession session=request.getSession();
		System.out.println(id+pw);
		map.put("id", id);
		map.put("pw", pw);
		if(type.equals("member")) {
			if(service.findmember(map)) {
				result="���� ȸ�� �α��� ����!!!";
				session.setAttribute("login_id", map.get("id"));
				session.setAttribute("login_type", map.get("member"));
			}
			else
				result="���� ȸ�� �α��� ����...";
		}else if(type.equals("business")) {
			if(service.findbusiness(map)) {
				result="��� ȸ�� �α��� ����!!!";
				session.setAttribute("login_id", map.get("id"));
				session.setAttribute("login_type", map.get("business"));
			}
			else
				result="��� ȸ�� �α��� ����...";
		}
		return result;
	}
	
//��� �α��� ���̵� �ߺ� üũ
	@RequestMapping(value="idcheck")
	public @ResponseBody String idCheck(String type, String checkid) {
		String result=null;
		if(type.equals("member")) {
			if(service.selectidcheck(checkid)){
				result="<font color=red>���̵� �ߺ�</font>";
			}else {
				result="<font color=green>���̵� ��� ����</font>";			
			}
		}else if(type.equals("business")) {
			if(service.selectidcheckbusin(checkid)){
				result="<font color=red>���̵� �ߺ�</font>";
			}else {
				result="<font color=green>���̵� ��� ����</font>";			
			}
		}
		return result;
	}
	
//��� �α��� ����ȣ �ߺ� üũ
	@RequestMapping(value="phonecheck")
	public @ResponseBody String phoneCheck(String type, String checkphone) {
		String result=null;
		if(type.equals("member")) {
			if(service.selectphonecheck(checkphone)){
				result="<font color=red>����ȣ �ߺ�</font>";
			}else {
				result="<font color=green>����ȣ ��� ����</font>";			
			}
		}else if(type.equals("business")) {
			if(service.selectphonecheckbusin(checkphone)){
				result="<font color=red>��ȭ��ȣ �ߺ�</font>";
			}else {
				result="<font color=green>��ȭ��ȣ ��� ����</font>";			
			}
		}
		return result;
	}
	
//Ŭ���� ���� action
	@RequestMapping(value="insertclass", method=RequestMethod.GET)
	public String showclass() {
		System.out.println("insertclass get in");
		return "/join/createClass";
	}
	
	@RequestMapping(value="insertclass", method=RequestMethod.POST)
	public @ResponseBody String createClass(HttpServletRequest request,
			MultipartFile file_class, MultipartFile file_teacher,
			String bid, String ctype, String cname, String cage1, String cage2,
			String cintro, String cdate, String prepare, String notice, int price,
			String park, String protect, String together, 
			String cteachername, String cteacher
			) throws IOException {
		System.out.println("insertclass post in");
		
		ClassVO classvo=new ClassVO();
		classvo.setBid(bid);
		classvo.setCtype(ctype);
		classvo.setCname(cname);
		classvo.setCage(cage1+","+cage2);
		classvo.setCintro(cintro);
		classvo.setCdate(cdate);
		classvo.setPrepare(prepare);
		classvo.setNotice(notice);
		classvo.setPrice(price);
		if(park!=null)
			classvo.setPark("use");
		else
			classvo.setPark("non");
		
		if(protect!=null)
			classvo.setProtect("use");
		else
			classvo.setProtect("non");
		
		if(together!=null)
			classvo.setTogether("use");
		else
			classvo.setTogether("non");
		
		classvo.setCteachername(cteachername);
		classvo.setCteacher(cteacher);
		
//Ŭ���� ���� �Է�
		if(service.createclass(classvo))
			System.out.println("DB class ���� �Է� ����!");
//���� ���ε�
			Map<String, String> map=new HashMap<>();
			map.put("bid",bid);
			map.put("cname",cname);
			map.put("cdate",cdate);
int cnocount=service.getcnocount(map);
if(cnocount==1) {//������ cno ����
			int cno=service.getcno(map);
//���� ���� ���
			String path_class=request.getServletContext().getRealPath("resources/upload/class");
			System.out.println(path_class);
			String path_teacher=request.getServletContext().getRealPath("resources/upload/teacher");
//���� ���ε� �Լ� ȣ��
			String classFileName=setFileName(file_class.getOriginalFilename(),cno);
			String teacherFileName=setFileName(file_teacher.getOriginalFilename(),cno);
			
			uploadFile(classFileName, file_class.getBytes(),"class",path_class);
			uploadFile(teacherFileName, file_teacher.getBytes(),"teacher",path_teacher);
//VO�� ���ϸ� set
			classvo.setCpic(classFileName);
			classvo.setCteacherpic(teacherFileName);
			Map<String, Object> map_file=new HashMap<>();
			map_file.put("cpic", classFileName);
			map_file.put("cteacherpic", teacherFileName);
			map_file.put("cno", cno);
			  
		if(service.modifyfile(map_file)) {
			System.out.println("DB file ���� �Է� ����!");
		}else {
			System.out.println("DB class ���� �Է� ����...OTL");					
		}

//���� �̸� ������ ���� ���ε� �Ŀ�

		System.out.println("file_class:"+classvo.getCpic());
		System.out.println("file_teacher:"+classvo.getCteacherpic());
}else if(cnocount > 1) {
		System.out.println("�����, Ŭ������, Ŭ������¥ �ߺ��� Ȯ���ϼ���");
}else {
		System.out.println("DB class ���� �Է� ����...OTL");	
}
		
		return "�޼��� �ޱ� ����!";
	}
	//teacher.jpg=> teacher_cno.jpg
	private String setFileName(String originalName, int cno) {
			String filename=originalName.split("\\.")[0];
			String extension=originalName.split("\\.")[1];
		return filename+"_"+cno+"."+extension;
	}
	private void uploadFile(String savedName, byte[] fileData, String type, String path) throws IOException {
		File target=null;
		if(type.equals("class")) {
			target=new File(path, savedName);
		}else if(type.equals("teacher")) {
			target=new File(path, savedName);			
		}
		FileCopyUtils.copy(fileData, target);
	}//uploadFile
	
	/*@RequestMapping(value="insertclass", method=RequestMethod.POST)
	public @ResponseBody String createClass(HttpServletRequest request) throws IOException {
		MultipartRequest mreq=null;
		String result=null;
		String formName=null;
		String fileName=null;
		String savepath=request.getServletContext().getRealPath("/upload");
		System.out.println("savepath:"+savepath);
		int maxSize=5*1024*1024;
		mreq=new MultipartRequest(request, savepath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		@SuppressWarnings("rawtypes")
		Enumeration formNames=mreq.getFileNames();
		while(formNames.hasMoreElements()) {
			formName=(String)formNames.nextElement();
			fileName=mreq.getFilesystemName(formName);
			System.out.println("filename:"+fileName);
			if(fileName != null) {
				System.out.println("���� ���ε� ����!");
			}//if
		}//while
		
		ClassVO cv=new ClassVO();
		cv.setBid(mreq.getParameter("bid"));
		cv.setCtype(mreq.getParameter("ctype"));
		cv.setCname(mreq.getParameter("cname"));
		//cv.setCpic("cpic");
		cv.setCpic(mreq.getFilesystemName("cpic"));
		cv.setCage(mreq.getParameter("cage1")+","+mreq.getParameter("cage2"));
		cv.setCintro(mreq.getParameter("cintro"));
		
		//cv.setCdate(mreq.getParameter("cdate"));
		cv.setPrepare(mreq.getParameter("prepare"));
		cv.setNotice(mreq.getParameter("notice"));
		cv.setPrice(Integer.parseInt(mreq.getParameter("price")));
		
		cv.setCteachername(mreq.getParameter("cteachername"));
		//cv.setCteacherpic(mreq.getParameter("cteacherpic"));
		cv.setCpic(mreq.getFilesystemName("cteacherpic"));
		cv.setCteacher(mreq.getParameter("cteacher"));		
		
		if(service.createclass(cv)) {
			result="Ŭ���� �Է� ����!!!";
		}else {
			result="Ŭ���� �Է� ����...";		
		}
		
		return result;
	}*/
}
