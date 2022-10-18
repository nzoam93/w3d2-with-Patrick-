require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(n)
        @player = Player.new("Bob")
        @board = Board.new(n, @player)
        @prev_guessed_pos = ""
    end

    def play
        until @board.won?
            @board.render
            input_1 = make_guess_1
            make_guess_2(input_1)
        end
        puts 'Good game!'
    end

    def make_guess_1 
        input = @player.get_input
        @board.reveal(input)
        @board.render
        return input
    end

    def make_guess_2(input1)
        input2 = @player.get_input
        @board.reveal(input2)
        @board.render
        if @board[input1].face_value != @board[input2].face_value
            @board[input1].hide
            @board[input2].hide

        end
        sleep(2)
        system("clear")
    end
end
system("clear")
my_game = Game.new(2)
my_game.play