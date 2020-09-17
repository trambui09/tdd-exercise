require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score' # don't need .rb?

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    score = blackjack_score([3,4])
    expect(score).must_equal 7

  end
  it 'facecards have values calculated correctly' do
    score = blackjack_score(["Jack", "Queen"])
    expect(score).must_equal 20

    score = blackjack_score(["King", "Queen"])
    expect(score).must_equal 20
    # clarification: face cards not including the Ace right?
  end

  it 'calculates aces as 11 where it does not go over 21' do
    score = blackjack_score(["Ace", 10])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", "King"])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", 6, 4])
    expect(score).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    score = blackjack_score(["Ace", "King", "Queen"])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", 10, 8])
    expect(score).must_equal 19

    score = blackjack_score(["Ace", 5, "Ace"])
    expect(score).must_equal 17


  end

  it 'raises an ArgumentError for invalid cards' do

    #score = blackjack_score(!VALID_CARDS)
    expect{
      blackjack_score(["Pie", "Dog", 24])
    }.must_raise ArgumentError

    #if  hand contains more than 5 cards
    expect{
      blackjack_score([1, 3, 4, 5, 6, 7])
    }.must_raise ArgumentError

    expect{
      blackjack_score([1])
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    expect{
      blackjack_score(["Queen", 10 , 3])
    }.must_raise ArgumentError

    expect{
      blackjack_score([9, 10, 5])
    }.must_raise ArgumentError
  end
end
