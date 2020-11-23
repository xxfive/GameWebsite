package com.game.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GameDAO {
	
	//DB연동
		private static GameDAO instance = new GameDAO();
		public static GameDAO getInstance() {
			return instance;
		}
		private Connection getConnection() throws Exception {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/game");
			return ds.getConnection();
		}
		
	//회원가입
		public void gameInsert(GameDTO game) {
			Connection con = null;
			PreparedStatement ps = null;
			
			try {
				con=getConnection();
				String sql = "INSERT INTO game VALUES (game_seq.nextval,?,?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, game.getUserid());
				ps.setString(2, game.getName());
				ps.setString(3, game.getPwd());
				ps.setString(4, game.getEmail());
				ps.setString(5, game.getPhone());
				ps.setInt(6, game.getAdmin());
				ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(con,ps);
			}
			
		}
		
		//전체보기
		public ArrayList<GameDTO> gameList() {
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			ArrayList<GameDTO> arr=new ArrayList<>();
			
			try {
				con=getConnection();
				String sql="select * from game";
				st=con.createStatement();
				rs=st.executeQuery(sql);
				while(rs.next()) {
					GameDTO game=new GameDTO();
					game.setName(rs.getString("name"));
					game.setUserid(rs.getString("userid"));
					game.setPwd(rs.getString("password"));
					game.setEmail(rs.getString("email"));
					game.setPhone(rs.getString("phone"));
					arr.add(game);
				}
				} catch (Exception e) {
						e.printStackTrace();
				}finally {
					closeConnection(con, st, rs);
				}
				return arr;
		}
		
	//상세보기	
		public GameDTO gameView(String userid) {
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			GameDTO game =null;
			try {
				con=getConnection();
				String sql="select * from game where userid='"+userid+"'";
				st=con.createStatement();
				rs=st.executeQuery(sql);
				if(rs.next()) {
					game=new GameDTO();
					game.setName(rs.getString("name"));
					game.setUserid(rs.getString("userid"));
					game.setPwd(rs.getString("password"));
					game.setEmail(rs.getString("email"));
					game.setPhone(rs.getString("phone"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(con, st, rs);
			}
			return game;
		}
		
	//수정
		public int gameUpdate(GameDTO game) {
			Connection con=null;
			PreparedStatement ps=null;
			int flag=0;
			
			try {
				con=getConnection();
				String sql="update game set name=?, password=?, email=?, phone=? where userid=?";
				ps=con.prepareStatement(sql);
				ps.setString(1,game.getName());
				ps.setString(2,game.getPwd());
				ps.setString(3,game.getEmail());
				ps.setString(4,game.getPhone());
				ps.setString(5,game.getUserid());
				flag=ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
			return flag;
		}
		
		
	//삭제
		public void gameDelete(String userid) {
			Connection con=null;
			Statement st=null;
			try {
				con=getConnection();
				String sql="delete from game where userid='"+userid+"'";
				st=con.createStatement();
				st.execute(sql);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(con, st, null);
			}
			
		}
		
	//닫기	
	private void closeConnection(Connection con, PreparedStatement ps) {
			try {
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	private void closeConnection(Connection con, Statement st, ResultSet rs) {
			try {
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
	
	//로그인체크
	public int loginCheck(String userid,String pwd) {
		Connection con = null;
		Statement st=null;
		ResultSet rs=null;
		int flag=-1; //-1:회원아님, 0:일반회원, 1:관리자, 2:비번오류
		try {
			String sql="select * from game where userid='"+userid+"'";
			
			con=getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) { //id는 맞음
				if(rs.getString("password").equals(pwd)) { //비번이 맞음
					flag=rs.getInt("admin"); //admin이 1->관리자, 0->일반회원
				}else { //비번틀림
					flag=2;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return flag;
	}
	
	//아이디 중복확인
	public String idCheck(String userid) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String flag="yes"; //사용가능
		
		try {
			con=getConnection();
			String sql="select * from game where userid='"+userid+"'";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) {
				flag="no"; //사용불가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return flag;
	}
	
	//회원수
	public int memberCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			con = getConnection();
			String	sql = "select count(*) from game";
			st = con.createStatement();
		    rs = st.executeQuery(sql);
		    if(rs.next()) {
		    	count = rs.getInt(1);
		    }
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return count;
	}
		
}
