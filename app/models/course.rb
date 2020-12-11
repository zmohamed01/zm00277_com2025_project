class Course < ApplicationRecord
  has_many :selections
  #has_many :users, through: :selections

  validates :code, :title, :description, presence: true

  def self.search(course_code)

    code = find_by_code(course_code)

    if code != nil
        new(code: course_code, title: code.title, description: code.description)
     else
       return nil
       end
    end
end
