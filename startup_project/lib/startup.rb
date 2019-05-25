require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "#{title} is not a valid title."
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    pay = @salaries[employee.title]
    if pay <= @funding
      employee.pay(pay)
      @funding -= pay
    else
      raise "Not enough funding to pay #{employee}."
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end
end
