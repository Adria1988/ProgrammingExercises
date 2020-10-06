class Item
  def self.valid_date?(string)
    arr_date = string.split("-").map(&:to_i)
    year, month, day = arr_date

    return false if month >= 12 || day > 31 || arr_date.length > 3

    true
  end

  attr_reader :deadline
  attr_accessor :title, :description

  def initialize(title, deadline, description)
    unless Item.valid_date?(deadline)
      raise RangeError, 'error due to invalid date'
    end
    @title = title
    @deadline = deadline
    @description = description

  end

  def deadline=(new_deadline)
    unless valid_date?(new_deadline)
      raise RangeError, 'error due to invalid date'
    end
    @deadline = new_deadline
  end
end