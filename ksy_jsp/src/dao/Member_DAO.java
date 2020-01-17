package dao;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnectionOracle;
import dto.Member_DTO;

	public class Member_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection 		   con    = null;
	PreparedStatement  ps 	  = null;
	ResultSet 		   rs 	  = null;
	
	

	
	


	//회원가입
	public int memberInsertUpdateDelete(String query){
		int result =0; 

		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println("SQLException memberInsertUpdateDelete():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception memberInsertUpdateDelete():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("memberInsertUpdateDelete() close"+e.getMessage());
			}
		}
		
		return result;
	}
	
	
	
	//id 중복검사
	public String getCheckCount(String id){
		String query = " select count(*) from A06_TRACK2_HOME_MEMBER "+
						" where id ='"+id+"' ";
		String result ="";
	
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getString(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException getCheckCount():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception getCheckCount():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("getCheckCount close"+e.getMessage());
		}
	}
		return result;
	}
	
	//네임 받아오기
	public String checkLogin(String id, String pw){
	String	query  = " select name from A06_TRACK2_HOME_MEMBER "+
				 " where id ='"+id+"' "+
				 " and pw = '"+pw+"' "+
				 " and status ='y' ";
		String result = null;
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getString(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException checkLogin():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception checkLogin():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("checkLogin close"+e.getMessage());
		}
	}
		return result;
	}

	
}


