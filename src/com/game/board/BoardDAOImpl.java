package com.game.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.corba.se.spi.orbutil.fsm.State;

public class BoardDAOImpl implements BoardDAO{
	//DB연동
	private static BoardDAOImpl instance = new BoardDAOImpl();
	public static BoardDAOImpl getInstance() {
		return instance;
	}
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/game");
		return ds.getConnection();
	}
	
	//추가
	@Override
	public void boardSave(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=getConnection();
			String sql = "INSERT INTO board2 (num, writer, content, subject, reg_date, readcount) VALUES (board2_seq.nextval, ?, ?, ?, sysdate, 0)";
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getWriter());
			ps.setString(2, board.getContent());
			ps.setString(3, board.getSubject());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con,ps);
		}
		
	}
	//전체보기
	@Override
	public ArrayList<BoardDTO> boardList(String field, String word,int startRow, int endRow){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> arr = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		try {
			con = getConnection();
			if(word.equals("")) {
				sb.append("select * from");
				sb.append(" (select aa.*,rownum rn from");
				sb.append(" (select * from board2 order by num desc)aa");
				sb.append(" where rownum<=?) where rn >=?");
				
				
			}else {
				sb.append("select * from");
				sb.append(" (select aa.*,rownum rn from");
				sb.append(" (select * from board2 where "+field +" like '%"+word+"%'");
				sb.append(" order by num desc)aa");
				sb.append(" where rownum<=?) where rn >=?");	
			}
			ps = con.prepareStatement(sb.toString());
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
		
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				arr.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, ps, rs);
		}
		return arr;
	}
	//상세보기
	@Override
	public BoardDTO boardfindById(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		BoardDTO board = null;
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql="select * from board2 where num="+num;
			rs = st.executeQuery(sql);
			if(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReg_date(rs.getString("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con,st,rs);
		}
		
		return board;
	}
	//수정
	@Override
	public int boardUpdate(BoardDTO board) {
		Connection con=null;
		PreparedStatement ps=null;
		int flag=0;
		
		try {
			con=getConnection();
			String sql="update board2 set subject=?, content=? where num=?";
			ps=con.prepareStatement(sql);
			ps.setString(1,board.getSubject());
			ps.setString(2,board.getContent());
			ps.setInt(3,board.getNum());
			
			flag=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
	}finally {
		closeConnection(con, ps);
	}
		return flag;
		
	}
	//삭제
	@Override
	public int boardDelete(int num) {
		Connection con = null;
		Statement st = null;
		int flag = 0;
		
		try {
			try {
				con = getConnection();
			} catch (Exception e) {
				e.printStackTrace();
		}
			String sql = "DELETE FROM board2 WHERE num ='"+num+"'";
			st = con.createStatement();
			st.execute(sql);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, st, null);
		}
		return flag;
	}
	//갯수 - 검색X
	@Override
	public int boardCount() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		
		try { 
			con = getConnection();
			st = con.createStatement();
			String sql ="select count(*) from board2";
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, st, rs);
		}

		return count;
	}
	//갯수 - 검색포함
	@Override
	public int boardCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();
			st = con.createStatement();
			if(word.equals("")) {
				 sql = "SELECT COUNT(*) FROM board2";
			}else {
				sql = "SELECT COUNT(*) FROM board2 where "+field+" like '%"+word+"%'";
			}
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
	
	
}
