require_relative "card.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Board
    attr_accessor :grid, :card_array, :hash
    def initialize(n, player)
        @grid = Array.new(n) {Array.new(n)}
        @card_array = make_card_array(n)
        @player = player
        @hash = {}
        self.populate
    end

    def [](position)
        row, col = position
        return @grid[row][col]
    end

    def populate
        @grid.each.with_index do |row, i|
            @grid.each.with_index do |col, j|
                sample_index = rand(@card_array.length)
                @grid[i][j] = @card_array[sample_index]
                @card_array.delete_at(sample_index)
            end
        end
    end

    def make_card_array(n)           
        alpha = ("a".."z").to_a
        card_array = []
        temp_array = []
        while card_array.length < (n*n) do 
            value = alpha.sample(3).join('')
            #make a random character, and assign that as the value
            new_card_1 = Card.new(value) #we need two values here so that it doesn't overwrite it in memory
            new_card_2 = Card.new(value)
            if !temp_array.include?(value)
                card_array << new_card_1
                card_array << new_card_2
                temp_array << value
            end
        end
        return card_array
    end

    def render
        @grid.each.with_index do |row,i|
            @grid.each_with_index do |col,j|
                if @grid[i][j].face_up
                    print @grid[i][j].face_value + ' '
                else
                    print '___ '
                end
            end
            puts ''
        end
    end
    
    def won?
        return @grid.flatten.all?{|el| el.face_up}
    end

    def reveal(input)
        row, col = input
        @grid[row][col].face_up = true
        @hash[input] = @grid[row][col].face_value
        return @grid[row][col].face_value
    end



end

# b = Board.new(6,"Bob")
# b.populate
# puts b.[]([1,2])
# puts b[[1,2]]
# b.render
# b.reveal
# b.render
# puts b.card_array.length
# b.populate
# puts b.grid
# puts b.card_array.length

#we at some point need to make a card_array and then double it
