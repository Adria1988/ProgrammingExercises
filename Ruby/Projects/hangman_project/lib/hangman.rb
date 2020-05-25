# frozen_string_literal: true

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word

  attr_reader :attempted_chars

  attr_reader :remaining_incorrect_guesses

  def already_attempted?(char)
   attempted_chars.include? char
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |ele, index| indices << index if ele == char }
    indices
  end

  def fill_indices(char, get_matching_indices)
    @guess_word.each_with_index do |_ele, index|
      @guess_word[index] = char if get_matching_indices.include? index
    end
    @guess_word
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    self.fill_indices(char, get_matching_indices(char))
    @remaining_incorrect_guesses -= 1 if self.get_matching_indices(char).empty?
    true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join('') == @secret_word
      print 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      print 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if self.win? == true || self.lose? == true
      print @secret_word
      true
    else
      false
    end
  end
end
