package com.playkids.control;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
	Random r=new Random();
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
			request.setAttribute("find_name", "이름");
			session.setAttribute("find_phone", "폰번호");
			session.setAttribute("title", "개인");
		}
		else {//business
			request.setAttribute("find_name", "기업명");
			session.setAttribute("find_phone", "전화번호");
			session.setAttribute("title", "기업");
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
			//아이디 찾기 * 찍기
			for(int i=0; i<show_id.length(); i++) {
				if(i%3==0) {
					show_id=show_id.replace(show_id.charAt(i), '*');
				}
			}
			result=show_id;	//* 찍은 id 보내기
		}
		else
			result="아이디 찾기 실패";
			
		return result;
	}
	
	@RequestMapping(value="findpw")
	public String findpw() {
		return "/join/findPw";
	}
	
	@RequestMapping(value="findcheckpw")
	public @ResponseBody String findcheckpw(String id, String phone, HttpSession session, HttpServletRequest request) throws Exception {
		String find_id=(String)session.getAttribute("find_id");
		System.out.println(id+", "+phone);
		String update_pw="";
		String result="";
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
//임시 비밀 번호 생성 & update 하는 부분
			int k = 3;//임시 비밀번호  길이 (xxx111)
//영문 k 개 생성 (xxx)
			for(int i=0;i<k; i++) {
				int n=r.nextInt(58) + 65; //0~57=> 65~122
				if(n>=91 && n<=96) {
					i--;
					continue;
				}
				update_pw+=(char)n;
			}
//숫자 k 개 생성 (111)
			for(int i=0;i<k; i++) {
				int n=r.nextInt(10); //0~9
				update_pw+=n;
			}//update_pw 생성 완료
			String secure_update_pw=new PassEncrypt().encrypt(update_pw);
			map.put("pw", secure_update_pw);//map에 update_pw put
			if(find_id.equals("member")) {//member table
				if(service.modifypw(map))
					System.out.println("member: 비번 변경 성공! "+update_pw);
				else
					System.out.println("member: 비번 변경 실패....");
			}else {//business table
				if(service.modifypwbusin(map))
					System.out.println("business: 비번 변경 성공! "+update_pw);
				else
					System.out.println("business: 비번 변경 실패....");
			}
			//request.setAttribute("update_pw", update_pw);
			result="회원님의 임시 비밀번호는 [ "+update_pw+" ]입니다.\n로그인 후 비밀번호를 변경해주세요.";
		}
		else
			result="아이디와 전화번호를 확인해주세요.";
			
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
		
		html="<option value='0'>==선택==</option>";
		for(int i=0; i<list.size(); i++){
			html+="<option value="+list.get(i)+">"+list.get(i)+"세"+"</option>";
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
		html="<option value='0'>==선택==</option>";
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
		html="<option value='0'>==선택==</option>";
		for(int i=0; i<list.size(); i++){
			html+="<option value="+list.get(i)+">"+list.get(i)+"</option>";
		}
		return html;
	}
	
	@RequestMapping(value="insertjoin")
	public @ResponseBody String insertJoin(String type, MemberVO member, BusinessVO business) throws Exception {
		String result=null;
		if(type.equals("member")) {
//비밀번호 암호화 과정
			member.setMpw(new PassEncrypt().encrypt(member.getMpw()));
			if(service.createmember(member))
				result="개인 회원 가입 성공!!!";
			else
				result="개인 회원 가입 실패...";
		}else if(type.equals("business")) {
			business.setBpw(new PassEncrypt().encrypt(business.getBpw()));
			if(service.createbusiness(business))
				result="기업 회원 가입 성공!!!";
			else
				result="기업 회원 가입 실패...";
		}
		return result;
	}
	
	@RequestMapping(value="findlogin")
	public @ResponseBody String findLogin(HttpServletRequest request, String type, String id, String pw) throws Exception {
		String result=null;
		Map<String, String> map=new HashMap<>();
		HttpSession session=request.getSession();
		String secure_pw=new PassEncrypt().encrypt(pw);
		map.put("id", id);
		map.put("pw", secure_pw);
		if(type.equals("member")) {
			if(service.findmember(map)) {
				result="개인 회원 로그인 성공!!!";
				session.setAttribute("login_id", map.get("id"));
				session.setAttribute("login_type", map.get("member"));
			}
			else
				result="개인 회원 아이디 또는 비밀번호를 확인해주세요...OTL";
		}else if(type.equals("business")) {
			if(service.findbusiness(map)) {
				result="기업 회원 로그인 성공!!!";
				session.setAttribute("login_id", map.get("id"));
				session.setAttribute("login_type", map.get("business"));
			}
			else
				result="기업 회원  아이디 또는 비밀번호를 확인해주세요...OTL";
		}
		return result;
	}
	
//멤버 로그인 아이디 중복 체크
	@RequestMapping(value="idcheck")
	public @ResponseBody String idCheck(String type, String checkid) {
		String result=null;
		if(type.equals("member")) {
			if(service.selectidcheck(checkid)){
				result="<font color=red>아이디 중복</font>";
			}else {
				result="<font color=green>아이디 사용 가능</font>";			
			}
		}else if(type.equals("business")) {
			if(service.selectidcheckbusin(checkid)){
				result="<font color=red>아이디 중복</font>";
			}else {
				result="<font color=green>아이디 사용 가능</font>";			
			}
		}
		return result;
	}
	
//멤버 로그인 폰번호 중복 체크
	@RequestMapping(value="phonecheck")
	public @ResponseBody String phoneCheck(String type, String checkphone) {
		String result=null;
		if(type.equals("member")) {
			if(service.selectphonecheck(checkphone)){
				result="<font color=red>폰번호 중복</font>";
			}else {
				result="<font color=green>폰번호 사용 가능</font>";			
			}
		}else if(type.equals("business")) {
			if(service.selectphonecheckbusin(checkphone)){
				result="<font color=red>전화번호 중복</font>";
			}else {
				result="<font color=green>전화번호 사용 가능</font>";			
			}
		}
		return result;
	}
	
//클래스 생성 action
	@RequestMapping(value="insertclass", method=RequestMethod.GET)
	public String showclass() {
		return "/join/createClass";
	}

	@RequestMapping(value="loginsuccess", method=RequestMethod.GET)
	public String loginsuccess(String type, String id, String name, String phone, HttpServletRequest request) {
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		if(type.equals("member")) {
			request.setAttribute("fid", "개인 회원 아이디");
			request.setAttribute("fname", "이름");
			request.setAttribute("fphone", "폰번호");			
		}else {
			request.setAttribute("fid", "기업 회원 아이디");
			request.setAttribute("fname", "기업명");
			request.setAttribute("fphone", "전화번호");						
		}
		return "/join/loginSuccess";
	}
	
	@RequestMapping(value="test")
	public String test() {
		return "/join/test";
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
		
//클래스 정보 입력
		if(service.createclass(classvo))
			System.out.println("DB class 정보 입력 성공!");
//파일 업로드
			Map<String, String> map=new HashMap<>();
			map.put("bid",bid);
			map.put("cname",cname);
			map.put("cdate",cdate);
int cnocount=service.getcnocount(map);
if(cnocount==1) {//유일한 cno 검출
			int cno=service.getcno(map);
//파일 저장 경로
//			String path_class="/resources/upload/class";
//			System.out.println(path_class);
//			String path_teacher="/resources/upload/teacher";
			String path_class=request.getServletContext().getRealPath("resources/upload/class");
			System.out.println(path_class);
			String path_teacher=request.getServletContext().getRealPath("resources/upload/teacher");
//파일 업로드 함수 호출
			String classFileName=setFileName(file_class.getOriginalFilename(),cno);
			String teacherFileName=setFileName(file_teacher.getOriginalFilename(),cno);
			
			uploadFile(classFileName, file_class.getBytes(),"class",path_class);
			uploadFile(teacherFileName, file_teacher.getBytes(),"teacher",path_teacher);
//VO에 파일명 set
			classvo.setCpic(classFileName);
			classvo.setCteacherpic(teacherFileName);
			Map<String, Object> map_file=new HashMap<>();
			map_file.put("cpic", classFileName);
			map_file.put("cteacherpic", teacherFileName);
			map_file.put("cno", cno);
			  
		if(service.modifyfile(map_file)) {
			System.out.println("DB file 정보 입력 성공!");
		}else {
			System.out.println("DB class 정보 입력 실패...OTL");					
		}

//파일 이름 저장은 파일 업로드 후에

		System.out.println("file_class:"+classvo.getCpic());
		System.out.println("file_teacher:"+classvo.getCteacherpic());
}else if(cnocount > 1) {
		System.out.println("기업명, 클래스명, 클래스날짜 중복을 확인하세요");
}else {
		System.out.println("DB class 정보 입력 실패...OTL");	
}
		
		return "메세지 받기 성공!";
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
	
}
