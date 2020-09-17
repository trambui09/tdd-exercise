# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)


  # hand.each do |card|
  #   unless VALID_CARDS.include?(card)
  #     raise ArgumentError.new("#{hand} is an invalid hand")
  #   end
  # end

  if hand.length > 5 || hand.length < 2 || hand.class != Array
    raise ArgumentError.new("#{hand} is an invalid amount of cards")
  end

  #sort the hand array, so the ace is at the end
  score = 0
  ace_arr = []

  hand.each do |card|
    # check card validity
    unless VALID_CARDS.include?(card)
      raise ArgumentError.new("#{hand} is an invalid hand")
    end

    if %w(Jack Queen King).include?(card)
      score += 10
    elsif(card.class == Integer)
      #elsif [2, 3, 4, 5, 6, 7, 8, 9, 10].include?(card)
      score += card
    elsif card == "Ace"
      ace_arr << card
    end
  end

  ace_arr.each do |element|
    score <= 10 ? score += 11 : score += 1
  end

  if score > 21
    raise ArgumentError.new("#{score} is larger than 21")
  end

  return score
end

#p blackjack_score(["Pie", "Dog", 24])
#puts blackjack_score([10, "Jack"])

# What would be two nominal cases?
#
# Positive and negative nominal cases, positive: (3 + 10 + 1) = 14 for the score
# Negative: the hand is not the cards, it's a string word. Error
#
# What edge cases can you determine? Name at least 3.

#1: input is not the hand of cards
# 2: can't handle aces well, if it should be a 1 or an 11
# 3: num of cards dealt not in (2..5) cards

#answer:
# an ace and a jack (21)
# two aces and a queen( to verify that the aces are counted as 1's) (12)
# A queen a king and a two (22 or bust)
# two kings and an ace (21)

# How would you test these cases?
# By writing our tests correctly.
# describe amd it blocks and calling the method with the given inputs and verifying that the method returns thte expected output
# Arrange, #act, #assert