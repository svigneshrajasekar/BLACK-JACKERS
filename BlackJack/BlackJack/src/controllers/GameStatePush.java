package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BlackJack;
import model.GameState;

/**
 * Servlet implementation class GameStatePush
 */

public class GameStatePush extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameStatePush() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String balanceS = request.getParameter("balance");
		String betS = request.getParameter("bet");
		int balance = Integer.parseInt(balanceS);
		int bet = Integer.parseInt(betS);
		BlackJack blackjack = new BlackJack();
		blackjack.setGameState(GameState.PUSH);
		balance = balance + bet;
		response.setContentType("text/plain");
		response.getWriter().write(Integer.toString(balance));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
