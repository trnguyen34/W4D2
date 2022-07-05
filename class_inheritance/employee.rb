
class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    # def boss=(boss)
    #     @boss = boss
    #     @em
    # end

    def bonus(multiplier)
        bonus = salary * multiplier
    end
end