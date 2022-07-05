require_relative "employee"

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss, employees=[])
        @employees = employees
        
        super(name, title, salary, boss)
    end

    def add_employee(employee)
        employees << employee
    end

    def bonus(multiplier)
        sum_salary * multiplier
    end

    def sum_salary
        sum_salary = 0
        employees.each do |employee|
            if !employee.is_a?(Manager)
                sum_salary += employee.salary
            else
                sum_salary += employee.sum_salary
            end
        end

        sum_salary
    end
end

big_boss = Manager.new("Ned", "founder", 1000000, nil)
employee1 = Manager.new("Darren", "Ta Manager", 78000, big_boss)
employee2 = Employee.new("Shawna", "TA", 12000, employee1)
employee3 = Employee.new("David", "TA", 10000, employee1)

big_boss.add_employee(employee1)
employee1.add_employee(employee2)
employee1.add_employee(employee3)

p big_boss.bonus(3)