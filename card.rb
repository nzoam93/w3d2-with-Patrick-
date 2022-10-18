class Card   
    attr_accessor :face_value, :face_up
    def initialize(value)
        @face_value = value
        @face_up = false
    end 

    def display
        if @face_up
            return @face_value
        else 
            return false
        end
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    # def to_s(input)
    #     return input.to_s
    # end

    def ==(face_val1, face_val2)
        return face_val1 == face_val2
    end
end