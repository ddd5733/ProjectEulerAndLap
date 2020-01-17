package dao;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import common.*;
import dto.Event_DTO;
import dto.EventM_DTO;


public class Event_DAO {
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
			
	
	
	
	
	//조회수 증가
	public int HitThatFalk(String event_no){
		int result=0;
		String query = " update a06_track2_home_event set hit = hit +1 "+
					   " where event_no = '"+event_no+"' ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException HitThatFalk():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception HitThatFalk():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps);
			}catch (Exception e) {
				System.out.println("HitThatFalk() close"+e.getMessage());
			}
		}
		return result;
	}
	
	
	//상세조회
	public Event_DTO getView(String event_no1){
		Event_DTO dto = null;
		String query =  " select event_no, title, content, "+
						" reg_id, to_char(reg_date,'yy-MM-dd'), "+
						" to_char(start_date,'yy-MM-dd'), to_char(end_date,'yy-MM-dd') , hit"+
						" from a06_track2_home_event "+
					    " where event_no = '"+event_no1+"' ";
		
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String event_no    = rs.getString(1);
				String title 	   = rs.getString(2);
				String content 	   = rs.getString(3);
				String reg_id 	   = rs.getString(4);
				String reg_date    = rs.getString(5);
				String start_date    = rs.getString(6);
				String end_date    = rs.getString(7);
				int hit    			= rs.getInt(8);
				dto = new Event_DTO(event_no,title,content,reg_id,reg_date,start_date,end_date,hit);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException getView():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getView():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getView() close"+e.getMessage());
			}
		}
		return dto;
	}

	//상세조회
	public EventM_DTO getViewM(String event_no1){
		EventM_DTO dto = null;
		String query =  " select  a.event_m_no,a.title, a.content, "+
				   		" a.reg_id, to_char(a.reg_date,'yy-MM-dd') , b.name "+
				   		" from a06_track2_home_event_m a, a06_track2_home_member b "+
				   		" where a.reg_id = b.id "+
				   		" and EVENT_M_NO = '"+event_no1+"' ";
		
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String event_m_no    = rs.getString(1);
				String title 	   = rs.getString(2);
				String content 	   = rs.getString(3);
				String reg_id 	   = rs.getString(4);
				String reg_date    = rs.getString(5);
				String name    = rs.getString(6);
				dto = new EventM_DTO(event_m_no,title,content,reg_id,reg_date,name);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException getViewM():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getViewM():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getView() close"+e.getMessage());
			}
		}
		return dto;
	}
	
	//상세조회
		public EventM_DTO getViewMM(String event_no1,String reg_id1){
			EventM_DTO dto = null;
			String query =  " select  a.event_m_no,a.title, a.content, "+
					   		" a.reg_id, to_char(a.reg_date,'yy-MM-dd') , b.name "+
					   		" from a06_track2_home_event_m a, a06_track2_home_member b "+
					   		" where a.reg_id = b.id "+
					   		" and a.reg_id = '"+reg_id1+"' "+
					   		" and EVENT_M_NO = '"+event_no1+"' ";
			
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String event_m_no    = rs.getString(1);
					String title 	   = rs.getString(2);
					String content 	   = rs.getString(3);
					String reg_id 	   = rs.getString(4);
					String reg_date    = rs.getString(5);
					String name    = rs.getString(6);
					dto = new EventM_DTO(event_m_no,title,content,reg_id,reg_date,name);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException getViewM():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getViewM():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getView() close"+e.getMessage());
				}
			}
			return dto;
		}
		
		
		//상세조회
		public EventM_DTO getWinnerName(String event_no1){
			EventM_DTO dto = null;
			String query =  " select  a.event_m_no,a.title, a.content, "+
					   		" a.reg_id, to_char(a.reg_date,'yy-MM-dd') , b.name ,a.status "+
					   		" from a06_track2_home_event_m a, a06_track2_home_member b "+
					   		" where a.reg_id = b.id "+
					   		" and a.status = 'w' "+
					   		" and EVENT_M_NO = '"+event_no1+"' ";
			
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String event_m_no    = rs.getString(1);
					String title 	   = rs.getString(2);
					String content 	   = rs.getString(3);
					String reg_id 	   = rs.getString(4);
					String reg_date    = rs.getString(5);
					String name    = rs.getString(6);
					String status    = rs.getString(7);
					dto = new EventM_DTO(event_m_no,title,content,reg_id,reg_date,name,status);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException getWinnerName():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getWinnerName():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getWinnerName() close"+e.getMessage());
				}
			}
			return dto;
		}
		
		
		

	//목록조회
	public ArrayList<Event_DTO> getEventList(){
		ArrayList<Event_DTO> dtos = new ArrayList<Event_DTO>();
		String query = " select event_no, title, content, "+
					   " reg_id, to_char(reg_date,'yy-MM-dd'),"+
					   " to_char(start_date,'yy-MM-dd'), to_char(end_date,'yy-MM-dd') , hit"+
					   " from a06_track2_home_event "+
					   " order by event_no desc ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String event_no    = rs.getString(1);
				String title 	   = rs.getString(2);
				String content 	   = rs.getString(3);
				String reg_id 	   = rs.getString(4);
				String reg_date    = rs.getString(5);
				String start_date    = rs.getString(6);
				String end_date    = rs.getString(7);
				int hit    			= rs.getInt(8);
				Event_DTO dto 	   = new Event_DTO(event_no,title,content,reg_id,reg_date,start_date,end_date,hit);
				dtos.add(dto);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException getEventList():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getEventList():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getEventList() close"+e.getMessage());
			}
		}
		return dtos;
	}
	
	//목록조회
		public ArrayList<Event_DTO> getEventList2(String selValue, String txtValue){
			ArrayList<Event_DTO> dtos = new ArrayList<Event_DTO>();
			String query = " select event_no, title, content, "+
						   " reg_id, to_char(reg_date,'yy-MM-dd'),"+
						   " to_char(start_date,'yy-MM-dd'), to_char(end_date,'yy-MM-dd') , hit"+
						   " from a06_track2_home_event "+
						   " where "+selValue+" like '%"+txtValue+"%' "+
						   " order by event_no desc ";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String event_no    = rs.getString(1);
					String title 	   = rs.getString(2);
					String content 	   = rs.getString(3);
					String reg_id 	   = rs.getString(4);
					String reg_date    = rs.getString(5);
					String start_date    = rs.getString(6);
					String end_date    = rs.getString(7);
					int hit    			= rs.getInt(8);
					Event_DTO dto 	   = new Event_DTO(event_no,title,content,reg_id,reg_date,start_date,end_date,hit);
					dtos.add(dto);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException getEventList():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getEventList():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getEventList() close"+e.getMessage());
				}
			}
			return dtos;
		}
		public ArrayList<EventM_DTO> getEventMList(String event_no1){
			ArrayList<EventM_DTO> dtos = new ArrayList<EventM_DTO>();
			String query = " select  a.event_m_no,a.title, a.content, "+
						   " a.reg_id, to_char(a.reg_date,'yy-MM-dd') , b.name "+
						   " from a06_track2_home_event_m a, a06_track2_home_member b "+
						   " where a.reg_id = b.id "+
						   " and EVENT_M_NO = '"+event_no1+"' ";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String event_m_no 	   = rs.getString(1);
					String title		  = rs.getString(2);
					String content 	   = rs.getString(3);
					String reg_id 	   = rs.getString(4);
					String reg_date    = rs.getString(5);
					String name   		 = rs.getString(6);
					
					EventM_DTO dto 	   = new EventM_DTO(event_m_no,title,content,reg_id,reg_date,name);
					dtos.add(dto);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException getEventMList():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getEventMList():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getEventMList() close"+e.getMessage());
				}
			}
			return dtos;
		}
		
		
		public int Kakunin(String id,String event_no){
			int result =0;
			String query = " select  count(*) "+
						   " from a06_track2_home_event_m a, a06_track2_home_event b  "+
						   " where a.EVENT_M_NO = b.event_no  "+
						   " and a.reg_id = '"+id+"'  "+
						   " and b.event_no = '"+event_no+"'  ";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					result =rs.getInt(1);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException Kakunin():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception Kakunin():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("Kakunin() close"+e.getMessage());
				}
			}
			return result;
		}
		
		public int Kakunin2(String id,String event_no){
			int result =0;
			String query = " select  count(*) "+
						   " from a06_track2_home_event_m a, a06_track2_home_event b  "+
						   " where a.EVENT_M_NO = b.event_no  "+
						   " and a.reg_id = '"+id+"'  "+
						   " and a.status = 'w'  "+
						   " and b.event_no = '"+event_no+"'  ";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					result =rs.getInt(1);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException Kakunin():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception Kakunin():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("Kakunin() close"+e.getMessage());
				}
			}
			return result;
		}
		
		public int howManyP(String event_no){
			int result =0;
			String query = " select  count(*) "+
						   " from a06_track2_home_event_m a, a06_track2_home_event b  "+
						   " where a.EVENT_M_NO = b.event_no  "+
						   " and b.event_no = '"+event_no+"'  ";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					result =rs.getInt(1);
				}
				
			}catch(SQLException se) {
				System.out.println("SQLException howManyP():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception howManyP():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("howManyP() close"+e.getMessage());
				}
			}
			return result;
		}
	
	//아이디 최대값 구하기
	String getMaxNo(){
		String query = "select max(event_no) from a06_track2_home_event ";
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
	public String getEventNo() {
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


