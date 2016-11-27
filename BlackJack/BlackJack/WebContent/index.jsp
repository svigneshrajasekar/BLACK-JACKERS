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
    <div class="row col-md-12" style="padding: 0 50px;">
        <div class="row col-md-6" style="border-right: 2px solid white;">
            <div class="row col-md-12" style="padding-right: 0">
                <div class="col-md-6">
                    <h3 style="text-align: left;padding-left: 40px">Dealer</h3>
                    <img src="img/dealer.png" alt="Dealer" style="display: block;text-align: left;height: 150px">
                    <img src="img/deck.png" alt="deck" style="display: block;text-align: left;height: 75px">

                    <div  class="row">
                        <h4 style="text-align: left" class=" col-md-6">Dealer Total: 17</h4>
                        <div style="" class="col-md-6"></div>

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
                    <h4 style="text-align: right">Money: $1000</h4>
                    <div  class="row">
                        <h4 style="padding-left: 0" class=" col-md-6">Player Total: 17</h4>
                        <form class="form-group text-right col-md-6" style="padding-right: 0">
                            <label for="bet_money" class="col-sm-6 col-form-label" style="padding-top: 4px;font-size: 18px;">Bet:</label>
                            <div class="col-sm-6" style="padding-right: 0">
                                <input type="text" class="form-control" name="bet_money" id="bet_money">
                            </div>
                        </form>
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
                                <td colspan="2"><button type="button" class="btn btn-default btn-lg " style="width: 100px" id="draw">Deal</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-success btn-lg " style="width: 100px">Hit</button></td>
                                <td><button type="button" class="btn btn-info btn-lg" style="width: 100px">Double</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-danger btn-lg" style="width: 100px">Stand</button></td>
                                <td><button type="button" class="btn btn-warning btn-lg" style="width: 100px">Split</button></td>
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
            }
        };
        $('#draw').click(function(){
            doDrawCard();
            no_of_draws += 1;
            if(no_of_draws == 4){
                $('#draw').prop('disabled', true);
            }
        });
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
            }
            cardDeck.spread();
            showHand();
        };
    });
</script>
</body>
</html>
