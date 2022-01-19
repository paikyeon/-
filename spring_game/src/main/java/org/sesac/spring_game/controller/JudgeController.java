package org.sesac.spring_game.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.sesac.spring_game.vo.JudgeVo;
import org.sesac.spring_game.exception.JudgeNotFoundException;
import org.sesac.spring_game.util.PageNavigator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class JudgeController {

	@Autowired
	private SqlSession session;
	
	@RequestMapping("/judge/list")
	public String judge_list(
			@RequestParam( value="pno",required = false, defaultValue = "0" ) int pno,
			Model model) {
		
		if( pno == 0 ) { // pno없이 접근
			return "redirect:/judge/list?pno=1";
		}
		
		int rowPerPage = 2 ; //페이지당 보여줄 게시물 수
		int pagePerGrp = 4 ; //하단 보여줄 페이지번호 갯수 
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		int startNo = (pno-1) * rowPerPage ;
		map.put("startNo", startNo);
		map.put("size", rowPerPage );
		
		String ns = "org.sesac.config.mappers.judge";
		List<JudgeVo> list = session.selectList(ns+".selectAll", map);
		model.addAttribute("judge_list", list);
		
		PageNavigator pnavi = new PageNavigator();//하단 페이지번호 목록 생성
		pnavi.setRowPerPage(rowPerPage);//페이지당 보여줄 게시물 수
		pnavi.setPagePerGrp(pagePerGrp);//하단 보여줄 페이지번호 갯수 
		pnavi.setCurrentPageNo(pno);
		
		// 총게시물 수 추출
		int judge_count = session.selectOne(ns+".count");
		model.addAttribute("judge_count", judge_count);
		
		pnavi.setTotalRow(judge_count);
		
		ArrayList<Integer> pageNavi = pnavi.getPageNavi();
		
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("pageNavigator", pnavi);
		
	return"judge/list";

}
	@RequestMapping("/judge/insert_form")
	public String judge_insert_form(){

	

	return "judge/insert_form";
}
	@RequestMapping("/judge/insert_action")
	public String judge_insert_action(JudgeVo vo){
		
		
		String ns = "org.sesac.config.mappers.judge";
		session.insert(ns+".insert", vo);
		
		
		return "redirect:/judge/list";
	}
	@RequestMapping("/judge/detail")
	public String judge_detail( 
			@RequestParam(value="target",required = false) String target, 
			@RequestParam(value="word", required = false) String word, 
			@RequestParam("no") int no, 
			Model model) throws JudgeNotFoundException {
		
		String ns = "org.sesac.config.mappers.judge";
		JudgeVo vo = session.selectOne(ns+".select", no);

		
		
		if( vo == null ) { //없는 할일 번호를 추출
			throw new JudgeNotFoundException("없거나 삭제된 할일번호입니다 : "+no);
//			model.addAttribute("error_msg", "없거나 삭제된 할일번호입니다 : "+no);
//			return "judge/error";
		}
			
			model.addAttribute("vo", vo);
		
			
			
			return "judge/detail";
}
	@RequestMapping("/judge/update_form")
	public String judge_update_form( @RequestParam("no") int no, Model model) {
		
		String ns = "org.sesac.config.mappers.judge";
		JudgeVo vo = session.selectOne(ns+".select", no);
		
		model.addAttribute("vo", vo);
		
		return "judge/update_form";
	}
	//수정작업
	@RequestMapping("/judge/update_action")
	public String judge_update_action(
			JudgeVo vo,
			@RequestParam("pno") int pno) {
		
		String ns = "org.sesac.config.mappers.judge";
		session.update(ns+".update", vo);
		
		return "redirect:/judge/list?pno="+pno;
	}
	//삭제작업
	@RequestMapping("/judge/delete_action")
	public String judge_delete_action(
			@RequestParam("no") int no,
			@RequestParam("pno") int pno) {
		
		String ns = "org.sesac.config.mappers.judge";
		session.delete(ns+".delete", no);
		
		return "redirect:/judge/list?pno="+pno;
	}

	// 할일 검색
	@RequestMapping("/judge/search")
	public String judge_search(
			@RequestParam("target") String target,
			@RequestParam("word") String word,
			@RequestParam( value="pno",required = false, defaultValue = "1" ) int pno,
			Model model) {
		
		int rowPerPage = 2 ; //페이지당 보여줄 게시물 수
		int pagePerGrp = 4 ; //하단 보여줄 페이지번호 갯수 
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		int startNo = (pno-1) * rowPerPage ;
		map.put("startNo", startNo);
		map.put("size", rowPerPage );
		map.put("target", target );
		map.put("word", "%"+word+"%" );
		
		String ns = "org.sesac.config.mappers.judge";
		List<JudgeVo> list = session.selectList(ns+".search", map);
		model.addAttribute("judge_list", list);
		
		PageNavigator pnavi = new PageNavigator();//하단 페이지번호 목록 생성
		pnavi.setRowPerPage(rowPerPage);//페이지당 보여줄 게시물 수
		pnavi.setPagePerGrp(pagePerGrp);//하단 보여줄 페이지번호 갯수 
		pnavi.setCurrentPageNo(pno);
		
		// 총게시물 수 추출
		int judge_count = session.selectOne(ns+".search_count", map);
		model.addAttribute("judge_count", judge_count);
		
		pnavi.setTotalRow(judge_count);
		
		ArrayList<Integer> pageNavi = pnavi.getPageNavi();
		
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("pageNavigator", pnavi);
		
		return "judge/search_list"; //뷰이름  =>  /WEB-INF/views/ (뷰이름) .jsp
	}
	
	@ExceptionHandler(Exception.class)
	public String judgenotfoundexception(Exception e, HttpServletRequest req) {
		
		req.setAttribute("exception", e);
		return "judge/error";
	}
}




