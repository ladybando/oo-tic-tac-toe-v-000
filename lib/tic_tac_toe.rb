class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
  ]

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def won?
     WIN_COMBINATIONS.detect do |win|
       @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
     end
   end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  if won? && full?
    false
  elsif full?
    true
  end
end

def over?
  if draw?
    true
  elsif won?
    true
  else
    false
  end
end

  def input_to_index(user_input)
  user_input.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def position_taken?(index)
  @board[index]== "X" || @board[index] == "O"
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def move(index,player)
  @board[index] = player
  end
end

def winner
  if won?(@board)
    return @board[won?(@board)[0]]
  else return nil
  end
end
