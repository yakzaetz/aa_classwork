class Bootcamp

    attr_reader :name, :slogan, :teachers, :students
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|h, k| h[k] = [] }
    end

    def hire(ta)
        @teachers << ta
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        end 
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end 
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if !enrolled?(student) || @grades[student].empty?
        @grades[student].sum / @grades[student].length
    end
end
