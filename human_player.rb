class Player
    def initialize(name)
        @name = name
    end

    def get_input
        begin
            puts "Please enter the position of the card you'd like to flip (eg. '2,3') " 
            input = gets.chomp.split(',')  #["2","3"]
            input.map!{|el| el.to_i}

            raise if input.length != 2
        rescue 
            puts "Incorrect input. Please try again!"
            retry 
            # raise if  input[0]>   || input[1]> 
        end
        return input
    end
    

end