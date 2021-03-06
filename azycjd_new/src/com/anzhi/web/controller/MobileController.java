package com.anzhi.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.service.IMobileService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class MobileController extends GetCondition{
	@Autowired
	private IMobileService mobileService;
	/**
	 * 首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/m_index")
	public String mIndex(HttpServletRequest request,HttpServletResponse response){
		return mobileService.mIndex(request);
	}
	
	/**
	 * 榜单
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/m_bangdan")
	public String mBangDan(HttpServletRequest request,HttpServletResponse response){
		return mobileService.mBangDan(request);
	}
	
	/**
	 * 榜单分页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/mBangDanFenYe")
	public String mBangDanFenYe(HttpServletRequest request,HttpServletResponse response){
		if(this.checkParam(request, "types")){
			QueryList<AnzhiNovel> ls= mobileService.getBanDanData(request, (this.getInt(request, "types")));
			request.setAttribute("data", ls);
		}
		return "mobile/m_novel";
	}
	
	/**
	 * 书库
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/m_shuku")
	public String mShuKu(HttpServletRequest request,HttpServletResponse response){
		return mobileService.mShuku(request);
	}
	
	/**
	 * 书库
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/m_shuku_fenye")
	public String mShuKuFenYe(HttpServletRequest request,HttpServletResponse response){
		if(this.checkParam(request, "types")){
			QueryList<AnzhiNovel> ls= mobileService.getShukuData(request,  (this.getInt(request, "types")-1));
			request.setAttribute("data", ls);
		}
		return "mobile/m_novel";
	}
	
	/**
	 * 目录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/mChapterMenu")
	public String mChapterMenu(HttpServletRequest request,HttpServletResponse response){
		return mobileService.mChapterMenu(request);
	}
	
	/**
	 * 阅读
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/mobile/readChapter")
	public void readChapter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(this.getInt(request, "chapterId")!=-1&&this.getInt(request, "novelId")!=-1&&this.checkParam(request, "looktype")){
			int chapterId=0;
			if(request.getParameter("looktype").equals("up")){
				chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" and id<"+this.getInt(request, "chapterId")+" order by id desc");
				if(chapterId==0){
					chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" order by id desc");
				}
			}else if(request.getParameter("looktype").equals("next")){
				chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" and id>"+this.getInt(request, "chapterId")+" order by id asc");
				if(chapterId==0){
					chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" order by id asc");
				}
			}else if(request.getParameter("looktype").equals("now")){
				chapterId=this.getInt(request, "chapterId");
			}
			
			response.sendRedirect(request.getContextPath()+"/mobile/readChapterReal.do?chapterId="+chapterId);
		}else{
			response.sendRedirect(request.getContextPath()+"/404.jsp");
		}
	}
	
	
	/**
	 * 阅读
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/readChapterReal")
	public String readChapterReal(HttpServletRequest request,HttpServletResponse response){
		if(this.checkParam(request, "chapterId")){
			return mobileService.cashRead(request,this.getLoginMember(request));
		}
		return "mobile/chapter_read";
	}
	
	/**
	 * 搜索
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/msearch")
	public String msearch(HttpServletRequest request,HttpServletResponse response){
		return mobileService.msearch(request);
	}
	
	/**
	 * 书架
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/mobile/mbookcase")
	public String mbookcase(HttpServletRequest request,HttpServletResponse response){
		return mobileService.mbookcase(request);
	}
	
	@RequestMapping(value="/mobile/mpinglun")
	public String mpinglun(HttpServletRequest request,HttpServletResponse response){
		return mobileService.mpinglun(request);
	}
	
	@RequestMapping(value="/mobile/myBookMark")
	public String myBookMark(HttpServletRequest request,HttpServletResponse response){
		return mobileService.myBookMark(request);
	}
	
	@RequestMapping(value="/mobile/moreDiscount")
	public String moreDiscount(HttpServletRequest request,HttpServletResponse response){
		return mobileService.moreDiscount(request);
	}
}
