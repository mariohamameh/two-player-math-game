require "./players"
require "./questions"

  
def start
  puts "Game Begins!"
  questions  
end

@player1 = Players.new("",3)
@player2 = Players.new("",3)

@count = 0   

def questions
  @count += 1
  if @count % 2 != 0 && @player1.alive? && @player2.alive?
    question = Question.new
    if (@count != 1)
      puts '------- NEW TURN -------'
    end
    puts "Player 1: #{question.display}"
    print '> '
    total = gets.chomp
    if total.to_i == question.total
      puts 'Player 1: Well Done! Correct Answer!'
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"       
    else 
      @player1.lives -= 1
      puts 'Player 1: Noooo Wrong Answer! You Lose a life'
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
    questions
  elsif @count % 2 == 0 && @player1.alive? && @player2.alive?
    question = Question.new
    puts '----- NEW TURN -----'
    puts "Player 2: #{question.display}"
    print '> '
    total = gets.chomp
    if total.to_i == question.total
      puts 'Player 2: Well Done! Correct Answer!'
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    else 
      @player2.lives -= 1
      puts 'Player 2: Noooo Wrong Answer! You Lose a life'
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    #   puts '------ NEW ROUND -------'
    end
    questions
  else 
    if !(@player1.alive?)
      puts "Player 2 WINS with #{@player2.lives} Lives left!"
      puts '----- GAME OVER -----'
    else
      puts "Player 1 WINS with #{@player1.lives} Lives left!"
      puts '----- GAME OVER -----' 
    end   
  end
end  

start
