require_relative 'board.rb'
require_relative "game.rb"

class ComputerPlayer
    def initialize()
        @comp_hash={}
    end

    def get_input
        @comp_hash = Game.board.hash
        # puts "BUGBUGBUG"
        # puts @comp_hash
        # puts @board.hash
        # puts @comp_hash.values
        dup = @comp_hash.values.select{|el| @comp_hash.values.count(el) > 1 }
        dup.uniq! #gets an array of duplicate values
        if dup.length>0
            duo_hash = @comp_hash.select{|k,v| v == dup[0]}
            pos1, pos2 = duo_hash.keys
            return [pos1, pos2]
        else
            return [[0,0], [1,1]]
        end
    end
end
