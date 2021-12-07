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

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(prospect, title)
        if valid_title?(title)
            @employees << Employee.new(prospect, title)
        else
            raise "invalid title"
        end 
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else 
            raise "insufficient funds"
        end
    end

    def payday
        @employees.each do |e|
            pay_employee(e)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |e|
            sum += @salaries[e.title]
        end 
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |pos, salary|
            if !@salaries.has_key?(pos)
                @salaries[pos] = salary
            end 
        end
        @employees += other_startup.employees 
        other_startup.close
    end
end
