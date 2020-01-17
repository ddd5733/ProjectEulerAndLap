package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnectionOracle;
import dto.Notice_DTO;
import dto.Smember_DTO;

public class Smember_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection 		   con    = null;
	PreparedStatement  ps 	  = null;
	ResultSet 		   rs 	  = null;

	
	
	public Smember_DTO getView(String id){ //상세조회
		Smember_DTO dto = null;
		String query = " select id,name,area,age "+
					   " from a06_track2_servlet "+
					   " where id = '"+id+"' ";
		try {
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()) {
				dto = new Smember_DTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		}catch(SQLException se) {
			System.out.println("SQLException getView():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getView():"+e.getMessage());
		} finally {
			try {
				common.close(con,ps,rs);
			}catch(Exception e) {
				System.out.println("getView() close:"+e.getMessage());
			}
		}
		return dto;
	}
	
	
	
	//홈에 리스트 띄워주기
	
	public ArrayList<Smember_DTO> getMemberList(){
	ArrayList<Smember_DTO> dtos = new ArrayList<Smember_DTO>();
		String query =	" SELECT id,name,area,age "+
						" FROM a06_track2_servlet ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
		while(rs.next()) {
			String id = rs.getString(1);
			String name = rs.getString(2);
			String area = rs.getString(3);
			String age = rs.getString(4);
			Smember_DTO dto = new Smember_DTO(id,name,area,age);
		
			dtos.add(dto);
	}
	
		}catch(SQLException se) {
			System.out.println("SQLException getMemberList():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getMemberList():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getMemberList() close"+e.getMessage());
			}
		}
	
	return dtos;
}
	
	
	
	//업데이트문
		
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
}
	