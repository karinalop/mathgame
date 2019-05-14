require './player'
require './game'


player1 = Player.new("Player1")
player2 = Player.new("Player2")

game = Game.new(player1, player2)

game.play