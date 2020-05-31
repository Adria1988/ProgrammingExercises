# frozen_string_literal: true

require 'employee'

class Startup
  attr_reader :employees, :name, :funding, :salaries

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.key?(title)
  end

  def >(another_startup)
    funding > another_startup.funding
  end

  def hire(name, title)
    raise 'should raise an error' unless valid_title?(title)

    new_employee = Employee.new(name, title)
    @employees << new_employee
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    raise 'should raise an error' if @funding <= salary

    employee.pay(salary)
    @funding -= salary
  end

  def payday
    employees.each do |employee|
      self.pay_employee(employee)
    end
  end

  def average_salary
    average = 0
    payday.each { |employee| average += @salaries[employee.title] / size }
    average
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each do |title, amount|
      @salaries[title] = amount if @salaries.key?(title) == false
    end
    other_startup.employees.each { |employee| @employees << employee }
    #@employees += other_startup.employees
    other_startup.close
  end
end
