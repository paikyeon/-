package org.sesac.spring_game.util;

import java.util.ArrayList;

public class PageNavigator {
	private int rowPerPage;
	private int pagePerGrp;
	private int totalRow;
	private int currentPageNo;
	private int maxPage;
	private int pageGrp;
	private int startPage;
	private int endPage;
	
	public PageNavigator() {
	}

	public PageNavigator(int rowPerPage, int pagePerGrp, int totalRow, int currentPageNo) {
		super();
		this.rowPerPage = rowPerPage;
		this.pagePerGrp = pagePerGrp;
		this.totalRow = totalRow;
		this.setCurrentPageNo(currentPageNo);
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getPagePerGrp() {
		return pagePerGrp;
	}

	public void setPagePerGrp(int pagePerGrp) {
		this.pagePerGrp = pagePerGrp;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	@Override
	public String toString() {
		return "PageNavigator [rowPerPage=" + rowPerPage + ", pagePerGrp=" + pagePerGrp + ", totalRow=" + totalRow
				+ "]";
	}

	public ArrayList<Integer> getPageNavi() {
		maxPage = (int)Math.ceil(1.0*totalRow / rowPerPage);
		pageGrp = (currentPageNo - 1) / pagePerGrp + 1;
		startPage = pageGrp*pagePerGrp-(pagePerGrp-1);
		endPage = startPage + pagePerGrp - 1;
		
		ArrayList<Integer> pageNavi = new ArrayList<Integer>();
		for (int i = startPage; i <= endPage; i++) {
			pageNavi.add(i); //각 페이지번호를 저장. 하단에 보여줄 페이지 번호
			if(i == maxPage ) // 마지막 페이지이면 페이지번호를 못넣게 중단
				break;
		}

		return pageNavi;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPageGrp() {
		return pageGrp;
	}

	public void setPageGrp(int pageGrp) {
		this.pageGrp = pageGrp;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	
	
}