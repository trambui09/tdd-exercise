require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do
    # Arrange
    facecards = ['Jack', 'Queen', 'King']

    # Act & Assert
    facecards.each do |card|
      expect(blackjack_score([2, card])).must_equal 12
    end

  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Act
    score1 = blackjack_score([2, 1])
    score2 = blackjack_score([2, 3, 1])
    score3 = blackjack_score(['King', 1])

    # Assert
    expect(score1).must_equal 13
    expect(score2).must_equal 16
    expect(score3).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Act
    score1 = blackjack_score([2, 10, 1])
    score2 = blackjack_score(['King', 3, 4, 1])
    score3 = blackjack_score(['King', 'King', 1])

    # Assert
    expect(score1).must_equal 13
    expect(score2).must_equal 18
    expect(score3).must_equal 21
  end

  it 'raises an ArgumentError for invalid cards' do
    # Arrange
    hand = ['Joker', 0, 11]

    # Act & Assert
    hand.each do |card|
      expect {
        blackjack_score([card])
      }.must_raise ArgumentError
    end
  end

  it 'raises an ArgumentError for scores over 21' do
    # Arrange
    hand = ['King', 1]

    # Act & Assert
    expect {
      expect(blackjac_score(hand))
    }.wont_raise ArgumentError

    hand << 1

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
  end
end
