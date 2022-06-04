class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts "------------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end 

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(position)
    if board[position] == " "
      false
    else board[position] == "X" || "O"
      true 
    end
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
  end

  def turn_count
    @board.filter{|position| position != " "}.count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input = gets.chomp
    position = input_to_index(input)
    if valid_move?(position)
      token = current_player
      move(position, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |indexes|
      if board[indexes[0]] == board[indexes[1]] && board[indexes[0]] == board[indexes[2]]
        return indexes
      end
    end
  end
end