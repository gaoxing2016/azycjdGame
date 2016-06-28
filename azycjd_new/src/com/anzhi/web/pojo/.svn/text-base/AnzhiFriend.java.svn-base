package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiFriend extends FatherPojo implements java.io.Serializable {
	public AnzhiFriend(){
	}
	public AnzhiFriend setValues(Object[] obj) {
		AnzhiFriend model=new AnzhiFriend();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setFriendMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setAddTime(obj[3]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[3]));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setMemberNick(obj[5]==null?"":obj[5].toString());
		model.setMemberHeadImg(obj[6]==null?"":obj[6].toString());
		model.setMemberVote(obj[7]==null?"":obj[7].toString());
		model.setFriendNick(obj[8]==null?"":obj[8].toString());
		model.setFriendHeadImg(obj[9]==null?"":obj[9].toString());
		model.setFriendVote(obj[10]==null?"":obj[10].toString());
		return model;
	}
	
	private String memberHeadImg;
	private String memberNick;
	private String memberVote;
	private String friendHeadImg;
	private String friendNick;
	private String friendVote;
	
	public String getMemberHeadImg() {
		return memberHeadImg;
	}
	public void setMemberHeadImg(String memberHeadImg) {
		this.memberHeadImg = memberHeadImg;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberVote() {
		return memberVote;
	}
	public void setMemberVote(String memberVote) {
		this.memberVote = memberVote;
	}
	public String getFriendHeadImg() {
		return friendHeadImg;
	}
	public void setFriendHeadImg(String friendHeadImg) {
		this.friendHeadImg = friendHeadImg;
	}
	public String getFriendNick() {
		return friendNick;
	}
	public void setFriendNick(String friendNick) {
		this.friendNick = friendNick;
	}
	public String getFriendVote() {
		return friendVote;
	}
	public void setFriendVote(String friendVote) {
		this.friendVote = friendVote;
	}

	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Integer friendMemberId;
	public void setFriendMemberId(Integer friendMemberId){
		this.friendMemberId=friendMemberId;
	}
	public Integer getFriendMemberId(){
		return this.friendMemberId;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
	}

}