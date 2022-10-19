require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(n)
        @player = Player.new("Bob")
        @computer_player = ComputerPlayer.new
        @board = Board.new(n, @player)
    end


    def play
        until @board.won?
            human_player_turn
            computer_player_turn
        end
        puts 'Good game!'
    end

    def make_guess_1(input)
        @board.reveal(input)
        @board.render
        return input
    end

    def make_guess_2(input1, input2)
        @board.reveal(input2)
        @board.render
        if @board[input1].face_value != @board[input2].face_value
            @board[input1].hide
            @board[input2].hide

        end
        sleep(2)
        system("clear")
    end

    def human_player_turn
        @board.render
        input = @player.get_input
        input_1 = make_guess_1(input)
        input2 = @player.get_input
        make_guess_2(input_1, input2)
    end

    def computer_player_turn
        @board.render
        input1, input2 = @computer_player.get_input
        make_guess_1(input1)
        make_guess_2(input1, input2)
        
    end
end


system("clear")
my_game = Game.new(2)
my_game.play