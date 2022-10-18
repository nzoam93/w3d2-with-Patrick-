require_relative 'card.rb'

n=10
alpha = ("a".."z").to_a
card_array = []
temp_array = []
while card_array.length < (n*n/2) do 
    value = alpha.sample(4).join('')
    #make a random character, and assign that as the value
    new_card = Card.new(value)
    if !temp_array.include?(value)
        card_array << new_card
        temp_array << value
    end
end
print card_array
print card_array.length
