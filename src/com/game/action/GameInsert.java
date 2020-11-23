package com.game.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.game.model.GameDAO;
import com.game.model.GameDTO;


/**
 * Servlet implementation class GameInserAction
 */
@WebServlet("/sbgames/insert")
public class GameInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		GameDAO dao=GameDAO.getInstance();
		GameDTO game=new GameDTO();
		game.setUserid(request.getParameter("userid"));
		game.setName(request.getParameter("name"));
		game.setPwd(request.getParameter("pwd"));
		game.setEmail(request.getParameter("email"));
		game.setPhone(request.getParameter("phone"));
		dao.gameInsert(game);
		response.sendRedirect("login");
	}

}
