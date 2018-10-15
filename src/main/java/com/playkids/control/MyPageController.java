package com.playkids.control;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;
import com.playkids.service.MypageService;

@Controller
public class MyPageController {
	
	@Inject
	private MypageService service;
	
	@RequestMapping("mypage")
	public String readMypage(HttpSession session, Model model, HttpServletResponse response) {
		String login_id = (String) session.getAttribute("login_id");
		System.out.println(login_id);
		String login_type = (String) session.getAttribute("login_type");
		if(login_type.equals("business")) {
			return "mypage/readBusinesspage";
		}
		List<ChildInfoVO> childList = service.selectChild(login_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentYear = sdf.format(new Date()).substring(0, 4);
		for(int i=0; i<childList.size();i++) { // 자식 나이 설정
			Date dbirth = childList.get(i).getDbirth();
			String dbirthYear = sdf.format(dbirth).substring(0,4);
			childList.get(i).setDage(Integer.parseInt(currentYear)-Integer.parseInt(dbirthYear)+1);
		}
		System.out.println(service.selectMyInfo(login_id));
		
		if(login_id != null) {
			model.addAttribute("myInfo", service.selectMyInfo(login_id)); //이름, 캐쉬 잔액
			model.addAttribute("childInfo",childList);// 자녀 정보
		}
		return "mypage/readMypage";
	}
	
	@RequestMapping("updateMyInfo")
	public @ResponseBody String updateMyInfo(MemberVO member) {
		System.out.println(member);
		if(service.updateMyInfo(member)) return "회원정보가 변경되었습니다.";
		return "회원정보 변경을 실패하였습니다.";
	}
	
	@RequestMapping("insertChild")
	public @ResponseBody ChildInfoVO insertChild(ChildInfoVO childInfo, HttpSession session) {
		String login_id = (String) session.getAttribute("login_id");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currentYear = sdf.format(new Date()).substring(0, 4);
		Date dbirth = childInfo.getDbirth();
		String dbirthYear = sdf.format(dbirth).substring(0,4);
		childInfo.setDage(Integer.parseInt(currentYear)-Integer.parseInt(dbirthYear)+1);
		
		if(login_id!=null)
			childInfo.setMid(login_id);
		if(service.insertChild(childInfo))
			System.out.println("자녀등록 완료");
		return childInfo;
	}
	
	@RequestMapping("myclasslist")
	public String myclasslist(Model model,HttpSession session,String myclass) {
		String login_id = (String) session.getAttribute("login_id");
		Map<String, String> map = new HashMap<>();
		map.put("mid", login_id);
		map.put("myclass", myclass);
		model.addAttribute("myClassList",service.selectClass(map));
		if(myclass.equals("payment"))
			return "mypage/result/mypaylist";
		return "mypage/result/myclasslist";
	}
	
	@RequestMapping("myboardlist")
	public String myboardlist(Model model,HttpSession session) {
		String login_id = (String) session.getAttribute("login_id");
		model.addAttribute("myBoard",service.selectMyBoard(login_id));
		return "mypage/result/myboardlist";
	}
	
	@RequestMapping("deleteReserve")
	public @ResponseBody String deleteReserve(HttpSession session,String rno, String price){
		System.err.println(rno);
		System.err.println(price);
		String login_id = (String) session.getAttribute("login_id");
		Map<String, Object> map = new HashMap<>();
		map.put("mcash", Integer.parseInt(price)*-1);
		map.put("mid", login_id);
		map.put("rno", rno);
		if(service.deleteReserve(map)) return "결제 취소가 완료되었습니다.";
		return "결제 취소를 실패하였습니다.";
	}
	
	
	@RequestMapping("chargepage")
	public String readChargePage(Model model, HttpSession session) {
		String login_id = (String) session.getAttribute("login_id");
		if(login_id != null)
			model.addAttribute("myInfo", service.selectMyInfo(login_id)); //이름, 캐쉬 잔액
		return "chargepage/readChargePage";
	}
	
	@RequestMapping("updateCharge")
	public @ResponseBody String updateCharge(HttpSession session, String refund,String cash) {
		String login_id = (String) session.getAttribute("login_id");
		System.out.println("cash>>"+ cash);
		Map<String,Object> map = new HashMap<>();
		map.put("mid", login_id);
		if(refund!=null && refund.equals("refund")) {
			map.put("mcash",Integer.parseInt(cash)*-1);
			if(service.updateCash(map)) return "환불되었습니다.";
			return "환불을 실패하였습니다.";
		}
		map.put("mcash", Integer.parseInt(cash));
		if(service.updateCash(map)) return "충전되었습니다.";
		return "충전을 실패하였습니다.";
	}
	
	@RequestMapping("returnLogin")
	public void returnLogin(HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out= response.getWriter();
			out.print("<script>alert('로그인이 필요합니다.'); location.href='/login'"
					+ "</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	@RequestMapping("chat")
	public String chat() {
		return "chat/qna";
	}

}
