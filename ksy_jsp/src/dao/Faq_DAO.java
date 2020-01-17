package dao;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import common.*;
import dto.Faq_DTO;


public class Faq_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection 		   con    = null;
	PreparedStatement  ps 	  = null;
	ResultSet 		   rs 	  = null;
	
	
		public int update(String query){
		int result =0; 
		
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				result = ps.executeUpdate();
				
			}catch(SQLException se) {
				System.out.println("SQLException insertNotice():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception insertNotice():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("insertNotice() close"+e.getMessage());
				}
			}
			
			return result;
		}
			
	
	
	//내용 수정
	public int updateFaq(Faq_DTO dto){
		int result=0;
		String query = " update a06_track2_home_faq "+
					   " set title = '"+dto.getTitle()+"', "+
					   " content='"+dto.getContent()+"', "+
					   " reg_id ='"+dto.getReg_id()+"', "+
					   " reg_date ='"+dto.getReg_date()+"' "+
					   " where faq_no = '"+dto.getFaq_no()+"' ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException updateFaq():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception updateFaq():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps);
			}catch (Exception e) {
				System.out.println("updateFaq() close"+e.getMessage());
			}
		}
		return result;
	}
	
	
	//내용 삭제
	public int deleteFaq(String faq_no){
		int result=0;
		String query = " delete from a06_track2_home_faq "+
					   " where faq_no = '"+faq_no+"' ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException deleteFaq():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception deleteFaq():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps);
			}catch (Exception e) {
				System.out.println("deleteFaq() close"+e.getMessage());
			}
		}
		return result;
	}
	
	//조회수 증가
	public int faqHit(String faq_no){
		int result=0;
		String query = " update a06_track2_home_faq set hit = hit +1 "+
					   " where faq_no = '"+faq_no+"' ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException faqHit():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception faqHit():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps);
			}catch (Exception e) {
				System.out.println("faqHit() close"+e.getMessage());
			}
		}
		return result;
	}
	
	
	//상세조회
	public Faq_DTO getFaqView(String faqno){
		Faq_DTO dto = null;
		String query = " select faq_no, title, content, "+
					   " reg_id, to_char(reg_date,'yy-MM-dd')"+
					   " from a06_track2_home_faq "+
					   " where faq_no = '"+faqno+"' ";
		
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String faq_no      = rs.getString(1);
				String title 	   = rs.getString(2);
				String content 	   = rs.getString(3);
				String reg_id 	   = rs.getString(4);
				String reg_date    = rs.getString(5);
				dto = new Faq_DTO(faq_no,title,content,reg_id,reg_date);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException getFaqView():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getFaqView():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getFaqView() close"+e.getMessage());
			}
		}
		return dto;
	}
	


	//목록조회
	public ArrayList<Faq_DTO> getFaqList(){
		ArrayList<Faq_DTO> dtos = new ArrayList<Faq_DTO>();
		String query = " select faq_no, title, content, "+
					   " reg_id, to_char(reg_date,'yy-MM-dd')"+
					   " from a06_track2_home_faq "+
					   " order by faq_no desc ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String faq_no      = rs.getString(1);
				String title 	   = rs.getString(2);
				String content 	   = rs.getString(3);
				String reg_id 	   = rs.getString(4);
				String reg_date    = rs.getString(5);
				Faq_DTO dto 	   = new Faq_DTO(faq_no,title,content,reg_id,reg_date);
				dtos.add(dto);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException getFaqList():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getFaqList():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getFaqList() close"+e.getMessage());
			}
		}
		return dtos;
	}
	
	
	//아이디 최대값 구하기
	String getMaxNo(){
		String query = "select max(faq_no) from a06_track2_home_faq ";
		String result = null;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
			}
		}catch(SQLException se) {
			System.out.println("SQLException getMaxNo():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getMaxNo():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getMaxNo() close"+e.getMessage());
			}
		}
		return result;
	}
	
		
	//아이디 부여
	public String getFaqNo() {
		String faqNo = getMaxNo();
		// String carMaxId = getMaxNo();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		String nowYear = Integer.toString(year);
		nowYear = nowYear.substring(2, 4); 
		
		String faqYear = "";
		String faqNum = "";
		if(faqNo==null) {
			faqYear = nowYear;
			faqNum = "0000";
		} else {
			faqYear = faqNo.substring(0,2);
			faqNum = faqNo.substring(3,7);
		}
		
		if(nowYear.equals(faqYear)) {
			faqNum = Integer.toString(Integer.parseInt(faqNum)+1);
			faqNum = CommonUtil.getLPad(faqNum, 4, "0");
			faqNo = faqYear+"_"+faqNum;
		}else {
			faqNo = nowYear+"_0001";
		}
		return faqNo;
	}
	
}


