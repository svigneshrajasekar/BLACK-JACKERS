<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Jack</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cover.css">
    <link rel="stylesheet" type="text/css" media="all" href="playingCards.ui.css"/>


    <style>
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
            border: none;
        }
        
       

    </style>
    
   
</head>
<body>
<div class="site-wrapper">
    <div class="row">
        <h1 class="text-center">Welcome to BlackJack <img src="img/BJ.png" alt="Black Jack" style="width:80px"></h1>
    </div>
    
    <div class="row col-md-12">
    <div class="modal fade" id="GameState" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content GSModal">
        <br><br><br><br>
        <h1 id="GameStatus" style="color:white"></h1>
        <br><br><br><br><br><br><br>
        <div class="modal-footer">
          <a type="button" class="btn btn-default" data-dismiss="modal" id="goBack">Go Back to Game</a>
        </div>
      </div>
      
    </div>
  </div>
  </div>
    
    
    <div class="row col-md-12" style="padding: 0 50px;">
        <div class="row col-md-6" style="border-right: 2px solid white;">
            <div class="row col-md-12" style="padding-right: 0">
                <div class="col-md-6">
                    <h3 style="text-align: left;padding-left: 40px">Dealer</h3>
                    <img src="img/dealer.png" alt="Dealer" style="display: block;text-align: left;height: 150px">
                    <img src="img/deck.png" alt="deck" style="display: block;text-align: left;height: 75px">
					<br>
					<div class="row"></div>
       
                     <div class="row">
                    <h4 class="col-md-10" style="text-align:right;margin-left: -25px;">Dealer Total:</h4><h4 class="col-md-2" style="text-align:left;margin-left: -25px;" id="dealerTotal">0</h4>
                    </div>
                </div>
                <div class="col-md-6">
                    <div id="dealerHand"></div>
                </div>
            </div>
        </div>
        <div class="row col-md-6" >
            <div class="row col-md-12" style="padding-right: 0">
                <div class="col-md-6">
                    <div id="yourHand"></div>
                </div>
                <div class="col-md-6"  style="padding-right: 0">
                    <div class="row">
                        <h3 style="text-align: right;padding-right: 40px">Player</h3>
                        <img src="img/man_playing.png" alt="player" style="float:right;height: 150px">
                        <div style="clear:both;float: none"></div>
                    </div>
                    <% 	String req = request.getParameter("balance");
					if(req != null){ %>
                    <div class="row">
                    <h4 class="col-md-10" style="text-align:right">Money: $ </h4><h4 class="col-md-2" style="text-align:left;margin-left: -25px;" id="balance"><%= request.getParameter("balance")%></h4>
                    </div>
                    <%}else{%>
                    <div class="row">
                    <h4 class="col-md-10" style="text-align:right">Money: $ </h4><h4 class="col-md-2" style="text-align:left;margin-left: -25px;" id="balance">1000</h4>
                    </div>
                    <%}%>
                    <div  class="row">
                        
                        <form class="form-group text-right col-md-12" style="padding-right: 0">
                            <div class="col-sm-1" style="font-size: 30px;margin-top: -5px;">$</div>
                            <div class="col-sm-4" style="padding-right: 0">
                                <input type="number" min="20" max="1000" class="form-control" name="bet_money" id="bet_money" placeholder="Bet">
                                
                            </div>
                        </form>
                    </div>
                    
                    <div  class="row">
                    <p class="col-sm-8" id="error_message" style="color: red;"></p>
                    </div>
                    
                   
                    <div class="row">
                    <h4 class="col-md-10" style="text-align:right;margin-left: -25px;">Player Total:</h4><h4 class="col-md-2" style="text-align:left;margin-left: -25px;" id="playerTotal">0</h4>
                    </div>
                    
                    <div class="row">
                        <table class="table borderless">
                            <thead>
                            <tr>
                                <th colspan="2" style="text-align: center">Player Options</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><button type="button" class="btn btn-primary btn-lg " style="width: 100px" id="placeBet">Bet</button></td>
                                <td><button type="button" class="btn btn-default btn-lg " style="width: 100px" disabled="true" id="draw">Deal</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" name="hit" id="hit" class="btn btn-success btn-lg " disabled="true" style="width: 100px">Hit</button></td>
                                <td><button type="button" name="double" id="double"class="btn btn-info btn-lg" disabled="true" style="width: 100px">Double</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" name="stand" id="stand" class="btn btn-danger btn-lg" disabled="true" style="width: 100px">Stand</button></td>
                                <td><button type="button" name="split" id="split" class="btn btn-warning btn-lg" disabled="true" style="width: 100px">Split</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="playingCards.js"></script>
<script type="text/javascript" src="playingCards.ui.js"></script>
<script type="text/javascript">
    /*
     * example throwing cards on the table
     */
    $(document).ready(function(){
    	var isFirstTwoCards = false;
        var cardDeck = $("#cardDeck").playingCards();
        cardDeck.spread(); // show it
        var hand_player = [];
        var hand_dealer = [];
        var no_of_draws=0;
        var showError = function(msg){
            $('#error').html(msg).show();
            setTimeout(function(){
                $('#error').fadeOut('slow');
            },3000);
        };
        var showHand = function(){
            var el="";
            if((no_of_draws%2) == 0){
                el = $('#yourHand');
                el.html('');
                for(var i=0;i<hand_player.length;i++){
                    el.append(hand_player[i].getHTML());
                }
            }else{
                if(no_of_draws < 4){
                    el = $('#dealerHand');
                    el.html('');
                    for(var j=0;j<hand_dealer.length;j++){
                        el.append(hand_dealer[j].getHTML());
                    }
                }
                else
                	{
                	el = $('#yourHand');
                    el.html('');
                    for(var j=0;j<hand_player.length;j++){
                        el.append(hand_player[j].getHTML());
                    }
                	}
            }
        };
        
        
        var doDrawCard = function(){
            var c = cardDeck.draw();
            if(!c){
                showError('no more cards');
                return;
            }
            if((no_of_draws%2) == 0){
                hand_player[hand_player.length] = c;
            }else{
                if(no_of_draws < 4) {
                    hand_dealer[hand_dealer.length] = c;
                }
                else
                	{
                	hand_player[hand_player.length] = c;
                	}
            }
            cardDeck.spread();
            showHand();
        };
        // Calculate Dealer Hand Value
        var dealerHandValue = function(){
        	var values = [];
        	var temp ;
        	var cardValue;
        	var counter = 0;
        	$( "#dealerHand .playingCard .front .corner" ).each(function( index ) {
        	if((counter%2)==0)
        		{
        		  temp = $( this ).text();
        		  console.log(temp);
        	 	  cardValue = temp.charAt(0);
        		  console.log(typeof(cardValue));
        		  console.log(cardValue);
        		  if(cardValue == 'J')
        			  {
        			  values.push(10);
        			  }
        		  else if(cardValue == 'Q')
    			  	{
        			  values.push(10);
    			  	}
        		  else if(cardValue == 'K')
    			  	{
        			  values.push(10);
    			  	}
        		  else if(parseInt(cardValue) == 1)
  			  		{
        			  values.push(10);
  			  		}
        		  else if((cardValue == 'A') && (!isFirstTwoCards) )
			  		{
      			  values.push(11);
			  		}
      		  	  else if((cardValue == 'A') && (isFirstTwoCards) )
			  		{
    			  values.push(1);
			  		}
        		  else
        			{
        			values.push(parseInt(cardValue));
        			}  
        		}
        	counter++;
        		});
         	console.log(typeof(values));
        	sum = 0;
        	for(var i =0; i < (values.length); i++)
        		{
        		
        		sum = sum + values[i];
        		console.log(values[i]);
        		} 
        	return sum;
 
        };
        
        
        var userHandValue = function(){
        	var values = [];
        	var temp ;
        	var cardValue;
        	var counter = 0;
        	$( "#yourHand .playingCard .front .corner" ).each(function( index ) {
        	if((counter%2)==0)
        		{
        		  temp = $( this ).text();
        		  console.log(temp);
        	 	  cardValue = temp.charAt(0);
        		  console.log(typeof(cardValue));
        		  console.log(cardValue);
        		  if(cardValue == 'J')
        			  {
        			  values.push(10);
        			  }
        		  else if(cardValue == 'Q')
    			  	{
        			  values.push(10);
    			  	}
        		  else if(cardValue == 'K')
    			  	{
        			  values.push(10);
    			  	}
        		  else if(parseInt(cardValue) == 1)
  			  		{
        			  values.push(10);
  			  		}
        		  else if((cardValue == 'A') && (!isFirstTwoCards) )
			  		{
        			  values.push(11);
			  		}
        		  else if((cardValue == 'A') && (isFirstTwoCards) )
			  		{
      			  values.push(1);
			  		}
        		  else
        			{
        			values.push(parseInt(cardValue));
        			}  
        		}
        	counter++;
        		});
         	console.log(typeof(values));
        	sum = 0;
        	for(var i =0; i < (values.length); i++)
        		{
        		
        		sum = sum + values[i];
        		console.log(values[i]);
        		} 
        	return sum;
        	
        };
        
        //Check for Split
        var checkSplit = function(){
        	var values = [];
        	var temp ;
        	var cardValue;
        	var counter = 0;
        	$( "#yourHand .playingCard .front .corner" ).each(function( index ) {
        	if((counter%2)==0)
        		{
        		  temp = $( this ).text();
        		  console.log(temp);
        	 	  cardValue = temp.charAt(0);
        		  console.log(typeof(cardValue));
        		  console.log(cardValue);
        		  if(cardValue == 'J')
        			  {
        			  values.push(10);
        			  }
        		  else if(cardValue == 'Q')
    			  	{
        			  values.push(10);
    			  	}
        		  else if(cardValue == 'K')
    			  	{
        			  values.push(10);
    			  	}
        		  else if(parseInt(cardValue) == 1)
  			  		{
        			  values.push(10);
  			  		}
        		  else if((cardValue == 'A') && (!isFirstTwoCards) )
			  		{
      			  values.push(11);
			  		}
      		  	  else if((cardValue == 'A') && (isFirstTwoCards) )
			  		{
    			  values.push(1);
			  		}
        		  else
        			{
        			values.push(parseInt(cardValue));
        			}  
        		}
        	counter++;
        		});
         	console.log(typeof(values));
        	
        	if(values[0] == values[1])
        		{
        		return true;
        		}
        	else{
        		return false;
        	}
        	
        	
        
        };
        
        //Check for Burst
        var checkBurst = function(){
        	var totalValue = userHandValue();
        	if(totalValue > 21){
        		return true;
        	}
        	else
        		{
        		return false;
        		}
        };
        
        //On click "placeBet"
		$('#placeBet').click(function(){
			if($('#bet_money').val() > 1000){
				$('#error_message').empty();
				$('#error_message').append('Maximum Bet - $1000');
				$('#error_message').fadeOut(5000);
			}
			else if($('#bet_money').val() < 20){
				$('#error_message').empty();
				$('#error_message').append('Minimum Bet - $20');
				$('#error_message').fadeOut(5000);
			}
			else
			{
				var bet = $('#bet_money').val();
				var balance = $('#balance').html();
			
				// Send Balance and Bet to Ajax request
				 $.post('placeBet', {
                     balance : balance,
                     bet : bet
             		}, function(responseText) {
             		 $('#placeBet').prop('disabled', true);	
                     $('#balance').empty();
                     $('#balance').append(responseText);
                     
                     
             	 });
				
				//Enabling Deal
				$('#draw').prop('disabled', false);
				
                
			}
				
		});
     // On click "Deal"
        $('#draw').click(function(){
            doDrawCard();
            no_of_draws += 1;
            // Calculate total 
            var playerTotal = userHandValue();
            var dealerTotal = dealerHandValue();
            $('#dealerTotal').empty();
            $('#dealerTotal').append(dealerTotal);
            $('#playerTotal').empty();
            $('#playerTotal').append(playerTotal);
           
            
            if(no_of_draws == 4){
            	isFirstTwoCards = true;
                $('#draw').prop('disabled', true);
                $('#stand').prop('disabled', false);
                $('#hit').prop('disabled', false);
                $('#double').prop('disabled', false);
                // check for blackjack
                var handValues = userHandValue();
                
                // BlackJack
                if(handValues == 21){
                	console.log(handValues);
                	var bet = $('#bet_money').val();
    				var balance = $('#balance').html();
    			
    				// Send Balance and Bet to Ajax request
    				$.post('GameStateBlackJack', {
                     balance : balance,
                     bet : bet
             		}, function(responseText) {
             		 // Changing Balance
                     $('#balance').empty();
                     $('#balance').append(responseText);
                     // Display GameState
                     //$('#GameState').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                     $('.GSModal').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                     $('.GSModal').css("width","84%");
                     $('#GameStatus').empty();
                     $('#GameStatus').append('BLACKJACK');
                     $('#GameState').modal({backdrop: false});
              	 });
    				
                // Check for split
                if(checkSplit()){
                	$('#split').prop('disabled', false);
                }
                else
                	{
                	$('#split').prop('disabled', true);
                	}
                
                
               
                
                
            	}
            }
        });
        //On click "hit"
        $('#hit').click(function(){
            doDrawCard();
            no_of_draws += 1;
            
            //Calculate Total
            var playerTotal = userHandValue();
            var dealerTotal = dealerHandValue();
            $('#dealerTotal').empty();
            $('#dealerTotal').append(dealerTotal);
            $('#playerTotal').empty();
            $('#playerTotal').append(playerTotal);
            
            // disable doubledown and split
            $('#double').prop('disabled', true);
            $('#split').prop('disabled', true);
            // Check for burst
            if(checkBurst()){
            	var bet = $('#bet_money').val();
				var balance = $('#balance').html();
            	$.post('GameStateBusted', {
                    balance : balance,
                    bet : bet
            		}, function(responseText) {
            		 // Changing Balance
                    $('#balance').empty();
                    $('#balance').append(balance);
                    // Display GameState
                    //$('#GameState').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("width","84%");
                    $('#GameStatus').empty();
                    $('#GameStatus').append('BUSTED');
                    $('#GameState').modal({backdrop: false});
             	 });
            	
            	
                 
            }
            
            
            
        });
        // S-17 Dealer rule
        var dealerS17 = function(dealerValue){
        	if((dealerValue < 17)){
        	var c = cardDeck.draw();
        	hand_dealer[hand_dealer.length] = c;
        	cardDeck.spread();
        	var ell = $('#dealerHand');
            ell.html('');
            for(var j=0;j<hand_dealer.length;j++){
                ell.append(hand_dealer[j].getHTML());
            }
            var dealerTotalValue = dealerHandValue();
            dealerS17(dealerTotalValue);
            }
        	else if(dealerValue > 21){
        		var bet = $('#bet_money').val();
				var balance = $('#balance').html();
        		$.post('GameStateWin', {
                    balance : balance,
                    bet : bet
            		}, function(responseText) {
            		 // Changing Balance
                    $('#balance').empty();
                    $('#balance').append(responseText);
                    // Display GameState
                    //$('#GameState').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("width","84%");
                    $('#GameStatus').empty();
                    $('#GameStatus').append('WIN');
                    $('#GameState').modal({backdrop: false});
             	 });
        	}
        };
        //On Click "Stand"
        $('#stand').click(function(){
        	$('#stand').prop('disabled', true);
        	// S-17 rule
        	var dealerTotalValue = dealerHandValue();
        	dealerS17(dealerTotalValue);
        	var dealer_TotalValue = dealerHandValue();
       		var userTotalValue = userHandValue();
        	
        	console.log(userTotalValue + ' ' + dealerTotalValue);
        	// Calculate total
        	var playerTotal = userHandValue();
            var dealerTotal = dealerHandValue();
            $('#dealerTotal').empty();
            $('#dealerTotal').append(dealerTotal);
            $('#playerTotal').empty();
            $('#playerTotal').append(playerTotal);
            
        	// Push
        	if(userTotalValue == dealer_TotalValue){
        		var bet = $('#bet_money').val();
				var balance = $('#balance').html();
            	$.post('GameStatePush', {
                    balance : balance,
                    bet : bet
            		}, function(responseText) {
            		 // Changing Balance
                    $('#balance').empty();
                    $('#balance').append(responseText);
                    // Display GameState
                    //$('#GameState').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("width","84%");
                    $('#GameStatus').empty();
                    $('#GameStatus').append('PUSH');
                    $('#GameState').modal({backdrop: false});
             	 });
            	
            	
        		
                
        	}
        	else if(userTotalValue > dealer_TotalValue){
        		var bet = $('#bet_money').val();
				var balance = $('#balance').html();
        		$.post('GameStateWin', {
                    balance : balance,
                    bet : bet
            		}, function(responseText) {
            		 // Changing Balance
                    $('#balance').empty();
                    $('#balance').append(responseText);
                    // Display GameState
                    //$('#GameState').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                   $('.GSModal').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                    $('.GSModal').css("width","84%");
                    $('#GameStatus').empty();
                    $('#GameStatus').append('WIN');
                    $('#GameState').modal({backdrop: false});
             	 });
        		
        		
                
        	}
        	else
        		{
        		$('.GSModal').css("background-image", "url('http://i-play-poker-online.com/wp-content/uploads/2016/05/BlackJack.jpg')");  
                $('.GSModal').css("width","84%");
                $('#GameStatus').empty();
                $('#GameStatus').append('LOSE');
                $('#GameState').modal({backdrop: false});
                
        		}
        });
        //On Click "Split"
        $('#split').click(function(){
            
        });
        // GoBack
        
        $('#goBack').click(function(){
        	var balance = $('#balance').html();
        
        	window.location.href = "index.jsp?balance="+balance;
        });
        
        // Double down
        $('#double').click(function(){
        	var bet = $('#bet_money').val();
			var balance = $('#balance').html();
			if(balance > bet)
				{
				$('#double').prop('disabled', true);
				$('#bet_money').val(bet*2);
				balance = balance - bet;
				$('#balance').empty();
				$('#balance').append(balance);
				}
			else
				{
				$('#error_message').empty();
				$('#error_message').append('OOPS! You don not have sufficient balance');
				$('#error_message').fadeout(5000);
				$('#double').prop('disabled', true);
				}
        	
        });
    
    
    });
    
</script>
</body>
</html>
