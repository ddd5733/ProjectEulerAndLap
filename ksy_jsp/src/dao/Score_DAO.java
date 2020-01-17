package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import common.DBConnectionOracle;
import dto.Score_DTO;
import dto.Smember_DTO;

public class Score_DAO {
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
				System.out.println("SQLException update():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception update():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("update() close"+e.getMessage());
				}
			}
			return result;
		}
	

	public String douhave() {
		String result = null;
		String query = " select max(id) from A06_TRACK2_SERVLET_SCORE ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException douhave():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception douhave():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("douhave() close"+e.getMessage());
			}
		}
		return result;
	}
	
	public String getId() {
		String id = douhave();
		if(id == null) {
			id ="101";
		} else {
			id =Integer.toString(Integer.parseInt(id)+1);
		}
		return id;
	}
	
	public ArrayList<Score_DTO> getScoreList(){
		ArrayList<Score_DTO> dtos = new ArrayList<Score_DTO>();
			String query =	" SELECT id,name,kor,eng,mat,total,ava "+
							" FROM A06_TRACK2_SERVLET_SCORE "+
							" order by id ";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
			while(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				int kor = rs.getInt(3);
				int eng = rs.getInt(4);
				int mat = rs.getInt(5);
				int total = rs.getInt(6);
				double ava = rs.getInt(7);
				Score_DTO dto = new Score_DTO(id,name,kor,eng,mat,total,ava);
				dtos.add(dto);
		}
		
			}catch(SQLException se) {
				System.out.println("SQLException getScoreList():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getScoreList():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getScoreList() close"+e.getMessage());
				}
			}
		return dtos;
	}
	
	
	public Score_DTO getView(String id){ //상세조회
		Score_DTO dto = null;
		String query =	" SELECT id,name,kor,eng,mat,total,ava "+
						" FROM A06_TRACK2_SERVLET_SCORE "+
						" where id = '"+id+"' ";
		try {
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()) {
				dto = new Score_DTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getDouble(7));
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
	
}
