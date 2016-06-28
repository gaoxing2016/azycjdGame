package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiBookmark;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.dao.IAnzhiBookmarkDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiBookmarkService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiBookmarkServiceImpl extends ActionDb  implements IAnzhiBookmarkService {
	@Autowired
	private IAnzhiBookmarkDao anzhibookmarkDao;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	public String addAnzhiBookmark(AnzhiBookmark anzhibookmark,HttpServletRequest request,AnzhiMember am){
		QueryList<AnzhiBookmark> ls=anzhibookmarkDao.findAnzhiBookmarkAll(1, 1, " and member_id="+am.getId()+" and bookmark_type="+anzhibookmark.getBookmarkType()+" and novel_id="+anzhibookmark.getNovelId()+" and chapter_id="+anzhibookmark.getChapterId());
		List<Pojo> pojoList=new ArrayList<Pojo>();
		
		
		if(ls.getList().size()==0){//说明该小说、章节没有书签
			anzhibookmark.setAddTime(getNowTime());
			anzhibookmark.setMemberId(am.getId());
			anzhibookmark.setVote("");
			pojoList.add(anzhibookmarkDao.addAnzhiBookmark(anzhibookmark));
			int shoucang=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+anzhibookmark.getNovelId()+" and member_id="+am.getId()+" and action_type=1");
			if(shoucang==0){
				//修改小说的基本信息
				AnzhiNovelMultifunction anzhinovelmultifunction =new AnzhiNovelMultifunction();
				this.updateTableFieldAppend("anzhi_novel", anzhibookmark.getNovelId(), "total_save_num", 1);
				//添加anzhi_novel_multifunction记录
				anzhinovelmultifunction.setAddTime(getNowTime());
				anzhinovelmultifunction.setState(0);
				anzhinovelmultifunction.setActionType(1);
				anzhinovelmultifunction.setNovelId(anzhibookmark.getNovelId());
				anzhinovelmultifunction.setMemberId(am.getId());
				anzhinovelmultifunction.setVote("添加书签收藏本书");
				pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anzhinovelmultifunction));
			}
		}else{
			AnzhiBookmark ab=ls.getList().get(0);
			ab.setReadAddress(anzhibookmark.getReadAddress());
			ab.setAddTime(getNowTime());
			pojoList.add(anzhibookmarkDao.updateAnzhiBookmark(ab));
		}
		this.excuteUpdate(pojoList);
		return "yes";
	}

	public boolean addBatchAnzhiBookmark(List<AnzhiBookmark> list){
		return anzhibookmarkDao.addBatchAnzhiBookmark(list);
	}

	public boolean delAnzhiBookmark(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibookmarkDao.delAnzhiBookmark(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiBookmark(String ids){
		return anzhibookmarkDao.delBatchAnzhiBookmark(ids);
	}

	public boolean updateAnzhiBookmark(AnzhiBookmark anzhibookmark){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibookmarkDao.updateAnzhiBookmark(anzhibookmark));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiBookmark> findAnzhiBookmarkAll(int size,int pageNum,String condition){
		return anzhibookmarkDao.findAnzhiBookmarkAll(size,pageNum,condition);
	}


}