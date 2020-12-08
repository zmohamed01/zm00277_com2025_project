class Course < ApplicationRecord

  def self.search(course_code)

    code = find_by_code(course_code)

    if code != nil
        new(code: course_code, title: code.title, description: code.description)
     else
       return nil
       end
    end
end
