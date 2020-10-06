require './list.rb'

class TodoBoard

  def initialize
    @list = {}
  end

  def get_command
    print "Enter a command:"
    cmd, label, *args = gets.chomp.split(' ')
    case cmd
    when 'mklist'
      @list[label] = List.new(label)
    when 'ls'
      @list.each { |list| p list[0] }
    when 'showall'
      @list.each_value(&:print)
    when 'mktodo'
      @list[label].add_item(*args)
    when 'up'
      @list[label].up(args[0].to_i, args[1].nil? ? args[1] = nil : args[1].to_i)
    when 'down'
      @list[label].down(args[0].to_i, args[1].nil? ? args[1] = nil : args[1].to_i)
    when 'swap'
      @list[label].swap(args[0].to_i,args[1].to_i)
    when 'sort'
      @list[label].sort_by_date!
    when 'priority'
      @list[label].print_priority
    when 'print'
      if args.empty?
        @list[label].print
      else
        @list[label].print_full_item(args[0].to_i)
      end
    when 'toggle'
      @list[label].toggle_item(args[0].to_i)
    when 'rm'
      @list[label].remove(args[0].to_i)
    when 'purge'
      @list[label].purge
    when 'quit'
      return false
    else
      print "Sorry, that command is no recognized."
    end

    true
  end

  def run
    while true
      return if !get_command
    end
  end
end

TodoBoard.new.run