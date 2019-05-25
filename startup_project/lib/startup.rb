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
    salary = @salaries[employee.title]
    if salary <= @funding
      employee.pay(salary)
      @funding -= salary
    else
      raise "Not enough funding to pay #{employee}."
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    total_pay = 0
    titles = Hash.new(0)
    @employees.each { |employee| titles[employee.title] += 1 }
    titles.each { |title, count| total_pay += salaries[title] * count }
    total_pay / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end
  
  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each { |title, salary| @salaries[title] = salary if @salaries[title] == nil }
    @employees += startup.employees
    startup.close
  end
end
