package com.game.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.game.board.BoardDAOImpl;
import com.game.board.BoardDTO;
import com.game.model.GameDAO;


/**
 * Servlet implementation class BoardUpdateAction
 */
@WebServlet("/sbgames/update.me")
public class BoardUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("list.jsp");
		 rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDTO board=new BoardDTO();
		int num =Integer.parseInt(request.getParameter("num"));
		board.setNum(num);
		board.setWriter(request.getParameter("writer"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));

		BoardDAOImpl dao=BoardDAOImpl.getInstance();
		dao.boardUpdate(board);
		response.sendRedirect("detail.me?num="+num);
	}

}
