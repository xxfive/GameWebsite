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
	
	//DB����
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
		
	//ȸ������
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
		
		//��ü����
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
		
	//�󼼺���	
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
		
	//����
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
		
		
	//����
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
		
	//�ݱ�	
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
	
	//�α���üũ
	public int loginCheck(String userid,String pwd) {
		Connection con = null;
		Statement st=null;
		ResultSet rs=null;
		int flag=-1; //-1:ȸ���ƴ�, 0:�Ϲ�ȸ��, 1:������, 2:�������
		try {
			String sql="select * from game where userid='"+userid+"'";
			
			con=getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) { //id�� ����
				if(rs.getString("password").equals(pwd)) { //����� ����
					flag=rs.getInt("admin"); //admin�� 1->������, 0->�Ϲ�ȸ��
				}else { //���Ʋ��
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
	
	//���̵� �ߺ�Ȯ��
	public String idCheck(String userid) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String flag="yes"; //��밡��
		
		try {
			con=getConnection();
			String sql="select * from game where userid='"+userid+"'";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()) {
				flag="no"; //���Ұ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return flag;
	}
	
	//ȸ����
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
