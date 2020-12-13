class Course < ApplicationRecord
  has_many :selections
  #has_many :users, through: :selections

  validates :code, presence: true, uniqueness: true, length: {maximum: 10}
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 50, maximum: 5000}


  def self.search(course_code)

    code = find_by_code(course_code)

    if code != nil
        new(code: course_code, title: code.title, description: code.description)
     else
       return nil
       end
    end
end
