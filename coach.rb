# School is our main container (database) class; comments show ORM mappings
# School has_many Coaches
class School
    attr_accessor :name

    def initialize(name)
        @name = name
        @coaches = []
    end

    def add_coaches(list)
        list.each {|c|
            @coaches.push( Coach.new(c) )
        }
    end
    
    def assign_students(students)
        students.each {|s|
            @coaches.min_by {|c| c.students.length }.students.push( Student.new(s) )
        }
    end
    
    def list()
        puts "Results for: #{@name}"
        @coaches.each {|c|
            puts "Coach: #{c.name} (#{c.students.length})"
            puts "Students: " + c.students.map {|s| s.name }.join(", ")
        }
    end

    
end

# Coach has_many Students, has_a School
class Coach
    attr_accessor :name
    attr_accessor :students

    def initialize(name)
        @name = name
        @students = []
    end

end

# Student has_a coach
class Student
    attr_accessor :name

    def initialize(name)
        @name = name
    end

end

school = School.new("A School")

school.add_coaches([*"a".."c"].map {|c| "coach-" + c })
school.assign_students([*"a".."z"].map {|s| "student-" + s })
school.list()

puts "------- (adding coaches and students) --------"

# more coaches is beyond spec, but seemed like a logical use case and shows flexibility of classes :)
school.add_coaches([*"d".."e"].map {|c| "coach-" + c })

school.assign_students([*"A".."Z"].map {|s| "student-" + s })
school.list()

