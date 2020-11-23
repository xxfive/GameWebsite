package com.game.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.game.model.GameDAO;
import com.game.model.GameDTO;

import sun.misc.Perf.GetPerfAction;

/**
 * Servlet implementation class UserDelete
 */
@WebServlet("/sbgames/userDelete")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		GameDAO dao=GameDAO.getInstance();
		dao.gameDelete(userid); //삭제
		ArrayList<GameDTO> arr=dao.gameList();
		int count=dao.memberCount();
		
		//JSON 형태로 값을 가져가야 함
		JSONObject mainObj=new JSONObject();
		JSONArray jarr=new JSONArray();
		for(GameDTO dto:arr) {
			String mode=dto.getAdmin()==1?"관리자":"일반회원";
			JSONObject obj=new JSONObject();
			obj.put("name",dto.getName());
			obj.put("userid",dto.getUserid());
			obj.put("email",dto.getEmail());
			obj.put("phone",dto.getPhone());
			obj.put("mode",mode);
			jarr.add(obj);
		}
		JSONObject countObj=new JSONObject();
			countObj.put("count",count);
			mainObj.put("root",jarr);
			mainObj.put("rootCount",countObj);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println(mainObj.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
