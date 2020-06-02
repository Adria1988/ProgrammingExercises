# frozen_string_literal: true

class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  def self.valid_pegs?(array_of_chars)
    array_of_chars.each do |char|
      return false unless POSSIBLE_PEGS.include?(char.upcase)
    end
    true
  end

  def initialize(array_of_chars)
    raise 'should raise an error' if Code.valid_pegs?(array_of_chars) == false

    @pegs = array_of_chars.map(&:upcase)
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(string_representing_pegs)
    arr_of_chars = string_representing_pegs.chars.map { |char| char }
    Code.new(arr_of_chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guees)
    count = 0
    guees.pegs.each_with_index do |char, value|
      count += 1 if @pegs[value] == char
    end
    count
  end

  def num_near_matches(guees)
    count = 0
    guees.pegs.each { |char| count += 1 if @pegs.include?(char) }
    num = count - num_exact_matches(guees)
    num
  end

  def ==(other_code)
    pegs == other_code.pegs
  end
end
