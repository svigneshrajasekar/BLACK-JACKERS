// --------------------------------------------------------
// Code generated by Papyrus Java
// --------------------------------------------------------

package model;

import model.Player;

/************************************************************/
/**
 * 
 */
public class User extends Player {
	/**
	 * 
	 */
	public int balance;/**
				 * 
				 */
	public int score;/**
				 * 
				 */
	public boolean isPlacedBet;
	/**
	 * @return the isPlacedBet
	 */
	public boolean isPlacedBet() {
		return isPlacedBet;
	}

	/**
	 * @param isPlacedBet the isPlacedBet to set
	 */
	public void setPlacedBet(boolean isPlacedBet) {
		this.isPlacedBet = isPlacedBet;
	}

	/**
	 * 
	 */
	public int getScore() {
		return score;
	}

	/**
	 * 
	 */
	public void setScore() {
		
	}

	/**
	 * 
	 */
	public void setBalance(int balance) {
		this.balance = balance;
		
	}
	
	public int getBalance() {
		return balance;
		
		
	}
	public int placeBet(int bet, int balances) {
		balances = balances - bet;
		return balances;
	}

	
};
