package com.javaex.vo;

public class UserVo {

	//필드
	//유저테이블
	private int userNo;
	private String userHp;
	private String userName;
	private String userBirth;
	
	//영화테이블
	private int mNo;
	private String mName;
	private String mTicketing;
	private String mDate;
	private String mRemarke;
	private String mTheater;
	
	
	//좌석테이블
	private int sNo;
	
	
	//생성자
	public UserVo() {

	}

	public UserVo(int userNo, String userHp, String userName, String userBirth, int mNo, String mName,
			String mTicketing, String mDate, int sNo, String mRemarke,String mTheater) {
		super();
		this.userNo = userNo;
		this.userHp = userHp;
		this.userName = userName;
		this.userBirth = userBirth;
		this.mNo = mNo;
		this.mName = mName;
		this.mTicketing = mTicketing;
		this.mDate = mDate;
		this.sNo = sNo;
		this.mRemarke = mRemarke;
		this.mTheater = mTheater;
	}

	public int getUserNo() {
		return userNo;
	}

	//메소드 g/s
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserHp() {
		return userHp;
	}

	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmTicketing() {
		return mTicketing;
	}

	public void setmTicketing(String mTicketing) {
		this.mTicketing = mTicketing;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	
	public String getmRemarke() {
		return mRemarke;
	}

	public void setmRemarke(String mRemarke) {
		this.mRemarke = mRemarke;
	}
	public String getmTheater() {
		return mTheater;
	}

	public void setmTheater(String mTheater) {
		this.mTheater = mTheater;
	}
	


	//일반메소드
	// toString() 메서드 수정
	@Override
	public String toString() {
	    return "UserVo [userNo=" + userNo + ", userHp=" + userHp + ", userName=" + userName + ", userBirth=" + userBirth
	            + ", mNo=" + mNo + ", mName=" + mName + ", mTicketing=" + mTicketing + ", mDate=" + mDate + ", sNo="
	            + sNo + ", mRemarke=" + mRemarke + ", mTheater=" + mTheater + "]";
	}

	

	

}
