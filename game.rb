class Game
  attr_accessor :player1, :player2, :current_player, :current_move, :current_response

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player_name = @player1.name
  end

  def play
    loop do
      puts "---- NEW TURN ----"
      generate_question
      get_response
      #response_correct called inside update
      update_current_player
      if @player1.lives == 0
        puts "#{@player2.name} wins with a score of #{player2.lives}/3"
        break
      end
      if @player2.lives == 0
        puts "#{@player1.name} wins with a score of #{player1.lives}/3"
        break
      end
    end #end loop
  end

  def generate_question
    @current_move = [rand(20) + 1,rand(20) +1]
    puts "#{@current_player_name}: What does #{@current_move[0]} plus #{@current_move[1]} equal?"
  end

  def get_response
    @current_response = gets.chomp.to_i
  end

  def response_correct
    if current_move[0] + @current_move[1] == @current_response
      puts "#{@current_player_name}: YES! You are correct."
      return true
    else
      puts "#{@current_player_name}: Seriously? No!"
      return false
    end
  end

  def update_current_player
    res = response_correct
    if @current_player_name == @player1.name && !res
      @player1.lives -= 1;
      @current_player_name = @player2.name
    elsif @current_player_name == @player1.name && res
      @current_player_name = @player2.name
    elsif @current_player_name == @player2.name && !res
      @player2.lives -= 1;
      @current_player_name = @player1.name
    elsif @current_player_name == @player2.name && res
      @current_player_name = @player1.name
    end
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

end #end class Game