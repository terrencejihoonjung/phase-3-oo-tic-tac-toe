class TicTacToe

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    attr_accessor :board

    def initialize
        @board = [" ", " ", " ",
                  " ", " ", " ",
                  " ", " ", " "]
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(string)
        index = string.to_i - 1
        index
    end

    def move(index, token="X")
        self.board[index] = token
    end

    def position_taken?(index)
        if self.board[index] != " "
            true
        else
            false
        end
    end

    def valid_move?(index)
        if position_taken?(index) == false && (index >=0 && index <= 9)
            true
        else
            false
        end
    end

    def turn_count
        self.board.count {|space| space != " "}
    end

    def current_player
        if turn_count.even? 
            "X"
        else
            "O"
        end
    end

    def turn
        input_index = input_to_index(self.gets)
        if (valid_move?(input_index))
            move(input_index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && self.board[combo[0]] == self.board[combo[1]] && self.board[combo[1]] == self.board[combo[2]]
                return combo
            end
        end
        false
    end

    def full?
        self.board.all? {|space| space != " "}
    end

    def draw? 
        if full? == true && won? == false
            true
        else
            false
        end
    end

    def over?
        won? || draw?
    end

    def winner
        if combo = won?
            self.board[combo[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end