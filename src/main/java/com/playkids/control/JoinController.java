package com.playkids.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.service.JoinService;

@Controller
public class JoinController {
	
	@Inject
	private JoinService service;
	
	@RequestMapping(value="login")
	public String login() {
		return "/join/login";
	}
	
	@RequestMapping(value="joinchoice")
	public String joinChoice() {
		return "/join/joinChoice";
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
	public @ResponseBody String insertJoin(String type, MemberVO member, BusinessVO business) throws SQLException {
		String result=null;
		if(type.equals("member")) {
			if(service.createmember(member))
				result="개인 회원 가입 성공!!!";
			else
				result="개인 회원 가입 실패...";
		}else if(type.equals("business")) {
			if(service.createbusiness(business))
				result="기업 회원 가입 성공!!!";
			else
				result="기업 회원 가입 실패...";
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
				result="개인 회원 로그인 성공!!!";
				session.setAttribute("login_member", map.get("id"));
			}
			else
				result="개인 회원 로그인 실패...";
		}else if(type.equals("business")) {
			if(service.findbusiness(map)) {
				result="기업 회원 로그인 성공!!!";
				session.setAttribute("login_business", map.get("id"));
			}
			else
				result="기업 회원 로그인 실패...";
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
	
//클래스 생성 action
	@RequestMapping(value="insertclass", method=RequestMethod.GET)
	public String showclass() {
		return "/join/createClass";
	}
	
	
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
				System.out.println("파일 업로드 성공!");
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
			result="클래스 입력 성공!!!";
		}else {
			result="클래스 입력 실패...";		
		}
		
		return result;
	}*/
}
