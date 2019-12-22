package com.railer.rt.tour;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;




@Controller("tour.tourController")
public class TourController {

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private TourService service;

	@RequestMapping(value = "/tour/sudo")
	public String tour1(Model model,
			@RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "1") int locNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req) {
		
		String cp = req.getContextPath();
		
		int items = 9;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		map.put("name", 0);
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
		
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		//지역별 이미지를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);
		
		//추천해줄 곳을 가져옴
		List<Tour> hitContentList = service.hitContentList(map);
		
		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;
		/*String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page;
		

        
        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }
        */
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		model.addAttribute("hitContentList", hitContentList);
		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "수도권");
		model.addAttribute("subTitle", "sudo");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/chungcheong")
	public String tour3(Model model,@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "2") int locNum,HttpServletRequest req) throws Exception {
		
	
		String cp = req.getContextPath();
		
		int items = 9;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		map.put("name", 0);
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
		
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		//지역별 이미지를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);
		
		//추천해줄 곳을 가져옴
		List<Tour> hitContentList = service.hitContentList(map);
		
		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;
		/*String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page;
		

        
        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }
        */
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		model.addAttribute("hitContentList", hitContentList);
		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "충청권");
		model.addAttribute("subTitle", "chungcheong");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/gangwon")
	public String tour2(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "3") int locNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req) throws Exception {
		
String cp = req.getContextPath();
		
		int items = 9;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		map.put("name", 0);
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
		
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		//지역별 이미지를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);
		
		//추천해줄 곳을 가져옴
		List<Tour> hitContentList = service.hitContentList(map);
		
		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;
		/*String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page;
		

        
        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }
        */
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		model.addAttribute("hitContentList", hitContentList);
		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", "3");
		model.addAttribute("title", "강원권");
		model.addAttribute("subTitle", "gangwon");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/jeonla")
	public String tour4(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "4") int locNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req) throws Exception {
		

		
String cp = req.getContextPath();
		
		int items = 9;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		map.put("name", 0);
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
		
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		//지역별 이미지를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);
		
		//추천해줄 곳을 가져옴
		List<Tour> hitContentList = service.hitContentList(map);
		
		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;
		/*String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page;
		

        
        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }
        */
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		model.addAttribute("hitContentList", hitContentList);
		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", "4");
		model.addAttribute("title", "전라권");
		model.addAttribute("subTitle", "jeonla");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/gyeongsang")
	public String tour5(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "5") int locNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req) throws Exception {
		
		
String cp = req.getContextPath();
		
		int items = 9;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		map.put("name", 0);
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
		
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		//지역별 이미지를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);
		
		//추천해줄 곳을 가져옴
		List<Tour> hitContentList = service.hitContentList(map);
		
		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;
		/*String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page;
		

        
        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }
        */
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		model.addAttribute("hitContentList", hitContentList);
		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", "5");
		model.addAttribute("title", "경상권");
		model.addAttribute("subTitle", "gyeongsang");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/detail")
	public String detail(Model model) throws Exception {

		return ".four.tour.tour.detail";
	}

	
	
	@RequestMapping(value = "/tour/detailTourCategory", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detailTourCategory(@RequestParam int cateNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateNum", cateNum);

		List<Tour> detailTourCategoy = service.detailTourCategory(map);

		Map<String, Object> model = new HashMap<>();
		model.put("detailTourCategoy", detailTourCategoy);

		return model;
	}
	
	
	@RequestMapping(value = "/tour/detailTourList")
	public String detailTourList(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam int staNum,
			@RequestParam int detailcateNum,
			@RequestParam String subTitle,
			HttpServletRequest req) {
				
		int items = 9;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("staNum", staNum);
		map.put("detailcateNum", detailcateNum);
		map.put("name", 1);
		
		//카운터 세기
		dataCount = service.dataCount(map);

		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);
		

		
		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		List<Tour> detailTourList = service.detailTourList(map);
		
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
				
		model.addAttribute("list", detailTourList);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount",dataCount);
		return "tour/tour/optionsList";
	}
	
	@RequestMapping(value = "/tour/likeTour" )
	@ResponseBody
	public Map<String, Object> likeTour(
			@RequestParam int tourNum,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tourNum", tourNum);
		map.put("userId", info.getUserId());
		

		//좋아요를 했는지(1) 안했는지(0) 알기 위한 여부 체크 
		int likecheck = service.likeCheck(map);
				
		if(likecheck==0) {
			service.likeTour(map);			
		}else{
			service.disLikeTour(map);
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("likecheck", likecheck);
	

		return model;
	}
	
	@RequestMapping(value ="/tour/initMarkHeart")
	@ResponseBody
	public Map<String, Object> 	initMarkHeart(
			HttpSession session) throws Exception {
		
		

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		

		//이미 좋아요 했던 것의 게시물 번호들을 가져온다~
		List<Tour> list = service.initLikeMark(map);
				
		
		
		Map<String, Object> model = new HashMap<>();
		model.put("likeList", list);
	

		return model;
	}
	

	
	
	

}
