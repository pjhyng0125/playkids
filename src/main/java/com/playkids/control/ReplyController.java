package com.playkids.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.playkids.domain.Criteria;
import com.playkids.domain.PageMaker;
import com.playkids.domain.ReplyVO;
import com.playkids.service.ReplyService;

@RestController
@RequestMapping("replies")
public class ReplyController {

	@Inject
	private ReplyService service;
	
	
	@RequestMapping(value="/{bno}/{replypage}",method=RequestMethod.GET)
	public Map<String, Object> listPage(@PathVariable("bno") int bno,
						 @PathVariable("replypage") int page) {
		Map<String , Object> map = new HashMap<>();
		List<ReplyVO> list= null;
		Criteria cri = new Criteria();
		cri.setPage(page);
		try {
			
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotalRecord(service.count(bno));
			
			list = service.list_reply(bno,cri);
			
			System.out.println("��� list >>>>"+list);
			
			map.put("list", list);
			map.put("pm", pm);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
		//ResponseEntity<Ŭ���̾�Ʈ���� ������ �ڷ���> 								
		ResponseEntity<String> entity=null;
		try {
			service.create_reply(vo);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);// status 200�� �ǹ�
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);// status 400�� �ǹ�
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{rno}",method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("rno") int rno, 
					   @RequestBody ReplyVO vo) {
		ResponseEntity<String> entity=null;
		// �����Ϳ� �Բ� ������ ���¸� ����
		
		try {
			// url ��θ� ���� ���޹��� rno ���� vo�� ����
			vo.setRno(rno);
			service.update_reply(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	@RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) { 
		
		ResponseEntity<String> entity = null;
		
		try {
			service.remove_reply(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			//return "FAIL";
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
