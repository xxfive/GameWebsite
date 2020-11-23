package com.game.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.game.board.BoardDAO;
import com.game.board.BoardDAOImpl;
import com.game.board.BoardDTO;

/**
 * Servlet implementation class BoardInsertAction
 */
@WebServlet("/sbgames/insert.me")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertAction() {

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("insert.jsp");
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardDTO board = new BoardDTO();
		board.setWriter(request.getParameter("writer"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		BoardDAO dao = BoardDAOImpl.getInstance();
		dao.boardSave(board);
		response.sendRedirect("list.jsp");
		
		
	}

}
