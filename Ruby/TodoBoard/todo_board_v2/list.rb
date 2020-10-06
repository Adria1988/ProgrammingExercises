require './item.rb'

class List

  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = nil)
    unless Item.valid_date?(deadline)
      puts 'invalid date'
      return false
    end
    description = '' if description.nil?
    new_item = Item.new(title, deadline, description)
    @items << new_item
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if index < 0 || @items[index] == nil

    true
  end

  def swap(index_1, index_2)
    if !valid_index?(index_1) || !valid_index?(index_2)
      puts 'invalid index'
      return false
    end
    new_indx_2 = @items[index_1]
    @items[index_1] = @items[index_2]
    @items[index_2] = new_indx_2

    return true
  end

  def [](index)
    return nil unless valid_index?(index)

    @items[index]
  end

  def priority
    @items.first
  end

  def print
    p '------------'
    puts @label.upcase
    p '------------'
    @items.each.with_index do |item,idx|
      p "Index => #{idx}"
      p "Item => #{item.title}"
      p "Deadline => #{item.deadline}"
      p "Done => #{item.done}"
      p '----'
    end
    return true
  end

  def print_full_item(index)
    p '------------'
    item = @items[index]
    return nil if @items[index].nil?

    p "Index => #{index}"
    p "Item => #{item.title}"
    p "Deadline => #{item.deadline}"
    p "Deadline => #{item.description}"
    p "Done => #{item.done}"
    p '------------'
    true
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount)
    return true if index == 0

    if amount.nil?
      swap(index, index - 1)
      return true
    end

    while amount > 0
      return true if index == 0

      if swap(index, index - 1)
        index -= 1
        amount -= 1
      else
        return false
      end

    end

    true
  end

  def down(index, amount)
    return true if index == size - 1

    if amount.nil?
      swap(index, index + 1)
      return true
    end

    i = 0
    while i < amount

      return true if index == size - 1

      if swap(index, index + 1)
        index += 1
        i += 1
      else
        return false
      end

    end

    true
  end

  def sort_by_date!
    @items.sort_by!(&:deadline)
  end

  def toggle_item(index)
    unless valid_index?(index)
      puts 'invalid index'
      return false
    end
    @items[index].toggle
  end

  def remove(index)
    unless valid_index?(index)
      puts 'invalid index'
      return false
    end

    @items.delete_at(index)
    return true

  end

  def purge
    @items.each.with_index do |item, idx|
      @items.delete_at(idx) if item.done == true
    end
  end

end